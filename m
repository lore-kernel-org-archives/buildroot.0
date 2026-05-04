Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDC4CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3DA8468F;
	Mon,  4 May 2026 14:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3pdSRi_JTYF; Mon,  4 May 2026 14:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D0008468B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906097;
	bh=fdJ5hJtF+1lcHIgbWNrjkPQFbVxPuBHJODdBXckPrfA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qsrLUXWDSoYCFaFCJbx2ZwYHoGhPNmtMLUDOaKGGnyjfI6WAQpSzmejznVxRbXNEP
	 ebdMEbVKanXlGR0wU9O/AcIyzwmaRH+aJW8Rf1QfmYlBCMZPPeZH/kbA+MOjMzqMSY
	 bJvRjotyKj0scScxbZ63pl7DI1h+CrZokm8AyCA6ZWrXOf/czF8TUhN2aszzUecejp
	 jYxuJ1eZQz7QMvLvx18HiS1ZrCosLOb9Lt2bVLEqf78BNzL+yMabxyO/MgBeiChVil
	 CpZsd35ekGVzIdSA50Wd/ZKxzr1CeSsK/IFoFKCahwMnAKYEpyLi0vQwmbe4InpwQA
	 hjefo7olxI/VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D0008468B;
	Mon,  4 May 2026 14:48:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23E8525D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1627741C35
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zw5_IUpBHzzO for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C52CB41B23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52CB41B23
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C52CB41B23
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:12 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-44985f4ab0fso1803258f8f.0
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906091; x=1778510891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2zbyk0Lf3Uc7mnnbO2pQw2dh9+jrGlqjWceWq/IuCcU=;
 b=jDeapqp3M4Jkqk4KvW9+Xrrb7kf4ojehexd8BXrdHVjjZbm26YcF+6NPcKZyPD+bYH
 DPvTT8kU/qEDmhEPSmLuYd74HZ78gOhxFu29kAHlNl9JdUG0QLnXcAw4NGy45Bnhf4WW
 xqaMzjGWDpbQm4hMu5Gmyrhxe3z/1CVSHudFNOiwW8evTJkrwdjW4QRwkdUPn0uLavnu
 eomPnMdYmaSwNuudW3D8AznDDC65S6CVvQNDPMSk3TLD2PoOS7Rm/GL0ZbbsZDgF+exb
 LQNaXu4qs5qTke/lph90It/h/3FpXRNTgL5FpJbSsX5j2e7JqD7rpjeBu/x0G3gMToH6
 t9yA==
X-Forwarded-Encrypted: i=1;
 AFNElJ95qPSlJq0jhTxS4y+ZRAxhTzm4Rwye7Z/IpnbaudW8cybR46JNZhpVe34nX+49Do7IwbLcP8D9tMU=@buildroot.org
X-Gm-Message-State: AOJu0Yx2TEojT8fwx6LBYZq63rKL/4i2Xr+SUQUN2ihASkkBzpiVUP2q
 QCSIYM55QewpDBqFqb1snzasiR8aePRCAQIJJJVKlUAAe21Y27MTStX+3xLvoYTRygA=
X-Gm-Gg: AeBDiesdRxlK3pJIK4B+7EieQLZWxhvmPHL1FCjOTZ3AF6Lm331/WqD7qgKn/5nwsod
 EAiq9+Na8Yq2a+f0b5pJ99UPGbwQeEVHOyQ5GoNLBXNtTa726INVc+yWcFBdl/jtb/pHgFygX7r
 w7OCRN+T5GG78eeX6/ucHsiRtU+KOXzNPZZqiZ4SmYGbLUtKbbRqiUwfundu5ib/K0weBy9C/T8
 x0tSxulkE3aPpKh+IVGBJaIOTCgAykVu2TxXuuygAIJ0Zw4fh4bxerZamWRRFe7Fk2q/QITQt1/
 1e88TZkCm375GkacVMjKr2+ZQvWJKs5BEFZxzz8W+94FVwvFCC6G9wJ0txYv9Pz5npj0JqNYmZ+
 1nVGkOeJnrJ83NN0Jd45YJHehkQc8zOIfKC3krLSFMBUkSoNcVKdS87hAknEfa0xUJiKnhzPRu4
 7/fq4Xd2nkvhwukQIHATDPmwi7zg==
X-Received: by 2002:a5d:5f56:0:b0:44a:b3c4:a044 with SMTP id
 ffacd0b85a97d-44bb68c793emr16933213f8f.30.1777906090669; 
 Mon, 04 May 2026 07:48:10 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a986aac01sm25078323f8f.31.2026.05.04.07.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:48:10 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:48:09 +0200
Message-ID: <20260504144809.11087-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260421172625.735873-2-ju.o@free.fr>
References: <20260421172625.735873-2-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906091; x=1778510891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2zbyk0Lf3Uc7mnnbO2pQw2dh9+jrGlqjWceWq/IuCcU=;
 b=RlwyQhNqOSS+Keup6eHpaG8tLcYO8GvuUI40O+aWUgkfkVUSIKFpJh8ubPICtSnS30
 j+VFfQxKEXtF1AEDABA3JAe8yLsFK9e/2ju0LL+TcLgv3VqhuHSK5DtD82u0LgbppBk3
 rV8aejkBxCVmj4AdVJw20kFMpuPUbnDJ1nt7/11bCkb4P9T00GqXnDbhMfzVnx87OQq5
 4iQDtO4ekdETLE/YeQD47b6YJiMnJC6ZLy8iMz7kM+H3WYS7kl/MGpf2M94TM/ZAXPWY
 xcmMMVqI34IIgbCSAs+D7aNFW0AD49EqaMn/1BzzPEfLA4V5XAEwwu8UJBKnFOXZtqFa
 Y03w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RlwyQhNq
Subject: Re: [Buildroot] [PATCH 2/4] package/python-magic-wormhole: security
 bump to version 0.23.0
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
> See NEWS:
> https://github.com/magic-wormhole/magic-wormhole/blob/0.23.0/NEWS.md
> 
> This commit also updates _SITE to use a stable URL which will redirect
> to the package archive, to reduce future maintenance.
> 
> Fixes:
> https://nvd.nist.gov/vuln/detail/CVE-2026-32116
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2026.02.x. Thanks

> ---
> Patch series tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/14023074896
> ---
>  package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
>  package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
> index b0f32e2d13..2f03594cc1 100644
> --- a/package/python-magic-wormhole/python-magic-wormhole.hash
> +++ b/package/python-magic-wormhole/python-magic-wormhole.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
> -md5  e57bac643bbc691e94919be496813a4c  magic_wormhole-0.22.0.tar.gz
> -sha256  52a3ae2f0c56d0d4cd52188e50f10d2fe14bfd46e287dd50b72e7f7e851434ac  magic_wormhole-0.22.0.tar.gz
> +md5  23f71fc6d6f78b93d419cee6d4af4d94  magic_wormhole-0.23.0.tar.gz
> +sha256  4cd8f48a5c47f70578be7063f892988177681ab66845f4d6ad2d5eb03ce82acf  magic_wormhole-0.23.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
> diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
> index 7b74113df1..9f3b4dfe1c 100644
> --- a/package/python-magic-wormhole/python-magic-wormhole.mk
> +++ b/package/python-magic-wormhole/python-magic-wormhole.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_MAGIC_WORMHOLE_VERSION = 0.22.0
> +PYTHON_MAGIC_WORMHOLE_VERSION = 0.23.0
>  PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
> -PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/65/34/08813891da57999cf953e9c553193c900ff363c4cdfdd48a74f65536a883
> +PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/source/m/magic_wormhole
>  PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
>  PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
>  PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
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
