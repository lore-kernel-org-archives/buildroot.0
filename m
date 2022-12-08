Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57618C3A5A7
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 10:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2BE04016B;
	Thu,  8 Dec 2022 10:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2BE04016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcD3Pd6iyi2s; Thu,  8 Dec 2022 10:02:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3D4D41915;
	Thu,  8 Dec 2022 10:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D4D41915
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2D6A1BF3ED
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAACC4184A
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAACC4184A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PVSqxWzLZPOE for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 10:01:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CE4E4016B
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 10:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE4E4016B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E117485DF2; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Dec 2022 10:56:41 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 773f4246bd6637c7d9e9755c31d86915b7c3190d
X-Git-Newrev: 2d8eac03c398a7829e84f6a685266e2810c1c5b0
X-Patchwork-Hint: ignore
Message-Id: <20221208100118.E117485DF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/python3: fix
 CVE-2022-37454
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d8eac03c398a7829e84f6a685266e2810c1c5b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The Keccak XKCP SHA-3 reference implementation before fdc6fef has an
integer overflow and resultant buffer overflow that allows attackers to
execute arbitrary code or eliminate expected cryptographic properties.
This occurs in the sponge function interface.

Python 3.11 and later switched to using tiny_sha3 in GH-32060, so they
should not be affected.

https://github.com/python/cpython/issues/98517

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 92d96e8513c75a8ab496c90841920e896085915f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...8517-Fix-buffer-overflows-in-_sha3-module.patch | 101 +++++++++++++++++++++
 package/python3/python3.mk                         |   3 +
 2 files changed, 104 insertions(+)

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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
