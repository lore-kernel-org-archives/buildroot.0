From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 08:33:39 +0200
Subject: [Buildroot] [git commit] package/mutt: fix CVE-2020-14093
Message-ID: <20200620063227.387B27F917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6756a3504cfc65352a970ff9999a72b31c1a194a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mutt before 1.14.3 allows an IMAP fcc/postpone man-in-the-middle attack
via a PREAUTH response.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-possible-IMAP-MITM-via-PREAUTH-response.patch | 60 ++++++++++++++++++++++
 package/mutt/mutt.mk                               |  3 ++
 2 files changed, 63 insertions(+)

diff --git a/package/mutt/0003-Prevent-possible-IMAP-MITM-via-PREAUTH-response.patch b/package/mutt/0003-Prevent-possible-IMAP-MITM-via-PREAUTH-response.patch
new file mode 100644
index 0000000000..913b6087b2
--- /dev/null
+++ b/package/mutt/0003-Prevent-possible-IMAP-MITM-via-PREAUTH-response.patch
@@ -0,0 +1,60 @@
+From 3e88866dc60b5fa6aaba6fd7c1710c12c1c3cd01 Mon Sep 17 00:00:00 2001
+From: Kevin McCarthy <kevin@8t8.us>
+Date: Sun, 14 Jun 2020 11:30:00 -0700
+Subject: [PATCH] Prevent possible IMAP MITM via PREAUTH response.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is similar to CVE-2014-2567 and CVE-2020-12398.  STARTTLS is not
+allowed in the Authenticated state, so previously Mutt would
+implicitly mark the connection as authenticated and skip any
+encryption checking/enabling.
+
+No credentials are exposed, but it does allow messages to be sent to
+an attacker, via postpone or fcc'ing for instance.
+
+Reuse the $ssl_starttls quadoption "in reverse" to prompt to abort the
+connection if it is unencrypted.
+
+Thanks very much to Damian Poddebniak and Fabian Ising from the
+M??nster University of Applied Sciences for reporting this issue, and
+their help in testing the fix.
+
+[Retrieved from:
+https://gitlab.com/muttmua/mutt/commit/3e88866dc60b5fa6aaba6fd7c1710c12c1c3cd01]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ imap/imap.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/imap/imap.c b/imap/imap.c
+index 63362176..3ca10df4 100644
+--- a/imap/imap.c
++++ b/imap/imap.c
+@@ -530,6 +530,22 @@ int imap_open_connection (IMAP_DATA* idata)
+   }
+   else if (ascii_strncasecmp ("* PREAUTH", idata->buf, 9) == 0)
+   {
++#if defined(USE_SSL)
++    /* An unencrypted PREAUTH response is most likely a MITM attack.
++     * Require a confirmation. */
++    if (!idata->conn->ssf)
++    {
++      if (option(OPTSSLFORCETLS) ||
++          (query_quadoption (OPT_SSLSTARTTLS,
++                             _("Abort unencrypted PREAUTH connection?")) != MUTT_NO))
++      {
++        mutt_error _("Encrypted connection unavailable");
++        mutt_sleep (1);
++        goto err_close_conn;
++      }
++    }
++#endif
++
+     idata->state = IMAP_AUTHENTICATED;
+     if (imap_check_capabilities (idata) != 0)
+       goto bail;
+-- 
+GitLab
+
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index a71c0e3551..5d400f8b8c 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -13,6 +13,9 @@ MUTT_CONF_OPTS = --disable-doc --disable-smtp
 # We're patching configure.ac
 MUTT_AUTORECONF = YES
 
+# 0003-Prevent-possible-IMAP-MITM-via-PREAUTH-response.patch
+MUTT_IGNORE_CVES += CVE-2020-14093
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
 MUTT_CONF_OPTS += --enable-iconv
