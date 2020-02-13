From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2020 21:19:32 +0100
Subject: [Buildroot] [PATCH v2] package/dovecot: security bump to version
 2.3.9.3
Message-ID: <20200213201933.3124-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- CVE-2020-7046: Truncated UTF-8 can be used to DoS submission-login and
  lmtp processes
  lib-smtp doesn't handle truncated command parameters properly, resulting
  in infinite loop taking 100% CPU for the process.  This happens for LMTP
  (where it doesn't matter so much) and also for submission-login where
  unauthenticated users can trigger it.

- CVE-2020-7957: Specially crafted mail can crash snippet generation
  Snippet generation crashes if:
  - message is large enough that message-parser returns multiple body
    blocks
  - The first block(s) don't contain the full snippet (e.g.  full of
    whitespace)
  - input ends with '>'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v1:
 - Fix subject
 - Drop unicode from commit text

 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index e8c76b3c1e..e61937495a 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 4784fb98dd41b83888e4aa9908efcbcad2e04a254e97440863903c0c498486f9  dovecot-2.3.9.2.tar.gz
+sha256 f89fb69423fc5bdc05955c8fc0607eab9e33511f9a643b721763db6156c49651  dovecot-2.3.9.3.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 5b19fa6235..9f89ce6354 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).9.2
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).9.3
 DOVECOT_SITE = https://dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
-- 
2.20.1
