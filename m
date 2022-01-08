Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99103C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EB6D40908;
	Sat,  8 Jan 2022 16:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Q7OH8nWs6hq; Sat,  8 Jan 2022 16:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EC7440871;
	Sat,  8 Jan 2022 16:53:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 898E21BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77DFF81423
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:52:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6gx-XXoIFafh for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3552A8140C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:52:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 89A0281DFE; Sat,  8 Jan 2022 16:46:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 17:51:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b5f7ce29288e2ba393ca7cd4768a83cdb5dec48
X-Git-Newrev: 363dd649f31c7e7732f3cd509d43cebbb53e51ce
X-Patchwork-Hint: ignore
Message-Id: <20220108164622.89A0281DFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ca-certificates: remove dependency
 on host-python-cryptography
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=363dd649f31c7e7732f3cd509d43cebbb53e51ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-python-cryptography module is only used by ca-certificates
for a check of the expiration date of certificates, which is only a
warning not even causing the build to abort, i.e something that
Buildroot users are most likely never going to see.

Since the host-python-cryptography dependency would soon require a
dependency on rust, it's a lot simpler to just patch the
certdata2pem.py script to no longer require cryptography, but only
make use of it if available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...tdata2pem.py-make-cryptography-module-opt.patch | 59 ++++++++++++++++++++++
 package/ca-certificates/ca-certificates.mk         |  2 +-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
new file mode 100644
index 0000000000..b76c1bfd7f
--- /dev/null
+++ b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
@@ -0,0 +1,59 @@
+From bf18b564122e8f976681a2398862fde1eafd84ba Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 6 Jan 2022 23:15:00 +0100
+Subject: [PATCH] mozilla/certdata2pem.py: make cryptography module optional
+
+The Python cryptography module is only used to verify if trusted
+certificates have expired, but this is only a warning. For some build
+systems and distributions, providing Python cryptography is costly,
+especially since it's now partly written in Rust.
+
+As the check is only a warning, it's anyway going to be overlooked by
+most people. This commit changes the check to be optional: if the
+cryptography Python module is there, we perform the check, otherwise
+the check is skipped.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ mozilla/certdata2pem.py | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
+index ede23d4..a6261f8 100644
+--- a/mozilla/certdata2pem.py
++++ b/mozilla/certdata2pem.py
+@@ -28,9 +28,6 @@ import sys
+ import textwrap
+ import io
+ 
+-from cryptography import x509
+-
+-
+ objects = []
+ 
+ # Dirty file parser.
+@@ -122,11 +119,16 @@ for obj in objects:
+         if not obj['CKA_LABEL'] in trust or not trust[obj['CKA_LABEL']]:
+             continue
+ 
+-        cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
+-        if cert.not_valid_after < datetime.datetime.now():
+-            print('!'*74)
+-            print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
+-            print('!'*74)
++        try:
++            from cryptography import x509
++
++            cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
++            if cert.not_valid_after < datetime.datetime.now():
++                print('!'*74)
++                print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
++                print('!'*74)
++        except ImportError:
++            pass
+ 
+         bname = obj['CKA_LABEL'][1:-1].replace('/', '_')\
+                                       .replace(' ', '_')\
+-- 
+2.33.1
+
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 7084ab781e..0b6962ab7b 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -7,7 +7,7 @@
 CA_CERTIFICATES_VERSION = 20211016
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
 CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
-CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python-cryptography
+CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
