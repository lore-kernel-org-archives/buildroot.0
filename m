Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA8CC001B0
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 13:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A5381CAD;
	Mon, 14 Aug 2023 13:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A5381CAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCMNYmxVbBf2; Mon, 14 Aug 2023 13:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC8C081C44;
	Mon, 14 Aug 2023 13:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC8C081C44
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76B501BF396
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 13:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2337B60FD3
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 13:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2337B60FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cti9Cp0MbQcQ for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 13:10:20 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A78A060F44
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 13:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A78A060F44
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 83368352BD9B; Mon, 14 Aug 2023 15:10:16 +0200 (CEST)
Date: Mon, 14 Aug 2023 15:10:16 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNonuEcvkO/N5PXe@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1692018616; bh=HhV3K2nOpQfu01iNljqWPD3VIydQR6N5sr4eNFauSqM=;
 h=Date:From:To:Subject:From;
 b=NYme2H9Wv3U2uJc33cFIntopwRE/rXa4XoeVSzMa9Gt7RVby/BeEDtRwHSzPQeo0V
 xCp5LIEsl93B/EAxBnzf4haDiHS9o9L2IgsnoMJz6znkauDYW1b56O0xC+QkZxq98T
 jyiisQxU2S/vQg1yuaOZ/ECeLr7n88GiR5YM5PiW0lAATPfgq0uYO6NIuN7WiIKVkc
 XnxOcZCu5XMN/v/wHBNa7h5K/zR11iieHdFzHJBTwUf65pMA/eiJyRt1ykbJXkjP+S
 QZIDN27IMIMw6B4Uv729T/wrKXwtFn9zf1L0EIdG7rNkiios7RUgz3VUv6oeRRjp08
 DjXaYXtES3TRw==
Subject: [Buildroot] [PATCH] package/zlib-ng: handle power9 cpu,
 fix compile error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Zlib-ng misdetects the powerpc cpu and the package fails to compile
for non-power9 cpu's.
Power9 support was added Upstream in commit:
02d10b252cc54159f7c33823048daec4b023fb22
So it was introduced in zlib-ng 2.1.3 and this was added to Buildroot
in commit 0df456ea6e05306fb077e96064adf68f3863eeea.

So there is no need to backport it to older Buildroot releases.

Fixes:
 - http://autobuild.buildroot.net/results/a9f/a9f45486664b2d5b23a2f330a63955a06ae8189d

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/zlib-ng/zlib-ng.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 23f1bd2158..fbb906503a 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -35,4 +35,10 @@ else
 ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
 endif
 
+ifeq ($(BR2_powerpc_power9),y)
+ZLIB_NG_CONF_OPTS += -DWITH_POWER9=ON
+else
+ZLIB_NG_CONF_OPTS += -DWITH_POWER9=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
