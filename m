Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9990BF9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72C2542B71;
	Tue, 14 Apr 2026 15:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktIxxLt2MD8k; Tue, 14 Apr 2026 15:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6C1F42B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181467;
	bh=QVZYHc1nj7GO8Cr19X2TcFci1M4Q7pi8xmQUSDKV1nc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Prz3Ja0CxbRfez1cNg15efQ3Iz24LLAYdU4Kgm+8rW1Bt2VPUr9pFKtDbJD17DueW
	 6rRyVhCFHaFXULWvJcEO7DGyZq/vy9nXgFrMMgL0Mu5Lv5HmCUDaH9AGdP2z7JTnSD
	 yEX4JWNeKQ4P7ZjIn2nFQMz2QuBHTXKtgL6ypE4jEwcpJyK6y96X3vQV/lMBsY4sfv
	 8vbY2cvjipq9CSYqP1oXWTaQkbHCbkLqB70PReRMOLPOYiACPRxh8F6fYN0IVvGjUw
	 UCQs26KMv/YQaoa0vVDdMHy6hSoi+PgUsrbtAq+pVsgQjnmtyYvrH9bFF03jZXQeyu
	 p9tEd14oCMLjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6C1F42B0A;
	Tue, 14 Apr 2026 15:44:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82A13237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 685FA400F6
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jywkit7pa-VY for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:44:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63AEC40078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63AEC40078
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63AEC40078
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:44:25 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488c2690057so57624445e9.0
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 08:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181463; x=1776786263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bHJqHtTEC3irCd9dqRXbTb1pFUCbi2ZX1ECBUMuqspk=;
 b=ZAXrD0jqOLlTk/Q0lZWKOPJeSCR0flyioxs+Y9qZvtl5IEGQM1XmKWBpcPbof8zEaM
 z5YDH/48JL32gltxMOv/0Mu04/02W2L1jjDGmhk9CqR7NosRnCs55ejpVEl33ZxiBfYg
 wwmcJGO2RS9evdlLUB7XXFX/IZ9fXCBsxc7/xFm8LEPidTLT3G+3Jn/idaWe2d5HAR5/
 HIstd2wa98Gy9a8mX5kdwNm86ZQ1zIrnkKmPhB4sNlevEJbs4mOaR+pik1FEuJOkPAwa
 bRqiJ+q+BzInljlM3G0scOPtquoywNTq6vJzmHq+a2CHQUNmAigEAN9KulIsenMtTM6V
 DsRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+wbS9pU8JBUX26NnNP9E3uyGjpPDu5QUgsOZH4MPZzug4gIjkCGyFpKby5gtaSrTKy7lFaqtgLYuk=@buildroot.org
X-Gm-Message-State: AOJu0YyDdkv9JdxHs1Qr6SNyt22m4pV62yYAfENSy8wgeptN6LebBFct
 uxJGsm0qmRbN5euUvnTjLz8QLVsfpNcKqaymgHN0s8Supgv4hcfwyIeiNcp1env1f64Myb5nmd8
 d7xxX
X-Gm-Gg: AeBDievoxSCo9whtX7JaqwcHJ+eZjFzOBVb73DzxDaIIjuqlN3sI+folZiQib97np/L
 cM5aTgltg4lAhZDLABtcrOfwXfnX59gvO/etz9ybM7mjd7VnhSLm/EtOl31TXk0mCTPuHoefol9
 Gbi5L979Uoimdaw18UXUEN8OMf626GUldU+vVMCGkYre9neSNJHOMH+WNmJ13wyLCs6ghDEBSyp
 t5Mm6hAqDym66ifr2QOf9DFb/cQ1relC6FSiKSI+DMze8hYKmq9eQ5M2ilEeWo52sDysagWKMZo
 tv0+GbWe6dYiQk7T9KbXfeqPHbtJjm8r6mvc9K48A3T/VX5WirkFQv6v8EIHVKlXs3lPDanxr8W
 OkQlyY8wl1EZALAd/qEYLJ6QS0PbB4IzAy5bIKkE25CBfgFr6PBk+sB10EhBd74GR9jF6+BYFSr
 NagzKbZDNe5AVOPEpM
X-Received: by 2002:a05:600c:628b:b0:487:1fbf:e0bb with SMTP id
 5b1f17b1804b1-488d680851fmr237999565e9.6.1776181463256; 
 Tue, 14 Apr 2026 08:44:23 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d7cf533b7sm13208865f8f.18.2026.04.14.08.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:44:22 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 14 Apr 2026 17:44:22 +0200
Message-ID: <20260414154422.334879-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315131107.3959487-1-bernd@kuhls.net>
References: <20260315131107.3959487-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181463; x=1776786263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHJqHtTEC3irCd9dqRXbTb1pFUCbi2ZX1ECBUMuqspk=;
 b=iCSfj0LisWDPV+yCR3JZwxFkAHdkoycuXH7mgTNKVNSJHfawDJ1EyxDN43lfMoI67c
 Z/zzfwbUWAEsR2g1x7CWit7s4mcY2KB3FBcEMeZk7etOy3Rf2joiHTbVIa27OmDtVbfx
 gyHk2QmDXcNkQQCbIvCaUWwxaWs9+9VirPEUL+hFhlTn124+n5UWN40a2I3oOKWBpAyZ
 vaPOCxO2JjB/HtPNx+SuLOsmO3piEgNwaSCSLw71NedsBHV2SOpW65u6sBWWzRNO6L+v
 Z/Lagk50BHcC0CIQ1NHqVw3K7swtgE0R1ZNAjgbpa5wTBs23Rc67nN+El0QCL6XPSBUI
 +1hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iCSfj0Li
Subject: Re: [Buildroot] [PATCH 1/3] package/giflib: update tarball URL
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
> Upstream moved all tarballs to new locations:
> https://sourceforge.net/p/giflib/bugs/190/
> 
> Fixes:
> https://autobuild.buildroot.net/results/c7f/c7f918fe7c879706c5a5875ea11c5f8b57007a85/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/giflib/giflib.hash | 2 +-
>  package/giflib/giflib.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
> index f11d4f1505..dcc384a523 100644
> --- a/package/giflib/giflib.hash
> +++ b/package/giflib/giflib.hash
> @@ -1,4 +1,4 @@
> -# From http://sourceforge.net/projects/giflib/files
> +# From https://sourceforge.net/projects/giflib/files/giflib-5.x/
>  md5  913dd251492134e235ee3c9a91987a4d  giflib-5.2.2.tar.gz
>  sha1  608ba98d2dd8d03dfa7476f434d57de50a33e10b  giflib-5.2.2.tar.gz
>  # Locally computed
> diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
> index f37ec8af21..00922ce2db 100644
> --- a/package/giflib/giflib.mk
> +++ b/package/giflib/giflib.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -GIFLIB_VERSION = 5.2.2
> -GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
> +GIFLIB_VERSION_MAJOR = 5
> +GIFLIB_VERSION = $(GIFLIB_VERSION_MAJOR).2.2
> +GIFLIB_SITE = https://sourceforge.net/projects/giflib/files/giflib-$(GIFLIB_VERSION_MAJOR).x
>  GIFLIB_INSTALL_STAGING = YES
>  GIFLIB_LICENSE = MIT
>  GIFLIB_LICENSE_FILES = COPYING
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
