Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58523FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B33429AA;
	Fri, 24 Apr 2026 16:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-9wkEx9bgyV; Fri, 24 Apr 2026 16:27:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CBFC4296C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048055;
	bh=1LGhQ0JTixFfW+U33HHOalAa1uZHkGyxZY/DrmV6EWI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G+D/EVdlFkuDwye0aU784yjzq+0AZJ3g2F7VumXyB8zppURhdqsQhUl27BhcZk6EJ
	 e5FQk0Z4M55zlnikonD4/kd0mDZA9MQDTX0mEPmGI7aYsdJVyDk0HOWDvIZoPyf/1h
	 Kl7wP0p0i6V1ODSgkFijwl75RClslB7WHDUO1ZamunA1HxdJu4VyqOej1gS5mtxi8U
	 duwR1Mk/hzLYmzMskxsyzMPwMnN5Xh/WWIXd3Xb4JGq0Q97roIyIgdPbSdfAKXd6Wl
	 tp7EK+7V5r/LuJRuRu5iSLO3ukJ/yTndEimA4ZYMauPOk0O0Zo3RtnP44QnJDK87mc
	 /gvvv2tghPyDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CBFC4296C;
	Fri, 24 Apr 2026 16:27:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F215194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5C8484E9B
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOjc2G_kVf-Y for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD26584E9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD26584E9D
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD26584E9D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:26 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43cff5dafc3so6457536f8f.1
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048045; x=1777652845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mlyyP5SHuBXCi9iwQIybfH92A079+skrjTrF4oiOVFc=;
 b=DlALRBbzenxJE9zBgl66tP1I+jd5vC1aNYvMOuAuyyAAvYAhE/+NbGAr2PBPwULfdL
 asd+fSbh8xA1JqguG28nkB+YnOfClc4WSW2G5RGAZt9TGny5JYVwG50IK1KIDEPpeae6
 x+cHKx0X6Kbq24kLy2ECxz28vam4I95zap4pJ3OGhCfUmd3Lw+ROjES6seI/CTuE7nR7
 U5ubhZzDic8o0uoNOMremkDpwAkpmxRqVRSIWqywB0ep3+l/3IbmMTrYn1uVdjIgHFhF
 tMXjkgTsq8QIhQeIZcMrP/uP9AvItwJBwkmWLZuDdn7Cn8YQ6BXlf+lM2pHJTJwdWE63
 AmcQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Z4G01+50POFiXeV2Q6Nj1q9zkCM3S9lrf/vbZRXUK81p4tih6/8oGf7660ZtIxICdeR9SWBERpHQ=@buildroot.org
X-Gm-Message-State: AOJu0YzcvuI85X5Cl50C97KO5TKhWAQNchiTAjkIxt3KGUovckUNi9EB
 VKcxCgOAKQ4oHewCCxI/0q7+liJKZ+Plxs4qUvE6iDR9f1Gu4/FqQxzZZ2urGQa/6zA=
X-Gm-Gg: AeBDieurNBEkW/6od5PTyp9zzbS5i2aSOT7lnM97WDoixNQGkx/ujhzvTQ6puAlv7Xw
 dbg3WXCothgQ5ABhVUmrBtqqHaiRtuvbTKui8nB1wT4uEUrZBMm90+C3162//SE0JjFhcnADFVA
 H8JyEejlK41UO4u+2HQXTEM4zhNdtiO6aNfd4O9NBXcxkxGK0qvk5Ob2Ym6UkXfW7XB900fbXPV
 cFjPaFWrZ5gYgc6yAHFAaFPMHdrwX9+Uu7r5CmB+t5bFI4SFFNb8ruEwMzMtRp7pILBfra47m0d
 s3sS5+ZybFtBHiV+hRKl0tOmTSdyjGt3cLtFWWUumHPcJgCp8Tu+lWDYVThK1kDJOK5TUg+BYVf
 vSZBOL8rNU5eGeycG/vs2qG7gYXT+PxY3ZHCjb+MRGuIikxXkIWuaN90Evh8kqU9GDCy5eTd0fX
 qhsxnL5qeEMoRpqigOd61NLRVDYA==
X-Received: by 2002:a05:6000:2303:b0:43d:795d:5dda with SMTP id
 ffacd0b85a97d-43fe3dc84a5mr48802919f8f.2.1777048044648; 
 Fri, 24 Apr 2026 09:27:24 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4d5b1sm64893403f8f.30.2026.04.24.09.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:24 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:24 +0200
Message-ID: <20260424162724.162119-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260416073638.3605579-1-bernd@kuhls.net>
References: <20260416073638.3605579-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048045; x=1777652845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mlyyP5SHuBXCi9iwQIybfH92A079+skrjTrF4oiOVFc=;
 b=COzt33EoivxPZtGiFUc+h4We8Lo6JLzOKiMRC/M7qFNSEWpYo6VF3MG+D8/CFA1250
 gpZ+IpqbLfCjYjffYbU9mA7wlPv2gyLUwsKhzpnYSEP+W3VdKZzMsUtKriWQKgDE6Exg
 3x7KK+Vl4Qql4RdMtC5es0lVQXjfnxR7pPL/9pc0KX3/YOY/TcrnfS/NjA1U3Jy1L0l7
 8QkUX1XiQXjbHcO29T2wI8As/n4HRsCQDEdwo1qgKbccMAiKfaNgD0CLEL/72/GvpJVa
 BoxkIBJo2u23/nv7vR3Riqhs22xvhK9YE5zqOJqSlonlReN3QvedlA7oVQA/UUvkv+Wz
 ofLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=COzt33Eo
Subject: Re: [Buildroot] [PATCH 1/1] package/libexif: security bump to
 version 0.6.26
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
> https://github.com/libexif/libexif/blob/v0.6.26/NEWS
> 
> * Security issues fixed:
>   * CVE-2026-40386: An unsigned integer underflow in Fuji and Olympus
>     makernote handling
>   * CVE-2026-40385: An unsigned integer overflow on 32bit systems in
>     Nikon makernote handling
>   * CVE-2026-32775: A buffer overwrite via integer underflow in makernote
>     handling
> 
> Switched to xz tarball and tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libexif/libexif.hash | 3 ++-
>  package/libexif/libexif.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
> index 9e95e27f3e..5949bfb36c 100644
> --- a/package/libexif/libexif.hash
> +++ b/package/libexif/libexif.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/libexif/libexif/releases/tag/v0.6.26
> +sha256  4a055ed6575e61ca46c3172be3c753cc16c9becd0f99ec71d58dd0e471476c0c  libexif-0.6.26.tar.xz
>  # Locally computed:
> -sha256  7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307  libexif-0.6.25.tar.bz2
>  sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
> diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
> index 0e50d78fbe..f434f9a922 100644
> --- a/package/libexif/libexif.mk
> +++ b/package/libexif/libexif.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LIBEXIF_VERSION = 0.6.25
> -LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
> +LIBEXIF_VERSION = 0.6.26
> +LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.xz
>  LIBEXIF_SITE = \
>  	https://github.com/libexif/libexif/releases/download/v$(LIBEXIF_VERSION)
>  LIBEXIF_INSTALL_STAGING = YES
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
