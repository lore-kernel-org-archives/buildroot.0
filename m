From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 21:47:46 +0100
Subject: [Buildroot] [git commit] package/mutt: bump to version 2.0.6
Message-ID: <20210314202540.C16E887C70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a3868ed2e8f265b51acc04f54067df491a408b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-0-6-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ection-is-closed-after-a-connection-error.patch | 48 --------------------
 package/mutt/0002-CVE-2021-3181-1.patch            | 40 ----------------
 package/mutt/0003-CVE-2021-3181-2.patch            | 53 ----------------------
 package/mutt/0004-CVE-2021-3181-3.patch            | 30 ------------
 package/mutt/mutt.hash                             |  2 +-
 package/mutt/mutt.mk                               | 10 +---
 6 files changed, 2 insertions(+), 181 deletions(-)

diff --git a/package/mutt/0001-Ensure-IMAP-connection-is-closed-after-a-connection-error.patch b/package/mutt/0001-Ensure-IMAP-connection-is-closed-after-a-connection-error.patch
deleted file mode 100644
index 7afc736085..0000000000
--- a/package/mutt/0001-Ensure-IMAP-connection-is-closed-after-a-connection-error.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 04b06aaa3e0cc0022b9b01dbca2863756ebbf59a Mon Sep 17 00:00:00 2001
-From: Kevin McCarthy <kevin@8t8.us>
-Date: Mon, 16 Nov 2020 10:20:21 -0800
-Subject: [PATCH] Ensure IMAP connection is closed after a connection error.
-
-During connection, if the server provided an illegal initial response,
-Mutt "bailed", but did not actually close the connection.  The calling
-code unfortunately relied on the connection status to decide to
-continue with authentication, instead of checking the "bail" return
-value.
-
-This could result in authentication credentials being sent over an
-unencrypted connection, without $ssl_force_tls being consulted.
-
-Fix this by strictly closing the connection on any invalid response
-during connection.  The fix is intentionally small, to ease
-backporting.  A better fix would include removing the 'err_close_conn'
-label, and perhaps adding return value checking in the caller (though
-this change obviates the need for that).
-
-This addresses CVE-2020-28896.  Thanks to Gabriel Salles-Loustau for
-reporting the problem, and providing test cases to reproduce.
-
-[Retrieved from:
-https://gitlab.com/muttmua/mutt/-/commit/04b06aaa3e0cc0022b9b01dbca2863756ebbf59a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- imap/imap.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/imap/imap.c b/imap/imap.c
-index b24e8a3f..b13dd54d 100644
---- a/imap/imap.c
-+++ b/imap/imap.c
-@@ -561,9 +561,9 @@ int imap_open_connection (IMAP_DATA* idata)
- 
- #if defined(USE_SSL)
- err_close_conn:
--  imap_close_connection (idata);
- #endif
- bail:
-+  imap_close_connection (idata);
-   FREE (&idata->capstr);
-   return -1;
- }
--- 
-GitLab
-
diff --git a/package/mutt/0002-CVE-2021-3181-1.patch b/package/mutt/0002-CVE-2021-3181-1.patch
deleted file mode 100644
index cbb12cf2f2..0000000000
--- a/package/mutt/0002-CVE-2021-3181-1.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4a2becbdb4422aaffe3ce314991b9d670b7adf17 Mon Sep 17 00:00:00 2001
-From: Kevin McCarthy <kevin@8t8.us>
-Date: Sun, 17 Jan 2021 10:40:37 -0800
-Subject: [PATCH] Fix memory leak parsing group addresses without a display
- name.
-
-When there was a group address terminator with no previous
-addresses (including the group display-name), an address would be
-allocated but not attached to the address list.
-
-Change this to only allocate when last exists.
-
-It would be more correct to not allocate at all unless we are inside a
-group list, but I will address that in a separate commit to master.
-
-[Retrieved from:
-https://git.launchpad.net/ubuntu/+source/mutt/plain/debian/patches/CVE-2021-3181-1.patch?h=import/1.14.6-1ubuntu0.2]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- rfc822.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-Index: mutt-1.14.6/rfc822.c
-===================================================================
---- mutt-1.14.6.orig/rfc822.c
-+++ mutt-1.14.6/rfc822.c
-@@ -491,11 +491,10 @@ ADDRESS *rfc822_parse_adrlist (ADDRESS *
- #endif
- 
-       /* add group terminator */
--      cur = rfc822_new_address ();
-       if (last)
-       {
--	last->next = cur;
--	last = cur;
-+	last->next = rfc822_new_address ();
-+	last = last->next;
-       }
- 
-       phraselen = 0;
diff --git a/package/mutt/0003-CVE-2021-3181-2.patch b/package/mutt/0003-CVE-2021-3181-2.patch
deleted file mode 100644
index c3184a40ed..0000000000
--- a/package/mutt/0003-CVE-2021-3181-2.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 939b02b33ae29bc0d642570c1dcfd4b339037d19 Mon Sep 17 00:00:00 2001
-From: Kevin McCarthy <kevin@8t8.us>
-Date: Sun, 17 Jan 2021 10:53:19 -0800
-Subject: [PATCH] Don't allocate a group terminator unless we are in a
- group-list.
-
-This will reduce memory allocation for garbage/spam address lists.
-
-It also makes no sense to store a terminator when there wasn't a
-display-name indicating the start of a group.
-
-[Retrieved from:
-https://git.launchpad.net/ubuntu/+source/mutt/plain/debian/patches/CVE-2021-3181-2.patch?h=import/1.14.6-1ubuntu0.2]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- rfc822.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-Index: mutt-1.14.6/rfc822.c
-===================================================================
---- mutt-1.14.6.orig/rfc822.c
-+++ mutt-1.14.6/rfc822.c
-@@ -378,7 +378,7 @@ add_addrspec (ADDRESS **top, ADDRESS **l
- 
- ADDRESS *rfc822_parse_adrlist (ADDRESS *top, const char *s)
- {
--  int ws_pending, nl;
-+  int ws_pending, nl, in_group = 0;
- #ifdef EXACT_ADDRESS
-   const char *begin;
- #endif
-@@ -455,6 +455,7 @@ ADDRESS *rfc822_parse_adrlist (ADDRESS *
-       terminate_buffer (phrase, phraselen);
-       cur->mailbox = safe_strdup (phrase);
-       cur->group = 1;
-+      in_group = 1;
- 
-       if (last)
- 	last->next = cur;
-@@ -491,11 +492,12 @@ ADDRESS *rfc822_parse_adrlist (ADDRESS *
- #endif
- 
-       /* add group terminator */
--      if (last)
-+      if (last && in_group)
-       {
- 	last->next = rfc822_new_address ();
- 	last = last->next;
-       }
-+      in_group = 0;
- 
-       phraselen = 0;
-       commentlen = 0;
diff --git a/package/mutt/0004-CVE-2021-3181-3.patch b/package/mutt/0004-CVE-2021-3181-3.patch
deleted file mode 100644
index 42d0cbaef5..0000000000
--- a/package/mutt/0004-CVE-2021-3181-3.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d4305208955c5cdd9fe96dfa61e7c1e14e176a14 Mon Sep 17 00:00:00 2001
-From: Kevin McCarthy <kevin@8t8.us>
-Date: Sun, 17 Jan 2021 11:05:36 -0800
-Subject: [PATCH] Add group terminator if it is left off.
-
-If there is no terminating ";" add one to the list, to make the text
-re-rendering correct.
-
-[Retrieved from:
-https://git.launchpad.net/ubuntu/+source/mutt/plain/debian/patches/CVE-2021-3181-3.patch?h=import/1.14.6-1ubuntu0.2]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- rfc822.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-Index: mutt-1.14.6/rfc822.c
-===================================================================
---- mutt-1.14.6.orig/rfc822.c
-+++ mutt-1.14.6/rfc822.c
-@@ -560,6 +560,10 @@ ADDRESS *rfc822_parse_adrlist (ADDRESS *
-     last->val = mutt_substrdup (begin, s - nl < begin ? begin : s - nl);
- #endif
- 
-+  /* add group terminator, if it was left off */
-+  if (last && in_group)
-+    last->next = rfc822_new_address ();
-+
-   return top;
- }
- 
diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 23e5dd0ff1..8fccbd3709 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4f507b133253cb5eef27996b8668956cdf9caac622cf8adad13f0f9a4eda864  mutt-1.14.7.tar.gz
+sha256  81e31c45895fd624747f19106aa2697d2aa135049ff2e9e9db0a6ed876bcb598  mutt-2.0.6.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 9557983a07..004a88d0b3 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.14.7
+MUTT_VERSION = 2.0.6
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
@@ -12,14 +12,6 @@ MUTT_CPE_ID_VENDOR = mutt
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPTS = --disable-doc --disable-smtp
 
-# 0001-Ensure-IMAP-connection-is-closed-after-a-connection-error.patch
-MUTT_IGNORE_CVES += CVE-2020-28896
-
-# 0002-CVE-2021-3181-1.patch
-# 0003-CVE-2021-3181-2.patch
-# 0004-CVE-2021-3181-3.patch
-MUTT_IGNORE_CVES += CVE-2021-3181
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
 MUTT_CONF_OPTS += --enable-iconv
