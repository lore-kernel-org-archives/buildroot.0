Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD80FC47088
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 22:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC986410A5;
	Sat,  3 Dec 2022 22:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC986410A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuXnsZ0I2Fbz; Sat,  3 Dec 2022 22:42:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 959AE410BD;
	Sat,  3 Dec 2022 22:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 959AE410BD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 167971BF48B
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 22:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E57D14017E
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 22:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E57D14017E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id girb2G-BZKRb for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 22:42:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE12C400C8
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE12C400C8
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 22:42:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h10so3718386wrx.3
 for <buildroot@buildroot.org>; Sat, 03 Dec 2022 14:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p7+ZdswupT622nsirjZ0O6R3jmLxmBpBDHdtCrBuPNw=;
 b=OvP2TVyDeN6kO6wWwovS3Nfs8kBaj/nUYRQH8MXvBepSXUh2QfaPvhVkeY+KiOyJYS
 HBHiuT1RBAKpTOckIuWOX9ZKwYQWvqdBRdgiIGZ7Z0vBL1KUBzXPXqFy0JTfv/ycpRun
 WGjnxMcLFQ/AuALnsy8wmDFvvnSS/Xe8k8bJLWMSs7XXxYrX/Vg6t0pbdxKR30gGVodc
 OswCAIL3BtDSytXEgP0Zqj9qXZo3mNJgA6TXInU87VNx+txWDBoBKNERNlhEI3NIXoFQ
 mabXx6vx1Jgs8XBunS3mz1ksHmjEmYoh2g9QeRjA6+jOQy8nxPCNdnOV3GYDefOilbev
 ag6w==
X-Gm-Message-State: ANoB5pnrtyN9R7ywG2t3BkfegPUiK9P+EZSUTzYvYA6C0OAO8ZpB8iIC
 fKs7+4OyJ61nTSX4fzIxlq+UKdvBoDI=
X-Google-Smtp-Source: AA0mqf42O2W1QeQkxNXF+DbEu1Y19p8LADXWeRNd0atat3CyeKxqTMH1nxgvkLBEsrfTUw4G0uRRHQ==
X-Received: by 2002:adf:eb8f:0:b0:22e:48ee:dc64 with SMTP id
 t15-20020adfeb8f000000b0022e48eedc64mr46006614wrn.319.1670107322189; 
 Sat, 03 Dec 2022 14:42:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c3b8300b003cfbbd54178sm20889306wms.2.2022.12.03.14.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 14:42:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Dec 2022 23:41:57 +0100
Message-Id: <20221203224157.1196944-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p7+ZdswupT622nsirjZ0O6R3jmLxmBpBDHdtCrBuPNw=;
 b=mb0nSp67Zy4TJi03dg83F+VIiWWphrhkKJfZhAiKHBrtP+NJl2KdAfXzFiqHih8iCY
 baD3cqqPaeacpddoo3tumV35864KCaADUP2YRXdsse541JWyGMMOInm0kCdB/nNMoCAV
 g1Ptp7bnHGqt2zbDEyK31k2ad0arasqdq0vf/XCd1QbSFyvmSoI9nrdDhm2AP4+bWy2R
 JsDIkniZfPSs7+kTseRHbIl5KUtZ/pvYCuJxDv8HXbtyxZqTBeZxe0uVgz1+uJM+JWAw
 FSqMbf1Kq/iOEowmi9c+QLEWCWPs0AAJeHXAEyI9VmvFFSvlL3Ux5As9PDRQZceaczzS
 0Y5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mb0nSp67
Subject: [Buildroot] [PATCH 1/1] package/python3: fix CVE-2022-37454
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Keccak XKCP SHA-3 reference implementation before fdc6fef has an
integer overflow and resultant buffer overflow that allows attackers to
execute arbitrary code or eliminate expected cryptographic properties.
This occurs in the sponge function interface.

Python 3.11 and later switched to using tiny_sha3 in GH-32060, so they
should not be affected.

https://github.com/python/cpython/issues/98517

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Fix-buffer-overflows-in-_sha3-module.patch | 101 ++++++++++++++++++
 package/python3/python3.mk                    |   3 +
 2 files changed, 104 insertions(+)
 create mode 100644 package/python3/0034-3-10-gh-98517-Fix-buffer-overflows-in-_sha3-module.patch

diff --git a/package/python3/0034-3-10-gh-98517-Fix-buffer-overflows-in-_sha3-module.patch b/package/python3/0034-3-10-gh-98517-Fix-buffer-overflows-in-_sha3-module.patch
new file mode 100644
index 0000000000..5c50dd16cb
--- /dev/null
+++ b/package/python3/0034-3-10-gh-98517-Fix-buffer-overflows-in-_sha3-module.patch
@@ -0,0 +1,101 @@
+From 0e4e058602d93b88256ff90bbef501ba20be9dd3 Mon Sep 17 00:00:00 2001
+From: Theo Buehler <botovq@users.noreply.github.com>
+Date: Fri, 21 Oct 2022 21:26:01 +0200
+Subject: [PATCH] [3.10] gh-98517: Fix buffer overflows in _sha3 module
+ (#98519)
+
+This is a port of the applicable part of XKCP's fix [1] for
+CVE-2022-37454 and avoids the segmentation fault and the infinite
+loop in the test cases published in [2].
+
+[1]: https://github.com/XKCP/XKCP/commit/fdc6fef075f4e81d6b1bc38364248975e08e340a
+[2]: https://mouha.be/sha-3-buffer-overflow/
+
+Regression test added by: Gregory P. Smith [Google LLC] <greg@krypto.org>
+
+[Retrieved from:
+https://github.com/python/cpython/commit/0e4e058602d93b88256ff90bbef501ba20be9dd3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Lib/test/test_hashlib.py                          |  9 +++++++++
+ .../2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst |  1 +
+ Modules/_sha3/kcp/KeccakSponge.inc                | 15 ++++++++-------
+ 3 files changed, 18 insertions(+), 7 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
+
+diff --git a/Lib/test/test_hashlib.py b/Lib/test/test_hashlib.py
+index 535f4aa3e04c..9aa6c1f0a3b6 100644
+--- a/Lib/test/test_hashlib.py
++++ b/Lib/test/test_hashlib.py
+@@ -495,6 +495,15 @@ def test_case_md5_huge(self, size):
+     def test_case_md5_uintmax(self, size):
+         self.check('md5', b'A'*size, '28138d306ff1b8281f1a9067e1a1a2b3')
+ 
++    @unittest.skipIf(sys.maxsize < _4G - 1, 'test cannot run on 32-bit systems')
++    @bigmemtest(size=_4G - 1, memuse=1, dry_run=False)
++    def test_sha3_update_overflow(self, size):
++        """Regression test for gh-98517 CVE-2022-37454."""
++        h = hashlib.sha3_224()
++        h.update(b'\x01')
++        h.update(b'\x01'*0xffff_ffff)
++        self.assertEqual(h.hexdigest(), '80762e8ce6700f114fec0f621fd97c4b9c00147fa052215294cceeed')
++
+     # use the three examples from Federal Information Processing Standards
+     # Publication 180-1, Secure Hash Standard,  1995 April 17
+     # http://www.itl.nist.gov/div897/pubs/fip180-1.htm
+diff --git a/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
+new file mode 100644
+index 000000000000..2d23a6ad93c7
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
+@@ -0,0 +1 @@
++Port XKCP's fix for the buffer overflows in SHA-3 (CVE-2022-37454).
+diff --git a/Modules/_sha3/kcp/KeccakSponge.inc b/Modules/_sha3/kcp/KeccakSponge.inc
+index e10739deafa8..cf92e4db4d36 100644
+--- a/Modules/_sha3/kcp/KeccakSponge.inc
++++ b/Modules/_sha3/kcp/KeccakSponge.inc
+@@ -171,7 +171,7 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
+     i = 0;
+     curData = data;
+     while(i < dataByteLen) {
+-        if ((instance->byteIOIndex == 0) && (dataByteLen >= (i + rateInBytes))) {
++        if ((instance->byteIOIndex == 0) && (dataByteLen-i >= rateInBytes)) {
+ #ifdef SnP_FastLoop_Absorb
+             /* processing full blocks first */
+ 
+@@ -199,10 +199,10 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
+         }
+         else {
+             /* normal lane: using the message queue */
+-
+-            partialBlock = (unsigned int)(dataByteLen - i);
+-            if (partialBlock+instance->byteIOIndex > rateInBytes)
++            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
+                 partialBlock = rateInBytes-instance->byteIOIndex;
++            else
++                partialBlock = (unsigned int)(dataByteLen - i);
+             #ifdef KeccakReference
+             displayBytes(1, "Block to be absorbed (part)", curData, partialBlock);
+             #endif
+@@ -281,7 +281,7 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
+     i = 0;
+     curData = data;
+     while(i < dataByteLen) {
+-        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen >= (i + rateInBytes))) {
++        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen-i >= rateInBytes)) {
+             for(j=dataByteLen-i; j>=rateInBytes; j-=rateInBytes) {
+                 SnP_Permute(instance->state);
+                 SnP_ExtractBytes(instance->state, curData, 0, rateInBytes);
+@@ -299,9 +299,10 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
+                 SnP_Permute(instance->state);
+                 instance->byteIOIndex = 0;
+             }
+-            partialBlock = (unsigned int)(dataByteLen - i);
+-            if (partialBlock+instance->byteIOIndex > rateInBytes)
++            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
+                 partialBlock = rateInBytes-instance->byteIOIndex;
++            else
++                partialBlock = (unsigned int)(dataByteLen - i);
+             i += partialBlock;
+ 
+             SnP_ExtractBytes(instance->state, curData, instance->byteIOIndex, partialBlock);
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2e17104102..b291fcf582 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -16,6 +16,9 @@ PYTHON3_CPE_ID_PRODUCT = python
 # 0033-3.11-gh-98433-Fix-quadratic-time-idna-decoding.-GH-9.patch
 PYTHON3_IGNORE_CVES += CVE-2022-45061
 
+# 0034-3-10-gh-98517-Fix-buffer-overflows-in-_sha3-module.patch
+PYTHON3_IGNORE_CVES += CVE-2022-37454
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
