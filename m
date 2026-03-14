Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90F1107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80CCD4101E;
	Sat, 14 Mar 2026 07:54:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyXNBhmBWcax; Sat, 14 Mar 2026 07:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2516541008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474848;
	bh=L0qVZf4NFq1wFruRmh+cbimT8HmhftQaqXwvOSGuDg8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RoMzIAnFJBgXFibOaLw8m4HXBp58iE4MROWU3RLvfBJ8XcSdLsL7kactEzKwh6FrA
	 pwpODMz9xh7i/+/wnAphZb2acY3l0g4YwG8INCen7CKWbj6lTlU6IVjuIHjLSLXuCV
	 7WIdkHW1eCmq34uRrPIc6PflG38dR9IYN3/ex/+aEnilFNvbJahpS29hN4NKVV3AJ2
	 dCESTAdWAmIKZUP0Ahfmg04KdTwr2YP1oMhy4iHUi7SJbF6F8Bk9HUpNxka3HTckJp
	 dgjBCelz6BonTMNO2xhDe+MO+JAPbnpntiHwGc53CG4n/DWg7LsE8UGalWKDV+MS+6
	 VsnMlsP9lHn8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2516541008;
	Sat, 14 Mar 2026 07:54:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 732F71B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5702560F21
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxQhm6vnL0wi for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:54:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51AEE60F61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51AEE60F61
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51AEE60F61
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48534b59cf3so25790275e9.2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474840; x=1774079640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iH9QhYDk2X9wOHosHiJqhcNuFQ/nUO6WbFsBQGvd3rI=;
 b=XbtVtk4bt+hiiT7+cj+WlUXduNSoDov2U0s5PvjLv7WI/1NmTmhNaEQocXKQ2f7Urv
 96VGrGp5AMzYN64E0ryF68EHICwZ5RWozc5AVupd5LMESWSxga8aZsKbTNFG4pGuTTto
 x05IVsYB6NGH40YUxE2GSBHoqs6VjyF58hOGrWGlJoXr/zx+NJIcUFcxDpp5eLlP/qrP
 SkoQG8l7Jkw4NNtvnWtQEPHhXAchsERYQ5PYAru9N1c1ed6KcOP6LAJXCyLfNTkTRzMN
 bB2b+slYmp2ZbyKGhuKYT8PuSGZdJLtrfJSNTX4SIQ/tMtPICKxyXr6s6U4Y+GS8oJCC
 A5cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGmexMIfypQ1DTVJWB0ZYXXsWcJuExXoI4blnpnqzVOyf9YfbOaE41lqWTPaKrA8KyVJFDzFajnD0=@buildroot.org
X-Gm-Message-State: AOJu0Yy1upGHI5G4Xy5tTUGm5O/JGX4zJ7Shy2lpkLi2UQQmdarF9Nzm
 0Dq3JCRUWgI9WaPg82DBouhPG4iDRKgeQdIr3AfgC9y/tn5TL0CF3v8N1axZY/6avdQHQbxbre2
 5HHtF
X-Gm-Gg: ATEYQzwdyYYA9dWJnnGofOYwEgk3gOxex1/3EzD8NXyD1FRhacYTvd0XURHu6veumbx
 49V/V6SLtivYFuvM1Soh96cm5JBTOJynJAwZtgGywO2jDpqVLiVrMO/U9XElA63dMBI+nYiZIYv
 pRLXwpV6zOhVbzVOI0M39RNJkZULcgdF0Q4zFFw3SC6kWzio2sowYYbsYxyiPu9ei+E/72KZDit
 SH90W97lOZOcC6t0wgUzzC6rYg7nd8bETw8RfZVUcLEyxU++mMeRJq2tJjGG4B9wL4VqkzSAHG0
 u3XteaeoAVHjuRRxPTxwMM7/CBIyhg+GrDnDzJnkmyVuukaD9xNIc+G5jC97WwOxT/0IMat9YWI
 UomeHvhwkOjsNzbhJ0xcxQWWRrgNWBh+3IdJ+iwIy87gNDQGtoFei6E4VVcPKyakfBNEEcZLAQv
 pB6gJo5+nG1/TEP2w=
X-Received: by 2002:a05:600c:3f1a:b0:485:481c:e7bb with SMTP id
 5b1f17b1804b1-4855670289cmr89998185e9.20.1773474840107; 
 Sat, 14 Mar 2026 00:54:00 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5f6bb4sm258663625e9.4.2026.03.14.00.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:59 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:59 +0100
Message-ID: <20260314075359.15168-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306074106.124068-2-bernd@kuhls.net>
References: <20260306074106.124068-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474840; x=1774079640; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iH9QhYDk2X9wOHosHiJqhcNuFQ/nUO6WbFsBQGvd3rI=;
 b=HL2kIoWhWmFZerHMP2qpgZ+EUO3zTFf4xFs63KN8vjgkIugJX1n1L5a7n3pp40dn3+
 pu6TXhCLN0T5loqN5/Bzs/eHQ+bPekog9oyjBqu5IfQ0Jsamw0wI14k+Tuguh1Mhn8a1
 Fzuz9DPYiZ9iFwgKJF2vxLazBkKhOyjQNvGo/jiUEtSUZPegzZASYVJ/LzUONR5eMB3r
 ZX+L4chKULzpPhP02GydXm9aNZPtQGMr93M22WcAlnrDLF9RV4ic7QNnOH0l257/JRBE
 BGzalBC7EMFGNc0dHSEPBK9ag1s0F9ez1fLIp+s4CWRW6wzMUoFJQVeDHn3ufyCAVU8w
 /sug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HL2kIoWh
Subject: Re: [Buildroot] [PATCH 2/2] package/libtpms: security bump version
 to 0.10.2
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
> https://github.com/stefanberger/libtpms/blob/v0.10.2/CHANGES
> 
> Fixes CVE-2026-21444.
> 
> Added comment to hash file about locally computed hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.11.x & 2026.02.x. Thanks

> ---
>  package/libtpms/libtpms.hash | 3 ++-
>  package/libtpms/libtpms.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
> index f10364f36e..175e6e3af6 100644
> --- a/package/libtpms/libtpms.hash
> +++ b/package/libtpms/libtpms.hash
> @@ -1,2 +1,3 @@
> -sha256  ebc24f3191d90f6cf0b4d4200cd876db4bd224b3c565708bbea0a82ee275e0fb  libtpms-0.10.1.tar.gz
> +# Locally computed
> +sha256  edac03680f8a4a1c5c1d609a10e3f41e1a129e38ff5158f0c8deaedc719fb127  libtpms-0.10.2.tar.gz
>  sha256  82f1e6bae374bb6a9d4f4596767fd33e499718d560de140fd9f3d402cc5e41fb  LICENSE
> diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
> index 6e5708202e..7bc69a50d6 100644
> --- a/package/libtpms/libtpms.mk
> +++ b/package/libtpms/libtpms.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBTPMS_VERSION = 0.10.1
> +LIBTPMS_VERSION = 0.10.2
>  LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
>  LIBTPMS_LICENSE = BSD-4-Clause
>  LIBTPMS_LICENSE_FILES = LICENSE
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
