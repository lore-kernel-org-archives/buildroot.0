From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 15:42:59 +0200
Subject: [Buildroot] [git commit] libsoup: add upstream security fix
Message-ID: <20180828134339.C3D988144C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a4536b2dddf7006da46706d1c133f4b0521457f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-12910: The get_cookies function in soup-cookie-jar.c in
libsoup 2.63.2 allows attackers to have unspecified impact via an empty
hostname.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-jar-bail-if-hostname-is-an-empty-string.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libsoup/0001-cookie-jar-bail-if-hostname-is-an-empty-string.patch b/package/libsoup/0001-cookie-jar-bail-if-hostname-is-an-empty-string.patch
new file mode 100644
index 0000000000..46c7cb4fd8
--- /dev/null
+++ b/package/libsoup/0001-cookie-jar-bail-if-hostname-is-an-empty-string.patch
@@ -0,0 +1,35 @@
+From 3f5635028bbad44287511fcd3c99f2a2fddf01cd Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@igalia.com>
+Date: Sun, 24 Jun 2018 19:46:19 -0500
+Subject: [PATCH] cookie-jar: bail if hostname is an empty string
+
+There are several other ways to fix the problem with this function, but
+skipping over all of the code is probably the simplest.
+
+Fixes #3
+
+
+(cherry picked from commit db2b0d5809d5f8226d47312b40992cadbcde439f)
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit db2b0d5809d
+
+ libsoup/soup-cookie-jar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-cookie-jar.c b/libsoup/soup-cookie-jar.c
+index d12bc85a8e60..365da6abf9f4 100644
+--- a/libsoup/soup-cookie-jar.c
++++ b/libsoup/soup-cookie-jar.c
+@@ -306,7 +306,7 @@ get_cookies (SoupCookieJar *jar, SoupURI *uri, gboolean for_http, gboolean copy_
+ 
+ 	priv = SOUP_COOKIE_JAR_GET_PRIVATE (jar);
+ 
+-	if (!uri->host)
++	if (!uri->host || !uri->host[0])
+ 		return NULL;
+ 
+ 	/* The logic here is a little weird, but the plan is that if
+-- 
+2.18.0
+
