From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 18:56:50 +0100
Subject: [Buildroot] [git commit] libsigrok: don't select libserialport in
	Config.in
Message-ID: <20150302222721.05677807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8dee519750c3ee1a229033eec4cff2e2e80cb54c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libsigrok can be built without libserialport. Don't select it
in Config.in from both libsigrok and sigrok-cli and add a check
to libsigrok.mk to determine whether libserialport should be
enabled.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigrok/Config.in    |    1 -
 package/libsigrok/libsigrok.mk |    7 +++++++
 package/sigrok-cli/Config.in   |    1 -
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index 09077fb..47f812c 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBSIGROK
 	bool "libsigrok"
-	select BR2_PACKAGE_LIBSERIALPORT
 	select BR2_PACKAGE_LIBZIP
 	select BR2_PACKAGE_LIBGLIB2
 	# libglib2
diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 109d4d3..d19c3c8 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -21,6 +21,13 @@ endef
 
 LIBSIGROK_PRE_CONFIGURE_HOOKS += LIBSIGROK_ADD_MISSING
 
+ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
+LIBSIGROK_CONF_OPTS += --enable-libserialport
+LIBSIGROK_DEPENDENCIES += libserialport
+else
+LIBSIGROK_CONF_OPTS += --disable-libserialport
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 LIBSIGROK_CONF_OPTS += --enable-libftdi
 LIBSIGROK_DEPENDENCIES += libftdi
diff --git a/package/sigrok-cli/Config.in b/package/sigrok-cli/Config.in
index e3e5420..4e7f137 100644
--- a/package/sigrok-cli/Config.in
+++ b/package/sigrok-cli/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SIGROK_CLI
 	bool "sigrok-cli"
-	select BR2_PACKAGE_LIBSERIALPORT
 	select BR2_PACKAGE_LIBSIGROK
 	# libsigrok->libglib2:
 	depends on BR2_USE_WCHAR
