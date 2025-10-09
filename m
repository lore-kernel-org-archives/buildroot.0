Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2A3CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61CD3410CA;
	Thu,  9 Oct 2025 14:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KChqVflZoM6; Thu,  9 Oct 2025 14:54:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF8C541062
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF8C541062;
	Thu,  9 Oct 2025 14:54:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF67D21B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D582C60EDC
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdR_W2MPaZpZ for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A2E5612E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2E5612E5
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A2E5612E5
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:46 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so9283005e9.0
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021685; x=1760626485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+cA7+lVgLIN8M58nIsWkhLSEl5FyCLL1WlyebJJv6Y=;
 b=gEeQEv0nyaeCeWlHTSSGEsEiiehq/4zng+kxzgG2whwFNfeZdVEMrfsvFcUzhYSvtF
 gpq5t+eoO6/4Yxo68II46nmjzrvlC88LNNWShkDCnR7lkP6ZbMqRmdmAFL/nTgxm8ePM
 MR1FgXUmQ76PJMu944AUcqwcIsKnfVAVvnbTKsGVigCnI/nQUzGBcpMRFKNrjB/WhyiD
 CFUtwUshuB5O+IHuyiEC84/lQDYBtl/3DjNAbtJ2yXVQxz9oi2gkBWOcdAEzj2rRrFRO
 eRqxflefb1JiHtvfPH/7OSKSYIheEAc23SY0X+IU8MNAgM0kd1kehRj8ZrQZqhP02Ye1
 A9zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxiJQKgynzc1G3o7tqSVFqRAfmDfDw7hGdQho50gSqb1+m2+cnvk49lsaqa1UCtsu9/hgT2RrReo0=@buildroot.org
X-Gm-Message-State: AOJu0YzgyzPK0kb9sXs1jB0Sr2Yync3JARKGLUy+fJW6pJJA7z+ko4sJ
 RdrgnSCW6KBryA1XBMlil+d8JTOAXfTJwd8YxqiPvruHCGfBliOR8vgrUsjKqnRFcB0=
X-Gm-Gg: ASbGncvSC8Wd+FSqVGQKldwXTlqoawrISIwFAmyJ1r0cdkaP79FewePBKtNiHdmSO9E
 nYz44mntSS0I1mb8LRU0Qk68mYxPTEHAPa4Rvgf3St43VAEr//xeUVwWBhwND/xCSxigJsZXYrD
 8bFPvmInYLFCtUQrwHcENuB+Su7bvlxK9An04r4LMktvOev5elleyM4zSSBuwrgWavddWfRDcSw
 Dr7+CGv+8UvMwVjyLu8w+Ng5PKGST7Ewz8DdU2yLfdQNZK7HJM1/9uhwncBpRbjnYvsp0XacBsn
 ZphpfxeAm7m3AaYYyy9vPBiVzBbZSBzQfvJu6A1F2ZI06mJg1zlzvlM6xw8lfI2VsrVP1kFunKm
 w1dmUaDzTeFrczroZ8+PU4iesi/+lTP9MOBsljX9r
X-Google-Smtp-Source: AGHT+IGc6SgW72R3FA5dKLs/YXCZSLIY+LH04s8NX3oyGQQ/LYerMJzn4NhjW/6IQ0OmFcWwrivLYQ==
X-Received: by 2002:a05:600c:4753:b0:46e:4a13:e6c6 with SMTP id
 5b1f17b1804b1-46fa9aef36bmr55812025e9.19.1760021684870; 
 Thu, 09 Oct 2025 07:54:44 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489ac60sm800695e9.16.2025.10.09.07.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:44 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:44 +0200
Message-ID: <20251009145444.482424-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002185857.2327302-1-bernd@kuhls.net>
References: <20251002185857.2327302-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021685; x=1760626485; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+cA7+lVgLIN8M58nIsWkhLSEl5FyCLL1WlyebJJv6Y=;
 b=Zzn5oycOEvtOthYcLu7QMOKTExOmbiTCZeG0FDu5c+Vo21r0g+XqeomLDos6A7irBU
 sF98K9nB0LEQUtiirg/C13w2MVN5gvC3dg0jdz1R5jCkehoKu2W749Mcr33qBsvkIcNY
 GuJO1AEB8oMEen32DI7BT/rXL8SINB1tcjPC+ZefE5kpHBvsbzznyyt/ZW0HqWqx3t2R
 PFBJHXtfXsoKFjHofkyeiA1hyrK9o03nJrD50YyKhoxdtWAt60YXXPfny5zz2UgMMwSm
 lP1bsLPwXmNlkVfklHWdK+2SUFOwoSqtFbYVM9J/2t/b5tuqyT1AwCWpzI9A1bAUqdYi
 Mylw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Zzn5oycO
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.8.18
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
> Release notes:
> https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
> https://forum.torproject.org/t/alpha-and-stable-release-0-4-8-18-and-0-4-9-3-alpha/20578
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index 55c915ef4d..95a3a26eb7 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.8.17.tar.gz.sha256sum
> -sha256  79b4725e1d4b887b9e68fd09b0d2243777d5ce3cd471e538583bcf6f9d8cdb56  tor-0.4.8.17.tar.gz
> +# From https://dist.torproject.org/tor-0.4.8.18.tar.gz.sha256sum
> +sha256  4aea6c109d4eff4ea2bafb905a7e6b0a965d14fe856214b02fcd9046b4d93af8  tor-0.4.8.18.tar.gz
>  # Locally computed
>  sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 399d4b481f..f9ff4fbca6 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.8.17
> +TOR_VERSION = 0.4.8.18
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
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
