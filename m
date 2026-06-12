Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB9ECD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FFC0412A7;
	Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEg-Mm3elUXW; Fri, 12 Jun 2026 11:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A735D412A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264291;
	bh=IaEnUQORrD0gkj+8aIi62CTMzkyZAGIMrrkSxE7WTb8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XRFaBmHu6VUJaV7ev89V2PcXTkoDDrWBlk1mR3kUe2OkSgQjhsFe5emEG4wBDSQ6M
	 3X6vnuiNPuRqyuuSsQ4xW8eTBSlkPODHBmio5KwKRt/rDtV5mDRlvs2qkFDRQ8XDHd
	 e/rWfHoFc59CHe7bLKOYVi1ZuWrR3j7VO5W+0WzV2OuK8sz8PtmYJqBfVeykb032ad
	 IzPR1JUwJrtK5Vo/cmriSOpCSkqJBz5gvG1ZzXAMLW5xADA2636RPNSNrkMTs2ELwt
	 gYpKsD36YeSNtzz/LTz2KVtC7pkc0nXynpsSKoON2otDFoIzYqAJ2Ow+EKHWcA98Fh
	 c1bnoLmCFT5Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A735D412A8;
	Fri, 12 Jun 2026 11:38:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E8C1C237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A66344128A
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQoNZJRJMKj8 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DCEF41253
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DCEF41253
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DCEF41253
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-490b7866869so8440685e9.2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264281; x=1781869081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ovJWi59hpXpMAGkYMtfOQSqLWAvDzd1hjxuD2UYMcd8=;
 b=r08+jyQRrblBGsFklHC7+l+fW49AekcWpc7aSiIg7VLjg+SzR2dL5+E+b8GtnGHI64
 BH3+rSo0mQAzuejFPPnbAnMpnaRIrfFzrxeSUrHCL2MQPC6/7VljFvqNwQ8C1EnShxIh
 fVBDh+IcY30Xy6km8864D4cG0P/jn5UBBWVS0JpyyjN8f9kUTOOSJS/GGhZj2PzzB0y/
 gtfQH4b3v7oQ7gESj+gzidLGi9Xqf74YuMmDWONMX0QULUDHh/m/YbzFwj/rUzWOaB9G
 F8dGgFplO4FvbZmgC6v4h8O1Jn1LoTh1RH9+/SbBgqleI24fR9OCOMogeEwoyTFMY4vL
 uh+w==
X-Gm-Message-State: AOJu0Yy3wcmvXOUuDLmqopmDkKyxnm792/U4B6W8UWczwq+XOc99idpN
 FLhKaR3eJogX0qtECfdstA4wm7KpffvsZ9HiDpJ/e2vVRndx2ZstVzEhQl5zFo6SvcM=
X-Gm-Gg: Acq92OFb9z8HOT2YCimjSAyLifoc87nWtEjNkU1Q3479znXU3uA6aG6CZZSkxzJWUdM
 Ss62Hk9BFO4e9PaTrVOYIVDUinD7Zgpn13RINfV8vKtC1GVLj8LznBPei7L6/LWGENHUA0Cnm/9
 3k7da2g4t0ghDpgtoVFmE66y7Du6vkT3ZnLHMfeCmk0egaXiS7JR2jilAR6DRBYqoM60Ej5q/dx
 xLh8uyIKAr2JU/E12s+/Og4DXinxjGU0UmzrXOj8KxMdOs31kdBrILAK+lyzUnrqkDhOVkKN9Qd
 9SazqOedBNWNkj9j5Nb0wY576/qsj4qqPM7pDsSbQVEtfwOZ3SqiXR3NToIRzlQPs81+tjpZ5OU
 YClqFrCaaAairPxOjusY2vjepmEL0Kl2Gnl2BteOKuwmeAbUMldDzglEFFnibp0+unyggDF470Z
 sj/pXhEGMydC3Aa8s=
X-Received: by 2002:a05:600c:4693:b0:490:cdb2:fb5e with SMTP id
 5b1f17b1804b1-490ec504d88mr36262015e9.22.1781264281464; 
 Fri, 12 Jun 2026 04:38:01 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4b2e8esm44022705e9.0.2026.06.12.04.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:00 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:00 +0200
Message-ID: <20260612113800.252688-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601094157.118235-1-thomas.perale@mind.be>
References: <20260601094157.118235-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264281; x=1781869081; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovJWi59hpXpMAGkYMtfOQSqLWAvDzd1hjxuD2UYMcd8=;
 b=VQ4EpEQXVIPYKLfUrkF21RDxgaoUakOFLm22sVZjDbU5IrGPPWAJXFID4EOfJ/+NsS
 7zOlC37Ds0YICjNeHoWYkjz+WRjXCbeSiVd4idaSN9JiOof2rkfWEC0CAgFkfJDsi4tM
 Yl2qGDvsMHEVmNWPZdV12DKk0JVP+P42XnxOZ4O2vimdEMBJFXipeUCJXBUg9eWTL0KX
 9YZrdoovCyvnB1tlrzwgv86KqpdL05bG9yExIjaL4XqqXtvnr1Ih00HY2WI2yNpxVfPG
 CjEN72Y9Jb79JiVJZsoayEsgHKEdXcP87HqbewHcWSpof6GwLyBCiA6M/LRePlKlifmR
 VxPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VQ4EpEQX
Subject: Re: [Buildroot] [PATCH 1/1] utils/generate-cyclonedx: fix hash_file
 location
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
> The 'show-info' output always the location relative to the Buildroot
> root directory.
> When running 'generate-cyclonedx' outside of the Buildroot root
> directory the hash file locations are not correct. Only using the
> 'hash_file' variable coming from 'show-info' doesn't guarantee the
> script to succeed.
> 
> Use the 'brpath' variable to correctly reference the absolute path.
> 
> Fixes: 1791b79422 utils/generate-cyclonedx: add hashes from .hash files to externalReferences
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  utils/generate-cyclonedx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 11edc05d80..bade018cd4 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -302,7 +302,7 @@ def cyclonedx_source_hashes(comp, source):
>  
>      hashes = []
>      for hash_file in comp.get("hashes", []):
> -        with Path(hash_file).open() as f:
> +        with (brpath / hash_file).open() as f:
>              for line in f:
>                  line = line.strip()
>                  if not line.startswith("#") and line.endswith(f" {source}"):
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
