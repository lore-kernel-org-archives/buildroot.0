From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:24:29 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/shellinabox: fix
 CVE-2018-16789
Message-ID: <20200314181229.330A683AE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78e295a7956bf29b79eac5f09252822f6d30e625
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

libhttp/url.c in shellinabox through 2.20 has an implementation flaw in
the HTTP request parsing logic. By sending a crafted multipart/form-data
HTTP request, an attacker could exploit this to force shellinaboxd into
an infinite loop, exhausting available CPU resources and taking the
service down.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5553223297a5ef07220ab5b45bf48973f7166950)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-16789-fix-for-broken-multipart-form-data.patch | 26 ++++++++++++++++++++++
 package/shellinabox/shellinabox.mk                 |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
new file mode 100644
index 0000000000..4b15f419e3
--- /dev/null
+++ b/package/shellinabox/0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
@@ -0,0 +1,26 @@
+From 7f47efe1717c381f86566fabe0b1ced8cb98fe8f Mon Sep 17 00:00:00 2001
+From: irsl <irsl@users.noreply.github.com>
+Date: Fri, 26 Oct 2018 11:51:15 +0200
+Subject: [PATCH] fix for broken multipart/form-data
+
+Malformed multipart/form-data payload results in infinite loop and thus denial of service
+[Upstream status: https://github.com/shellinabox/shellinabox/pull/446]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libhttp/url.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libhttp/url.c b/libhttp/url.c
+index ed29475..4177871 100644
+--- a/libhttp/url.c
++++ b/libhttp/url.c
+@@ -312,6 +312,9 @@ static void urlParsePostBody(struct URL *url,
+               }
+             }
+           }
++        } else {
++           warn("[http] broken multipart/form-data!");
++           break;
+         }
+       }
+       if (lastPart) {
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
index be36804cb7..4c93fdccef 100644
--- a/package/shellinabox/shellinabox.mk
+++ b/package/shellinabox/shellinabox.mk
@@ -9,6 +9,9 @@ SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,v$(SHELLINABOX_VERSION)
 SHELLINABOX_LICENSE = GPL-2.0 with OpenSSL exception
 SHELLINABOX_LICENSE_FILES = COPYING GPL-2
 
+# 0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
+SHELLINABOX_IGNORE_CVES += CVE-2018-16789
+
 # Fetching from Github, and patching Makefile.am, so we need to autoreconf
 SHELLINABOX_AUTORECONF = YES
 
