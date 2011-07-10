From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 23:08:35 +0200
Subject: [Buildroot] [PATCH] ebtables: new package
In-Reply-To: <f2408a31cec10972f6f2a4a5fc885b4cc6704eb8.1310046029.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 7 Jul 2011 16:42:01 +0300")
References: <f2408a31cec10972f6f2a4a5fc885b4cc6704eb8.1310046029.git.baruch@tkos.co.il>
Message-ID: <87y605x2r0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Thanks, a few comments:

 Baruch> +++ b/package/ebtables/ebtables.mk
 Baruch> @@ -0,0 +1,24 @@
 Baruch> +#############################################################
 Baruch> +#
 Baruch> +# ebtables
 Baruch> +#
 Baruch> +#############################################################
 Baruch> +EBTABLES_VERSION = 2.0.9-2

2.0.10-1 is (now) out.

 Baruch> +EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
 Baruch> +EBTABLES_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ebtables
 Baruch> +
 Baruch> +define EBTABLES_BUILD_CMDS
 Baruch> +	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) LIBDIR=/lib/ebtables -C $(@D)

You have to add quotes ("") around TARGET_CC / TARGET_LD as
E.G. TARGET_CC is two words when ccache is enabled. You should also set
CFLAGS / LDFLAGS, or even better use TARGET_CONFIGURE_OPTS.

 Baruch> +endef
 Baruch> +
 Baruch> +define EBTABLES_INSTALL_TARGET_CMDS
 Baruch> +	mkdir -p $(TARGET_DIR)/lib/ebtables
 Baruch> +	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/extensions/*.so \
 Baruch> +		$(TARGET_DIR)/lib/ebtables
 Baruch> +	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/*.so \
 Baruch> +		$(TARGET_DIR)/lib/ebtables
 Baruch> +	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
 Baruch> +		$(TARGET_DIR)/sbin/ebtables

Doesn't the makefile have an install target? You need to provide the
destination file name (not just the dir) when you use install -D.

Uninstall handling would be good as well.

Care to fix and resend?

-- 
Bye, Peter Korsgaard
