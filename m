Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C42C27C52
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64978400E8;
	Wed,  5 Jun 2024 17:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iar7pfjiQn0N; Wed,  5 Jun 2024 17:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5F1240316
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F1240316;
	Wed,  5 Jun 2024 17:53:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 633111BF954
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F1B540153
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91mZIDKFu926 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FA36400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FA36400D8
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FA36400D8
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:25 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35dc36b107fso31347f8f.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610003; x=1718214803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EXEt1uTrRMKQs7MaogRVn4eClR3bjhl52Wah0AACkA8=;
 b=B22Z+0N6W9oyTQlBuQ90ZsBzCtZebmv/WfMeXbzG04IUhui7ktHDrxXSia7i8pOrvZ
 IV+JmmpgRkk7wPDCxwXTt8af7wmD+ufr/evvbtqmjprcsMs9twESxNBozA5/dUQZCSyP
 pgAx9a/buTr4ROFzEOdXWubcZxugTmcTQbMZR/hIdGYkTF1luVrhVeYWuJPkEXQHH+PV
 tyGGGdwGICx4296wQ02qyZq1TMVlQfyXKG7iZ0SDpPr82xjJWii49HQfNZG3Ssj+TD98
 rwAtnuILGal3njaybYA2Y0ex64kc1OjglVdhksw9ieSLjCHzeorivwTK0Oz2x/s2/CX5
 GZ9g==
X-Gm-Message-State: AOJu0YzChBg3bzFChK57fGOGPe711Okt+7X5uXU/YEyadR070ZZ4V9TT
 d3IfgTnPe8aZIUUVYUWpZBf2XgVy36fhNI3PKMNziGnAzOTof3rKTjus7Q==
X-Google-Smtp-Source: AGHT+IFv1oHcyuBQcATREMP/hSkiG3sQhKZ34clzBwkh3UK6lNqGqTO3oxFLM0GgCMbBWUiRohL+mg==
X-Received: by 2002:a5d:5088:0:b0:354:f48e:dafe with SMTP id
 ffacd0b85a97d-35e8405854cmr2553673f8f.8.1717610003155; 
 Wed, 05 Jun 2024 10:53:23 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d90a8sm15520821f8f.46.2024.06.05.10.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:22 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:14 +0200
Message-ID: <9399345002e1b8438a5db65dab8fe828e81ca2f6.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610003; x=1718214803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EXEt1uTrRMKQs7MaogRVn4eClR3bjhl52Wah0AACkA8=;
 b=UwnQAOkDZnFc80KRDX5map4hfkWS7RUbHOmNZNW9bGO3eWsdIR5x7Za+2ThcjQ0CZD
 xmbOUsBpG2q4YfdRh1QLoOp2XrMSoqKhMHtjoFOTDkVmM1VG4Z3YTZAaKjwJVvMNstRp
 KazDivShvEy1CTT5sBUJzgwgZtlCB8o//VczOenmszVWDJRtUnae2huaH/ZcBG7msxRD
 CTvXkpKMaiSVUFyxfCpPEseoISwicxuviAYCaqOqwxMnnA7ySCk8wmKB81qoVB7BaPgN
 3g4HtDA0lRVHyhRcuFtvHLCJtpm8k7oszNOO1vuS+dSp4bDrQcf6h4yP4cWRAgWYcixJ
 9gSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UwnQAOkD
Subject: [Buildroot] [PATCH 02/10 v2] fs/tar: use appropriate TAR
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/tar/tar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 841af14706..92b39f993f 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -13,7 +13,7 @@ TAR_OPTS += --pax-option=exthdr.name=%d/PaxHeaders/%f,atime:=0,ctime:=0
 
 define ROOTFS_TAR_CMD
 	(cd $(TARGET_DIR); find -print0 | LC_ALL=C sort -z | \
-		tar $(TAR_OPTS) -cf $@ --null --xattrs-include='*' --no-recursion -T - --numeric-owner)
+		$(TAR) $(TAR_OPTS) -cf $@ --null --xattrs-include='*' --no-recursion -T - --numeric-owner)
 endef
 
 $(eval $(rootfs))
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
