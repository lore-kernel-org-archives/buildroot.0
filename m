Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E9910ED652
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D45A841718;
	Fri, 27 Mar 2026 10:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaNChf0UiM7a; Fri, 27 Mar 2026 10:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA98E4170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605751;
	bh=OqBIbwwlPWjP6/Z2+fVRw8dTXv9PG7zClqUhEcSF8wI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DcbQYlsPaubDuSdmvrHZqf4uID+ulBmjsJsQPbJ8+QDxV4aQBseb4Dqve4qY9ejc8
	 Kqb5lJitEtMoGxEyu3LctxUbvNn8Joqs91rKwlMnUcwFDFQ1ESK0LUTUf3jo+qCmOK
	 pb17wne6xUIGVlppXzU65HJy6+tZ9dg4I76EJttMcHIMblDv81Ce8C/vrZbVYJDo34
	 360BYdr0Zz+dYODdoAhCT5HONp6lGFejNoG9ZckeKvoMAWpPpy2uyMm3HUFpyn5sXU
	 jucY9XHT/oOiTlOTO+xrADcCX/38ZLAlODoT3aRESHWzqfjJ60E18bF5id7oTSEgju
	 VezAJ2xoRu8EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA98E4170F;
	Fri, 27 Mar 2026 10:02:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 603211D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45FA1613CC
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NM8dU_rfbjNf for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15096612BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15096612BD
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15096612BD
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:24 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43b40003d13so1345003f8f.2
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605743; x=1775210543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=95itZzGjyatefOMcAGlq7jB2bz9/4otXa2JTCNV80rg=;
 b=e4a3Bnaq0xJGkBg0YqN5Q7N8oH2VUZYh+FH/CNVfzSdxVqprF+Z6fj/0NOjbn/+xua
 6m+4rXnAQnJrJbtrWgdtVpHtgKxzCkFW0O51BbyF0C6KpiegJ+PfSRNjSf7dwXsUK0KL
 6c2sG1OpLop7q6GpkY6eT6Gh1JDKsrlwupuTxMR83JkXhcbFSEec+17ke/mOWl2kGTL6
 IHXz6ABJKw17RmWsp5ooFC9ZWT/WBsY0p37fnBgVmVUx+uK3v55J+PnVj4Kmv6uGplHc
 WsRJJroZMn8cbHSEHqdFYO1lHFLxVMVWnvyWwaikVLYvWS+MezRkU1PmoIGzcYt7NhbM
 pPVw==
X-Gm-Message-State: AOJu0YxSpnQ9xcFwt+lozlk79nDhTrsHNgiqOdHEvYgjE7NVlCfzecDx
 7IrQKeVz5YXSyFtBZHDdna0DCWaOMETDzIEpd3QmHZcA8B+hLwjF6AAsuubp0djhJ/MjboGWQSs
 cqQlDRi0=
X-Gm-Gg: ATEYQzxt30+/SdQUkn9Wm4EwSG5xGIbCmAnWv71KZSMTJ8T/hZ8G4NV7oPVc/kGd05Z
 wWNyJT5MOUWgRHN7YwL18qUimyXUgz/+xJ5+q4lEFmlUsC0ESQRLknDNZxSmgL9z8xcxhdkNKUL
 EAxno3zFwKmGi6kw9F0xIRVn0SqJEvdBGLBAwhUixBJg2ldnTwj9jcRZQAAPhAEMksWg6PQoxcg
 cm1AfALIgHqkG5pa7QLXiB1TwkQLykDeupHD0DJoUGZMqNrAlitypwABmREprZtgicY9ISULf37
 jUw/MpwA3xiCmfUCuhQCoRbmXj6XrjWYKTHhYPA86bXkdxY/k8GPDe21qtCO4S8AD1U/uM81/9t
 TSsHVwmzEgdRDQig6xULSWnpJ3NZWmsU5jOdEGcKTwlhVF5lQhEY3AegtLJQdq7P7QaaVPxyyow
 qffeuYqoEO+vZxRpV3
X-Received: by 2002:a05:6000:1ac9:b0:43b:3c27:238a with SMTP id
 ffacd0b85a97d-43b9e9d5cdbmr2831302f8f.8.1774605742743; 
 Fri, 27 Mar 2026 03:02:22 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b91942f24sm15027891f8f.11.2026.03.27.03.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:22 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:21 +0100
Message-ID: <20260327100221.45925-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316113716.208738-3-thomas.perale@mind.be>
References: <20260316113716.208738-3-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605743; x=1775210543; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=95itZzGjyatefOMcAGlq7jB2bz9/4otXa2JTCNV80rg=;
 b=S2/1Be0kA7xH2IlHpNFYsj/run8NLuOCkYqBNrvIkCkylnHL+PRho/ctYB7Hn1hhGY
 gU/azCYq/OVsiozGQtYugPK9EpBIVb0Bh+mwgSzwOGpou7QM2vPDLz2HHbXtS6B89hHJ
 nVa640/cpFv7EZERRvBCZqWtyMVpvE+x4fjpVcVeGaFq4Y7f/arvKMZiYPvreBGa2pqJ
 jkTVCpGEoc4wt5eKVFcfAMkzK96UMcWCnpYPrrP3PduJBRyeJPsFZDbFFTeukdEm5ivK
 3ZIXMBwXX3Jo3BhOCv4E0tNZcDba/TAjoosGsKdr55hVnP643hUzneFA4vAy82qYXTJ5
 f6dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S2/1Be0k
Subject: Re: [Buildroot] [2025.02.x,
 PATCH 3/3] package/wireshark: security bump to v4.2.14
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
> For more information on the version bump, see:
> 
> - https://www.wireshark.org/docs/relnotes/wireshark-4.2.14.html
> 
> Fixes the following vulnerability:
> 
> - CVE-2025-11626:
>     MONGO dissector infinite loop in Wireshark 4.4.0 to 4.4.9 and 4.2.0 to
>     4.2.13 allows denial of service
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-11626
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index f1f2f58442..521fea662c 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,6 +1,6 @@
> -# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.13.txt
> -sha1  e5a08396a98d5dfba4078c66677aacd50d47ec90  wireshark-4.2.13.tar.xz
> -sha256  2454aa650276264d23aca28e1b62eb5d4bd12b64aa261d38c06b33f97b8fa3dd  wireshark-4.2.13.tar.xz
> +# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.14.txt
> +sha1  e972062abc0d15db34c3a0186c39511efb29ea34  wireshark-4.2.14.tar.xz
> +sha256  098177f021951638f5bdca5b01f284c14fcc3f6c804f7aa2ca00fdcb99c7a166  wireshark-4.2.14.tar.xz
>  
>  # Locally calculated
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index bd81224ae7..3a92c4cfa4 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRESHARK_VERSION = 4.2.13
> +WIRESHARK_VERSION = 4.2.14
>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
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
