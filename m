Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49831C5320E
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E8760D65;
	Thu, 22 Aug 2024 10:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gWh1ZXA-N88; Thu, 22 Aug 2024 10:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 327D960E26
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 327D960E26;
	Thu, 22 Aug 2024 10:21:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8172C1BF346
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F31F407C6
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LG5X0IhTETz3 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 10:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A184340789
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A184340789
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A184340789
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 10:20:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E793CC0006;
 Thu, 22 Aug 2024 10:20:46 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 Peter Korsgaard <peter@korsgaard.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 22 Aug 2024 12:20:31 +0200
Message-ID: <20240822102040.2083799-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com>
References: <20240822102040.2083799-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724322047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NnTaAd/jKLABuR829MCe6jAxWaYVHZi7ljF67UkpRow=;
 b=l2n0i2MbTUWME33vwuX5M13L0w0a1jUKp23Lwcnv5sRMWGI5VmBNiY+RAVuXH28Nvbr6ws
 F7/UWaKv2XJMrJ4Esjwl99TFiT87pBBE8dJjgZOUQesYyNSV7PcKYeFYXcnbKqNzpbzveE
 WOVEiKV1blpB42uxOL9UaLxpfvkYrOKfldlO/psOfD8DqDUekjzu02losMSWqa2o5PrecU
 z6rHGaGAK8LR1ph3hC1ShNFDyzZ920wzpZ8KmIBGDiVjid6gHOb/iSd2EyujqdzfOGeMUs
 rT8Bp1lptXUF0+rt0O1bveTDjepZOyH7biPByvX74orCUm6+aPWZxmDwJVjgpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l2n0i2Mb
Subject: [Buildroot] [PATCH 2024.02.x 6/9] package/qt6/qt6base: backport fix
 for CVE-2023-51714
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit backports upstream patches that are needed to fix
CVE-2023-51714. The second one is the actual CVE fix, the first one is
needed to only backporting the second patch in a reasonable way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Only applicable to 2024.02.x, since >= 2024.05 use a Qt6 version that
already has the fix.
---
 .../0010-HPack-fix-a-Yoda-Condition.patch     | 43 +++++++++++++++++
 ...fix-incorrect-integer-overflow-check.patch | 48 +++++++++++++++++++
 package/qt6/qt6base/qt6base.mk                |  2 +
 3 files changed, 93 insertions(+)
 create mode 100644 package/qt6/qt6base/0010-HPack-fix-a-Yoda-Condition.patch
 create mode 100644 package/qt6/qt6base/0011-HPack-fix-incorrect-integer-overflow-check.patch

diff --git a/package/qt6/qt6base/0010-HPack-fix-a-Yoda-Condition.patch b/package/qt6/qt6base/0010-HPack-fix-a-Yoda-Condition.patch
new file mode 100644
index 0000000000..ca9c740df0
--- /dev/null
+++ b/package/qt6/qt6base/0010-HPack-fix-a-Yoda-Condition.patch
@@ -0,0 +1,43 @@
+From fc5e607b78dc6dc2a17e3586d2085e9d25412785 Mon Sep 17 00:00:00 2001
+From: Marc Mutz <marc.mutz@qt.io>
+Date: Tue, 12 Dec 2023 20:51:56 +0100
+Subject: [PATCH] HPack: fix a Yoda Condition
+
+Putting the variable on the LHS of a relational operation makes the
+expression easier to read. In this case, we find that the whole
+expression is nonsensical as an overflow protection, because if
+name.size() + value.size() overflows, the result will exactly _not_
+be > max() - 32, because UB will have happened.
+
+To be fixed in a follow-up commit.
+
+As a drive-by, add parentheses around the RHS.
+
+Pick-to: 6.7 6.6 6.5 6.2 5.15
+Change-Id: I35ce598884c37c51b74756b3bd2734b9aad63c09
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+
+Upstream: https://github.com/qt/qtbase/commit/658607a34ead214fbacbc2cca44915655c318ea9
+[Thomas: needed to backport fix for
+https://security-tracker.debian.org/tracker/CVE-2023-51714]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/network/access/http2/hpacktable.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/network/access/http2/hpacktable.cpp b/src/network/access/http2/hpacktable.cpp
+index 0b69ee86a9b..34da5594e2b 100644
+--- a/src/network/access/http2/hpacktable.cpp
++++ b/src/network/access/http2/hpacktable.cpp
+@@ -27,7 +27,7 @@ HeaderSize entry_size(QByteArrayView name, QByteArrayView value)
+     // 32 octets of overhead."
+ 
+     const unsigned sum = unsigned(name.size() + value.size());
+-    if (std::numeric_limits<unsigned>::max() - 32 < sum)
++    if (sum > (std::numeric_limits<unsigned>::max() - 32))
+         return HeaderSize();
+     return HeaderSize(true, quint32(sum + 32));
+ }
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/0011-HPack-fix-incorrect-integer-overflow-check.patch b/package/qt6/qt6base/0011-HPack-fix-incorrect-integer-overflow-check.patch
new file mode 100644
index 0000000000..a7b7c20b64
--- /dev/null
+++ b/package/qt6/qt6base/0011-HPack-fix-incorrect-integer-overflow-check.patch
@@ -0,0 +1,48 @@
+From 01348087ee851f1781a27e7ce8a1ed0bda5441fe Mon Sep 17 00:00:00 2001
+From: Marc Mutz <marc.mutz@qt.io>
+Date: Tue, 12 Dec 2023 22:08:07 +0100
+Subject: [PATCH] HPack: fix incorrect integer overflow check
+
+This code never worked:
+
+For the comparison with max() - 32 to trigger, on 32-bit platforms (or
+Qt 5) signed interger overflow would have had to happen in the
+addition of the two sizes. The compiler can therefore remove the
+overflow check as dead code.
+
+On Qt 6 and 64-bit platforms, the signed integer addition would be
+very unlikely to overflow, but the following truncation to uint32
+would yield the correct result only in a narrow 32-value window just
+below UINT_MAX, if even that.
+
+Fix by using the proper tool, qAddOverflow.
+
+Pick-to: 6.7 6.6 6.5 6.2 5.15
+Change-Id: I7599f2e75ff7f488077b0c60b81022591005661c
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+
+Fixes: https://security-tracker.debian.org/tracker/CVE-2023-51714
+Upstream: https://github.com/qt/qtbase/commit/ee5da1f2eaf8932aeca02ffea6e4c618585e29e3
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/network/access/http2/hpacktable.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/network/access/http2/hpacktable.cpp b/src/network/access/http2/hpacktable.cpp
+index 34da5594e2b..f20ec92d4c5 100644
+--- a/src/network/access/http2/hpacktable.cpp
++++ b/src/network/access/http2/hpacktable.cpp
+@@ -26,7 +26,9 @@ HeaderSize entry_size(QByteArrayView name, QByteArrayView value)
+     // for counting the number of references to the name and value would have
+     // 32 octets of overhead."
+ 
+-    const unsigned sum = unsigned(name.size() + value.size());
++    size_t sum;
++    if (qAddOverflow(size_t(name.size()), size_t(value.size()), &sum))
++        return HeaderSize();
+     if (sum > (std::numeric_limits<unsigned>::max() - 32))
+         return HeaderSize();
+     return HeaderSize(true, quint32(sum + 32));
+-- 
+2.46.0
+
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 9d21aefbfb..0bb9a197ec 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -17,6 +17,8 @@ QT6BASE_IGNORE_CVES += CVE-2023-32762
 QT6BASE_IGNORE_CVES += CVE-2023-32763
 # 0009-QXmlStreamReader-Raise-error-on-unexpected-tokens.patch
 QT6BASE_IGNORE_CVES += CVE-2023-38197
+# 0011-HPack-fix-incorrect-integer-overflow-check.patch
+QT6BASE_IGNORE_CVES += CVE-2023-38197
 
 QT6BASE_CMAKE_BACKEND = ninja
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
