Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99851C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E51F80F28;
	Sat, 22 Aug 2026 12:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAhroit05YXi; Sat, 22 Aug 2026 12:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402051;
	bh=nle5qI801DdCvuyku58xbt5H64QeG89or0fabUW7y0s=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Tr3sCFWaDUCstV5PMQnh5qm+3ByyygnBavINNbJvq05lNN2euGRZ9hdo0IwfXa2EV
	 fBSn9eejrVd9EMIYeR1xoLRT/Bf2Eq58cBLHBsPpJe47VpDEFuKuuPk099IfluCqCV
	 ghGvT7iAoDxXbTGfo7tFR97KAgEUMA5PgK95+SjCXVmgeBKiXpmh6h5jjqoqyo78PM
	 TJtT0OKG7NMf5SLMLHW250lbXlCcvGNl27ZqYExEQdDQklsIH8fMmaeEFdH4YAsziY
	 zn5AnLrkPKybbTZ6hXYORVBI/iZJC7SBWNJtmjRCqQzpMX5dFygDvsDLlCAcwFE4Jp
	 LOCxKMuav3LJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBDA380EF0;
	Sat, 22 Aug 2026 12:34:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B524118
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F159A60609
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bo87f1_N-LkF for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:34:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBB6C605FA
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:34:08 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c15b1da6b82so204805366b.1
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402046; x=1788006846;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ltOuxRtD3KzEntBvUtd2iUmfc7A4JoM6w1V1oQnJmK4=;
 b=eFUI/mn+kXO5rw1fj+dQwotiZfaXMzHNBnVoIYmIRuz+izssNfrwSrN1uwDFbT2THv
 Gu9AyHQeUgb+rFHg3pGsvAQkvkjPWgAQ/gIJnL0QtLX5eEP+v81keEmKjbSa5lYabpd0
 NKMz5xTMeGrLFd0IOyui9/joVakgSRuORVGQSzV3pccRS5/8fQxSDl2r9Wsdt4pXVmSU
 cEWD4IW+3jK1zeBUfKbUSkmwaktPKCYsL5Ls1fWcCCVThu9wTsqd2X5io8ry9UpTpiIx
 syug+UhFf/ZAuhHnGaKbLEcFb2Xf/n/HvsoULfc4FiMZ0mJpGeTEjNOezWbn8E63ZSBH
 LhNg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoSLZLv48U8Ufs26KSOcq8MMsk+j5I32Q5vZ0VADMuWOuTS2NhSwHS/jlldhneen7JGo90NfrMEnmk=@buildroot.org
X-Gm-Message-State: AFuF++ln/S+wbm5jJ9E4Ov4afA4/VA5KE81edGCAXxxyvu1oEATokwwT
 OdABQ2Fi2RfiTHy7ADH2WMNV2asXd7Y4yjlQ3+YRoNujHcXcKH9joZTpQU+fMk0AWhI=
X-Gm-Gg: AR+sD11yhzJVk+3qs8l/xckx+qmQ5KzbQ6rT4B/MN46U1GFLSqPDzMFV23YRl0cBDYp
 jmmQLD6fi9XKRH92h3REBgEFgJyiKJs8/8uCMcbSMM1AImBfqqWiW5ppibWEUpeMfFlMBcSm57Z
 /I28XttBl5N4CzTNb2q9cAzbwjgd/Q794NC/7ovXdgWUsNzRd595dcrs08ioscMLaHHQW+G4fTe
 JU3+WLMUWmQ4uIoKTCoSU9QHCyhko9cZCSp0h4HjnEI/Pbhi4uwj+tVNyZh/93+T/aHuw/mfbsR
 OvMA/WhnKWcWIC4ydlG4D0IyyBCI5LpqmZVjShckrKA1RF9QBiSaNk3Awp2ySXGPUjVpRM1uSdi
 NyfbtGX2Ss0s8qiPAc4igPFLThci+gNI1BO2Z17v++5Ird1xoOOcwtIodcFpc/kPf/ViGDWnbeb
 auIpk/COiLuLTj6OXYZULdJTnAgxSlkUvh/BTCJ+ZbN/1n+3Dg1XXuvkbPAvxnC6DL75/WYRnzd
 zjHtC9Hj4dh776KndHNL9ZAXo31b401toi+23Ss4kEziuMG
X-Received: by 2002:a17:907:c20:b0:c15:f4bb:e663 with SMTP id
 a640c23a62f3a-c246a3ab3dfmr1416823466b.10.1787402046258; 
 Sat, 22 Aug 2026 05:34:06 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24968abf18sm333104566b.61.2026.08.22.05.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:34:06 -0700 (PDT)
Message-ID: <41c67c1e-0cae-4c66-a77b-10709ce81a8b@mind.be>
Date: Sat, 22 Aug 2026 14:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20260815100306.100753-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260815100306.100753-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/cramfs: bump to version 2.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/08/26 12:03, Thomas Petazzoni via buildroot wrote:
> Changes:
>
> Security and robustness release.  Notable cramfsck changes:
>
>    * Reject dirent names containing "/", "." or ".." to close a path
>      traversal during `cramfsck -x` (reported in issue #12).
>    * Open regular files with O_CREAT|O_EXCL during extraction to
>      prevent duplicate-dirent attacks from truncating files reached
>      via a previously-extracted symlink.
>    * Fix outbuffer NUL termination and a 1-byte overflow in
>      do_symlink when running with both -v and -x.
>    * Harden romfs_read against truncated/malformed images by
>      zero-filling the window buffer and checking lseek/read returns.
>    * Reject directory entries that extend past their parent's size.
>
> Documentation: README now documents cramfsck and lists all current
> mkcramfs options; stale hard-link and endianness claims corrected;
> NOTES trimmed of the 25-year-old Future Development section.
>
> (See https://github.com/npitre/cramfs-tools/releases/tag/v2.2)
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
