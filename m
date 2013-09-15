From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 21:37:03 +0200
Subject: [Buildroot] [PATCH v5] aiccu: new package
In-Reply-To: <1379105824-26020-1-git-send-email-rommel@layer-7.net> (Michael
 Rommel's message of "Fri, 13 Sep 2013 22:57:04 +0200")
References: <1379105824-26020-1-git-send-email-rommel@layer-7.net>
Message-ID: <87fvt5lvvk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Rommel <rommel@layer-7.net> writes:

 Michael> Automatic IPv6 Connectivity Configuration Utility for users of a
 Michael> IPv6 tunnel broker, developed by sixxs.net

 Michael> Signed-off-by: Michael Rommel <rommel@layer-7.net>
 Michael> ---
 Michael> Changes v4 -> v5
 Michael>  * changed the patch to remove the strip command completely
 Michael>    tested cross compilation for i568 and powerpc

 Michael> +++ b/package/aiccu/aiccu-0002-makefile-remove-strip.patch
 Michael> @@ -0,0 +1,20 @@
 Michael> +Makefile: removed strip command, it would not cater for cross compiling
 Michael> +	  and since buildroot strips the binaries anyway, it was suggested
 Michael> +	  by Arnout to remove it completely.
 Michael> +
 Michael> +Signed-off-by: Michael Rommel <rommel@layer-7.net>
 Michael> +
 Michael> +--- aiccu_20070115.orig/unix-console/Makefile	2007-01-15 12:04:27.000000000 +0100
 Michael> ++++ aiccu_20070115/unix-console/Makefile	2013-09-13 19:54:51.740933958 +0200
 Michael> +@@ -145,11 +145,6 @@ all: aiccu
 Michael> + 
 Michael> + aiccu:	$(OBJS) ${SRCS} ${INCS}
 Michael> + 	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)
 Michael> +-ifeq ($(shell echo $(CFLAGS) | grep -c "DEBUG"),0)
 Michael> +-ifeq ($(shell echo "$(RPM_OPT_FLAGS)" | wc -c),1)
 Michael> +-	strip $@
 Michael> +-endif
 Michael> +-endif

So we can just pass RPM_OPT_FLAGS to get it to not strip? That seems
nicer.

 Michael> +################################################################################
 Michael> +#
 Michael> +# aiccu
 Michael> +#
 Michael> +################################################################################
 Michael> +
 Michael> +AICCU_VERSION = 20070115
 Michael> +AICCU_SOURCE = aiccu_$(AICCU_VERSION).tar.gz
 Michael> +AICCU_SITE = http://www.sixxs.net/archive/sixxs/aiccu/unix/
 Michael> +AICCU_LICENSE = SixXS License, concise redistribution license
 Michael> +AICCU_LICENSE_FILES = doc/LICENSE
 Michael> +AICCU_DEPENDENCIES = gnutls
 Michael> +
 Michael> +define AICCU_BUILD_CMDS
 Michael> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all

We also need to pass our CFLAGS / LDFLAGS. Looking at the Makefile's we
can just pass them in the environment if we directly call the sub
Makefile in unix-console. LD doesn't seem to be used anywhere, so we can
drop it.

E.G. we end up with something like:

	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" \
		RPM_OPT_FLAGS=1 -C $(@D)/unix-console all

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
