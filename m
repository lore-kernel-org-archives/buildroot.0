Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70261C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 359EF60B55;
	Fri, 31 Jul 2026 12:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vz1Pr7jffw7; Fri, 31 Jul 2026 12:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 140B260B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499546;
	bh=SwIW9WsJ3AO+D2tsQBgvXgTTCc6UsJAneK9H7YkTnZ4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H4aKASZZDtGNRN5C4+3p9RwQ69A8f9AosQIPz+pK/lCRIcL+WVDIzsVRgm5ISTcF9
	 dAYPSsIhmCrHGxF0oq0PFeBKi5HDBSQsXLLeprShIFn/EnWKTnpGLkSNwiCqH30sNx
	 y8ioAQ17u9b39iGgBsNvHM126GoyXJG4ty5Kgnp8EqyjPDpU0KOlAwwWj2yjXjDCsc
	 QBIGLuWYsnbRxq9MjjjVh/zgXcxRJNhLLxnTJGMIfCn+QQCpfWDFpBEhqE4aPvyUkF
	 trELixbcAwbioo0Y1+QwUxNjvD/upmPvteS2bwZDkiPWQFQkJVFLPmCiIoGxSUj47R
	 /ooOmRvakgocA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 140B260B4A;
	Fri, 31 Jul 2026 12:05:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E92E27C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24B7940467
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u4C2w-hnXz4G for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2402C40463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2402C40463
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2402C40463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47f904e80eeso816261f8f.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499539; x=1786104339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hUQFpKsOPCg2JzcUkkutOWZ5jUapWY++mSGHO/usXtM=;
 b=CoE/7dt1+ZQcDyERp0YxWv3KjAX0s68M+RQefC9M5/CixErwomdo52fn+2zVmYzRC5
 kO22pjlGXOspVRuDL64Eoj7nQoKbtT4CdxK4slDhMXsKn15ZkY2Y0S3Wdvzanm9V71JQ
 mxSn9U+C/WKyqMRad/OzLIBVeRaxTj2Svnoe0Paoy4cBDgRLZpGkMJyUVU6T+iphFmua
 HACJuhCSgGPr1I+coHkamfx+Hza6ofYw2YKWK4ZKBVDDjqV7l8XSG+AudO9ssgTnKQLL
 rRVr68j4Qzse7Xv9JTadMoRRxqUHuS8xFlt9FgsxmF3kVl5SR9o4QyBuboHYEmvspd33
 jYQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpc45nZizovI/oqy5f1/txErUlGiisYzApuLukPZNk8frWT6qXknxTRNBVnbf1LExUEF6h0aReR/MM=@buildroot.org
X-Gm-Message-State: AOJu0YwR9nNQh1PqGQMFLKzat0OUR/S4mUpmnf42kihveKuJG6z5jsOc
 ner9xXFSFDBVRa8DenRL/sEmwq1LNf3F62NyErnLr32Py31HFI5CONOCJKJq/Y9l/bc=
X-Gm-Gg: AR+sD12e1LBUomBZFxS+jX6ooZlFanSPVmcSJM7e13ut+TF0Z9eZ9Y/pH/EVpdsyVKo
 VKx66WN+9IuoBWaOkAMrAuuxouqIAaVxCRyctO21TNMIb58QOJAmV5TaXHX3eIzUGsDdv9HwHyn
 z23INLGDJ3Rjh6ZBqUXW3h3paHRm9/gHPqOzKrBlxR/2SQWQ4FJ4FAWtgv4GqCaiCwFZzMn1YTp
 PqWnFJMrkYu9g9lsQpov7rR/d0Ag1uPBbh0CngoXLPhl3JFum+XaCCg1ppBRTi8bU3X2EQptQMO
 /lbe6nqmiyrJhyPLwbl9oAo26U8KTXNVcoGJ/H2CM164SLJs8ta5Pi1kv+fWbJSG/prx7CKPNFg
 V+RixAaVafwXLz0+EGBrKWOvPfkXNDZ0Rb5FDnJ7K7F9vXYgZIIckgP65VRNArIhrZ7gNzH0Jgd
 i4dZVookLc/0HQ9LsiizygigwVvJMJGqKceB1gIi3BNDEjn/V9rPijqdwV3cHDm2LcyNb0nJfEp
 T6sWr1+UvnfaDDXwti09vv6kCXV2+XwlfiSSg==
X-Received: by 2002:a5d:5c89:0:b0:47f:97e9:fe60 with SMTP id
 ffacd0b85a97d-47fd2adc8c6mr4200649f8f.15.1785499539017; 
 Fri, 31 Jul 2026 05:05:39 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd4068fb7sm4678864f8f.0.2026.07.31.05.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:38 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:37 +0200
Message-ID: <20260731120537.3846-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722153224.624762-3-fiona.klute@gmx.de>
References: <20260722153224.624762-3-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499539; x=1786104339; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hUQFpKsOPCg2JzcUkkutOWZ5jUapWY++mSGHO/usXtM=;
 b=JCntoZ7HrxL67mInJnaK3e9d8AIKGasGMfCn089c/feL79uPDB2wQDFLuZkvGD6anp
 wYoME0vZbSL1a3ZqUg1+xysUkUR3bX/EIq3JAKQlTKoMzV18iQAQtFbvyXz9majz4oPb
 yv/XJ3GcX5YA8XiJFi8CFSYIpSKT1jkzqkd2mMAk7C8XLN/f8Bw8Ixtd5YW6n56GgHLl
 ZLQoIIcAIRZ34sroXtJnk/GFFv6aWNaNjJlzjd5A8ps51OHWHb6i9S5x+kWe9ZWUJxPn
 DjDDfm60d21KjZKv0UgaakTKxSH5zQpvNktG2PytnHvTICKmwyPHy2USKBVA25vlV8n/
 6xUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JCntoZ7H
Subject: Re: [Buildroot] [PATCH 3/7] package/ifupdown-scripts: add license
 info
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
> The package is part of Buildroot and thus under GPL-2.0-or-later
> unless stated otherwise, as described in COPYING.
> 
> Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
> index 5ef032142c..d7d5244ffc 100644
> --- a/package/ifupdown-scripts/ifupdown-scripts.mk
> +++ b/package/ifupdown-scripts/ifupdown-scripts.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +IFUPDOWN_SCRIPTS_LICENSE = GPL-2.0-or-later
> +
>  define IFUPDOWN_SCRIPTS_PREAMBLE
>  	echo "# interface file auto-generated by buildroot" \
>  		> $(TARGET_DIR)/etc/network/interfaces
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
