Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E967FC5AD49
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 11:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92AE381F78;
	Fri,  6 Jun 2025 11:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSgiogKriK6y; Fri,  6 Jun 2025 11:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A11081F8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A11081F8A;
	Fri,  6 Jun 2025 11:54:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D03DD3
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 11:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A2F540B11
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 11:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5FVOc5iQD4Ih for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 11:54:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D0B940AD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D0B940AD8
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D0B940AD8
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 11:54:23 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4e6a0c274so263627f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 04:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749210861; x=1749815661;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/s/DC/VP3SPCGzdpLWHlZ5pXFRFCZWohI+fnjlm8oE=;
 b=RWBBgu+HJEwpKNsJa165mFw6HjxrHb5UPDBghTlMW8bNwwi0bCuK3CRB0jWoCjEmwM
 clZE5s3Wta4go0ZAwos01RDG7Sb0iq9k/uqJOjfaPiG3OCdehXQ0xAdSz1LEf0CcNmGu
 4blzDJyowJDb/ActQUsg/a8CZukQKQIhUHYteP7IDlcmffdelsLWtB2OR6Qxcq3+wspa
 2TdTLYfLlHNS8akckEWv9nG/ElxYuGBsq122Was4w90U3RCjpyc+3KeKtcpfR0p8XdHW
 ww3RJD6yPPqkszLUjbF3f6MceM2sWjp6NzD5cCHTp/GBVnLbBztYo3Hrr3Bfn899UzLB
 ryUg==
X-Gm-Message-State: AOJu0Yya0x/Rb5JzsMKpBph2LmiVz6UmN8W1xJin8KeY1bLwtBXtLBaY
 jMVuW3Rk22Hc+ow4ylYwn2+DivLF006Sg8g9pDW0/BgY6B8fHY26P3u6
X-Gm-Gg: ASbGncvhUO6NIr+8h2Ff/6PzfkpfCHi4ZUhSsWcgfw0eoO3VlBIpA7U1lMWY7T9Bo89
 mYXamrPsZAD10E0sMCdKCo9c5y36im1GUYT+1hcVLfPl5EfliPMK2kAwOqKG0JtfrNw1lLZyAjn
 Sw41ZXD5QMidLqcDkXJ7UUKbhxKorV5J6ZECayEW9alBEyLCFbsbabI21Yx5PqoZNdbCicJZ3dO
 gyNj8oCUl1EYJMg1eoqOVN6eJHNC/mrAQsHSOReHzZcP3UCInF2aEiNDTW+IJlctH9LQlE9dETM
 6NhauN925PUaafr9Yo1jXC2GQOhUYrtX5lrUg9g=
X-Google-Smtp-Source: AGHT+IGWnqxIo5/PkvslzYhNkckx3JvVL9eUZntZSmD4vPcXr+3tz0m5lC/OQs0GtIfJRPLVa+0yUA==
X-Received: by 2002:a05:600c:c83:b0:439:a30f:2e49 with SMTP id
 5b1f17b1804b1-452014b3cdamr12169885e9.5.1749210860950; 
 Fri, 06 Jun 2025 04:54:20 -0700 (PDT)
Received: from skbuf ([86.127.125.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45209ce458bsm21531555e9.15.2025.06.06.04.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 04:54:19 -0700 (PDT)
Date: Fri, 6 Jun 2025 14:54:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: buildroot@buildroot.org, oss@ew.tq-group.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Jardin <vjardin@free.fr>
Message-ID: <20250606115417.sgvcmlwjz3vhg5hn@skbuf>
References: <21834b48ff096e427bdb722be447f4ea8a770135.1749133483.git.matthias.schiffer@tq-group.com>
 <f4d62d775a2fc76a6a2ad286675df03610e3ecbc.1749133483.git.matthias.schiffer@tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4d62d775a2fc76a6a2ad286675df03610e3ecbc.1749133483.git.matthias.schiffer@tq-group.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749210861; x=1749815661; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=m/s/DC/VP3SPCGzdpLWHlZ5pXFRFCZWohI+fnjlm8oE=;
 b=RqJ6stBO6EC7YexAXt3IpjIXIfwrGwDmp2YUTR1hVnik2q3qv8JW2HQhoh3VJNjwmj
 wh50414S1CubAnelMRVYx8ocn0fGnE3LBtjWwpavbrOdvnlEukpMgKXSZOOpoiOaAtDq
 JUiBQuHtTeMzPFLvusWC3ngGovV9/EoLtFj3McbbVPR5GqI3TNcfWIldsvgZXz2bpNRh
 sHT1Go/Xns/3zlSZ59+bq2bwF6LImFOn4cOQ2ssI7HxwmIydDWZq2G2v9w27+QsieQ2v
 rPVoXRDCl9RL0n9Yh+l6Gbll4hhsgApQdaSZ0kX4HEifyjPKAy/yzywOXPsh1X7ostIs
 0Rhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RqJ6stBO
Subject: Re: [Buildroot] [PATCH 2/2] package/qoriq-mc-utils: fix target
 install
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jun 05, 2025 at 04:32:41PM +0200, Matthias Schiffer wrote:
> - The check was referencing an incorrect variable name

Same thing, QORIQ_MC_UTILS_TARGET_INSTALL_PATH is a variable not present
in the original patch submission, and you are the first to notice that:
https://lore.kernel.org/buildroot/20250422233157.27a969d7@windsurf/

> - In the `$(QORIQ_MC_UTILS_DPC_FILES) $(QORIQ_MC_UTILS_DPL_FILES)` case,
>   the target directory needs to be created first

Fair point. Revisiting Thomas' comments, nobody seems to like the
hand-rolled $(foreach dtc) commands. And for good reason, they're kind
of fragile.

Vincent added upstream support for setting the SOURCES variable to point
to the Buildroot-provided DPL and DPC. We should transition to that
after this fixup patch is accepted - it seems more robust.
https://github.com/nxp-qoriq/mc-utils/commit/e551264b24dcc931a45db73ca4d2bd4d8a82becd

> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  package/qoriq-mc-utils/qoriq-mc-utils.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.mk b/package/qoriq-mc-utils/qoriq-mc-utils.mk
> index 29a0d3c560..63390ad6de 100644
> --- a/package/qoriq-mc-utils/qoriq-mc-utils.mk
> +++ b/package/qoriq-mc-utils/qoriq-mc-utils.mk
> @@ -16,11 +16,12 @@ QORIQ_MC_UTILS_DPL_FILES = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL_CUSTOM
>  QORIQ_MC_UTILS_DPL_INTREE = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE))
>  QORIQ_MC_UTILS_INSTALL_PATH = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH))
>  
> -ifeq ($(QORIQ_MC_UTILS_TARGET_INSTALL_PATH),)
> +ifeq ($(QORIQ_MC_UTILS_INSTALL_PATH),)
>  QORIQ_MC_UTILS_INSTALL_TARGET = NO
>  endif
>  
>  define QORIQ_MC_UTILS_INSTALL_FILES
> +	$(INSTALL) -d $(1)
>  	$(foreach file, $(QORIQ_MC_UTILS_DPC_FILES) $(QORIQ_MC_UTILS_DPL_FILES), \
>  		PATH=$(BR_PATH) dtc -I dts -O dtb $(file).dts -o $(1)/$(notdir $(file)).dtb
>  	)
> -- 
> 2.49.0
> 

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
