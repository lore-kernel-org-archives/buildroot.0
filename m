Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20942C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 07:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8380A81E1D;
	Sun, 23 Jun 2024 07:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oySu4USOlLeL; Sun, 23 Jun 2024 07:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 370D781E0C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 370D781E0C;
	Sun, 23 Jun 2024 07:41:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E77F1BF59E
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 581D8406BA
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 07:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMt4A1jrIui1 for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 07:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 016F8406B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 016F8406B9
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 016F8406B9
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 07:40:54 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-36532d177a0so1997005f8f.2
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 00:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719128453; x=1719733253;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Cgv2pmEJYwgEC+vbba5htbrwUEcS+c4HRrIdgstRCY=;
 b=dFjlKdYmw3k04kvdFmvpiabqUGzzhAxXBLY4WcWk1DcngfcGOyuCdZaL5L8Qk1/Yxb
 x/U7YroKs13VLxb4Byxa3G48NP6ljqkjqxrlJFEsl+qVUB55NTjKj1k6pgVYkcoEjs5d
 /vl8PrJaxusUe7sFAkAQcGeQw7k/SxQT1IKO4jjkY8KlOMySbO4tdaBoAAK9irTKofRA
 eMMNEttHH486+P2ko163oA9FU7z8IZhBMv4HTdlGDDp/xJWZ27XSP1KRDARA0AKpxplx
 +/sgP93kzFcGcY6KLt3I6Oc6PmsbPdvFk3X3O98lWuhtZ5eh1p7+BERI1OFsocodWjYK
 uE8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2OsGsuDCw6ThMCr4JcXGwXCufcddT/01uNOZHycA43j0CsOhF4PcgZhqDhXNukfEc5/LDgQA2RID5YNkaAZ9n10sGxXqOUg==
X-Gm-Message-State: AOJu0YwE5oa96Flv1jB4wwHfszXQGSP5m2fFyKgf4PZC8ChFBuwobR0Q
 JWRpsnjVGSXl1eK2diwMbZxC4+dXf2EH9+FNgsJwv8sL/20TvwEoSyRy3Ra2eRI=
X-Google-Smtp-Source: AGHT+IE0Oy4hmqDYXFz0pRezMjAy7Ki/XzJl7JuGn18/adNCN7j93pt++JauZdlg9zt8F+Pj9a8iiQ==
X-Received: by 2002:a5d:58ed:0:b0:362:f291:6f97 with SMTP id
 ffacd0b85a97d-366e4ed2eb5mr1459031f8f.18.1719128452686; 
 Sun, 23 Jun 2024 00:40:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8c789esm6683167f8f.91.2024.06.23.00.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jun 2024 00:40:52 -0700 (PDT)
Message-ID: <8faa31b1-7cec-4753-b8df-983374007cce@mind.be>
Date: Fri, 21 Jun 2024 23:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240602144343.1272944-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240602144343.1272944-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719128453; x=1719733253; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7Cgv2pmEJYwgEC+vbba5htbrwUEcS+c4HRrIdgstRCY=;
 b=Ap8m0LvhGx/HHV4lwR/t33veioXWRBaD8LTY30BauKfJLluBiw/Z4tAZJNjnTBzRkA
 htbS1wlFbH7IV9nXDMmQxo3EMg8xUDC0DSi550ZCKCeybThZH2qKfyqH+W9NXQugC69l
 QlHn5/9744rL8aaqBlZKNDebXuE89fYxc3a1yknazYigMUybSSYlcwecCI+BPIL+3Z8L
 HVTURqyBpHeTazK9wO6XCnv5oOfQ46WLxZZfz45Hsq422uHTuToedtPg/gL7Hf6PxhMj
 hB+Bfp3+cb5JsRQfjElfLhRCqnyskByQk4Y9G4XVuhrrXT1Ju9TSrjs63KMIiXMd7FAo
 keCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ap8m0Lvh
Subject: Re: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: bump to git
 version 00dfa28cd7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/06/2024 16:43, Julien Olivain wrote:
> riscv-isa-sim (Spike) has not received any tag or release in the past
> years. As of the time of this commit, the latest release is still
> v1.1.0 (2021-12-17), see [1].
> 
> This commit bumps to the latest commit 00dfa28cd7. For the commit log,
> see [2]. This bump includes many RISC-V spec and extension updates.
> 
> Also, when host gcc >= 13, riscv-isa-sim compilation fails with
> output:
> 
>      In file included from ./fesvr/syscall.h:6,
>                       from ./fesvr/syscall.cc:3:
>      ./fesvr/device.h:15:30: error: 'uint64_t' was not declared in this scope
>         15 |   typedef std::function<void(uint64_t)> callback_t;
>            |                              ^~~~~~~~
> 
> This bump includes commits for fix those issues. For example, see [3].
> 
> Fixes: [4] and few others.
> 
> [1] https://github.com/riscv-software-src/riscv-isa-sim/releases/tag/v1.1.0
> [2] https://github.com/riscv-software-src/riscv-isa-sim/commits/00dfa28cd71326a9b553052bf0160cb76f0e7e07
> [3] https://github.com/riscv-software-src/riscv-isa-sim/commit/0a7bb5403d0290cea8b2356179d92e4c61ffd51d
> [4] http://autobuild.buildroot.org/results/c30/c300f1c84033aec1d265b682e4c1da5362d25f8b/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/riscv-isa-sim/riscv-isa-sim.hash | 2 +-
>   package/riscv-isa-sim/riscv-isa-sim.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/riscv-isa-sim/riscv-isa-sim.hash b/package/riscv-isa-sim/riscv-isa-sim.hash
> index d787a03e4c4..a935cdcf80d 100644
> --- a/package/riscv-isa-sim/riscv-isa-sim.hash
> +++ b/package/riscv-isa-sim/riscv-isa-sim.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  9b29c220fed1e867e3bea4b5c565f2629237d525a4d9fe1668699c4406003a1f  riscv-isa-sim-1.1.0.tar.gz
> +sha256  fb4420fbc8fe88799e5cd3195920afab99a18bc919e6c675a5e55c7c90079cb4  riscv-isa-sim-00dfa28cd71326a9b553052bf0160cb76f0e7e07.tar.gz
>   sha256  c65e436d18972c9c4bd192494fe4870bd2e158179474975b80a3559f27631632  LICENSE
> diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
> index 90eed93c36d..a31192da0a8 100644
> --- a/package/riscv-isa-sim/riscv-isa-sim.mk
> +++ b/package/riscv-isa-sim/riscv-isa-sim.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -RISCV_ISA_SIM_VERSION = 1.1.0
> -RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA_SIM_VERSION))
> +RISCV_ISA_SIM_VERSION = 00dfa28cd71326a9b553052bf0160cb76f0e7e07
> +RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,$(RISCV_ISA_SIM_VERSION))
>   RISCV_ISA_SIM_LICENSE = BSD-3-Clause
>   RISCV_ISA_SIM_LICENSE_FILES = LICENSE
>   HOST_RISCV_ISA_SIM_DEPENDENCIES = host-boost host-dtc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
