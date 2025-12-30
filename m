Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33118E9411C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F14FF60802;
	Tue, 30 Dec 2025 08:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kyKhQx5YWRC; Tue, 30 Dec 2025 08:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAC1260B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082778;
	bh=F+IXdsM8juRjJQEpmGe+/4X5O3I22IpmkVoo1X/DHQ8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=HE+7U9bcqEKUBC35ciS8ZbnvB6zvoAskeAhq8cKiVS37cA9MRs1GHU7p6K1IlmKk2
	 5dnYK4PFg7oheGurrCapX4Og4TlXUqlKMYwBCFqmBcoPuPWBPkZo/umn6uxocI1uuf
	 8x5qLhYWL6OmZZFKjM6YNCk8/wvFFzb8BKCX4wtNuIlsLYooSDIwqdiZSiqohvbzU4
	 qkvgQs7pbohk/m/5p0b8xzKVYTIf/laKPUMTuESnDlowFBhWiiclBWBu0mtHPenJLZ
	 quS8ckQRuwCiWRZAuMaLnbBTXnKb0QSgYfTc6HCdfOktWLp7I/DTtZx8QBGNyK8F4X
	 qLaxTN85Tzeig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC1260B25;
	Tue, 30 Dec 2025 08:19:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E74BFD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE66A4030B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcGH5GXelat6 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F261C402E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F261C402E8
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F261C402E8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47a8195e515so59838995e9.0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082773; x=1767687573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g+rxNuUfXOfmTxGizDfdHThlwUAt0OPZJGWOGqz6AYY=;
 b=mt5AZWAoR9jAuu1LD5k9mlRPiHB9OH56JCNqXwFI7mKHx7566EjcW55wfLzaH3fqNC
 LYQenifi3GOrhj4JdgvEt9wc0yFy+gphS6zde2h17f6UMGqSPGUbBgt24qtCZqFVF5Db
 Kk5XEDCiGzItSSo8B8OCBDsRYTJk0nIGVEhm5yQePVhvv/dEuUcRGrPk1CcV1rvPzMvX
 92ooFbgTo+Yen3dIJ+Z8gsjerIH0MXeoYM7RP9tLP1TvE/UvLxtrpiSSCLTb54gpmZnd
 sOaGzKs7gbZEVFIx6xGqM9ncz96pOCNz4q/XZovDwGT8plfYwfqrtMyxOyRRNxNv9BYT
 aUCQ==
X-Gm-Message-State: AOJu0YwdfrK4+PfF06f70DjAG2uctRZfn4jdlT0gKN0mHovixvJVXPGN
 FSIxPAhFPFtirBHZIuXqL807jPmQthc+3cLRjDG/mC7BLQ5z7uqTJqrrFDr22Go3s5p6Uu18U7J
 LFkH0R3U=
X-Gm-Gg: AY/fxX5vmScR9eaB/K/aZT7t6CYVrbUyM1Zl5FIdTQ8OPXsX1j30F9Crh0wXQ+euh/m
 tTLztyCh0+jjqp4F1BuYEXv/EGRVzhuhzMBrBA7lytLJ8iX7c00pYJNpdEpCKQvvX9fcPmvK7yZ
 VHgiOwMzunhnUXQLgq4JJOUFpKpZjFvu8+UpRNdHUBX+onM6biYUo3m7m4C4iRTmCdIoQjzHP2D
 OKRjo9G8bdggL/2D0WjqlluiEXFj311yfsyGlIvphIIxWJNxf38986G9MqHI2KdHOEGnOG6QC/f
 92AxPBa9MHcxNNt0dneuQ2AwzrxYQ3NIresoqQQDbg5D1m/nBy19xPqKzg/Tmt/Nu+KucEuDKit
 AdAxb3xFBjN/2dWVemzkAjgVSqPF/mm+yIFV1mHtf4PZP6fzNvOPvQFWMAyAYqRrEn8daPEHWnv
 dWeG+fi+3ZbLR8Sw==
X-Google-Smtp-Source: AGHT+IHWudDa6BJV7qTadYmGNNbE4x9n6o/dl6jbGJuQBIwb8Ss/uKCIm+6q3YM6N/o3tacx6lLTHg==
X-Received: by 2002:a05:600c:8b0c:b0:475:dcbb:7903 with SMTP id
 5b1f17b1804b1-47d19555796mr361634415e9.9.1767082772653; 
 Tue, 30 Dec 2025 00:19:32 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:30 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:10 +0100
Message-ID: <20251230081917.18676-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082773; x=1767687573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+rxNuUfXOfmTxGizDfdHThlwUAt0OPZJGWOGqz6AYY=;
 b=iCK6eO7WCjD1W3BKAUAK0mu7PWsINL3dMaD1Jq8v3Egb0kEBhC87LmnyXzLLqhqzMo
 BcY6/FZavU3dAkiYuJlV340Utc7kZMkjbVNOZzye0zJlZzP6ZciidtZFqv9Nwf32B9JR
 hqALhY1qBE5ejxCqas+dLFQ9DjnYdoRp3/zu2MWFJL7KdytMT0YOiIV8MdX58VwP2sr6
 WZLGHQl9qL1ErKza01UGKi3cgxbs2LJ5gobGv8+JOGPyoX5PMIIPd+YgdpPPVmn9n4fX
 CNkHAY9FtO4GFNF3R/koe5eZd9w0G0iWKjnA8y4TPz6u42r4qdux1NNvZfRFf8fwH02T
 kY3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iCK6eO7W
Subject: [Buildroot] [PATCH v2 08/15] package/libssh: remove stale
 IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The entry was added in commit [1]. But since then the NVD database
updated the version end specifier.

This IGNORE_CVES entry is then no longer needed.

[1] 51b1e1daf5 package/libssh: ignore CVE-2025-5318

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libssh/libssh.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 2be9013454..3c7e77a206 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -17,10 +17,6 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
 
-# NVD database is missing an upper version specifier.
-# This vulnerability only affects libssh<0.11.2
-LIBSSH_IGNORE_CVES = CVE-2025-5318
-
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
 endif
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
