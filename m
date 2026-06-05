Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655B4CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33DCA41F7B;
	Fri,  5 Jun 2026 12:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0o-syI0vn1I; Fri,  5 Jun 2026 12:50:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70E3E41F65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663829;
	bh=IQ5ELe4zBtJhuifewJKTbWzOb3irDl/rnKfAZ6dtq1Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SrdtSA2h/yYXuEgVkond+q3CrJmDc61lOSU9Ev2ANP7kL3BMo4ZLp+5zAq1tEvAM1
	 3jiREPnDklK2jTMt1gwy1weAMSPypwC79l9j2rTXAVOXjORMMSm7yASlC5KIsZ+7YY
	 YHwhVyCbnpcE52eRbtjIknQ4eAwQfL9Z09HQbdJr8HCJs38D/jiJWcshJL3+ypm2/T
	 Ju0LidC4Un+xx65foIc52+nACm4iBMlt0u5AbWipz52eToEOztusUn7DowR41ROBrz
	 GBhTszkdFNDE/asD26FZfH+q0ecWdLiM8D5OYPkgFQFlsc9uX65U1UkCCXm1eZMJpc
	 0+pzUbeBOexuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70E3E41F65;
	Fri,  5 Jun 2026 12:50:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 381BCF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D1B640C8F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id io_a9Mhl4_Po for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:50:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DD5841F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DD5841F3E
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DD5841F3E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:50:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so1236900f8f.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663821; x=1781268621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LjY1YqFo3G+e0oxVlRbQV88jTS7x3FSx3eG16+IhYb4=;
 b=PBLSsE217GNyDzGYPsGtJLTdwKkKFx7s07Ttj8vPier+oXA5Wh8VfXL3Va4rnBaTlk
 w9rKN2l+6CIwcESKOui3vPFH6GfmPBpSN7q0cNFOVcvWitO1xvdSRmF0mbTCqANIpYGk
 U5qdZwh78JCrjs9oI1nCI7nImhrS5ifgl6PfnfqpDIBuQR9BnhgLQIO3B7Xd7eEHVax9
 YVYCm4cVHtx/iZ6QrGQsmQTBSCFIFiQrseRcWFMGlsLolgtocR9IF5+KQs97HJ3Kb9g7
 RkKM8TZF3/hTBowttayv4+Srk4487NI0Nb8cE5W1DohKykqAiFjTGTNxZ9g0TLHy12E5
 3mDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/F1jRIJk8jIIPUnKYlkvPy6PWNf8t4LpmHWu6sUJGrkl4Ww2h8InIdqhYZ40M6srjpQGZi85F1GAU=@buildroot.org
X-Gm-Message-State: AOJu0YzUeC3YtvLWWK9U6eGa5ZM1Ka2vnDCFCiuaHMFfsZbJlEtYySw9
 97784EaSRLPnQUzeOmMO4CKJ0CyrZl9jbRpVAKlY6Mc3cza4GhMVnU6jwvs2HYKmyE7rKuBgl1F
 9Ej8u
X-Gm-Gg: Acq92OHa9eGpq3lKRHhFaKpfzbmIt2v3utCCMEFgBnvx2CJle4ZeFnxjyxowt782kNW
 IZsg5fUjAOzMN7PO7mXWxlDzBqEjFTX9Ey2cfxYCfcqiSL2uWe0k9U+UuQh27La4wzks2nkxh2+
 oihbMDuckB5+hb0XtIR/kOMZmOb6p7jDAgTeFL/dm6nAhrkM5XYDcEh5jeBEt4PnTshdwpEuRAv
 BTtKw3uToiDWcsH5c3ddiVhPSAPYcQKzQlJKLNX625IniBNdaHLuQfpOBlj8lsurfrb9ZgpyOwO
 gjQaLNoKkBgQrotmjlx57JyL4w3pjqAquo8/HIWpdJsLbFJBvqmlzKUP5XzlkeWVvbno1lX6TdM
 caBSal8nvTUZTJ23G4UTKJHGovh65zeEis+6djZROF3YovG4pFPDovWTsnIFnhhmE+Dqc0oJZ/o
 QuELpqO+6p312Db5/XdJqoOCqD7A==
X-Received: by 2002:a05:6000:e52:b0:45e:a0ab:8bcb with SMTP id
 ffacd0b85a97d-460302e45f7mr4117192f8f.15.1780663820943; 
 Fri, 05 Jun 2026 05:50:20 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35133csm25191884f8f.25.2026.06.05.05.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:50:20 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:50:19 +0200
Message-ID: <20260605125019.273085-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260409081401.2060709-5-martin@strongswan.org>
References: <20260409081401.2060709-5-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663821; x=1781268621; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LjY1YqFo3G+e0oxVlRbQV88jTS7x3FSx3eG16+IhYb4=;
 b=R48HnNkvJM3G76xVO9qsGMau2AMGnkoLwl+sc4QzbOmzy3KswrcUhGirGvxMYnsnMn
 fswiQDZOi2GiQEMdfKi8X4pnSsSQItbMiidvKG3qWOIeH+LTf8SOyZUWKPyxKnRSgGYi
 hOvgNo/NzCLjdYZztkf06RehZg8GeJcmhH8EFbESuaU4DkxQtNvQti4RMmVAeqBJ7wKZ
 hP/9x5jp3R4PDRzijnFcqdnh2cyQrX0XQK3eGPim/Tvkaoj7nVsUMxScG3yrP9SfYcyz
 /VMPMDrT2rI69ZbSN1u3/FFIexgxx9mv3EQU6+vkso58NXxgLKL2D4GGXCflWE9AG4FC
 E//w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=R48HnNkv
Subject: Re: [Buildroot] [PATCH v4 4/6] package/pkg-utils: add 'hashes' to
 show-info
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
> Finding the hash file for a package is non-trivial, as they can be in a
> <version> sub-directory or under GLOBAL_PATCH_DIR. To allow other tools
> such as utils/generate-cyclonedx to find hash files, expose this information
> from show-info. If a package does not provide a hash file, create an
> empty hashes array.
> 
> Suggested-by: Thomas Perale <thomas.perale@mind.be>
> Signed-off-by: Martin Willi <martin@strongswan.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/pkg-utils.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 211e681e8f5c..17b0aa176045 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -197,6 +197,13 @@ define _json-info-pkg-details
>  		},
>  	)
>  	],
> +	"hashes": [
> +		$(call make-comma-list, \
> +			$(foreach hash,$(wildcard $($(1)_HASH_FILES)),
> +				$(call mk-json-str,$(hash)) \
> +			) \
> +		)
> +	],
>  	"patches": [
>  		$(foreach patch, \
>  			$(call pkg-patches-list,$(1)), \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
