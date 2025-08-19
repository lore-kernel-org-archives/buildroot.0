Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52C8CA0EF7
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65BF080B05;
	Tue, 19 Aug 2025 18:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXrg5SJeiAZo; Tue, 19 Aug 2025 18:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F4B80B47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71F4B80B47;
	Tue, 19 Aug 2025 18:15:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00FF6E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC2A240164
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NN7-FrF9Y0uI for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 18:15:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9D4D40068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9D4D40068
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9D4D40068
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:00 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-61a8f452c43so255496a12.0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755627298; x=1756232098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NsRZorVhSxNDRnTQEgSARrhk8IL7C/Jqi8WX2Yp6C8g=;
 b=Fw6oPWKkGHRgJw0ixwlaF4HYEMzveO6btCy4KbzXRs40n+lk7kKPaPwwVjCLwV9M6J
 X69K1B8C2lvAo12ojCgxvE6gc04/W+ho3L0n+bSdII2Wxb56yxjz6LGOuBKiIa9iKxM+
 HdeEMfjs2L9eytuljNhgUQ3fuDqfaNo6KkrsBfcVsvC9wdRFMqF2SB5QmAC/I7xVnmzX
 IA/tIODmdhbRAQL4Zlux7CIlMf6h5AJs4g3YJQD9Jw1iad2tjgZVqzB0zXgW9F4aZ5f7
 d4crd55Dpsfw8THuFZml2MGnAgZrpzQoRUbC/XmOAHTVxcOQlEJhX9enPzo06sITTipH
 edVA==
X-Gm-Message-State: AOJu0Yzdy5nINdrcJKytNOnoXFX38hyBsBrkvUv3CcTf0BWdKPMadCSV
 4TIy16Ile8G+1+/dss0YRcTiN08o9zOdJ9WTeFULz3jLCv83IXnf7mkwr/Py58E1O5WIL2r+BDO
 qwaWy
X-Gm-Gg: ASbGncth1elDSRqkrzG24gXzkfmRUOS/8VDim5nuRLUY9TZjN8bw2bctN43FI+2qpL0
 9bV35sMndeYi+cEyypwLnmehUT64bEi1EJMfvyjsW1Ru++iWQovzOjo/nMFEjkDixWH3+UYsOwu
 Sp6d5BjrK/yskF2jEtAo1BwYdP49pmkt9mnYdwfuw8+OPhAQC4QwCG7/f666UwRiwzzaFL55P/i
 bwRiO7YQtWmfn5WhNCwwq/rqgzyrtAB2Ey8i8tzcriet7vN99YQLzaX/IQle8UN/7DYJZITCHuK
 SWyTtwwizXoXjaRdVqMotcxVkipH8j/WmhTH2XeblPnps7FoGxXtwEQYyIRiuvNe22l66aZCK4Y
 4yBvPPT8CDgDDT88yOKqgYoxk96P0RZyc+6+so07E1xm6mrqgJHNH7CUNtwAnSinzFbtHSj42+8
 ieHm7HsrBmKAGJesY0vLg/
X-Google-Smtp-Source: AGHT+IGTj3hxJ87fHc4f+GrLhOSPz4Scra28dFCAxGyVCEHAGjlegDv10VMxeCR6yhpJLnJO3ofr+Q==
X-Received: by 2002:a05:6402:4393:b0:618:2533:f735 with SMTP id
 4fb4d7f45d1cf-61a97556109mr284416a12.7.1755627298363; 
 Tue, 19 Aug 2025 11:14:58 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (mob-31-158-159-104.net.vodafone.it. [31.158.159.104])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a755f876bsm2112245a12.13.2025.08.19.11.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:14:57 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 20:14:46 +0200
Message-ID: <20250819181451.3012126-2-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819181451.3012126-1-michael@amarulasolutions.com>
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755627298; x=1756232098;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NsRZorVhSxNDRnTQEgSARrhk8IL7C/Jqi8WX2Yp6C8g=;
 b=EAwtEpxSC05WYjTDmEvtlQQetyxKhHaHk/xOltTywoaV7awHEf435fKI5h+xYWSWVT
 P+2tvga7TwAXyaYYMuSrWHhmTiJVVZqVjfA9cDTgQwenWqGJZJ4aVvOA4vwrscG7ng/9
 5XYReiqX+DTpPiaWltnZNDGwDAWqe/y8bOsxY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EAwtEpxS
Subject: [Buildroot] [PATCH 1/6] linux: add missing hash for linux 6.12.36
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

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 linux/linux.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/linux.hash b/linux/linux.hash
index f5e2d663d1..599d2bc6b3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
+
 sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-6.16.tar.xz
 sha256  e94f3af85492302f7a819441458f80bca0ad9912e5a4c83c699ff3c63c52957d  linux-6.15.9.tar.xz
 sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
