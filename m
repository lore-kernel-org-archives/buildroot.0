From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 12 May 2012 00:39:31 +0200
Subject: [Buildroot] [PATCH] Added package v86d which provides a
 real-mode helper for uvesafb driver.
In-Reply-To: <1336560101-29035-1-git-send-email-golubovsky@gmail.com>
References: <1336560101-29035-1-git-send-email-golubovsky@gmail.com>
Message-ID: <4FAD9523.3020501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/09/12 12:41, Dmitry wrote:
[snip]
> +# This flag to configure should be per target architecture rather than
> +# autodetected (or it will be per host architecture which may be
> +# not the same as target).
> +
> +X86EMU = $(if $(BR2_i386),n,y)

  This comment was not very clear to me.  I guess you mean
# The configure script autodetects the host architecture, so we must
# pass the target architecture explicitly.

> +
> +# v86d's configure script is not autoconf-based.
> +# GENTARGETS macro will be used rather than AUTOTARGETS.
> +
> +define V86D_CONFIGURE_CMDS
> +	(cd $(@D) ; ./configure --with-debug=n --with-klibc=n --with-x86emu=$(X86EMU))
> +endef
> +
> +# It is necessary to define __i386__ explicitly for successful compilation.
> +
> +define V86D_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC) -D__i386__" LD="$(TARGET_LD)" -C $(@D) all
> +endef

  When you use GENTARGETS, you must also specify the install commands.
However, you can probably keep using AUTOTARGETS.  Even when you use
AUTOTARGETS, it is possible to override the CONFIGURE_CMDS and BUILD_CMDS.
But you don't even need to override the BUILD_CMDS.  Instead, you can
pass additional options to the MAKE call, by defining

V86D_MAKE_OPT += CC="$(TARGET_CC) -D__i386__"

  (As Thomas mentioned, if you assign twice on the command line it is only
the last one that counts.)

  I can't guarantee that what I'm saying is correct, though, so be sure to
test with a clean build before resending.

  Regards,
  Arnout


> +
> +$(eval $(call GENTARGETS))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
