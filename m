Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086A1CCF2C9
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 13:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7986A813E9;
	Sat, 17 Oct 2026 13:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GG4a1FrB36s1; Sat, 17 Oct 2026 13:12:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A765C81090
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792242779;
	b=FRBME0hBkjKanl5QnENzLnSggeUJnjneWD8TKLmDJSHed1tlCv1akysJxDOOSyq96xoj
	 pb+irHKjg72YvpFA7KlwY5Jm6nMIbLsgEMvbNc6w8d75RU3/dnXKFo2Auui0VHNYbhwr6
	 6a2bQ9vVCyof2J5KKsgBJT4H9lCPjmgjdYPVlFRC4HWZSOH3o6Ahjz0v2S7LlC48VNh/2
	 Sl67OPGe+Wdg+X9TCXKsegiGg0lij4xYhzunpFwq6Y0ZKLcCMDpHsOGEQLfWCYXZkUdqa
	 tPOvIoeeSz5WpPvyOvTpQit7U0CLBWHaJ1etY1ODKjEXBL/sWVP4AN0unAo7GQRwNuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792242779;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LOOiovl84KfgyOs10XTHDOT7jRYdctVw/EDFdyu+dzo=;
	b=g0aRtLtG369BsbiYrMkjmeVNv1iSziHVdr2WnTYe5ZVuvKxNf8xupIBf4u1Uhce5Uvjq
	 2mJbNUN0duZfb6bN/xCMxpenUBT4vZiQiHN9i+NGjgRG8MJFIN8iKrFSpVPdXCAW82+45
	 1AzCBoqkb6DNKFTQqSOMTlVhp5MteLseSD0mfuS3FwsnB0b7cPZQXd9q3gerzqByRlPLu
	 KpmLviid2oxpdqiPVH6Zz0cGVEKCEkIQuSFNw6DSVRGOaM6N9B0gbni1RtwdtsLyXgd5Y
	 oFn6vsUAdEI92kskesHkdLlAmElchiPoS0Us0ZxeyoKDkjWT/Vd6tUAwJMgn/TviwXg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792242779;
	bh=LOOiovl84KfgyOs10XTHDOT7jRYdctVw/EDFdyu+dzo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THA3EGLWIF1ll5wjV6o3A9hB3nbZqH3KMUNNrJ4d21snZmOf0ht2YbnT3ivlJ84bf
	 uSEbMSH1XNen3QtrdE6xFU/hZp/cUGEiyP2vvJ3ob2Y1j7JBme3zkiU4Sw3E4rfgcq
	 D+HsZZR2wmf0+6jJItnyTIFAdY6WZVn/l/5lEnmL0KMqX//SU2xQl03z3Tk4cYHcMG
	 iv7X3TJ06u9Sc4dTg6CCQX/fxPXdZjKSw0wNG9qVUz+hg5iYnCEX3NAfEx2FfjvF3I
	 5b0fFGBSLYMHlO6Vckj689Qp8pwsaGaLDtqjCn9AGAQXDm0juiwFDHNjioO3r+YWlm
	 tFtyX0bBTcH6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A765C81090;
	Sat, 17 Oct 2026 13:12:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22FFB1DE
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 092CE4092B
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5ET0BERGynW for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 13:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 75DC240930
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792242774;
 b=Q3PiKYOL0tFWB0Po/7FDB9zaHaa9+oU8jcyrnq9rjVFxssJ3bfbFRImU2i5z7yELsODZ
 +4fUZz+X0VkgdtxbdpkCIbaweY67yAmBglvGPoRt5kARyO1FATZMhVLshNnz+8JTp4m3X
 3DH/RGpPlQxLS02FXoKt+WKLHZvpmrVbkitnMUHwgUuUwcPcTVPLfdPRwZWZuLwV9C35c
 ZNGkjmQs1/mi3jJSDnyQzzowCAg/tS/yYPUhDWHtI9QE15S2QlgtsxrCvR8zA/4slBBi1
 P59FtSLYaxT7fJqmYqBQEmqxqGi4Y58rW2+GXHZy3HyjSolW3zt5KkXUorFszI96svQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792242774;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=/7d3TKhlJIMeDZBTAaolc7KtlfQ8UH0VlHL3axsOgJk=;
 b=b1Y4RV/wUVMAQM2Hox9g1g3ipdmxqy3HAhxQEEy8ZscKUEdGTfmqQZ5Z1dO47//C5NFU
 50gCt0BkMkbLiJxQ/JkeQdEJC6WB62V/smw0ohxBo9QpXFBAaf/f0Ddj+96fsIaIvxiV4
 7C0/1GwN1X4YNKwD7lmwKVHLNre8COt2sgWDI73TYR5yuRNPKmwHqeCRD/eU5GCF5HGVm
 +WsE75TgHkDqqzPRFAf9Iip9dNvLURd9NNO8bbV/1EgwstoYAwdnS1PWTehOk87h+zL+Y
 Tt+voYLS9SUauUBexWzEtCjRsMyAWTgx9ivw6TadKyDIqsRR/sM74C2jwtNk1QfJJWg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=Ug5bzLMg; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Ug5bzLMg
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75DC240930
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Ug5bzLMgrZRDnrgVNCRU0B3xUTsIyludsaKrltwRv8zInz5s5gRVrxt3VQVaEzJDPTuKcNnzL53AI30OmhVzAsnjig121oiHo4LOHla5U9g7nmI+eh7cazG1a6NY0rg9tnBCQMWt2SOXu6eJBprmcxK+ROLs71Z6Frh/DimHQpHaBdO+42GgflNmHnL38qvb7F86ahPAAekYWbEstitgdgI/Wpsi9qMLOEMW/DBdPIJ1EqNOi+N+ihx5WeE95Zx3ega+Dm97FOM0w+WUG3O6TC2yLucv863kY8FYuf+gGLZmh0wF2+cuGmqQAwbgC+BaoXgpnz4JdYf9icK8wTzn9Q==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=o7MY7R7pLSFRB/AGb+iztvat+6L6xHdbhwJuWgrE5Vc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1057166657; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 17 Oct 2026 13:12:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xI4DS-00000006b0h-0yyJ;
 Sat, 17 Oct 2026 15:12:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Oct 2026 15:12:41 +0200
Message-ID: <20261017131247.1572149-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017131247.1572149-1-peter@korsgaard.com>
References: <20261017131247.1572149-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 3/4] board/librecomputer/lafrite/readme.txt:
 document SPI flash dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Running a modern kernel with old A-TF/U-Boot leads to various issues.  Add a
note about updating the bootloader in the SPI flash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/librecomputer/lafrite/readme.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
index 86afa855e6..8747a9a23f 100644
--- a/board/librecomputer/lafrite/readme.txt
+++ b/board/librecomputer/lafrite/readme.txt
@@ -6,6 +6,14 @@ s805x SoC (quad A53), 512MB/1GB DDR4 and a 16MB SPI NOR flash:
 
 https://libre.computer/products/boards/aml-s805x-ac/
 
+Ensure the the bootloader in the SPI flash is up-to-date. Updates are
+available at:
+
+https://boot.libre.computer/release/aml-s805x-ac/
+
+To update, write aml-s805x-ac-spiflash.img to a USB flash drive and
+boot it as described below.
+
 How to build it
 ===============
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
