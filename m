From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Mar 2010 09:00:57 +0100
Subject: [Buildroot] [git commit master] squid: don't use susv3 legacy
	functions
Message-ID: <20100324082326.AD7BB776F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=754a8c96ce4bd80f284efc08d8f8e1b0d2f3bf9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squid/squid-susv3-legacy.patch |   49 ++++++++++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/squid/squid-susv3-legacy.patch

diff --git a/package/squid/squid-susv3-legacy.patch b/package/squid/squid-susv3-legacy.patch
new file mode 100644
index 0000000..c3343bd
--- /dev/null
+++ b/package/squid/squid-susv3-legacy.patch
@@ -0,0 +1,49 @@
+[PATCH]  replace susv3 legacy functions with modern equivalents
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/ESIVarState.cc     |    6 +++---
+ src/HttpHeaderTools.cc |    2 +-
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+Index: squid-3.0.STABLE21/src/ESIVarState.cc
+===================================================================
+--- squid-3.0.STABLE21.orig/src/ESIVarState.cc
++++ squid-3.0.STABLE21/src/ESIVarState.cc
+@@ -207,7 +207,7 @@ ESIVariableUserAgent::getProductVersion 
+ {
+     char const *t;
+     int len;
+-    t = index (s,'/');
++    t = strchr (s,'/');
+ 
+     if (!t || !*(++t))
+         return xstrdup ("");
+@@ -382,12 +382,12 @@ ESIVariableUserAgent::ESIVariableUserAge
+ 
+         if ((t = strstr (s, "MSIE"))) {
+             browser = ESI_BROWSER_MSIE;
+-            t = index (t, ' ');
++            t = strchr (t, ' ');
+ 
+             if (!t)
+                 browserversion = xstrdup ("");
+             else {
+-                t1 = index (t, ';');
++                t1 = strchr (t, ';');
+ 
+                 if (!t1)
+                     browserversion = xstrdup (t + 1);
+Index: squid-3.0.STABLE21/src/HttpHeaderTools.cc
+===================================================================
+--- squid-3.0.STABLE21.orig/src/HttpHeaderTools.cc
++++ squid-3.0.STABLE21/src/HttpHeaderTools.cc
+@@ -357,7 +357,7 @@ httpHeaderParseQuotedString (const char 
+     pos = start + 1;
+ 
+     while (1) {
+-        if (!(end = index (pos,'"'))) {
++        if (!(end = strchr (pos,'"'))) {
+             debugs(66, 2, "failed to parse a quoted-string header field near '" << start << "'");
+             return 0;
+         }
-- 
1.6.3.3
