Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD942EB28E4
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B4D761197;
	Fri,  6 Feb 2026 08:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLt6daXQ7o9X; Fri,  6 Feb 2026 08:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7440161188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365495;
	bh=Y2tzy8NZ9TW1dUyUeh5K+UU3DeesgSzXxEnb2dzdfx8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CNXb9UgwjwiKCuMTAikTp8ft89Ux0ZJ/4F2dQYn0b1gotisIyP7tl0JYa+Uctsk7p
	 jFgk7Zbg8rMgr1fmPxpiloePAjkjpCSFhuYoXJV0nky3kuklMiyucbm8J0q3uK/+kT
	 b83XAsrzl+Xt1KYveBiylKoK7XZjFJ1qCMzZJJ2HNzfe4HblPcd1RloNVFPfcOMKz/
	 H5XmexQKPuQU0iNz7xepgZQE9HU1Q2MfF7Fq0gHUIf47mbxmtQ4GvjQ0t8nup98ZOv
	 5C2+fwIQGfkNS0G+n+pjELDQUi+LbBJgD3l9GxojZx/JG8gpu5uHfPSz9h9nITet8z
	 PXNcl8zdOJ/FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7440161188;
	Fri,  6 Feb 2026 08:11:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C16B7173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6D1C40844
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qeV-HztoMcgI for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D8E2407E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D8E2407E3
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D8E2407E3
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:29 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48327b8350dso545345e9.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365487; x=1770970287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8MPdWatrLtoL/yUzAvOXuzqaYr2IdN2gU5pV83xl32s=;
 b=CkKjlqyUXj92UPoqHgc/tBEt0eCSBQz3DDV8TwlcjFAc1nyRna7IM/aSZ2CptGlEL1
 7mD9TJtvWTKupgzo3ToDFlab0y1Sr+/5LmuoswNZwYMUhN+NgpE0GXi6CsipknZRfjJv
 eZASLOO3sKlU14LDEn/v1FDLNedSxT/o0vWL3fJijV95wZ6CXyT1vcRbFBQ3nkELkOGH
 dVfBjLVLK9T4Zn1khWv1dRxSUnAIhIqBBcYpVO3akmcLPmkDkvAS/wmam/i0Zuvfxhbn
 r1XdjTM5j8AEH0/apRgRB2AAdfc9xoUE4MD7nu04G4GldGTEWU+p3s234venvyURK76l
 rbDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAdbJDBORmkrbFTuETWJi4RkLEdA0R67N5q/Y9/pyhvblZmfi3cz2581nskBaH896tP7H9fQHy+ZE=@buildroot.org
X-Gm-Message-State: AOJu0Yx3300N4ZE7dn2OT7x8kNjbdsillT4HJQwM/1TdO5P0T/P3xH6c
 57Sah+sXIMfyYc1oFqfIYbJBlJHzfZ0QW8HCD25E9IsgWiDe36OpJN6xguioPJzGcOL/C3p1qVQ
 02X3v
X-Gm-Gg: AZuq6aIaSv+uOTo3uA9sX32PG6CTIimBJECMjf5Ao8tqqAmvJl/s4oawx8ztHKMWPBM
 zBpSKQXq1AUEePmWXgUkcUPXC1mkxTYtoRci/ga5OHq+XeszvKAwJT25BcT5Gu1z+SPRuNvzILT
 NyoPFwdsbOHiqeh65LyIuv3CEiNCsr20huErsAXC3gua6ZFMBDl1DwfQqbaXkJnDGyL8MPI6ckz
 nwDJvopLMhQrJLl9KwqWUb28rCt/N1VXO9066al9DnBQaj5Fk3pf24SUlmxEJg2sfQgbMesvZNC
 7AcUPtfAZSXFgrOswtCNIsO9cijPF1Im3CJ6tjXmenOuodYZ4YZyAJO6NL6mdpGj1GMZajzXu/z
 Iw/67qztjvRCcLY/tgnMpnjTrnrbfI6DTqkJI1SGg766KzA3F7xhuk+pEcDjgRW8BswM7k4jKxj
 PIxNw=
X-Received: by 2002:a05:600c:8506:b0:46e:49fb:4776 with SMTP id
 5b1f17b1804b1-483201e2d9cmr27146075e9.11.1770365487348; 
 Fri, 06 Feb 2026 00:11:27 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bd4a1sm4241779f8f.17.2026.02.06.00.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:27 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:26 +0100
Message-ID: <20260206081126.31537-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121110208.3355429-3-peter@korsgaard.com>
References: <20260121110208.3355429-3-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365487; x=1770970287; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8MPdWatrLtoL/yUzAvOXuzqaYr2IdN2gU5pV83xl32s=;
 b=DGwn4rr8zgcOZfy+/PK1YHxMZDbx/x6sAenBrbkh8eynG/+1C/lv05Bg1UThUmS9Oz
 vyvMUjLROA3zsdWomXnm7FMNwVqzhVk3GgFpcCSwj8kL+YJQ3S9yStfaQbsN9DjwzzzC
 yMsDeOUTRCdk1cfS7aFMgQ/P6kHLxIj8GgjFFOV12x+/k3IAKf3sSdngi21JMsWeEdSM
 QFDdvLR2Pq8ul2lU6O0pw7T3f6gH3KytYd8Za873gIvzUEI2lYSeMI6j1eZjokeW2cEY
 UZ7jCTkIW1mRGD4u6WkhWjC6u4g+TB1uncAal7bWfFKzOTRuywQlRKfDUZ0LCYu1kRbU
 aQhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DGwn4rr8
Subject: Re: [Buildroot] [PATCH 3/4] boot/grub2: fix 'targeting' typo
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
> Found by codespell.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.11.x. Thanks

> ---
>  boot/grub2/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
> index 3a50ec0ad7..8cd56cad00 100644
> --- a/boot/grub2/Config.in
> +++ b/boot/grub2/Config.in
> @@ -118,7 +118,7 @@ config BR2_TARGET_GRUB2_LOONGARCH64_EFI
>  	depends on BR2_loongarch64
>  	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
>  	help
> -	  Select this option if the platform you're targetting is a
> +	  Select this option if the platform you're targeting is a
>  	  64bit LoongArch platform and you want to boot Grub 2 as an EFI
>  	  application.
>  
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
