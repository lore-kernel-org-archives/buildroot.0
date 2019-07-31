From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 31 Jul 2019 18:00:59 +0200
Subject: [Buildroot] [RFC PATCH v4 2/2] iputils: add capability for
 clockdiff, ping, traceroute6
In-Reply-To: <20190730213846.7488-2-petr.vorel@gmail.com>
References: <20190730213846.7488-1-petr.vorel@gmail.com>
 <20190730213846.7488-2-petr.vorel@gmail.com>
Message-ID: <20190731160059.GJ3194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2019-07-30 23:38 +0200, Petr Vorel spake thusly:
> Not setting for arping as it can be used for ARP Poisoning.
> 
> Use cap_net_raw+p (drop +e) as upstream sets that via
> cap_set_flag(), see https://github.com/iputils/iputils/issues/194

So, now we set the capabilities to those exectuables, do they still need
to be setuid?

But then, if one really does not want xattr, setuid is still required.

So, we have no way to express that a file should have either setuid or
xattrs, except as a big if-block like:

    ifeq ($(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),y)
    define IPUTILS_PERMISSIONS
        /usr/bin/clockdiff    f 0755 0 0 - - - - -
        |xattr cap_net_raw+p
    endef
    else
    define IPUTILS_PERMISSIONS
        /usr/bin/clockdiff    f 4755 0 0 - - - - -
    endef
    endif

... which is what we were trying to avoid in the firstplace...

We could write something like:

    /usr/bin/clockdiff    f $(MAYBE_SUID)755 0 0 - - - - -
    |xattr cap_net_raw+p

Where MAYBE_SUID would be set as:

    MAYBE_SUID = $(if $(BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES),0,4)

But it is starting to be a bit more complex than what you initially
envisionned, I guess.

Regards,
Yann E. MORIN.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/iputils/iputils.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 8e6a3e2fc5..f1d3e1fc6a 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -76,8 +76,11 @@ IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
>  define IPUTILS_PERMISSIONS
>  	/usr/sbin/arping      f 4755 0 0 - - - - -
>  	/usr/bin/clockdiff    f 4755 0 0 - - - - -
> +	|xattr cap_net_raw+p
>  	/bin/ping             f 4755 0 0 - - - - -
> +	|xattr cap_net_raw+p
>  	/usr/bin/traceroute6  f 4755 0 0 - - - - -
> +	|xattr cap_net_raw+p
>  endef
>  
>  $(eval $(meson-package))
> -- 
> 2.22.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
