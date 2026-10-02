Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ADCCA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC3E60873;
	Fri,  2 Oct 2026 10:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9VLyxtGNHBc; Fri,  2 Oct 2026 10:29:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E99F260828
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790936985;
	b=IouV3BJa0cfR6Z/LfUK08yksOz6+7yRPM0xpO6y8rpGKdjZpq7gMslKtwU9ke7IjHEdH
	 P8so6uZTlQ77ZmylsdH85JD+PciJRJhDs8tOPNs9JUSNJYjZUhq11XmCleRIFiZdyhP5I
	 HJtk7bBw61QHSZZ7CePV7qzA4M0NwkIMlWpauJlCvbCXd8l7SrEUY8LNX5q76fMFxQfqp
	 IVXBG/v8OEM+oiJvSnceRt70sEQ+My8Iil74+GMDPdPPJaxShT1V7Q6WkAD1WKAjSAnSD
	 wjpcuOv3657Huxydmn1t6Vh7Qx5u8DiPqEJ1kRCzUOTY85RGgBtdRUcdBmCFeldcmxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790936985;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ca2/1mlUcOIIXc1MmWFvtLiMxf7QCetmNU60UTUVqAM=;
	b=A26ETCNLd1NUpVdBPngfKgXaYZj3p1Q2EE1/MUHUndNi7OlPnt5xbFoMXhQ4aLHqY6Qj
	 RPMADYAK/lDPmE8LS3Hl5ZRbL56kaMuMaR4U50+6Oy8aCJyJQ+4qnAXoy8/ylz76U1Zuj
	 Q5bP6+IAnjhc8VnRT88In18OF2hgtMO3wgkLyuH1WLHNxXvCeJNFuBuT/woNJY0rKk/7X
	 YaNZbrTpN6I4gmXUk4vTTfs1oNn0FnGKuTNuZiICzM0F61+GOhu1kcv1NzFQV8Mqx/79j
	 1DLSbSX6EcgE9R6xEu2Psx3N5Nv3rAMZPrd638Oizze3aLJZGeUaQvjZAfePC6bs+eA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790936985;
	bh=Ca2/1mlUcOIIXc1MmWFvtLiMxf7QCetmNU60UTUVqAM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sETOgIs36iXHk3Kg+e2Is3MilSEk6tP8ZH5TPq3l1NwNzLTrHVXnz9IDvN2EuFp07
	 Xy4rJYBUmvFUgP1QcdLOVsK1dBSFx69ZeVK/Dptp2XEoFC+vw6v0j51qS52KX4ngXG
	 2gEvWb1YN7nssKFho7HSKoMILGqWtyyfVyaNT/oHlXR3Dd9DC1OR26rWhF9RL2T9NU
	 xmJdsNomCgdMQFlvQGZH2EosrOsLKFdwNHFSvfzmRBqHJDCVHcahQ3E1bh4x1DU8HX
	 W4yL1HD66pTFPmlR35zVsM4xeD3VD96kfX0Q9/Xah1Ng91k27rO5OUkb8+5GpAz21Y
	 OSOB56H/DgBfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E99F260828;
	Fri,  2 Oct 2026 10:29:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E404282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3D9881188
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NZFmXvlPdvO for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:29:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 359CF8113D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790936983;
 b=HWRKc565OKAadnf7j7HvI5BRk/3vz3NaMxF3K3ci20PaE4mKd4TmbXqblaCSr9N3jKVD
 SnqIlz4XpY6y4evmcyaopQiScxR1RvppYoDplPDmFB3qXu8UbK3T8a5GU84DoR/ytERSV
 iVe2ybjy2tglCOU/zWj7sQU81REfgC+0wDZ9ioCvtLrVb9ST6ZTASoieEVVaAV80o0Z91
 hZPvYg3BKNS9Q979LoCJfCJlYkgsAQLxj17SkWHdmMp3oGz2I76S+KwFVIs2ylxJO/NCt
 vsuur3k0JLbtW179y1AtT2FbEPGMWZM/amOu65J/lENY2WYOJ1EHb26AdzHJzbuOOOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790936983;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=HmLxDq3BzcoVXdo8lltJKsaPjyKJeNji5S6Adn1ermk=;
 b=FznKbp5UWpkb2y4t6tu28guOTmBTBdCkaOQg6IMQVtAZG8ice23RQrzy+BbxtkcmoJFv
 2tooATV7J5cxcef0Ag2a9EOrzNyyOC40PzSfCA2J2f7ebNE+KFqNfzAllkSL0R+zRaTg/
 GIn6ja5hvHvnQBbKj+hNoYeK/fpAJy+nHO5miMqAtcjz5fKIkj0FESE6mwGtC3SHMftpb
 qny9Fv/vjBcCbyJu4dGxyCiMCD3gMe7z+bePQW/yEiT0dw67xtuzK0K9QTldS3krIJER4
 ZxCooeBcRdeW51GxZeAhmKVsNbDadxQFBWWSiEyjdWFxbG7CMMcDDaX3SrS/M7/g+Cw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QdcQCdyq; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 359CF8113D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:29:41 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e6598dd44so47224235e9.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790936980; x=1791541780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HmLxDq3BzcoVXdo8lltJKsaPjyKJeNji5S6Adn1ermk=;
 b=AX3r9UbuTXb68hWcvUqB22KAPcEPOSfYGL2so2SwG511AeWDwGGh9iFOVwToeX6jWN
 i3QClNMg5LcqsY1r5nu8qDtnSx5Gf79FoW+0AZGbu37jQ9eChRKaUoGeGq3LSN79q1N0
 OSxuOS2RCg/Q59cdKJWm5HRnj5v05rmzTZRXSi0xE0u+U0xY697+HDIpZhjTuzZ+04+N
 kMxc90oyE8mBupRWbsD0QFcVQbf430Uq7cdyjMCtifNQ1oBmfM9mnPr81fwYOn3semIM
 2olTrsEu4rTcFgmnyM4QSsUXzFfwPEMsxvELe3B6KuwOXbHFcUZ53JxDByNOcmoF9DWK
 mkaQ==
X-Gm-Message-State: AFuF++lnBN92b2mmpeAIEI+3Q8k+CZBVTGAEFd8P0TKrSRAnj3oZofZ7
 58m9PL05qfNAPdMad0SeV+AiI4vSDP5cSl+ZdqjtZ9OUDKE+5oX+i9LNe8HpXI9n9SH80OP3sux
 UEpZ4nKs=
X-Gm-Gg: AYBFou0mj4EIrTAetVYr0DWrZR4Axa3O2zw1Y2tl6kt8EphyHN+WQU4NDn8IvZERyQu
 Wc1yc1PDz45YbZHJxwQ92ljLsI40EGA6N/H7Y2mFrdIVDwwbwBsB8VKYCRQb1Qn5Kf4QBGLct1o
 ya7D6eDRKUnuwRBGyCTgTXZBHc/jOjFupAAovbXMH6Evrtwro803LM9mlgolPAc4X9LkSQIIGuH
 iTbSS1GEgD99dTbOxqZsGpr6p1I0ogFDh4/w1gGhxlupKjl1G6h+pZPjMspta6UWEGU5/94IHUI
 pcjFy6Qnrejg9dWWOWER90X9ITosPmEa7gFv5fSeG187SFU+tb9dygJO9JJK1N9OnLqyqkPt9Sl
 KT+JvMV40eQko4/49fZpvd6wqz3ucBU2zyIkg9/cXkeXqRrqNWG1I5H8grxSGlGY92rbAUCV1vg
 qcrbU5ImfTp7q5fFSOFIYTEtqTwq3LCpYvxE595MMnbK0mfD77sfTzeQc7QiNdf1fQKQHQoK4Cw
 GPFKwvs/5uDQWQdYLdRPiFT9Bt6DwFJtRuHRARt6A==
X-Received: by 2002:a05:600c:620c:b0:49c:fa20:cbfd with SMTP id
 5b1f17b1804b1-4a027583fb0mr38945665e9.20.1790936979067; 
 Fri, 02 Oct 2026 03:29:39 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0a6e894a4sm50199805e9.5.2026.10.02.03.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:29:38 -0700 (PDT)
To: buildroot@buildroot.org,
	Michael Fischer <mf@go-sys.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:29:28 +0200
Message-ID: <20261002102930.75815-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908090757.84261-1-mf@go-sys.de>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 01/1] package/sdl3_image: security bump to
 version 3.4.6
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> 3.1.1 was a preview release. Among the changes since, it fixes the XCF
> loader issue reported as CVE-2026-35444
> 
> The LICENSE.txt hash changes because the copyright year was updated
> upstream. The license itself is unchanged (Zlib).
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to 2026.08.x. Thanks

> ---
>  package/sdl3_image/sdl3_image.hash | 4 ++--
>  package/sdl3_image/sdl3_image.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl3_image/sdl3_image.hash b/package/sdl3_image/sdl3_image.hash
> index 83f5e7eaf1..e0eb2d2cc8 100644
> --- a/package/sdl3_image/sdl3_image.hash
> +++ b/package/sdl3_image/sdl3_image.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  d5685f220d5ae99439d710d808d8c478c6ccfaac539876929239b875a6723792  SDL3_image-3.1.1.tar.gz
> -sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
> +sha256  d2e4637ae700f72e5196b8fbd749850ed2e5e1e09c5a5be8d06ff55aaccf3b01  SDL3_image-3.4.6.tar.gz
> +sha256  e36997fe492c48e7ed873065cc3a694f38e8189a328d3709099ffdc9a8843f4c  LICENSE.txt
> diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
> index 7832d38fc6..c8802a6bed 100644
> --- a/package/sdl3_image/sdl3_image.mk
> +++ b/package/sdl3_image/sdl3_image.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDL3_IMAGE_VERSION = 3.1.1
> +SDL3_IMAGE_VERSION = 3.4.6
>  SDL3_IMAGE_SITE = https://www.libsdl.org/projects/SDL_image/release
>  SDL3_IMAGE_SOURCE = SDL3_image-$(SDL3_IMAGE_VERSION).tar.gz
>  SDL3_IMAGE_LICENSE = Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
