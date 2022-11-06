Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C061C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F62408DA;
	Mon, 20 Feb 2023 21:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4F62408DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piA6QxKXJW50; Mon, 20 Feb 2023 21:06:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B250142A6E;
	Mon, 20 Feb 2023 21:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B250142A6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD781BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41EEB6107A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41EEB6107A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLIrYPyXQGRK for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A75F661040
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A75F661040
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A042286494; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 11:40:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 934ec83e9d005fb21e5813f4480ebd624ee28c6c
X-Git-Newrev: 0fc1bf137e44caf44a018cf948d5bd2a10566860
X-Patchwork-Hint: ignore
Message-Id: <20230220205147.A042286494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ca-certificates: add
 support for cryptography >= 3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fc1bf137e44caf44a018cf948d5bd2a10566860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Building ca-certificates with a newer cryptography is breaking because
python-cryptography's x509 API changed to accept only bytes, not str.

Carry a patch that has been submitted upstream [0] but has not yet been
applied [1]. Minor changes to account for 0001-*.patch.

[0] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1008244
[1] https://salsa.debian.org/debian/ca-certificates

Signed-off-by: Justin Wood <jwood@starry.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...tdata2pem.py-Fix-compat-with-cryptography.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch b/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
new file mode 100644
index 0000000000..0537da9224
--- /dev/null
+++ b/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
@@ -0,0 +1,29 @@
+From 5e493ca307a031e81528ceddb96f3da40bc062cf Mon Sep 17 00:00:00 2001
+From: Wataru Ashihara <wsh@iij.ad.jp>
+Date: Wed, 2 Nov 2022 12:40:05 -0400
+Subject: [PATCH] mozilla/certdata2pem.py: Fix compat with cryptography > 3.0
+
+In newer cryptography packages, load_der_x509_certificate is enforced to be 'bytes' rather than currently used 'bytearray'.  This fixes that.
+
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1008244
+Signed-off-by: Justin Wood <jwood@starry.com>
+---
+ mozilla/certdata2pem.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
+index a6261f8..c0fa52c 100644
+--- a/mozilla/certdata2pem.py
++++ b/mozilla/certdata2pem.py
+@@ -122,7 +122,7 @@ for obj in objects:
+         try:
+             from cryptography import x509
+ 
+-            cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
++            cert = x509.load_der_x509_certificate(bytes(obj['CKA_VALUE']))
+             if cert.not_valid_after < datetime.datetime.now():
+                 print('!'*74)
+                 print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
+-- 
+2.38.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
