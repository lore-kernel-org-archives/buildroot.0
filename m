Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF8CEF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AFC0849C3;
	Fri, 13 Feb 2026 19:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNjuf8lSBtWW; Fri, 13 Feb 2026 19:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 420878499D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011625;
	bh=gRywGfX8fv9MAQHwU4lqfZUWOyKz70wgzwwTmCcEP/M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J58b9Cy0PLCsUcaCD1FAvutNPkTfxPfPLvWNvFs8f5bmNI7MODjlyjSO1qRYrNIc1
	 56xDX+Zht9UFeGrsrOsLSd4zsEeX5/swjCFYlNjbTvmbuhFD3eQGpLjbl6hk3etHrM
	 BBKOB88sPC1/mY4KJW41tSRl2j0CDdzfLnnWCR7a6z//dmPSpZCUCsV8KqmJeR38ZF
	 Mfu+hpphpFvhdr8LUGOQFjryZefCa797NNLu4CXcYMWdXbuWx2lq/X9dpcHmQsZRRg
	 Bz9mBYAWtUJbxrjFkWc+rTgafUwVi+NQxivdrg844m8eKdkpSBfSC/F5YKBqO/O7aR
	 CuSH1QmUd+1Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 420878499D;
	Fri, 13 Feb 2026 19:40:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15CB869
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65297412A6
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZikTG74P7v-p for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 719AE40380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 719AE40380
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 719AE40380
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43621bf67ceso820172f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011469; x=1771616269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zs789Si1qtGe9pwwnGEIXqF8QpA1MjiyP1RqmPxQlyY=;
 b=NLVxg84CLD/Rzu5vAwgmMvYSMfYGQ9pyN09ahyiWKvGF+Z/YaY8gqr9S9BT/raOTEr
 T4AwHBsnGTASDlVwTlr2Jk1wuvKrvNjx7ccRIn85amRc+GgfGe2hPEtAekDS2H+XqdzV
 v8SyprYmyiJVMkWAFQKp+kflHzADm6s04qgE+D+Dj0UxI7EwGZZ2SAiRrZtpJe/Ju7/P
 tozkBwNnUyUmkYWMHfru19TklokjmacPovD7nG7xZDDSZ3EmP2emkOBat94PqKunVBbt
 cLzDuOGC1nIPj+Hpw39v/bXcStNNR75tpPdcacaIbfePsZKjGw0OUtyC1QcOvA9ELwh8
 b3MA==
X-Gm-Message-State: AOJu0YxHt8FLzwUKpFyJOObIRNhW1YgHp2yHnHx5f4aOUjOVVN384M2/
 9sz5WnZ6IVZWbGDzmF72pi3DQVncrbW5ao1UTLzzktiCtFZBc37MeYjP7Dfzt1AOmWiDwGewxPY
 d7rxr
X-Gm-Gg: AZuq6aK0UqhIrTJuaVgU1pZ/g9zc+UjM0pGHSGaAn0fbyBSKovMLBqQnS2vputKuGdd
 2IbB5Rj/Zh+1d35ewvByJ5T3sfIYGBf2FgnLhj0FwkAGZfsRy7YkTVk0CyHYGiVQu9QAAbPdzJB
 POFFfu6tBYVPz+VpMAxFi63cBUbuSMzcznK/RjV7cmtWtqs4MG3l06GxbzhvHltQ8B03Wr3hXOX
 3IkrTc8VUorfbEMrGd/ep8knILnKlq3MBKMRIt4Hv6fpaM/eLLE8B8EzHDPiXkDpsAdUWsBQcBS
 nFOnpTBU96a0cDOW1gx24iQpqCgLlaIzaTUFvNN0bNPr/nkhl5E8OtrGxv/Ywfflto8kFHPXZ4u
 ZmQs8aolr+Z7jf0FrlSGqn0C4w9xYmrkJjIrxnDcyhCznHvA9JWC2m+wn7EpY84sdiyjZ6j+F8S
 tE1DCer0pT+exKm00=
X-Received: by 2002:a5d:5d89:0:b0:437:9d2f:8bf1 with SMTP id
 ffacd0b85a97d-4379db8cdf6mr1119960f8f.38.1771011469367; 
 Fri, 13 Feb 2026 11:37:49 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm7459238f8f.13.2026.02.13.11.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:49 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:48 +0100
Message-ID: <20260213193748.40740-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120082405.46683-6-thomas.perale@mind.be>
References: <20260120082405.46683-6-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011469; x=1771616269; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zs789Si1qtGe9pwwnGEIXqF8QpA1MjiyP1RqmPxQlyY=;
 b=ADEFSrPARkAxhd2eQ1AeC0Ad1Y8Q1hTfWZ4+0sNv3d/fgbK+pX5LyEZRwSEo/mtIpi
 ctj1lOvOpBbDyhJSfeTuHcRceszX8Tg2N3CNvzoLiai5VXyh7UkS51LrU17E6GaE8Szs
 +4vkhLICOledfuybz4yvS/zt624sOAmgn69L3myJdDeJD4ei+QPRbgQ+aGnlS2qiIdNV
 xu42IpBwAwJ4NXpVnikjpV0elvK/yICLb9WH3VhtG58Bms0mqCodXtY3siqhuZ5tL1Ja
 b/61wscb/dADRPhjuxPjKm0RDxizsHzmDoNTSgPXlcTP0mqq81fwKc2bYAZXlUWs42Hr
 weTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ADEFSrPA
Subject: Re: [Buildroot] [PATCH 6/6] package/libucl: add CPE
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
> The CPE `vstakhov:libucl` is a valid CPE for the package libucl.
> 
> See the latest CVE: CVE-2025-6499 [1] that reference the upstream
> repository.
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-6499
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/libucl/libucl.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
> index bf5e368f2b..7b0e5b8e8c 100644
> --- a/package/libucl/libucl.mk
> +++ b/package/libucl/libucl.mk
> @@ -12,6 +12,8 @@ LIBUCL_LICENSE = BSD-2-Clause
>  LIBUCL_LICENSE_FILES = COPYING
>  LIBUCL_DEPENDENCIES = host-pkgconf
>  
> +LIBUCL_CPE_ID_VENDOR = vstakhov
> +
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  LIBUCL_DEPENDENCIES += libcurl
>  LIBUCL_CONF_OPTS += --enable-urls
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
