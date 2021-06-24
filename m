From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Jun 2021 23:38:37 +0200
Subject: [Buildroot] [PATCH] package/gawk: create awk symlink for
 host-gawk
In-Reply-To: <20210615140302.2485993-1-hubert.lacote@gmail.com>
References: <20210615140302.2485993-1-hubert.lacote@gmail.com>
Message-ID: <20210624213837.GH2852@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hubert, All,

On 2021-06-15 16:03 +0200, Hubert Lacote spake thusly:
> From: Hubert Lacote <hubert.lacote@youview.com>
> 
> This is to make sure that host packages that depend on `host-gawk` and that use
> `awk` end up using `gawk`, instead of the `awk` symlink installed on the host
> system.
> 
> On recent Debian-based distributions, `awk` is still symlinked to `mawk` [1].
> 
> [1] https://bugs.launchpad.net/ubuntu/+source/mawk/+bug/1841654
> 
> Signed-off-by: Hubert Lacote <hubert.lacote@youview.com>
> Co-authored-by: Hubert Lacote <hubert.lacote@youview.com>
> Co-authored-by: Vicente Olivert Riera <vincent.olivert.riera@youview.com>
> ---
>  package/gawk/gawk.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
> index 16906f6f93..ab7088e90e 100644
> --- a/package/gawk/gawk.mk
> +++ b/package/gawk/gawk.mk
> @@ -33,6 +33,12 @@ endif
>  
>  HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
>  
> +define HOST_GAWK_CREATE_SYMLINK
> +	ln -sf gawk $(HOST_DIR)/usr/bin/awk
> +endef
> +
> +HOST_GAWK_POST_INSTALL_HOOKS += HOST_GAWK_CREATE_SYMLINK

Usually, we add the host-variant stuff after the target-variant stuff,
so I moved that after the corresponding hook, below:

>  define GAWK_CREATE_SYMLINK
>  	ln -sf gawk $(TARGET_DIR)/usr/bin/awk
>  endef

Of course, I see that you inserted that next to the existing
host-variant CONF_OPTS, and I can see the reasoning. Still, I found it
odd for the host suff to be stuffed in the middle of the tarrget
stuff...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
