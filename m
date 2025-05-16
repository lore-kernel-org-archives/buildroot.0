Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A895C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 16:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E482783C4C;
	Fri, 16 May 2025 16:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWUBOkoayUNl; Fri, 16 May 2025 16:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21DDB83CFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21DDB83CFE;
	Fri, 16 May 2025 16:51:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F81D1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45B11400D2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0roK5KVP2zaI for <buildroot@buildroot.org>;
 Fri, 16 May 2025 16:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7ED04003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7ED04003A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7ED04003A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:51:23 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so26291225e9.3
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747414282; x=1748019082;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WN6iX1dQTU5aG2ojFZo7ieLi0jhHOBkMwa7fQT8zuFs=;
 b=hkacH2iAxdwBD5zbQoXsBXXT9IIKXT0sv1H+qaSDg0B2nRXvAmm11l5qoDiTaOHawr
 ZaA1BRsaM+iHzZY04ZohQsmq+A1HtsoQiAqrrAuGUVQ7369jVx4ybrfydlzX423fZxzr
 YTXh/FWW9lGQtgpGu97bBigxsTkLx1uaw2n3geVuj8BLm4I1YAFEsBRKBEtHh0mdk5y+
 Teuros9wKGRTCspacvKKJasKUsrkAEuEY4oMmIA9Q5a0dMPSH8ue8tHK1DFG4kt2iPrO
 n+OlkA7gQikmNh7DJFGw9Noof+lO4MtwXXLtmDaPIsGjgntb/HDqL/R7P8hP7IBrZg4e
 tfjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQaXbLUfz0Dc9SMN7cRB++om18cgEqoes18JV4BYprayyZwyEmeC3cUWzpp5gNKMnG6EoC71V6Gn4=@buildroot.org
X-Gm-Message-State: AOJu0Yy2pW/Sg7VxpDgPN3sDvFDCivfsyNF7LHEutJU1i/RNiJLmc4IY
 9j4JoT7L5drcJlgl3MZMRiQUjbir+WqG64QSztDb/57/BgCu/yZm5ObcNHAebNaNYpc43DzUFrz
 fLkfnyJo=
X-Gm-Gg: ASbGncvgAGfbRtvVv8xrHoWD/Iju2XyjCtWD9qh7DfFB56d8/BjBFNjZmkYwYbzCMca
 8tN5wq2aKTRyXcCJ3a4qs6gvgQrhUPqmIO13FCDMNvoB2zhl/qJ5miCZsrZvszu5xxipWbZvEiI
 PycAfoWVBH+cZs4eU5dFXzaJ9sMf6d9jC/SYCd2Cim0dJwhGNUq0xpPxwQQeNdnheTxcjHu9MwU
 AEphpjjHtbmj9X8L/5paEm6CL8FGhtKofaV9qVdKPSOx/m7XV4teWYODLKV/RFebxMjal2eczJL
 BtataOscTMM5VK4btPsGhDYoIClAsY5vQiTIU9BuKOeQZ9+4DWxkpMCN00K7fk7+99E48Dstw3x
 MLRaA7MzW9NVZZMsngh1ti3Xtm35cZaRj3l0=
X-Google-Smtp-Source: AGHT+IHeyZBEdfggUQry1mXbQe3OIl4ya6uFBkYKIP5hznDGZI/xE7DWPEpT3+IV5G4mibbF9t+UjQ==
X-Received: by 2002:a05:600c:154a:b0:43c:fcbc:9680 with SMTP id
 5b1f17b1804b1-442fd664848mr35104815e9.25.1747414282001; 
 Fri, 16 May 2025 09:51:22 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a3631c728esm1766237f8f.60.2025.05.16.09.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 09:51:21 -0700 (PDT)
Message-ID: <442fb76e-43e5-4a33-a6ad-edc6a752f583@mind.be>
Date: Fri, 16 May 2025 18:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250505160327.3422096-1-fiona.klute@gmx.de>
 <20250505160327.3422096-3-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20250505160327.3422096-3-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747414282; x=1748019082; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WN6iX1dQTU5aG2ojFZo7ieLi0jhHOBkMwa7fQT8zuFs=;
 b=D6KX0r2Fyo8CufpQfIoYlX+a8rR4r8JG01rxvQ5kYCQCfmSXxAP9Ry2lOLrGP7QUha
 EKu+qyQcR4ivMdsi9080UuAXNvSN+8Iu+ON+4hbAY8obbK8UMAytm3+yco/PA983oWww
 bTD9EBnea4XSmmhl5bhEclL4xadk/83C7156J1RBlEnFok6SwSWUPDPEX0X1eZ4h1bz9
 7WS5bBjDEw3vkK5g9CwDA3ApoZRSWR+yYIMOYENwPunWPOzdrKS3G5LpxTo9/fhkh7HM
 v/c2n7HGCYZkT/J6kDqGYGkxftQqI3QdDdBFIdg8h0hxi1WNmfMu8sngFpgk/eg68eq2
 JR/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=D6KX0r2F
Subject: Re: [Buildroot] [PATCH 2/3] package/pkg-utils.mk: include package
 directory in show-info output
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On 5/05/25 18:03, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> The new package_dir element contains the path of the package
> directory. For Buildroot packages this is a path relative to the main
> Buildroot directory, for packages from external trees an absolute
> path.
>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   package/pkg-utils.mk | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 0266f66b42..288a202230 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -120,6 +120,7 @@ define _json-info-pkg
>   		"virtual": false$(comma)
>   		$(call _json-info-pkg-details,$(1)) \
>   	)
> +	"package_dir": $(call mk-json-str,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR))),
>   	"stamp_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
>   	"source_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
>   	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
