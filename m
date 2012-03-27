From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Mar 2012 10:30:31 +0200
Subject: [Buildroot] [git commit] microperl: fix
	MICROPERL_INSTALL_TARGET_CMDS
Message-ID: <20120328065359.60DB296996@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a70788a2207af8ed97bbd26effaf5e461faf8af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The MICROPERL_INSTALL_TARGET_CMDS used the following construct in a
for loop:

		[ -d $(@D)/lib/$$j ] && cp -af $(@D)/lib/$$j \
			$(TARGET_DIR)/$(MICROPERL_MODS_DIR) ; \
		[ -f $(@D)/lib/$$i ] && $(INSTALL) -m 0644 -D $(@D)/lib/$$i \
			$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \

The problem is that when at the last iteration, the second test (-f)
fails, then the whole loop ends with a non-zero error code, and makes
aborts the build. This happens for example if the last Perl modules in
the list is Time::Local, because such modules are taken care of by the
first condition (that copies a complete directory).

By moving to full if statements, we ensure that the return code is
zero even if the condition was false.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/microperl/microperl.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index d5b5a7c..5bf4a2e 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -132,10 +132,12 @@ define MICROPERL_INSTALL_TARGET_CMDS
 	$(MICROPERL_BUILD_EXTENSIONS)
 	for i in $(MICROPERL_MODS); do \
 		j=`echo $$i|cut -d : -f 1` ; \
-		[ -d $(@D)/lib/$$j ] && cp -af $(@D)/lib/$$j \
-			$(TARGET_DIR)/$(MICROPERL_MODS_DIR) ; \
-		[ -f $(@D)/lib/$$i ] && $(INSTALL) -m 0644 -D $(@D)/lib/$$i \
-			$(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
+		if [ -d $(@D)/lib/$$j ] ; then \
+			cp -af $(@D)/lib/$$j $(TARGET_DIR)/$(MICROPERL_MODS_DIR) ; \
+		fi ; \
+		if [ -f $(@D)/lib/$$i ] ; then \
+			$(INSTALL) -m 0644 -D $(@D)/lib/$$i $(TARGET_DIR)/$(MICROPERL_MODS_DIR)/$$i; \
+		fi ; \
 	done
 	# Remove test files
 	find $(TARGET_DIR)/$(MICROPERL_MODS_DIR) -type f -name *.t \
