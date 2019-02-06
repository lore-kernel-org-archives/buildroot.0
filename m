From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 17:19:53 +0100
Subject: [Buildroot] [git commit] package/zeromq: allow building with draft
 APIs enabled
Message-ID: <20190206162018.93F1A81F17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=964ec06018cc49480ddc2c3248b7c7330ccc40b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
[Thomas: add explicit --disable-drafts]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zeromq/Config.in | 7 +++++++
 package/zeromq/zeromq.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index 69be9f002c..aeedff17b8 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -52,4 +52,11 @@ config BR2_PACKAGE_ZEROMQ_PGM
 	  3208) implemented either over raw IP packets or UDP
 	  datagrams (encapsulated PGM).
 
+config BR2_PACKAGE_ZEROMQ_DRAFTS
+	bool "Draft APIs support"
+	help
+	  Enable unstable draft ZeroMQ APIs
+
+	  https://pyzmq.readthedocs.io/en/latest/draft.html
+
 endif
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index da57f8745c..d799f863c4 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -47,6 +47,12 @@ else
 ZEROMQ_CONF_OPTS += --without-pgm
 endif
 
+ifeq ($(BR2_PACKAGE_ZEROMQ_DRAFTS),y)
+ZEROMQ_CONF_OPTS += --enable-drafts
+else
+ZEROMQ_CONF_OPTS += --disable-drafts
+endif
+
 # ZeroMQ uses libsodium if it's available.
 ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 ZEROMQ_DEPENDENCIES += libsodium
