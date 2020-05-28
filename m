From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 May 2020 22:33:52 +0200
Subject: [Buildroot] [git commit branch/next] package/reaver: bump to v1.6.6
Message-ID: <20200528202455.CAC8D91AA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84e8f3aa901b482c4a5bda8a11fa0fadb44b5b39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/reaver/0001-fix-271.patch | 32 --------------------------------
 package/reaver/Config.in          |  4 ++++
 package/reaver/reaver.hash        |  4 ++--
 package/reaver/reaver.mk          |  2 +-
 4 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/package/reaver/0001-fix-271.patch b/package/reaver/0001-fix-271.patch
deleted file mode 100644
index 9f6b395120..0000000000
--- a/package/reaver/0001-fix-271.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c7040da3a9ff98cd8063b9d5b5a7721374186391 Mon Sep 17 00:00:00 2001
-From: rofl0r <retnyg@gmx.net>
-Date: Fri, 22 Feb 2019 17:38:24 +0000
-Subject: [PATCH] fix #271
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/t6x/reaver-wps-fork-t6x/commit/c7040da3a9ff98cd8063b9d5b5a7721374186391]
----
- src/wps/wps_attr_parse.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/wps/wps_attr_parse.c b/src/wps/wps_attr_parse.c
-index 30b0e79..d681b70 100644
---- a/src/wps/wps_attr_parse.c
-+++ b/src/wps/wps_attr_parse.c
-@@ -443,12 +443,12 @@ int wps_parse_msg(const struct wpabuf *msg, struct wps_parse_attr *attr)
- 			 * Mac OS X 10.6 seems to be adding 0x00 padding to the
- 			 * end of M1. Skip those to avoid interop issues.
- 			 */
--			int i;
--			for (i = 0; i < end - pos; i++) {
-+			uintptr_t i, left = end - pos;
-+			for (i = 0; i < left; i++) {
- 				if (pos[i])
- 					break;
- 			}
--			if (i == end - pos) {
-+			if (i == left) {
- 				wpa_printf(MSG_DEBUG, "WPS: Workaround - skip "
- 					   "unexpected message padding");
- 				break;
diff --git a/package/reaver/Config.in b/package/reaver/Config.in
index 0fd8ab7c6e..c286fa8d34 100644
--- a/package/reaver/Config.in
+++ b/package/reaver/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_REAVER
 	bool "reaver"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  Reaver is a tool to audit networks against brute WPS pins
@@ -7,3 +8,6 @@ config BR2_PACKAGE_REAVER
 
 	  https://code.google.com/archive/p/reaver-wps/wikis/README.wiki
 	  https://github.com/t6x/reaver-wps-fork-t6x
+
+comment "reaver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/reaver/reaver.hash b/package/reaver/reaver.hash
index fad81fe326..780e6ac86d 100644
--- a/package/reaver/reaver.hash
+++ b/package/reaver/reaver.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 e6761d2d4ef9cb2b45fe0a60d6b94048ce4442e4ac209904fe89506ff1e94c44 reaver-1.6.5.tar.gz
-sha256 bb40cfd5e9ca6e8465ea3c236f3f2293e8300af1bfe87e72fabe482ae6cc995a docs/LICENSE
+sha256 73189782b208d12b8dddc4f29d32e1f72b1f3609e573c9ea9510deebec394583  reaver-1.6.6.tar.gz
+sha256 bb40cfd5e9ca6e8465ea3c236f3f2293e8300af1bfe87e72fabe482ae6cc995a  docs/LICENSE
diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
index 093ac935af..2b5f82960b 100644
--- a/package/reaver/reaver.mk
+++ b/package/reaver/reaver.mk
@@ -6,7 +6,7 @@
 
 # Older repos for this project will not cross-compile easily
 # while this one works right away
-REAVER_VERSION = 1.6.5
+REAVER_VERSION = 1.6.6
 REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,v$(REAVER_VERSION))
 REAVER_LICENSE = GPL-2.0+
 REAVER_LICENSE_FILES = docs/LICENSE
