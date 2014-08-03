From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Aug 2014 10:39:51 +0200
Subject: [Buildroot] [PATCH v2] bcache-tools: Adding package.
In-Reply-To: <53DD503F.4030900@tribudubois.net>
References: <1406839219-10929-1-git-send-email-jcd@tribudubois.net>
 <53DD503F.4030900@tribudubois.net>
Message-ID: <20140803083951.GF4052@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Christophe, All,

On 2014-08-02 22:55 +0200, Jean-Christophe DUBOIS spake thusly:
> Sorry to bother you guys, but how do I know the patch is accepted (or not) ?

You'll get a mail that it is applied. It can take a few days, or even a
week before someone gets to review a patch.

I'm interested in bcache-tools, so I've queued it for review.

Don't worry, your patch is not forgotten. Sorry it takes long, but
reviewing is not a simple task...

In the meantime, we have a lot of patches to review and test:
    http://patchwork.ozlabs.org/project/buildroot/list/

A bit of help in testing them is always welcome! ;-)

Regards,
Yann E. MORIN.

> Le 07/31/2014 10:40 PM, Jean-Christophe DUBOIS a ?crit :
> >This patch adds the bcache-tools package to buildroot.
> >
> >This is the bcache tools, required to setup the linux bcache
> >feature of the Linux kernel.
> >
> >Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
> >---
> >Changes v1 to v2
> >  * remove 'support' word from comment statement in Config.in.
> >  * use github helper to get the project site instead of hardcoded URL.
> >---
> >  package/Config.in                    |  1 +
> >  package/bcache-tools/Config.in       | 11 +++++++++++
> >  package/bcache-tools/bcache-tools.mk | 34 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 46 insertions(+)
> >  create mode 100644 package/bcache-tools/Config.in
> >  create mode 100644 package/bcache-tools/bcache-tools.mk
> >
> >diff --git a/package/Config.in b/package/Config.in
> >index 29b8e6b..7468b28 100644
> >--- a/package/Config.in
> >+++ b/package/Config.in
> >@@ -279,6 +279,7 @@ endmenu
> >  	source "package/a10disp/Config.in"
> >  	source "package/acpid/Config.in"
> >  	source "package/avrdude/Config.in"
> >+	source "package/bcache-tools/Config.in"
> >  	source "package/cdrkit/Config.in"
> >  	source "package/cryptsetup/Config.in"
> >  	source "package/cwiid/Config.in"
> >diff --git a/package/bcache-tools/Config.in b/package/bcache-tools/Config.in
> >new file mode 100644
> >index 0000000..fbe4158
> >--- /dev/null
> >+++ b/package/bcache-tools/Config.in
> >@@ -0,0 +1,11 @@
> >+config BR2_PACKAGE_BCACHE_TOOLS
> >+	bool "bcache tools"
> >+	depends on BR2_PACKAGE_HAS_UDEV
> >+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> >+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> >+	help
> >+	  This is the bcache tools, required to setup the linux bcache
> >+	  feature of the Linux kernel.
> >+
> >+comment "bcache-tools needs udev /dev management"
> >+        depends on !BR2_PACKAGE_HAS_UDEV
> >diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
> >new file mode 100644
> >index 0000000..8b0b061
> >--- /dev/null
> >+++ b/package/bcache-tools/bcache-tools.mk
> >@@ -0,0 +1,34 @@
> >+################################################################################
> >+#
> >+# bcache-tools
> >+#
> >+################################################################################
> >+
> >+BCACHE_TOOLS_VERSION = 1.0.7
> >+BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,v$(BCACHE_TOOLS_VERSION))
> >+BCACHE_TOOLS_SOURCE = v$(BCACHE_TOOLS_VERSION).zip
> >+BCACHE_TOOLS_LICENSE = GPLv2
> >+BCACHE_TOOLS_LICENSE_FILES = COPYING
> >+BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux eudev
> >+BCACHE_TOOLS_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
> >+
> >+define BCACHE_TOOLS_EXTRACT_CMDS
> >+	unzip -d $(BUILD_DIR) $(DL_DIR)/$(BCACHE_TOOLS_SOURCE)
> >+endef
> >+
> >+define BCACHE_TOOLS_FIX_PKGCONFIG
> >+	$(SED) 's^`pkg-config^`$(PKG_CONFIG_HOST_BINARY)^' \
> >+		$(BCACHE_TOOLS_DIR)/Makefile
> >+endef
> >+
> >+define BCACHE_TOOLS_BUILD_CMDS
> >+	$(BCACHE_TOOLS_FIX_PKGCONFIG)
> >+	$(BCACHE_TOOLS_MAKE_ENV) $(MAKE) -C $(@D)
> >+endef
> >+
> >+define BCACHE_TOOLS_INSTALL_TARGET_CMDS
> >+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/man/man8
> >+	$(BCACHE_TOOLS_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> >+endef
> >+
> >+$(eval $(generic-package))
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
