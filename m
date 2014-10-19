From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 10:50:13 +0200
Subject: [Buildroot] [PATCH v2] libevent: Use github call & fix patch
In-Reply-To: <1413135162-16654-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413135162-16654-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141019085013.GD4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-10-12 19:32 +0200, Maxime Hadjinlian spake thusly:
> We want to uses the github helper since we download a generated tarball

... to use ...

> from the tag anyway.
> 
> We also need to uses AUTORECONF as theses releases don't contains

... to use ... those releases ... do not contain ...

> 'configure' and such.
> 
> The patchs that was already present is updated to apply against

The patch ...

> Makefile.am instead of Makefile.in
> 
> The seconds patchs is backported from upstream to remove the usage of

The second patch ... the use of ...

> $(top_src_dirs) which makes current autotools error.

... error out.

> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[--SNIP--]
> diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
> index 73be502..8d325da 100644
> --- a/package/libevent/libevent.mk
> +++ b/package/libevent/libevent.mk
> @@ -5,11 +5,12 @@
>  ################################################################################
>  
>  LIBEVENT_VERSION = 2.0.21
> -LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
> -LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
> +LIBEVENT_SITE = $(call github,libevent,libevent,release-$(LIBEVENT_VERSION)-stable)

This should be:

    LIBEVENT_VERSION = release-2.0.21-stable
    LIBEVENT_SITE = $(call github,libevent,libevent,$(LIBEVENT_VERSION))

I think we already talked about this in the past few days (for another
such change), where we said that the version should be the tag used by
upstream.

Regards,
Yann E. MORIN.

>  LIBEVENT_INSTALL_STAGING = YES
>  LIBEVENT_LICENSE = BSD-3c, OpenBSD
>  LIBEVENT_LICENSE_FILES = LICENSE
> +# Straight from the repository, need to generate autotools files
> +LIBEVENT_AUTORECONF = YES
>  
>  define LIBEVENT_REMOVE_PYSCRIPT
>  	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
> -- 
> 2.1.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
