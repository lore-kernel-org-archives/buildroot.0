Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614E1CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 348FD40984;
	Sat, 10 Oct 2026 09:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OC4p4jskyEI; Sat, 10 Oct 2026 09:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2AF5440979
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624160;
	b=gitsB7oWQtpyXpC8fm1I1VtnII/zqktm1r7zqdJqYi568JuWxApMXQiCroBDQEUbYbit
	 Jibm505wt/WpaUk5z+rIqCFl2OLJrCG0na8Th8KMol+B5w1HyA4Qyiaati7+aGo8l5Sf+
	 BcXDEDn06YGp40Cbcv/uadHs2rrwy6nAvh6s61GSYt51NGfJYxUe2o3pGVWGwxUn5ngZp
	 NjrOTNC6VoCrziYwvc7661zoelUaQcTvNJdqEbJZaFIx2cKX0UEH8I4+hKitxAycE/0JW
	 5RGFvDZXr3TGQccMY/Wlg8wSJ2bIrjvPZvOUlLibeTJz22vqFOKHzHFDx4qF/CC195g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZR8sHp/CQ3MnGwh56Fml50uwF5lRuncq75U6J5y8WcI=;
	b=sowKH1mmmVkpx8F0NCvZawSEmIIcYqm0EEqFXRIH1le7RBBwwuxkmKScI7F80cySaaoz
	 JbjBy1qv7KUa/c0RO+7BoJ2B2FUx+eP9tqzpyVG+TJm2hVXDPmrfL6oVctERc+cV+5cwC
	 FJB8g7O9l7JA9tOSOSWs4lk52OUCtLjbf6fJPiWwJ2PAnH44Hl/viAvCXKKQ7ynCRfsFo
	 bwMW5NKLqIWUavubkZk++nl4VCypsI2sDBOMRZzR0Max/nKt2rwmjIn/EzKK8ddFbPdn2
	 59Be8RKexgAEm1HEwZEVAj8WsEQUBtyXaFQb93yUF9df+oQ164ab+rN1GHMAcrUBLPA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624160;
	bh=ZR8sHp/CQ3MnGwh56Fml50uwF5lRuncq75U6J5y8WcI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ki33v6yRGQUdQONncCn78OzZSQg/aslJnXAvDxU8rV/PA3uo+8C5gT1/OQcy/HXwE
	 N7UxIIllckKac0/uYv9UZrEZecN4f6MfFv494g3SFZAQjkQs1t5LZXlbkmo54jMXoA
	 pqWiPdFbU11OVDrNbA175t52lJU9d9Oere7GUilNyH7dRDObUNFRDT9zsEqgf/7+EJ
	 IELLJUH48UHoKGK3zEypkNFwIy1S6WxigeszCaR3dmWcKWcUmuvKYhdEv3Ttms37Gj
	 xth9jczJBEKVaC0tsL7d/lHr8InoSkDNN6O2I75VIY94cepXjhUxUFlMYU9Mzkzac5
	 +2Ptx6c3r04Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF5440979;
	Sat, 10 Oct 2026 09:22:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49346356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EE4480E3A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cve8JD9Dkw7U for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:22:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 18A008100F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624144;
 b=h6LlhqHgASOpzvdBaSpNKrF1Ykxu22mtf7AH7WKTxKy8DrwRBFIFTgZY/4qYfiGLxrCn
 FEopCFLyx54VevBpVbPbFf2HtYH/gTqUIcAbMGN4hiLA5kKgMSekocuIL/6QenyVtsYMF
 oFGAPShMDrmQTetWcjpd3rWlutHbv6Q3Rphg6/DOOfVDJJRlD6kX16aSLdKcypNjSq3Uc
 3kDYrdNTheVr+5jNMowBlvG1pXwJ3jHKb+nwZkOqzvlTLo9L1g5Y6+gmzICAqNEtOPnEQ
 Dbdni6Rs1PCJgNNzBQK5zQBx02hr2w6Dqs8i5u7IqVw4TUgZ0FpTXbS2mOhNJeDQnuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624144;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=9+wl2f0IqPPawOuF3qQP0caaZ6+1Ri7FHVtg6umsizU=;
 b=dhBPZXRWaOEmhHmZjq7qSA9H9Qa2UCNvza9MQJSofa8/bloBr2GlAdwx3RY4hlug0JlU
 5RbVRqnmVo6TX5p7UfRMlcwwklw4Wb55XxVcClPdfRV05A9PXtaPyzq0UcgcWLUhaRay0
 9kLCB/U/ANpt1SFNBlKRNQMnhfGUFIBTRpxVoji+OGu9hT6tsY5i8GOi5C1kgVXL0HFTU
 /d/cdS4G4yf+B9yCNBQbZbhUJ0NlJX5FgFRLcIvcLbNYbBRMyLpjK8s1RHdOeTFo1gzGA
 zqLWYeBM7nurCCVS1jB3W4oPTZmAkhT4LWUurlX4xuwMrJXP2znoSovaQeyGyodOlIg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="EWZn/X2l"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18A008100F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:20 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a018dc1f98so3906625e9.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624138; x=1792228938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9+wl2f0IqPPawOuF3qQP0caaZ6+1Ri7FHVtg6umsizU=;
 b=MB8W/KSNJxTMsAqGGn+pnzColk/oQp5krd91InA/4f6BWvkZVXxn7QBLbSZ6Dlv00h
 FxxnTd7kyLux3kVMCvxuaPIPamWEc0ckgYnEsXd1v5soVY2kuQvwBc/q8NM3AOc2QZ0w
 46Xnv2syrhtIxc7mmEEU61v+7WAChDuxExrzrvqqf7xhPV7cldbqH/v2VTwqGcHdwZgv
 H6LYsc0zOSbOgov/aliyL9V7dgWHWV8kd9Bgg59rWY9q9c+lnDqBkb9UHK/aaMYQmrMJ
 JSrl92XzgHUJpk6S+5aXor7PAAkIweHKR8MExU1i8a3VeM4PqHoQxUu8Sc3cnRMOvEdC
 axDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzSne8vvHBGX09XMnRD13K/ZnhM3D9yI+hW2V9qzqtLb4YxNjq9J8G8dfCi+F4fvI4MKxLFrJN9PMI=@buildroot.org
X-Gm-Message-State: AFq9FYIwqekwsjCLrA0YW+PpovGVNB3rStXchuBa2FKPTQqMw14XRErG
 2RRDbrdwCO2JJ6hf5wit6Wace6H/D+qdqyDtlKFJVclD6r1C1eGT493eKVMZehyOutg=
X-Gm-Gg: AYBFou3s6Wmbx4k2k12A8wUY44quDJSaoVGmxTTxmpMYTI8IWU+PC1jLNDT0wCdaGjv
 YRQoxzGpqzKfTqXrsnk4XbEmcWcV62e9RrlkpdAhhDh0mpnFQ+fzqsJrdCcYwjtmHGJnEVplmb/
 Q7PbL+jv75JepO53060h4BX7DMV+W0s8cwGWWh432nMBN/QXCLoh7XqXwDKDFzEw+X2rrmDmLnN
 cDCA2vlTH7aj5qdMCpY7cIuSvMj8B8QlVb/6muFCUsgoaRRYGNsGKoPoWDMzFB+vj6nULHDajyd
 FK67C5/ysxdw8wppQR3kAJGTjhESfnp8R3LRCBv/TVPt0ZBDCkadAOu8qS6KlIlhiXJu8IPRpet
 pc7SKBgPXeO38Eg8W8H/mf5XAi4KXQ/uKMn03ACTqb7cqOmXrIHxQZaaMT9t1EHPubjUEHmaLL/
 mOd4KA0wfXWGnRc7Bfoiw89P3AmT52J/nJH33CyoyGrEfPeNdagnnLcUbq3UwpVxaujEN+CkOQ6
 8fxFU4+To+VvKZgNN81pm3KH08tUNfnWvA+Io9ZQ5Bt4zvc7K8p3PYFt7vSQOMCz3Y=
X-Received: by 2002:a05:600c:4e8a:b0:4a1:78dd:dd28 with SMTP id
 5b1f17b1804b1-4a18e4d2b31mr90208645e9.27.1791624138610; 
 Sat, 10 Oct 2026 02:22:18 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18beacd2csm131179485e9.14.2026.10.10.02.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:22:18 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:17 +0200
Message-ID: <20261010092217.138299-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20251216194119.3020421-12-bernd@kuhls.net>
References: <20251216194119.3020421-12-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 12/26] package/python-twisted: bump version
 to 25.5.0
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
> https://github.com/twisted/twisted/blob/twisted-25.5.0/NEWS.rst
> 
> Updated license hash due to copyright year bump:
> https://github.com/twisted/twisted/commit/662f2a9b0563cd7a0f6acf0ed92891ae2cd7e1f3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/python-twisted/python-twisted.hash | 6 +++---
>  package/python-twisted/python-twisted.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
> index 436f4c48a7..f3cf53bcaa 100644
> --- a/package/python-twisted/python-twisted.hash
> +++ b/package/python-twisted/python-twisted.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/twisted/json
> -md5  a21b5326a74079a92d7bc4748b419280  twisted-24.11.0.tar.gz
> -sha256  695d0556d5ec579dcc464d2856b634880ed1319f45b10d19043f2b57eb0115b5  twisted-24.11.0.tar.gz
> +md5  845d6782c2236ef764f3849948f4bfad  twisted-25.5.0.tar.gz
> +sha256  1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316  twisted-25.5.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256  78d059391dddba18a695c1998ac9dde68160a1df1635f34adcfb3ecba4564802  LICENSE
> +sha256  16b7f6825ee8aaed193e7fcfaee67ab493087302c700483f8991f22b70c539e1  LICENSE
> diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
> index b7217da6e4..8db5d3750c 100644
> --- a/package/python-twisted/python-twisted.mk
> +++ b/package/python-twisted/python-twisted.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_TWISTED_VERSION = 24.11.0
> +PYTHON_TWISTED_VERSION = 25.5.0
>  PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
> -PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/77/1c/e07af0df31229250ab58a943077e4adbd5e227d9f2ac826920416b3e5fa2
> +PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/13/0f/82716ed849bf7ea4984c21385597c949944f0f9b428b5710f79d0afc084d
>  PYTHON_TWISTED_SETUP_TYPE = hatch
>  PYTHON_TWISTED_LICENSE = MIT
>  PYTHON_TWISTED_LICENSE_FILES = LICENSE
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
