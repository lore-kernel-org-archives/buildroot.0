From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Nov 2010 08:55:18 +0100
Subject: [Buildroot] [PATCH] autotools: add with/without and
 enable/disable helpers
In-Reply-To: <1290141237-30539-1-git-send-email-vapier@gentoo.org>
References: <1290141237-30539-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101119085518.655d8c0d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Nov 2010 23:33:57 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> Rather than have to write ugly logic in every package .mk file to check
> a config var and then expand into a --{en,dis}able-foo flag, add helpers
> so code can cleanly expand things.

Sounds a very good idea!

> +# $(call _USE_CONF,enable,disable,LIB_FFMPEG,video,blah) -> --enable-video=blah if LIB_FFMPEG
> +# $(call _USE_CONF,with,without,LIB_FFMPEG,video)        -> --with-video if LIB_FFMPEG
> +_USE_CONF = $(shell \
> +	opt="$(5)"; test "$${opt:+set}" = "set" && opt="=$${opt}"; \
> +	test "$(BR2_$(3))" = "y" \
> +		&& echo "--$(1)-$(4)$${opt}" \
> +		|| echo "--$(2)-$(4)")

However, I'm worried that this will start a shell process when
evaluating *each* USE_ENABLE/USE_WITH call, and this will slow down the
start up of Buildroot. In the past, we were forking/execing "tr" once
per-package and it was slowing down Buildroot startup needlessly
(~10-15 seconds doing hundreds of fork/exec).

It'd be nicer if we could use a pure Makefile implementation. What
about a simpler :

USE_WITH = $(if $(BR2_$(1)),--with-$(2),--without-$(2))
USE_ENABLE = $(if $(BR2_$(1),--enable-$(2),--disable-$(2)))

However, their usage might be a little limited: often when the option
is enabled, we need to add a dependency to the package as well.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
