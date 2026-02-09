Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AB9E81BB1
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 13:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB17838D3;
	Mon,  9 Feb 2026 13:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2O_hWjiqLOoC; Mon,  9 Feb 2026 13:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8932483C19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770643913;
	bh=NyXPKFdHi+hzCr0z+wm4A1fliAMANRxYYrnfb0bl5d4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EsGQJcnhiouvxTZ5sAG1zY/1Uh0VMKz1v9A4fp8sVoEUOTyLtS+F0mLeI0IM0mr8l
	 QDpAdm/qwAFy2FpQzTc1OUhsk4Pc8Ef/Yq52BGRzVr0ViMpSHfGBYSfYHCmwhM4h9l
	 7CBcnH5OdtSKICMe3AF8T4KvBHK00EWGbQNEX+P5jUqCW0+xL1oXkW7tg8ij3j22wT
	 w8sCDebUV9sAMtwwzgwLkEVpkJdkamrj5dOXhdDNP0N1oEw1i0ZfjCZtyLWHnLviBk
	 ZBpmfbMafOHKNa9Nmifeo/egYf+7G4BWAohwkxSvfK5jba5jdg54WVYJAnkOkJyE6V
	 ZAwdLn6r/25lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8932483C19;
	Mon,  9 Feb 2026 13:31:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F7D91A9
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 13:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4477E40D5D
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 13:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSqy6l8U5FDD for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 13:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35F3B40BFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F3B40BFD
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35F3B40BFD
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 13:31:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so12136335e9.3
 for <buildroot@buildroot.org>; Mon, 09 Feb 2026 05:31:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770643909; x=1771248709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ScCiuWKohZ3cmgPjQl/UO32tyD1HESeEPpRQNgufszs=;
 b=C5mVcL3XQKhyQdeaSGz6piWTF/KuPka1HAf5ru0KT/mSKrtuSNnpCnkJ8Zbczhi2Jn
 hbdUIZehyPSj7c6+NIqMzjAZWt1pcgT8Clvs7YG0WZhHH2/MkeIxzaASEYILEugINaqu
 bE10YhYuqrqaOfuloUeCuJc2/6Lqh9+MKKixdALdAfn86R39TtO3oOfrKM75C9Mf9MZx
 bAY8Ag0VDjXPr3xBfjjry9Qotdp8Br/STAhge2HBkDd61xzSjjUCtugoyyqEylNzoXfY
 A/Wu491GmJ+1Cdpy3+Q6FTllZ4qzJnKbBObAU3Aokmiul2MdRWgLQo9QoWmYPKm5Z7fg
 +g3A==
X-Gm-Message-State: AOJu0YxgAYQf/yl+KFtp2RRb01SeGGuuoRGbjG80qzJ89PEBJy+0xCEg
 GtooP7HXqsx225Q/Ez7ye0pE2YR8nLhZY+pTttvZP2iCjzUtez/9ucRJwHdSlw==
X-Gm-Gg: AZuq6aKEIQEbqRz2V9K9iSEaUhPzF+Ut5aJ3ljef1PXrNG/0QTCdlIxlOnWd7gTo6A/
 3ifn9INzG+GW6x/YoLGzJaxEIv1sKGIpZ38xVF37LSy+UtO9DSVLwxAfQJa69hKh2pY9baLBhKz
 kJWF+fW5nZuB/rAbPkcld2KHHiXbSAptk/Po/gapa5a3uCgS7vK08GwasCPD8KMN+e88o8+FInC
 5iYm1ol8hpWG2dMGDQw1kEZG1zMs71xI39KghU0LiNutIO4x9E8rzFDnHSO2BZUzUrJLWUzWOz1
 kupsOne4uS0YBIJibNWOI74U0pPixGm1fz3kXSG1BIZvg+bmlajOpBwTBGGvAC7lomqWqSWGE4C
 Wx+7Oy9BL+nDLD6z1gL600jQbfc8sY7/UL6+k6YXApK2RlNnf6ac+mO3wVV9c4AT5lSuakId2GZ
 BXcf5Vv0qOe9DtKjkznT34drzl6qqkQ6eT7PWCrO4+C6YACSaAgqATT1Ytu0E=
X-Received: by 2002:a05:600c:35c7:b0:47e:e2eb:bc22 with SMTP id
 5b1f17b1804b1-483209291fbmr166021455e9.5.1770643908413; 
 Mon, 09 Feb 2026 05:31:48 -0800 (PST)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d8342dsm290199155e9.12.2026.02.09.05.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 05:31:48 -0800 (PST)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
Date: Mon,  9 Feb 2026 15:31:36 +0200
Message-ID: <20260209133136.163189-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <51a2df8a-1b8e-471d-b3c5-ef73240ac226@gmx.de>
References: <51a2df8a-1b8e-471d-b3c5-ef73240ac226@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770643909; x=1771248709; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ScCiuWKohZ3cmgPjQl/UO32tyD1HESeEPpRQNgufszs=;
 b=Qssgs3z5yVMkydmOcdZGfq/9vypM1n3DKR6R1Lt73VwgH3/Y+OwrBJUqhpRv2xAOib
 cwDXtHWi67WqfW2zgg6B7WojkhN5pU1yvf2oY1pO/WkwCV3WZe4uZMlpBg5FqbP5i6Hs
 0Po1xVkhUjcb/LqMwTKO3GtakLf/Q25qe350RL/kWqr65vIj2YkKRD4GQ1Znrg2swZtP
 txeUZ4JDuqFFbktKr2r9Up2R3eGDQgwi/Gsggyes2ZA0llJjcTTxwuM0PTO7jvlQSn5L
 FBcKDqRcQQDcGfs2Hm15RkTco8ySFfHCdhgien5myQcctOKjEpmdkR/xW3uPGCArMtUp
 Cylg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qssgs3z5
Subject: Re: [Buildroot] [PATCH 1/1] linux/linux.mk: add kernel commit hash
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

Hello Fiona!

On 09.02.26 at 13:09, Fiona Klute wrote:
>Hi Flaviu!
>
>Am 09.02.26 um 08:07 schrieb Flaviu Nistor:
>> Add also the kernel commit hash to the kernel release string
>> in case LINUX_DIR is a valid git repo. Using uname, this allows
>> easy identification of the commit hash used to build the kernel.
>>=20
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>>   linux/linux.mk | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index c61089bfe0..7833304013 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -12,6 +12,11 @@ LINUX_CPE_ID_VENDOR =3D linux
>>   LINUX_CPE_ID_PRODUCT =3D linux_kernel
>>   LINUX_CPE_ID_PREFIX =3D cpe:2.3:o
>>  =20
>> +# Get git commit hash if LINUX_DIR is a valid git repo or
>> +# an empty string which will be passed via LINUX_MAKE_FLAGS
>> +LINUX_GIT_COMMIT_HASH =3D $(shell cd $(LINUX_DIR) 2>/dev/null && git rev=
-parse --short HEAD 2>/dev/null)
>> +LINUX_LOCALVERSION =3D $(if $(LINUX_GIT_COMMIT_HASH),-g$(LINUX_GIT_COMMI=
T_HASH),)
>> +
>>   # Compute LINUX_SOURCE and LINUX_SITE from the configuration
>>   ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
>>   LINUX_TARBALL =3D $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCAT=
ION))
>> @@ -164,7 +169,8 @@ LINUX_MAKE_FLAGS =3D \
>>   =09CROSS_COMPILE=3D"$(TARGET_CROSS)" \
>>   =09WERROR=3D0 \
>>   =09REGENERATE_PARSERS=3D1 \
>> -=09DEPMOD=3D$(HOST_DIR)/sbin/depmod
>> +=09DEPMOD=3D$(HOST_DIR)/sbin/depmod \
>> +=09LOCALVERSION=3D"$(LINUX_LOCALVERSION)"

>Wouldn't setting CONFIG_LOCALVERSION_AUTO=3Dy in your kernel config=20
>achieve pretty much the same thing, without adding to localversion for=20
>everyone's builds?
>
You are right, making sure to set this in the kernel config file would
end in the same result. Thanks for the reply and pointing this out.

Best regards,
Flaviu

>Best regards,
>Fiona
>
>>   ifeq ($(BR2_REPRODUCIBLE),y)
>>   LINUX_MAKE_ENV +=3D \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
