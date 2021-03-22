From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Mar 2021 20:00:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/openssh: security bump to version
 8.5p1
Message-ID: <20210322190034.1151555-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * ssh-agent(1): fixed a double-free memory corruption that was
   introduced in OpenSSH 8.2 . We treat all such memory faults as
   potentially exploitable. This bug could be reached by an attacker
   with access to the agent socket.

   On modern operating systems where the OS can provide information
   about the user identity connected to a socket, OpenSSH ssh-agent
   and sshd limit agent socket access only to the originating user
   and root. Additional mitigation may be afforded by the system's
   malloc(3)/free(3) implementation, if it detects double-free
   conditions.

   The most likely scenario for exploitation is a user forwarding an
   agent either to an account shared with a malicious user or to a
   host with an attacker holding root access.

 * Portable sshd(8): Prevent excessively long username going to PAM.
   This is a mitigation for a buffer overflow in Solaris' PAM username
   handling (CVE-2020-14871), and is only enabled for Sun-derived PAM
   implementations.  This is not a problem in sshd itself, it only
   prevents sshd from being used as a vector to attack Solaris' PAM.
   It does not prevent the bug in PAM from being exploited via some
   other PAM application. GHPR#212

Also license has been updated to add some openbsd-compat licenses:
https://github.com/openssh/openssh-portable/commit/922cfac5ed5ead9f796f7d39f012dd653dc5c173

https://www.openssh.com/txt/release-8.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openssh/openssh.hash |  6 +++---
 package/openssh/openssh.mk   | 10 ++++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 840467f50a..c50a49896c 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.4 (base64 encoded)
-sha256  5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24  openssh-8.4p1.tar.gz
+# From https://www.openssh.com/txt/release-8.5 (base64 encoded)
+sha256  f52f3f41d429aa9918e38cf200af225ccdd8e66f052da572870c89737646ec25  openssh-8.5p1.tar.gz
 # Locally calculated
-sha256  73d0db766229670c7b4e1ec5e6baed54977a0694a565e7cc878c45ee834045d7  LICENCE
+sha256  432abf7480fb31473a6706627212913fc70032e3fb71b90fecb28ae26a2d741d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 64e3084ca1..055c024cab 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 8.4p1
-OPENSSH_CPE_ID_VERSION = 8.4
-OPENSSH_CPE_ID_UPDATE = p1
+OPENSSH_VERSION_MAJOR = 8.5
+OPENSSH_VERSION_MINOR = p1
+OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
+OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
+OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
-OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
+OPENSSH_LICENSE = BSD-4-Clause, BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
-- 
2.30.1
