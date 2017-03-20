From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Mar 2017 16:27:37 +0100
Subject: [Buildroot] [git commit] wget: add upstream security fix
Message-ID: <20170320152954.6E9EE821E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7132fc9c11573a460243895c85e66b514b71c041
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2017-6508: CRLF injection in the url_parse function in url.c

http://lists.gnu.org/archive/html/bug-wget/2017-03/msg00018.html

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-Fix-CRLF-injection-in-Wget-host-part.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/wget/0001-Fix-CRLF-injection-in-Wget-host-part.patch b/package/wget/0001-Fix-CRLF-injection-in-Wget-host-part.patch
new file mode 100644
index 0000000..380b075
--- /dev/null
+++ b/package/wget/0001-Fix-CRLF-injection-in-Wget-host-part.patch
@@ -0,0 +1,40 @@
+From 4d729e322fae359a1aefaafec1144764a54e8ad4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 6 Mar 2017 10:04:22 +0100
+Subject: [PATCH] Fix CRLF injection in Wget host part
+
+* src/url.c (url_parse): Reject control characters in host part of URL
+
+Reported-by: Orange Tsai
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 4d729e322fae35
+
+ src/url.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/src/url.c b/src/url.c
+index 8f8ff0b881af..7d36b27d7b92 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -925,6 +925,17 @@ url_parse (const char *url, int *error, struct iri *iri, bool percent_encode)
+       url_unescape (u->host);
+       host_modified = true;
+ 
++      /* check for invalid control characters in host name */
++      for (p = u->host; *p; p++)
++        {
++          if (c_iscntrl(*p))
++            {
++              url_free(u);
++              error_code = PE_INVALID_HOST_NAME;
++              goto error;
++            }
++        }
++
+       /* Apply IDNA regardless of iri->utf8_encode status */
+       if (opt.enable_iri && iri)
+         {
+-- 
+2.11.0
+
