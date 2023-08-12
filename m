Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF106C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 13:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DC7260BA0;
	Sat, 12 Aug 2023 13:04:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DC7260BA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBU2fctmGkPD; Sat, 12 Aug 2023 13:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEBA06079B;
	Sat, 12 Aug 2023 13:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEBA06079B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1FE81BF3B5
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 13:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB6F681BF4
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 13:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB6F681BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYnmuXiM5wEC for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 13:04:15 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04F0B81BE3
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 13:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F0B81BE3
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 475CB3520C44; Sat, 12 Aug 2023 15:04:10 +0200 (CEST)
Date: Sat, 12 Aug 2023 15:04:10 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNeDSjN9ON9dG18Q@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691845451; bh=O2AJOKOX6ZwODCiseCL5JcScrd2iLXtfTk9J8od7r9I=;
 h=Date:From:To:Subject:From;
 b=NY2tAieJ1t7+L8hk/dEobvx632U/6gbB4U2E2BQfIsxa9O2KMXJy3v/lYaF1VUkNz
 uii4kUaZcbfU0anT97aFFyWPib6cndqjSvwNwRIA4NJerPqQBox//6+0wrX+YBbVxY
 Dn7glFgf9KvOg/z1HxNhdBADRTcBDm56Kfh86p92PJJYgWNscADDDsq7RdpVOA3Apt
 n5yRDUYItY3sYPrWvJN4Zk9SWyX7TK1Uq0Gf7oJe2ldBdsrZ9hXTGIM7wJcrNDSy/M
 MNwM/otK/h8C3bVix7dHHI2ZQ1LyyV3XcIZAuqFXHP16++/TbDDgGtcWPkRHyMJ/0W
 RMdVPkz325RgQ==
Subject: [Buildroot] [PATCH v2 1/2] package/xfsprogs: fix linking error when
 -O0 is used
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

Urcu does not like -O0 it needs gcc optimizations.
Force -O1 in this case. Inspired by package fwts.

The issue got introduced in commit 2f8f69012e0eee7f3e98212fb3da118c211f3c0b:
before this commit, xfsprogs builds fine at -O0, after this commit, it fails
to build at -O0. As this commit went into 2022.02, the fix needs to be
backported to stable branches.

Fixes:
 - http://autobuild.buildroot.net/results/3bd/3bd7de784953ab1fa70bf5572eccd7b10e4a0e17

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - add more information about when the problem was introduced
    from Thomas Petazzoni's review
---
 package/xfsprogs/xfsprogs.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 695471bddc..09f59a76f4 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -27,6 +27,10 @@ else
 XFSPROGS_CONF_OPTS += --disable-libicu
 endif
 
+ifeq ($(BR2_OPTIMIZE_0),y)
+XFSPROGS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
+endif
+
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
