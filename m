From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Mar 2019 14:38:42 +0100
Subject: [Buildroot] [git commit] package/gesftpserver: bump version to
 latest stable
Message-ID: <20190320134049.9318382B56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83f7a923d092411c2c15cc08b66c379ce7359571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, gesftpserver wants to treat al warnings as errors, but there
is an actual warning in the release, so we quiesce that by not treating
warnings as errors.

We also backport a patch from upstream, to fix the ordering of some
fields when sending file attributes.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...r-of-v3-attributes-according-to-draft-iet.patch | 30 ++++++++++++++++++++++
 package/gesftpserver/gesftpserver.hash             |  3 ++-
 package/gesftpserver/gesftpserver.mk               |  6 ++++-
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/package/gesftpserver/0001-Change-order-of-v3-attributes-according-to-draft-iet.patch b/package/gesftpserver/0001-Change-order-of-v3-attributes-according-to-draft-iet.patch
new file mode 100644
index 0000000000..3697d0e525
--- /dev/null
+++ b/package/gesftpserver/0001-Change-order-of-v3-attributes-according-to-draft-iet.patch
@@ -0,0 +1,30 @@
+From 4b5c7eb63894bd2b1fedeb2a8e9bd16bf3c8c555 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bernd=20Holzm=C3=BCller?=
+ <bernd.holzmueller@tiggerswelt.net>
+Date: Mon, 11 Feb 2019 23:57:01 +0100
+Subject: [PATCH] Change order of v3-attributes according to
+ draft-ietf-secsh-filexfer-00/02
+
+[yann.morin.1998 at free.fr: backport from upstream]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ v3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/v3.c b/v3.c
+index 57cc31e..1fd86ad 100644
+--- a/v3.c
++++ b/v3.c
+@@ -121,8 +121,8 @@ static void v3_sendattrs(struct sftpjob *job, const struct sftpattr *attrs) {
+       fatal("sending out-of-range mtime");
+     if(a != attrs->atime.seconds)
+       fatal("sending out-of-range mtime");
+-    sftp_send_uint32(job->worker, m);
+     sftp_send_uint32(job->worker, a);
++    sftp_send_uint32(job->worker, m);
+   }
+   /* Note that we just discard unknown bits rather than reporting errors. */
+ }
+-- 
+2.14.1
+
diff --git a/package/gesftpserver/gesftpserver.hash b/package/gesftpserver/gesftpserver.hash
index 1a8a5f3492..790cbe97c2 100644
--- a/package/gesftpserver/gesftpserver.hash
+++ b/package/gesftpserver/gesftpserver.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 8ac1938d0f62a05799b2aeab489d6ce098c3fe53280a9b66c0957b1fdcbcbab9  sftpserver-0.2.2.tar.gz
+sha256  4963b85787de3485085a5356c671c58b8b33125f528ff1b2fe8b534ed8a0c1bd  sftpserver-1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 58c6270a09..ff7ce768ae 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-GESFTPSERVER_VERSION = 0.2.2
+GESFTPSERVER_VERSION = 1
 GESFTPSERVER_SOURCE = sftpserver-$(GESFTPSERVER_VERSION).tar.gz
 GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver
 GESFTPSERVER_LICENSE = GPL-2.0+
 GESFTPSERVER_LICENSE_FILES = COPYING
+
+# "Missing prototype" warning treated as error
+GESFTPSERVER_CONF_OPTS = --disable-warnings-as-errors
+
 # forgets to link against pthread when cross compiling
 GESFTPSERVER_CONF_ENV = LIBS=-lpthread
 
