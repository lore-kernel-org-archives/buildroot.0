From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Aug 2017 23:09:24 +0200
Subject: [Buildroot] [git commit] whois: fix build with NLS disabled
Message-ID: <20170816210309.616518211F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58ae0b35ed8fa0411757fa21fde66bf067e348f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

whois build uses the xgettext utility to build translation files.
This utility may not be available when NLS is disabled. Omit the pos and
install-pos Makefile targets from the default and the install targets
when NLS is disabled, respectively.

Fixes:
http://autobuild.buildroot.net/results/862/862d8165a59711c970c65d90009a527315a1a6b4/
http://autobuild.buildroot.net/results/b62/b62ec9d6f350e409731d47ffb585344c516944e8/
http://autobuild.buildroot.net/results/be2/be28d06ae004a46c87133d6f07709c6f909288d8/

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/whois/whois.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index f22446b..22117cf 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -27,13 +27,22 @@ WHOIS_DEPENDENCIES += libidn
 WHOIS_MAKE_ENV += HAVE_LIBIDN=1
 endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+WHOIS_BUILD_TARGETS =
+WHOIS_INSTALL_TARGETS = install
+else
+WHOIS_BUILD_TARGETS = Makefile.depend whois mkpasswd
+WHOIS_INSTALL_TARGETS = install-whois install-mkpasswd
+endif
+
 define WHOIS_BUILD_CMDS
-	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPTS) -C $(@D)
+	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPTS) \
+		$(WHOIS_BUILD_TARGETS) -C $(@D)
 endef
 
 define WHOIS_INSTALL_TARGET_CMDS
 	$(WHOIS_MAKE_ENV) $(MAKE) $(WHOIS_MAKE_OPTS) \
-		BASEDIR="$(TARGET_DIR)" install -C $(@D)
+		BASEDIR="$(TARGET_DIR)" $(WHOIS_INSTALL_TARGETS) -C $(@D)
 endef
 
 $(eval $(generic-package))
