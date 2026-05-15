Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23C2CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB15A6165D;
	Fri, 15 May 2026 13:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pgPxsy7Ylbr; Fri, 15 May 2026 13:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE4E961664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852067;
	bh=PMA29pEAklhaHpiQ0EDEMhISlHYFvuNEpPlmUKSeyFQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y+j9FaaBlV3sy9kaUzO8fYjOUDjuwHYoxTc9JgxwSCHTZ/LmE67m74LcwPi+dB0qG
	 iAO08/u4ZDH/eOwNc8XFrrK2VW8enXPKSa2loLbb/oO8Dnn5C3+LIZdPwOoAsCYIPF
	 DJNS8jrU2EUTdGsCIZFosC5l3EPWiOqG0pDJA9gntIFytjpik4CH5sNjOoPxLldgxe
	 AbvoYu4gAqGKASBt8gvgA+jabfIIVSnEGUEromkvA+AfUSk4BaK8Q0/4aDAPplC3WE
	 XjQnjMHa7r35ZbOHiIElvFbykHYyUEf3Ozs8ijHGhKBMK1fAGUbbooQwq6feUwfP6a
	 n2xlARPcrCQZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE4E961664;
	Fri, 15 May 2026 13:34:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5302136F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44A3640E35
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXWwMHoLeoQb for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50E6C40E33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E6C40E33
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50E6C40E33
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:22 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-448528f4e69so5272149f8f.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852060; x=1779456860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SztPZr4821j9tSPY0PJbMZg4S10YhYKpOw9OEKVDYgk=;
 b=M57agR+rTsXcjoAyUjuCkHr1XonQL0ReQQ2g1H1AWZ2zn1aUAcYidC2c44//LJ7Uhk
 SYuCdRE8+yuczm4rU7JczDWM6lc7V98fqwX3Q5GEIJmN8U1LF5Drvs36ziMNWxs31Mqd
 TN0hlgOBTZcHC59teI2TbuNvuoT9y1WmeavFyMPVljA9mgfDbC12A3dquYiaM/Or09L1
 eVEpMIxaDX8TFB7X/MEREbGnx4+D/bDv/BFvEJKtd5DDV9j4wUm4pTvx9ev/e2s6BHvc
 yKg0BoikXjwoNQJAqh1aIz94qbtTGpxZyVc8wc575hSrynCXKXXVRPaSQGEbv4+x+Eyw
 Uxqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9EZfvnm1pohYSSh4lmnk4s6fko+OOi/kkvDH45d30CM/qvEA4WqMxx+0A2tRh3mrTJqAsK/tkyXLM=@buildroot.org
X-Gm-Message-State: AOJu0YzfEyzk2dQIi0bY+v20UumoK3Il6GfUW6K0PyUKlsxCxemj/CrT
 8BjEr62jQsqFR8tzmaoI/tmMV3N8IOr44fX5IxSU6VvcG5qCUkNVLqGFbB+JDhadj4E=
X-Gm-Gg: Acq92OEW4SHKALvdEtbJEyRbmlHFO2wrHKj+MRWodSAkXW3I5TSoHNAhoWXTLSDSynS
 ohP1HBmLxf43yl9S1mZVimuGrRax64x1xYuynQzNfJ/T56oDxp79o3tLbFVDmwdhbxUums4KxnC
 q+y8eYshfV0ayOeAfFuSMlXX9jMiTAqYiiXBwqCWRKPnQMde6me3obc8CYslO1yB5qkJx1LBsPH
 Hmbgb4AJ1DpySZz9R/xlBkNTwYSgvs5X+WsFd+tgR8cOiX7+oZy0YFISres1z8prtTxcy2M+bHX
 9fEBmUFnyJowYojaUxzxvbXNuqtOO8tbHYeKXvNvYwVZQrbki+Y1Hg9vdAt1dkoZ3/AeZag4igx
 hTzLRqEQ82HU2EhCECbaNvdJzY1AQu1CtgqbLW9niz05w/WMXtj20CgJKckt487ik9hqXLaKw9r
 lS/+f75Ag97bmN6IqQoN3EKo2vn+tnqPceClSymb7RJfkyTICgzzKxcCk=
X-Received: by 2002:a05:6000:2302:b0:44f:c886:89b4 with SMTP id
 ffacd0b85a97d-45e5c589d83mr5708936f8f.15.1778852060320; 
 Fri, 15 May 2026 06:34:20 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe248dsm14283773f8f.30.2026.05.15.06.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:20 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:19 +0200
Message-ID: <20260515133419.316930-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430185635.2999959-1-bernd@kuhls.net>
References: <20260430185635.2999959-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852060; x=1779456860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SztPZr4821j9tSPY0PJbMZg4S10YhYKpOw9OEKVDYgk=;
 b=chxHHGtRqhdZo8mCE4LcL1b1GRnpjjh/wdkZue4tKykpkr0+V3xZeIyh1NsCrRF43f
 irCYwwg0VG5k5OOMx+9Gyh6YJR6FWBfGGKVMq+GjKFZWAnNUueM/GaGPhlgUQDYtMlmf
 6w5qnyRx2lxk6SineCUGZUVqKyhcTvbK/GdfkWHLnaVmyBb7IF40W41g+sDPc539RyJN
 4UHkKgMGD0OXbK32qAM0XEJ8PJ0IvNLZ0wU1E+uByXasY7maz3iocf6v6y8Pyq7IJYEw
 U4aLQW+6Zkzyn1KYFOCpLVhbVdpTyQtaMxZsInwLnSw7uG7dL7tX+f8vSzncvQN+3tKR
 aZBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=chxHHGtR
Subject: Re: [Buildroot] [PATCH 1/1] package/thrift: security bump version
 to 0.23.0
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
> https://github.com/apache/thrift/blob/v0.23.0/CHANGES.md
> 
> Fixes the following CVEs:
> 
> CVE-2026-41636: https://seclists.org/oss-sec/2026/q2/236
> CVE-2026-41607: https://seclists.org/oss-sec/2026/q2/237
> CVE-2026-41606: https://seclists.org/oss-sec/2026/q2/238
> CVE-2026-41605: https://seclists.org/oss-sec/2026/q2/239
> CVE-2026-41604: https://seclists.org/oss-sec/2026/q2/240
> CVE-2026-41602: https://seclists.org/oss-sec/2026/q2/241
> CVE-2026-41603: https://seclists.org/oss-sec/2026/q2/242
> CVE-2025-48431: https://seclists.org/oss-sec/2026/q2/243
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/thrift/thrift.hash | 4 ++--
>  package/thrift/thrift.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
> index a517900c82..ff69f16849 100644
> --- a/package/thrift/thrift.hash
> +++ b/package/thrift/thrift.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.apache.org/thrift/0.22.0/thrift-0.22.0.tar.gz.sha256
> -sha256  794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5  thrift-0.22.0.tar.gz
> +# From https://downloads.apache.org/thrift/0.23.0/thrift-0.23.0.tar.gz.sha256
> +sha256  1859d932d2ae1f13d16c5a196931208c116310a5ff50f2bfd11d3db03be8f46f  thrift-0.23.0.tar.gz
>  # License files, locally calculated
>  sha256  d315e6cdedc07c478de6992027bfb66f220886c6216fd7e9885ced30c3703646  LICENSE
> diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
> index cee7adb8ed..68b9faa3e4 100644
> --- a/package/thrift/thrift.mk
> +++ b/package/thrift/thrift.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -THRIFT_VERSION = 0.22.0
> +THRIFT_VERSION = 0.23.0
>  THRIFT_SITE = https://downloads.apache.org/thrift/$(THRIFT_VERSION)
>  THRIFT_LICENSE = Apache-2.0
>  THRIFT_LICENSE_FILES = LICENSE
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
