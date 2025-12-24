Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD385E75448
	for <buildroot@archiver.kernel.org>; Wed, 24 Dec 2025 11:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D75240A6D;
	Wed, 24 Dec 2025 11:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4nPQm79Ip6i; Wed, 24 Dec 2025 11:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA7140A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766575452;
	bh=xFQAXVJaabPgQ2QmiUMjEo1fOy5KjqAStDlVM4cGh4E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZQRkdnszGhoHvBbUV3JvFv5jWcQh7vdYa3NC4JjH/1+ECEHPz73bRocZhFQVR33C
	 f8o5qmh5t8pD2qYyIk1Ey5ABkySbYfISnPOOTf0hdMGUExOW+hugmwgN1yjlW7qK0E
	 /it2tdTFCLXxcAKWwHM815LWNqJrE/xoPdIFdmSFUt6TX/QpEJlR2TZxyOHr318x5j
	 5smJ1t0J2iSvnGOpAEuN2PcMHlq3/O3ozN79rahMqZZdBN26uH87rf0Qqf+Nl3ff55
	 zsIshVO7C5xJFoOjbaBaqubZRe7M3CM4IBMsgMiqqV9AwbBsnRzrtrCtlObZSBEZW1
	 in5K2ZHtaViKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA7140A41;
	Wed, 24 Dec 2025 11:24:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF623BE
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 11:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C979540232
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 11:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqJKfQ0U8sTk for <buildroot@buildroot.org>;
 Wed, 24 Dec 2025 11:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 255414027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 255414027C
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 255414027C
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 11:24:07 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id YMyLvLFGpIfDkYMyLvASuI; Wed, 24 Dec 2025 12:24:06 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 24 Dec 2025 12:24:04 +0100
Message-ID: <20251224112404.3796586-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251224112404.3796586-1-giulio.benetti@benettiengineering.com>
References: <20251224112404.3796586-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGKUdMn7RTI2Rtr63gmGyzJerPHDhFUMGQxu+kfQleV1C6g1waHAUQejVOZLqGzmrg8bP6IWl7zfv2zT8EShEm5fVCXPAJbPj60SYwFmqMJNXuysrthj
 dk5mJI4qk8oFA7pGTtHFD/gIHvDHerO0fdGsJCgoCaq7xXUN9qsZ7Nh/txvw8/GlTpD5Xow1xYD5zXEgwbgbp9AEulLvz3CGFe1UvEz+nfh2uddxLSYVnrX5
 hK95Ohqa5DXzDP4XtNicTzzHW1vy69EvVQL+ShQJtJk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766575446; bh=4ggsSKmH5QnnH/0pSmk7KJsBys2ooqd4mFs3q2R7XSE=;
 h=From:To:Subject:Date:MIME-Version;
 b=YvbYWajtwlxNoqlaTotQ7/iJ9kNOHcTejaivpXrz8h5sHLXxtax8+uYZ1/FSIOrmI
 SnLZCO8q0GJuOIFKHmcsBjQ7qnyYi+843PQwsoR9+8PYm+nysB3kK5ehM6A70a1WcK
 7GKrPulLtnF5TQLZhHQadRaMlV7zskdpkqfabOcnE6I7obPADBG/itjmEsIEg8x/he
 WSv98NxTUmtgzbTMYLhABhbo1FtYvZkFCcTSnCCoFPKnU8Jmhub2Xqxi9CPPp0Kqco
 RvZetsjRkhEDaUKLj/CTR+uOkPytBCjW/R61K79ZNfHvd67KXOnfxyLkTzdbly16rC
 aElBzzYEQkkPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YvbYWajt
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to vim
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 224c0fda73..d576fe9c61 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1334,6 +1334,7 @@ F:	package/swugenerator/
 F:	package/swupdate/
 F:	package/trace-cmd/
 F:	package/udisks/
+F:	package/vim/
 F:	package/wilc-driver/
 F:	package/zlib-ng/
 F:	toolchain/
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
