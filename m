Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEABC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F82281372;
	Fri, 31 Jul 2026 12:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPno7MTVNvLW; Fri, 31 Jul 2026 12:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0662781369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499547;
	bh=wxBZ6olW8heQC+pkdBFfqd7ywS4XOCOZmqTCqj7ZPfc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fvkk4thREj5aAFMMVeV1bU7oGE5L1jHUbzttVPM4p1ISENaBJbmy/7IwwzHpH+V5G
	 P/kalsCFaE895rsBPbg+mxR6bknq2/MLDYyNdMlK6//nqT5grgMEO96xYWV1bu+AMq
	 Y0GepdPitM3K4bAHHxOaSXSid0Q1DIxOUMvAsmQmTfOAGPkp3cJvCEk3uSz6TfRW2L
	 Q13zBzZLi+QUzH88t28RCkWYOl63EPtN92W97m77FEbDoucojCNnANILhgU961CzYY
	 mfGYqGzP0D/N8SO2iBH24PDB3o/mQZeSqkG3BC0JrFzOJZGnvJKBHaV+WuGfet8vch
	 RPmT+50UpVihg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0662781369;
	Fri, 31 Jul 2026 12:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5909227B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AEEC400DA
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpKij0dqhEmP for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2741840463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2741840463
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2741840463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-47f81a3ccf9so812553f8f.0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499541; x=1786104341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mB9d/G4FGdpjtQdTvU33DuVU1Dt99KpaAEReGXU95GM=;
 b=r4aDU3q2dPGHNzoc2pesQr9ha/RKm3frVQVjW/fWS63BX8GW+3LkvVjzaP7oKCO+cS
 iFcNMqXiPUgAE3Qe6Id+BIAk49GfSI2EfpBj2s8v/XeMsW3iEE6t5gBZQR9MDWwV8t6P
 3fI8gQy2EZjf9pqB7DIZUs3L+lzc1TNVpG/pe4XydSk9U5IRpNRu3YspXyY2irdL+bJw
 CeHt7Ol3ba5vQY2q2wmWyoHYXADa2HBlLndmAn5hDqFTB1maGe2+6FrlR+kmTwd9IC8U
 c4PbqxIA/J3KWW7JmmmJPF7vW0oD0y7QgZcDbtFj9I9M8++QliAaMwGm/xwS6stkFn3y
 sZRw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoPZd3NUiPJ/CBdpQD11U1LdYsGK6sCkTxXv5ODp1W1RKPS9pd0LkyhEUmaG58/rqBlirovLu2EPGA=@buildroot.org
X-Gm-Message-State: AOJu0YzAr/2K7BqY6B2fBHv01WQigd4pVyfh/69XySSsHRI8fcfUOiwV
 PpfekoXQtIJf4AX2WVnNArPlqya3c3IioEzou2ctiRIxPI8krRVALpYDrqKDXzAOiYw=
X-Gm-Gg: AR+sD12fnHnY9fbYZcoDfuZnK8sPBz+LYMKR0JW+iBUV+/mIoVT4JLWmTGkmXwuxlLp
 7Iji0UdZ8EzgSCfJhFzA4U9BY7kBSFKPZQYpK/hVpq/A7I2ymfKnlPLFYxTOKME1bwetlf0rUut
 YY60SBpEyvc+5NzBEUBkOUnqrqMof7Qk413A+lpxPAlu5NjpWYlhPOoO9en7GEbi/Rqb2+ImPbX
 rtX+zI0oaaVBULKpKkNIHDKS9bPQUUyFRHk8DS6P1K0iRtEzs63rTQHqH47Y1s8KbvbqD+HKeRc
 U1cgofjRvYGqtMASN4GDoyMHGc2QSrDV/1yfJHJMl/oKbEsu475ehvKfV5HmOdqzvKxRN+LqlRS
 WXsWVjyeI63kyPzBQIGwrggh6M4Xg05j6PEl531OYA9qSEQv+f0rmnDJxg73YaEDGYzNtDsk5mK
 4ql2r5+rdi0zGcGoxE8NIxAjG3T/91ztZzZa1mSMCfEHRGlZ86pziJsM6LoryzKshLDKzD6SThW
 tEqfrXohef2AW/JzPc5jXwiCgw/ZXsO1Gtds7qWRwXjfEzx
X-Received: by 2002:a05:6000:3111:b0:47f:6b9a:9d48 with SMTP id
 ffacd0b85a97d-47fd2ad1f2dmr4351849f8f.13.1785499540903; 
 Fri, 31 Jul 2026 05:05:40 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd42d91bfsm4585100f8f.15.2026.07.31.05.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:40 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:39 +0200
Message-ID: <20260731120539.3895-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722153224.624762-4-fiona.klute@gmx.de>
References: <20260722153224.624762-4-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499541; x=1786104341; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mB9d/G4FGdpjtQdTvU33DuVU1Dt99KpaAEReGXU95GM=;
 b=bbWMgrqgO3x6bxwAn7CQmT708FYHCW5OYeBAON1dlneVV2e0TodCdXOHnxedsg1XXd
 1VszQv48YA9EdMeY5ljASAnkoQLUzgM5Y8/YzKo6ol0KS8F/K+FDwJxU3EP6oTicaDf5
 sVo9S0K0yZbOMgpvs4VCOloXkIuFwp+AKFy/DA5ALsphVodsylbD/xvZvjGFPFYScW4H
 NfdzsmxJkdCOxNOeQ+3X3yQl4aU/04B542owhk5nGDnG1iTMeElBq/QDOEzVcfj5LNet
 mHu4NC/HE/g+RHVx8kvWT1ejTmJqJ6NLJecjC4ESVm0/Bvo18xpkaehebWHeJexE/p6T
 4BAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bbWMgrqg
Subject: Re: [Buildroot] [PATCH 4/7] package/initscripts: add license info
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The package is part of Buildroot and thus under GPL-2.0-or-later
> unless stated otherwise, as described in COPYING.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/initscripts/initscripts.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
> index 2e997dcd6f..d3a7a8faa1 100644
> --- a/package/initscripts/initscripts.mk
> +++ b/package/initscripts/initscripts.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +INITSCRIPTS_LICENSE = GPL-2.0-or-later
> +
>  define INITSCRIPTS_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/etc/init.d
>  	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
