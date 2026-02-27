Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999E3104891F
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 21:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CE21821DE;
	Fri, 27 Feb 2026 21:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpZgq2QLLnCm; Fri, 27 Feb 2026 21:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E3E821DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772229455;
	bh=p8u8WE4WK2aTJEZYA7An28FxykIFMTqVcSwRzilbUyE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Sqj+njINkbX7Us1Lv7z4nRKIxIMnVUkj3OECqn8vdkuFL/iJcIr/x4D85NmBtijJy
	 7/U6WK8u9o0QgCLyU1Tk6m/H7/RhgJ7BlkpmWq/WerN4gl0pjo9qVY7iupg9nmCDBd
	 lPpfmDbvrcLBtyl7ld+m6Ys+hmH4Gx4dtclOEE8gWUuxAe/VBdhKcJppuiJcIFQ2NM
	 siKYTARp5SFawf4bCMxCd0OJ7tEhM81rcjd/E1jI6p7ERzojFW6XAknIbB1UGdPjI4
	 cTErcGjg6+/2RbJEwj85qYINY+XICiZz/6R/5cO5ycQybdWfjVU6mlpD7kICC3oNiZ
	 TQ+jKLsc2J1iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E3E821DF;
	Fri, 27 Feb 2026 21:57:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8C80204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAB6F821DF
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dhmAJ7fUyyYC for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 21:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8D16821DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D16821DE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8D16821DE
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:57:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 446EF19F57B;
 Fri, 27 Feb 2026 22:57:27 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 27 Feb 2026 22:57:11 +0100
Message-ID: <20260227215711.1232099-3-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227215711.1232099-1-ju.o@free.fr>
References: <20260227215711.1232099-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772229450;
 bh=TraKUiN7kuLD8XpViR8DMH39ygLxAEe9J0ll1PN3V6s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OUCbyu6p3VKfqZB7RntYJu9bk+RzXhWChB0Qj9netZYd5MOSmIAW6lIwjw6HsVe5T
 JeJQGZomSeDIvTXkUSedHBvZpHxvxzO8EbXy6Tfmgl05w+Ziq03z0LLCKBs7QXlv3N
 fEx2DS4qLIvndBf2wr4a6yVsh+iyJdmplXmOsVQUE06ef4sM4Lhsnz4osVoDvxQhsS
 E9mR1aaB5b5tagjdsImoXJQTeo8PqBrnCTpVFVh+7IgPfZNPPz/AtgnmG2obqyGeRH
 7h7oIOTHay+KsTVLOwkjdVBQRtDxsIVeXemTMFv8gYSajKe8NzuO0Yj7Gv5zaQkT9M
 iEUVGglwVBEcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OUCbyu6p
Subject: [Buildroot] [PATCH next 3/3] board/aarch64-efi/genimage-efi.cfg:
 use readable partition type
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

genimage has an alias for the root-arm64 uuid [1].

[1] https://github.com/pengutronix/genimage/blob/v19/image-hd.c#L284

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/aarch64-efi/genimage-efi.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 158deab87d..207fc3e3bc 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -24,7 +24,7 @@ image disk.img {
 	}
 
 	partition root {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = root-arm64
 		image = "rootfs.ext2"
 	}
 }
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
