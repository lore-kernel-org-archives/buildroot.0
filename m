From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:28:19 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/openswan: fix
 build with gcc 10
Message-ID: <20201002082507.22B6A81429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1723fce030989aa4a145d5d173d7a16cef0fb071
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes:
 - http://autobuild.buildroot.org/results/650fc0046fd063c70e17ce5ebd9592195657434d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a2f69b8cc4d34521abfaafc61aeb5b5e7154cf6d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openswan/0001-fix-build-with-gcc-10.patch | 49 +++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/openswan/0001-fix-build-with-gcc-10.patch b/package/openswan/0001-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..eb474b56aa
--- /dev/null
+++ b/package/openswan/0001-fix-build-with-gcc-10.patch
@@ -0,0 +1,49 @@
+From 3324d5ab1d00920ea46f453240da1356e0639e98 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 24 Sep 2020 21:55:31 +0200
+Subject: [PATCH] fix build with gcc 10
+
+Define kw_host_list and kw_connaddrfamily_list as extern to avoid the following
+build failure with gcc 10 (which defaults to -fno-common):
+
+/home/peko/autobuild/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: initiate.o:/home/peko/autobuild/instance-1/output-1/build/openswan-2.6.51.5/include/pluto_constants.h:650: multiple definition of `kw_host_list'; connections.o:/home/peko/autobuild/instance-1/output-1/build/openswan-2.6.51.5/include/pluto_constants.h:650: first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/650fc0046fd063c70e17ce5ebd9592195657434d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/xelerance/Openswan/pull/444]
+---
+ include/ipsecconf/keywords.h | 2 +-
+ include/pluto_constants.h    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/ipsecconf/keywords.h b/include/ipsecconf/keywords.h
+index e32be7968..02e8e073e 100644
+--- a/include/ipsecconf/keywords.h
++++ b/include/ipsecconf/keywords.h
+@@ -314,7 +314,7 @@ struct config_parsed {
+     bool                got_default;
+ };
+ 
+-const struct keyword_enum_values kw_connaddrfamily_list;
++extern const struct keyword_enum_values kw_connaddrfamily_list;
+ 
+ extern struct keyword_def ipsec_conf_keywords_v2[];
+ extern const int ipsec_conf_keywords_v2_count;
+diff --git a/include/pluto_constants.h b/include/pluto_constants.h
+index c35dd9576..dcbd3b5b4 100644
+--- a/include/pluto_constants.h
++++ b/include/pluto_constants.h
+@@ -665,7 +665,7 @@ enum keyword_host {
+     KH_IPADDR       = LOOSE_ENUM_OTHER,
+ };
+ /* keyword_name(&kw_host_list, type, buffer[KEYWORD_NAME_BUFLEN]) */
+-struct keyword_enum_values kw_host_list;
++extern struct keyword_enum_values kw_host_list;
+ #define KH_ISWILDCARD(type)  ((type) == KH_ANY || (type) == KH_DEFAULTROUTE)
+ #define KH_ISKNOWNADDR(type) ((type) == KH_IPADDR || (type)==KH_IFACE)
+ 
+-- 
+2.28.0
+
