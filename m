Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0187CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:21:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7C8A600EF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7C8A600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AC2A4059F;
	Tue,  3 Aug 2021 23:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qDR3qbaM3DDQ; Tue,  3 Aug 2021 23:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B4B54052E;
	Tue,  3 Aug 2021 23:21:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 896BB1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85BC240679
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2P55nOs8mwyV for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 780D44067D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CC70F860D3; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Jun 2021 21:27:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 78c42cdca2679a9237003c27e7018b56e5e8e568
X-Git-Newrev: 37a1af7a74e57e42ff6beefb8a7fdcae01a00ff7
X-Patchwork-Hint: ignore
Message-Id: <20210803210956.CC70F860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing/infra: add
 img_round_power2() function
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=37a1af7a74e57e42ff6beefb8a7fdcae01a00ff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since Qemu 5.1, SD card images must have a size that are a power of
two. While some filesystem (such as ext2/3/4) allow to specify the
expected size of the filesystem, others such as SquashFS do not have
this capability.

We were already extending the size of such images to the next 1 MB
boundary using "truncate -s %1M", but that is no longer sufficient. So
instead, we introduce a helper function that extends the size of an
image to the next power of two.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - use f.trunctate() rather than subprocess.call([truncate,...])
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/infra/__init__.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 6522a265f3..b10a7601a3 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -112,3 +112,15 @@ def get_elf_prog_interpreter(builddir, prefix, fpath):
             continue
         return m.group(1)
     return None
+
+
+def img_round_power2(img):
+    """
+    Rounds up the size of an image file to the next power of 2
+    """
+    sz = os.stat(img).st_size
+    pow2 = 1
+    while pow2 < sz:
+        pow2 = pow2 << 1
+    with open(img, 'ab') as f:
+        f.truncate(pow2)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
