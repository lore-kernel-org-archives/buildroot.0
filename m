Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1802CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D928612C2;
	Thu,  9 Oct 2025 14:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18XjMRxPEsUq; Thu,  9 Oct 2025 14:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E2D060E56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E2D060E56;
	Thu,  9 Oct 2025 14:54:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A452119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B44841062
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxFl4SDijhyK for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E58DC4105D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E58DC4105D
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E58DC4105D
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so7647275e9.1
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021677; x=1760626477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/p+Ove7d6ZprJtpz0/x6iov0onURqqLQcKJjzsQRZM=;
 b=CExH2aYvBcU9qVvKlBS28ZQvDA0VZeleuiFFbJvw6k51FgBWLTfQu0PGQzkuJ+xcCp
 Eyg6K5ukL0YrK3K+c9mS5xM3e3c/QKm3FbSWN5SzcjICMjQhgZx4lQn0rEM9NcJgp4MY
 ewB6qQiqln7t0XVX73pzBzvfRWNl5PpE90KczMKzBWRcVqDPOFykyk2X3+DP8JSRva/M
 tK9HnSTKFt4MVQ4HZEJjiMddD+qCCLO8sYFFj6AEEpWWoGGVbZ9dB6dTUeqTdkIY1P5u
 QWVrKditXLuwzoZOSSbLu+FsQzWqdWe3Fk2b/2Ku9j/oXN8esNbK0Iachw6qhl2WfwPr
 J/xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU4/VvNWK601u5HYmfsPcT17/3LxS8yiJLh79dQuDUhLgvtmy1fpFcqzd+E9E5dRygwFQtFpcAEQM=@buildroot.org
X-Gm-Message-State: AOJu0YzH5Nh0ierlweYty2QdH1EC4Z4FYe+7BnRNBMbsFlWA8xz56ZuS
 wh58qeXVZAbxNILOi4mPPNtkTr4RStzOiHoz+ID0jy2EPJcKB7exXGxFFjR1pdejozLyznV8cJX
 VcA/X
X-Gm-Gg: ASbGnctbQDlAJ/ZGGVm+QbUkVHw6AXtCfOEGrHCVHFcVb/w/CPkquXsM+BdJL3F3qNQ
 WmNhvTnBlfX9YZkO+2kDOpXIKBDDmNdHibCHuQxxIetyKfhmirb2zidE/TLrSV+hunzLE2KHpWE
 veQ5IFyR89PU/++6rr4wxrdO8wb7C6ISQwRlIP6AsWfM/PeG5kTg2iMihddn2xaB+FXr/VtJRs/
 yK9Xf2fd+tPdNUuTfFydAnSVbJRpOUowkgzmaEZByaAYvdAMw9j/8rLDVsc+G6/AFbsNHHn5y8C
 qkhxsHxZdzzvY+IXlbREHFdNA8bVMOm9/AiynUxc0nPPMBmT1DtZ58Bcx2OzI98vjlZQxFLh42K
 Gl9RVX6sxY14BIW7SMtRShJ2nSgqe/yZ2MNhAHkGn
X-Google-Smtp-Source: AGHT+IEr0swzzsvT9uelHRwaiVdhoBkjsOZ4Venh1whHr/MoYlK2oQPtWbJ4zK5gc5EBh6FvJ4rKJQ==
X-Received: by 2002:a05:600c:3d87:b0:45b:7d77:b592 with SMTP id
 5b1f17b1804b1-46fa9a9ede8mr54831525e9.12.1760021677307; 
 Thu, 09 Oct 2025 07:54:37 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f027csm35891514f8f.40.2025.10.09.07.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:37 -0700 (PDT)
To: Alex McLain <alex@alexmclain.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:36 +0200
Message-ID: <20251009145436.481964-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915033631.2230670-1-alex@alexmclain.com>
References: <20250915033631.2230670-1-alex@alexmclain.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021677; x=1760626477; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/p+Ove7d6ZprJtpz0/x6iov0onURqqLQcKJjzsQRZM=;
 b=Z5bi0i/8YcMs/1/99Aq1JGJZo0wSAGrL5PhQHPHXQktYFTJmpugJcOv/VL1iHo8mnj
 y2BLhzgXtvPVvMJzW0e4v+T5cNNchB2uGmG0j7EPDvAhso8ZoKsbSuudEqaahENlB+zF
 7c5SP3Ieh8AgeH8Zzk1x9SPf97qzHd/+GMPnecyUwlMuyrVD5aGjoKlY/E/S/i1sNZZa
 VWO++M2z0P4RjNxj3ovphGZjxTff1+cVGJMDFff+eSdph2fYib1ngb0RwXl+NYvumm5z
 wTTXR8mGrSdW7bjJbb6keBGLCCuBTgD2b8aYKsL2+M1yyKgoUUQfl5p7zbuYIzal/d/F
 BoWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Z5bi0i/8
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: add support for
 Intel 6E Ty architecture
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
> Signed-off-by: Alex McLain <alex@alexmclain.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/linux-firmware/linux-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 7f1a789057..21d29fa945 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -642,7 +642,7 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
> -LINUX_FIRMWARE_FILES += iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
> +LINUX_FIRMWARE_FILES += iwlwifi-{so,ty}-a0-gf-a0*.{ucode,pnvm}
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
>  endif
>  
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
