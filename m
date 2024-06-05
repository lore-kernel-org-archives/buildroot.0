Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA8C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 14:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B81611F2;
	Wed,  5 Jun 2024 14:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rqd9wNHreEV; Wed,  5 Jun 2024 14:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B655961174
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B655961174;
	Wed,  5 Jun 2024 14:18:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 208581BF23C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C2894180B
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGNI0H7RDW8L for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BEA34172A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BEA34172A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BEA34172A
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 14:18:21 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4214f52b810so23843635e9.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 07:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717597099; x=1718201899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NvSism9bXPp3SYiTW+cnqZr50CZXmZcxCBVP2dgEeJ0=;
 b=uc8V8gY5ZG0CtY892qQM2MaZO9rj4TsXTeB2QYfPE42Dr++WIviiwWx70X31SDfH2s
 yF4fbngQFUOGGhRXtE5uaDIatPDkyUWiIA9g3HdsczqmdcRNHxgBo/E9jPt3rfwvF9wb
 eOactsVYr+fXvghminrkSNzFrL/qEps2gTHwNd/1IrknrfYrdNsR+42dABkCeQDtyot9
 ASYwmtWZ8Vo8HNbaeWijosMJLaoMrgXiOKjri0DZMKlrpUSbWF1gecb1aHRj5FTz0Ew+
 DtGbpLGGZ/MeFHzlia7JtNTN2A9eOBsnUUnz851pKljlZjwCaigxvvTAx6orUd7RA5OL
 /BvQ==
X-Gm-Message-State: AOJu0YyrvBFaIGYV31OSwHbiUEu8v/BydwP9W2sAftIUYywE4W6ZFDJF
 C6vsjxVM598e6aA3x8MUvBdIOL19CoaUeJhjJcenidUdXaiEm5lQ6DEkWw==
X-Google-Smtp-Source: AGHT+IEOrcRJHj53HQMdkdpyJccWYS3nUMqr/1NXaCeNmCSAm+wMpQvupxENFXPlovhhVh9YL+cteA==
X-Received: by 2002:a05:600c:3b86:b0:421:276d:a0ef with SMTP id
 5b1f17b1804b1-4215635037emr25779015e9.36.1717597099493; 
 Wed, 05 Jun 2024 07:18:19 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149057sm24253925e9.36.2024.06.05.07.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:18:19 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 16:18:12 +0200
Message-ID: <c793f91d5a9aa1b07cffe9f658fdde10d9dd02fe.1717597094.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717597094.git.yann.morin.1998@free.fr>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717597099; x=1718201899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvSism9bXPp3SYiTW+cnqZr50CZXmZcxCBVP2dgEeJ0=;
 b=R7p/dGnNr85Jhw4JqFaWGBEHLUPELZWYoXL55v54pIVkQMkq4es+UXISB7k6RwxeEx
 O5YdPdExVbpp8FJ2iVBO7VaqT8XcKY2M/RMMpZQSUnEaHhx2rEXhHin+/rJFdApHB8Fe
 imT7gcBVMqfE8+oE+z5RPebm9C35FUKxQLUp7Sc+J1mDn6izV2T0zmYuebromkElw5EV
 +ripNNl4+zoeDPyiLXehciy5FJP/PUE9RiPeev28gOGQd4aJcmHYDPJ/ncvP25v4Ts36
 +LQSoY0P7ksTKsTUVG6B9upiXpgncP6Gug19mjO99dScGZx+GZB9f/xshrGWhnTi9j9G
 2f2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R7p/dGnN
Subject: [Buildroot] [PATCH 4/9] package/pkg-download: export TAR for
 download backends
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
 package/pkg-download.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index bec213fb71..a78532ce8b 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -109,7 +109,9 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(2)_DL_DIR)
-	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
+	$(Q)$(EXTRA_ENV) \
+	$($(2)_DL_ENV) \
+	TAR=$(TAR) \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(2)_DL_VERSION)' \
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
