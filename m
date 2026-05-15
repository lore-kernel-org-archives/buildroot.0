Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92205CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68FDB61633;
	Fri, 15 May 2026 13:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JC5ciBZLRsi; Fri, 15 May 2026 13:34:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 924BC6163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852053;
	bh=RRCk69ZZONAOOS1pbq3XZoCZkM2ewAMfQsZrXxfBK9s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z9PfET6vRnAkAkSEVLajqUd7IFYrliYIdBS/VKzMIFA28IOqsxsy2o4RJ/psrwH1n
	 k9N2L0ifI086+XIlcAFJ2xhG6giVqjWUeSuw4jEJk6/hBNjF8v4s26RZkDREJxJcix
	 ThI1Onzemllyqg8xQeLCeQsBNFSospBQVxdfMbgVBvTgTa3I57kL3nKHjesLdAUDtL
	 3Yn8tomn41SBUpGqVhVQRFHhoAkJ/fQ5z9umOjPeu5GaZitYPEKfuP5M8Vlrk9S2GK
	 DilHeJUpDikzhT1MHPqAjB3xme5u9SCixjhT5s8abLtd+wiatX0rD3cOLpvYy9Tgx4
	 LKVTmQ22LIzpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 924BC6163A;
	Fri, 15 May 2026 13:34:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1004836E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0161E408B6
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zl1mRrUYN1_Q for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0520B4059E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0520B4059E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0520B4059E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:09 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so83205995e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852048; x=1779456848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AcLpNUjJ668syw3f7Yxswc5p6A0GCAD6zJvvSaf95uM=;
 b=DX1sEH3mg/DPn3JpEUSCKc7w9Ec7JL3haRcpcseTnvFOBVimE9BhJoCqwPbrjLA+Qm
 rX4Fvu8VXUof5n5k6/mf096QDFK7AkVMPCEKl0/Sm+nBW8Xf//gcQAXhjSiUC93EsE0Z
 dS5ZKYKHZhvbKA6uN1ZR1kxAHMj1oyfk419w9Asb2lymxrqUbQrkq51QPggfjw/QuNqG
 ydAXVOuX9faQCcLPSK2j7dwU5LF4KWmqXu1G276UsPlpEnG9Xy3kd4kur2nhFJCmKOb8
 RgwdOhvciAV3OyvEbYE2ojVq+NfHEivYvY0VUsA56P2jLr5JeW09mVMWrWJyrYgp+9WC
 9K/w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/M7lii/H0jwuAiwy9dV9XybWkeqkXqa1gTwuyX8Vkzqe8+jT+a2Q6Mw4hrCFgaYjCeqiI96Qzc5WI=@buildroot.org
X-Gm-Message-State: AOJu0YwDRLhmQ6O2AzS018rfyEJJP97IVM4b/rXvm3ScNqoCr8huuMUv
 NHjQrjUmb1rCT/yYBYsAbCGiGgszE4xiaWTVPtX+OtZknU1E/utK6yHNvEZESjdFbEiztFhluW2
 5dJDn
X-Gm-Gg: Acq92OHibfxZRKh/zy6qX2bTdJnfjydc3WfNp95RT2ysoxAjLNcSFS08XfGFESaaw3+
 iF7KOLlbk3t/OW/DiQKVX4TVOFMwJ86WBFDDZ6B6nB0O8aq8OysiuDmrJL+kuSudq3Zx04hDOFZ
 kDAK1aN4cVmCv9qJh+N8ieUuu0UZmADmhb9zMs/A/ZPtWrJUJg+/LCoL70IMYupXy8farNmgVks
 raHaACUpfEiq2Wrh1lD6m0rb/F3lKFEtOeNwGJkRPafsABj6PtwdBp4XT4g0uvphbZZ6rSkx/0G
 LoglkgdP/35srpVdipG8MEQRp6Gx+QfQkYF0E6UEjF1OkUD/NCmi8r3NITHtctFWE30xkggHM46
 qC29t4mCe4mPkeptrmJmW6hpA7VTDF2YHULgbxkvGkFMD1S3liaRwvJlKFTWXeT8TSIJLEq5TeA
 hmCzQ7HIXwaI6KiTCI9fx/zfr0PfzaYz5nGhDwzzBjz2kh
X-Received: by 2002:a05:600c:4fd4:b0:48a:581c:ead with SMTP id
 5b1f17b1804b1-48fe60ed7b7mr50955975e9.10.1778852047714; 
 Fri, 15 May 2026 06:34:07 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c833fcsm59640915e9.2.2026.05.15.06.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:07 -0700 (PDT)
To: Eugen Hristev <ehristev@kernel.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:06 +0200
Message-ID: <20260515133406.316272-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428-maintainers-v1-1-9aa4552ce96a@kernel.org>
References: <20260428-maintainers-v1-1-9aa4552ce96a@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852048; x=1779456848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AcLpNUjJ668syw3f7Yxswc5p6A0GCAD6zJvvSaf95uM=;
 b=JXIA4Mu7nQIKUyj/q2VyaHyc4uNQ7VCCi0Ehr3og/vXYcJxX5daidciJUvX83Zgwl/
 Ifc9o2wcKLGNpyO/GtwNOSeVPCf7odV6btGEewm4azc7Ykd7y8tlPoJB7qj9unhbRB93
 CkKYzrJ2625dvdX+v7Zgc3zLdYX6XQRbs02pqfG0NjhiFR+gaynceH6gIwiiBKteOCID
 SFMHHisTNt6C3TVdZUnAI4SrsC91ENJFWloUDE2rtR56e3xXQDX8f1+ebUukwoD9YJW7
 p1gCnDXx6BgshsF9cS/IuR7+b/XUwyLYy3grpvsQDnFemIIJy8NXBUw9C+XvW00VF/EV
 /Ymw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JXIA4Mu7
Subject: Re: [Buildroot] [PATCH RESEND] DEVELOPERS: Update email for Eugen
 Hristev
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
> Replace old bouncing email address.
> 
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c6c228ae91c9..1270365ef0e1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -968,7 +968,7 @@ F:	package/optee-client/
>  F:	package/optee-examples/
>  F:	package/optee-test/
>  
> -N:	Eugen Hristev <eugen.hristev@microchip.com>
> +N:	Eugen Hristev <ehristev@kernel.org>
>  F:	board/atmel/readme.txt
>  F:	board/microchip/sama7g5ek/
>  F:	configs/microchip_sama7g5ek*
> 
> ---
> base-commit: 3a488674b52f2515b3cc54526253682749553d11
> change-id: 20260428-maintainers-d796e332862a
> 
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
> -- 
> Eugen Hristev <ehristev@kernel.org>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
