Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9722CDB466
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF7C86FACB;
	Sat, 20 Jun 2026 09:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uz1cnTqlap1i; Sat, 20 Jun 2026 09:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E84ED6FADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946639;
	bh=oTPzm3se2kfNvI/DY24pr9jt51sp0i4DUac6dXhusHo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SnSNI9NEAOKMEubAfScPeJOtCqG7s44faxVG+ToFKCZzxyqZD/54THX8xgTfz74aK
	 D2GJr4eiUcKhBh1heHeDsxH/oIoRGimANESdrZ5gCffLcGcm8M6priqTX5al+w2QUb
	 6oSAkBh2zJIP3rGVNgeWFz1DM1eRmHxF6KNXFQ4zPTxqOO+377q6rW/CooVhFEcxcb
	 trRYsV4lwl/V5Qz4jKmjJwuZIks7UEneJme7aa0yEE96t5Q0Tu/ad2QvbKRYX164MW
	 UONraX31b0e4iaY1dO5FL6r0rUaucipRhSC3oz5HJjTPnM9nqpv8dxNjSmonhSdEGe
	 GZZb1r73Uargg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E84ED6FADC;
	Sat, 20 Jun 2026 09:10:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB36D06
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 743926FACB
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62N3tJtFS_2R for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD9466FAC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9466FAC4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD9466FAC4
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-460662fcb4eso1939211f8f.0
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781946634; x=1782551434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ieQgch8wL2YUZRSi0Hz3NEVp6Gk8DZvb2Siqw6FW2Js=;
 b=Z4QAvEddZNKVWPrgQnrgmtmFwqBxNUgDagGvG+Izku5zKSSumZE7ZNN/9A3E0ZlD/t
 nyp/+LGWIA3qP4JX4hfCP2IvqpNh99rjTZc/XmrFJaRY9FPcEw1HxYlExgTSFPCvJe2W
 e0FetumfUTjvno3DTAKXQE3ze06Df6D7kQhS1wrC6dIPSndMDQj6+8FB7P8yZMlr587v
 EbWpvdBhd4Xpl3Tm6aKVNTreRN9vZs4+pETciLb9cMPp5lAll2IjBiZU7axDp6tiWkm7
 OuZiE2efsBZ2oqfCvZNLK1RoIcDmvSwzJTIAQiPDMLNyayQONkdfZJfYsU0bLga6+OO4
 IXQw==
X-Gm-Message-State: AOJu0YwcrxVodZE8HCbqdxUD9gCMNeCgp9NLsW70RF7mcnCZn8R/4Q92
 PS5HleVHu/YrLPh2CK/ItVBhq6uiFxLwq7FW2SSZbk19pNNz1qecvQ+5ZIx2CgadNKxnxJGn9+Q
 z+wTr
X-Gm-Gg: AfdE7cnpCebuMIAHDy1sMnFEvLpIjvHtogrR4H7mELD3zuUHF48qHYX2QY115uUx7kQ
 7hiYF+6mUb7Y2ToAk0o1WlPXlsNn7LBtIKt+bNLeXj5WXOHaMQlq1bfzFJkRCiEtG/SYT8rX6BU
 HQ9HLRj1Mxs0tKnXPbsvwYnFHuJSgmew95/Kaa2GY+BICTc3WhEQ7WPJtCpOL8304GGc3gqVs05
 TTbcLs56h4L6Hw9zdDOxnWhJxsp1MSaiKb5sKg3r5RH8icLIbDzR/3dmwLCbguuFfYdrRa3HywZ
 ElJCFEKcarMxvfJrHWuk8hZUZNyDnZVGXR4WwvgYMAZFRNnihXeqb3dmJ9Rg/vnDtDBuCySf6n2
 AmLpKheflxqQlmybYXSMwlbsQ6igz9l5l4nDh66YHfvL6e8lLvvaTZmAFpw8nImuWe6xDawIib6
 OfKpv3
X-Received: by 2002:a05:6000:41e6:b0:465:7c2f:c09 with SMTP id
 ffacd0b85a97d-4657c2f0c7cmr10192744f8f.16.1781946633711; 
 Sat, 20 Jun 2026 02:10:33 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466643f4e3esm6122549f8f.8.2026.06.20.02.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:10:33 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Sat, 20 Jun 2026 11:10:33 +0200
Message-ID: <20260620091033.22057-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602202322.52208-1-thomas.perale@mind.be>
References: <20260602202322.52208-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781946634; x=1782551434; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ieQgch8wL2YUZRSi0Hz3NEVp6Gk8DZvb2Siqw6FW2Js=;
 b=cAqTaLVP79IKZoLMJezxVdigfvGsOuGSw9hJsgLb7W8pnmpxqAvTNz9+PLIMBSiYqP
 IfDLDIPzRSc4oZ48r2et2A+dW2vFWrn9ddLJaKuAGXNQhMP8YB04HdIpWsESLGbOKk9N
 J1tGyQ+eFKhEKYM7Fg3uEkSTN1Pxi5EXzKEKhyX6RJ5PPJgxgqGX/RNNYWPj1k2mUrRR
 f86KIxcZUWgSz9OzfKST3nrfA4DFWpt6wtTzThsjMZ1gbCMGK9LVSqVEEkiCU6C9Ut1S
 42tyng27jPlshrTWLbL8LpimviMu9vKfTJRcX1bWi+1fPCnDBF/3EGJ+K9ljtw5jZGw8
 H1uQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cAqTaLVP
Subject: Re: [Buildroot] [PATCH] package/ntp: ignore CVE-2015-7977
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
> The NVD database schema has the following entry
> 
> ```
> {
>   "vulnerable": true,
>   "criteria": "cpe:2.3:a:ntp:ntp:*:*:*:*:*:*:*:*",
>   "versionEndIncluding": "4.2.8",
> },
> ```
> 
> Which make every patch revision of the package ntp match to the
> CVE-2015-7977.
> 
> This commit ignore this entry.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  package/ntp/ntp.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
> index f481c5d79b..29770642a0 100644
> --- a/package/ntp/ntp.mk
> +++ b/package/ntp/ntp.mk
> @@ -25,6 +25,9 @@ NTP_CONF_OPTS = \
>  	--with-yielding-select=yes \
>  	--disable-local-libevent
>  
> +# NVD Entry incorrectly match on every patch revision. Fixed in 4.2.8p6.
> +NTP_IGNORE_CVES += CVE-2015-7977
> +
>  # 0002-ntp-syscalls-fallback.patch
>  NTP_AUTORECONF = YES
>  
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
