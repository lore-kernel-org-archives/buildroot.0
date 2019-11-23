From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Nov 2019 22:15:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/tini: compile executable static
In-Reply-To: <1574255351-23642-1-git-send-email-simon.rowe@citrix.com>
References: <1574255351-23642-1-git-send-email-simon.rowe@citrix.com>
Message-ID: <20191123211555.GZ32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon, All,

On 2019-11-20 13:09 +0000, Simon Rowe spake thusly:
> tini is intended to be used as the init process within containers and
> therefore needs to be independent of the C runtime library.
> 
> Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
> ---
>  package/tini/tini.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tini/tini.mk b/package/tini/tini.mk
> index 5dd9877..986e612 100644
> --- a/package/tini/tini.mk
> +++ b/package/tini/tini.mk
> @@ -10,6 +10,7 @@ TINI_LICENSE = MIT
>  TINI_LICENSE_FILES = LICENSE
>  
>  TINI_CFLAGS = $(TARGET_CFLAGS) \
> +	-static \

That can't work as-is, because this would break with BR2_SHARED_LIBS=y,
in which case only shared libraries are available.

Furthermore, the commit message introducing tini explicitly states "it
is not necessary to compile Tini statically for many non-docker
container environments". So, what has changed since then?

Besides, I would expect that the init process of a container would be
provided inside the container, not come from the host system. As such,
the init system of the container can be dynamically linked with the
runtime of the container itself.

In any case, this patch is incorrect in the shared-only setup, so I
marked it as rejected for now. If you can provide a beter way to do what
you need, then we can revisit it later with a different implementation
(and more explanations on how this is used in the wild).

Regards,
Yann E. MORIN.

>  	-DTINI_VERSION=\"$(TINI_VERSION)\" \
>  	-DTINI_GIT=\"\"
>  
> -- 
> 1.8.3.1
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
