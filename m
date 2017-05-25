From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 15:34:03 +0200
Subject: [Buildroot] [git commit branch/next] package/bootstrap: bump
	version to 3.3.7
Message-ID: <20170525133427.D5A1F800AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc7e8828729441393c3e825500094ac2fbf54694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Extended _EXTRACT_CMDS and _INSTALL_TARGET_CMDS to handle updated
internal zip structure:

$ unzip -l ../dl/bootstrap-3.3.1-dist.zip
Archive:  ../dl/bootstrap-3.3.1-dist.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2014-11-12 18:03   dist/
        0  2014-11-12 18:03   dist/css/
[...]

$ unzip -l ../dl/bootstrap-3.3.7-dist.zip
Archive:  ../dl/bootstrap-3.3.7-dist.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2016-07-25 15:53   bootstrap-3.3.7-dist/css/
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: better fix for the EXTRACT_CMDS, which consists in removing the
dist/ sub-directory.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bootstrap/bootstrap.hash |  2 +-
 package/bootstrap/bootstrap.mk   | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
index acb06b4..abc09da 100644
--- a/package/bootstrap/bootstrap.hash
+++ b/package/bootstrap/bootstrap.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  95ca4a02aff37570660c81a87065b53ebc281c33fa86b91a6a7a650eee10678f  bootstrap-3.3.1-dist.zip
+sha256 f498a8ff2dd007e29c2074f5e4b01a9a01775c3ff3aeaf6906ea503bc5791b7b  bootstrap-3.3.7-dist.zip
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index 17752ce..33161f5 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -4,23 +4,25 @@
 #
 ################################################################################
 
-BOOTSTRAP_VERSION = 3.3.1
+BOOTSTRAP_VERSION = 3.3.7
 BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
 BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
 BOOTSTRAP_LICENSE = MIT
 
 define BOOTSTRAP_EXTRACT_CMDS
 	$(UNZIP) $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
+	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist/* $(@D)/
+	rmdir $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist
 endef
 
 define BOOTSTRAP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/css/bootstrap-theme.min.css \
+	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap-theme.min.css \
 		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap-theme.min.css
-	$(INSTALL) -m 0644 -D $(@D)/dist/css/bootstrap.min.css \
+	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap.min.css \
 		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css
-	$(INSTALL) -m 0644 -D $(@D)/dist/js/bootstrap.min.js \
+	$(INSTALL) -m 0644 -D $(@D)/js/bootstrap.min.js \
 		$(TARGET_DIR)/var/www/bootstrap/js/bootstrap.min.js
-	cp -r $(@D)/dist/fonts $(TARGET_DIR)/var/www/bootstrap/
+	cp -r $(@D)/fonts $(TARGET_DIR)/var/www/bootstrap/
 endef
 
 $(eval $(generic-package))
