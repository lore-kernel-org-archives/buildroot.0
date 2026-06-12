Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81636CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 523CB6132B;
	Fri, 12 Jun 2026 11:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWINuZkIxicT; Fri, 12 Jun 2026 11:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1336961154
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264285;
	bh=UR80jNi0mJuUxm+0LZ+Erv07Jda90Wqaqm+7umhBI2A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rbXSBjMkFe/X1OkqtO78Le2sX7sNnsjXIx1RGVdMIC7c7u9qqcV0ruA4KdwUGO2ac
	 EgON1aMUWDVHyHu3vgmZZEzhb3vYTYTzWhqzdoptehJDNHUoyaxHYBs8I0JRRoZt60
	 gdxRm28K7uGR0wLLhviPpgXi+XGfVj9q2vNIDANoZTmpbXOKl+yu+LZdlqf3DGNEbi
	 r4kHP8yvTwIUwTFXcvWVRRs+wKxvAD71qr6c52BjbgjkoSYBqmuKPBoBz4vGyvhTtr
	 iQ/6/9J1WprbAFV2Ok5c/VZZO9sxVzh6oHaS8yQkAbfwtyst2l68iGgiUTzS7AWMmu
	 5ppt9htNO+ewA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1336961154;
	Fri, 12 Jun 2026 11:38:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF2B512F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94FBB6107C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0I4hq4R8XgyP for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A03660F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A03660F3E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A03660F3E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:58 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so6452895e9.2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264276; x=1781869076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G9e4MO65ax4XM7WYTF/am2yq7MEWiGPSzUMYNFZuLmA=;
 b=JYwPvY4hsbmqdRkneZg9GXz8iTMkfvZHLRbtzNSc/2o6hkAG8Z5s6SomDW5qW0fLix
 iIR4FXI1a1HUU5lddZuEqT39ntWewkDjr3syz2NQ0uHXOYKAhQnuXZTs72pk/UPezOXI
 BDdb4RRn2AF3koi6V3zdZyRGdjY8CSAzFo5d2uDjIR6IquuVMLPP6rXyPtnYpw5JG/K4
 jRLZ+1TFxOnT2JYNnmHyCAUnLl6srdtPi/YM+1S4Yhh0xVe9nDW3kK9nWg6LBcdDYjCc
 h9QT/ZHCN2d527DWg97ZKqhcM8IB0cefeMUEz9IEtQMaMho46gaoq1qBCSmS/q1R++1a
 /ctQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/bbUOlTECz84qfkQVReXlVewji638B5Gh56WDm5h8z89pkAi78caPUmEUU/7ATZmAM0C4QW9Chh7A=@buildroot.org
X-Gm-Message-State: AOJu0YxSzfJdSf9ibuxuU0kxt2JjH3yahjo5HKGB1ziPnDE3+lDa4+o6
 uXS0mtPq6knEydOkH14ei89iLc47Eekmx6xB7+Dt2wQlr47sCgMbiBRrxN5oTuCyHHo=
X-Gm-Gg: Acq92OE+wWyQ5mcTm1n0AAtZOCjpnf2YMdiS1POH7RZictIzTzGcEiqIoc5BudbHusw
 4kxbP8a2OuQKjePn+tgmcDp+MvHbZKAKOdtJMtn0Webiy74FFIdflwLky3oTdXZy6dctEBzDX4F
 n7rxLhaCObkbjueLF+568SmQoYCVn319hr0MBiw9SpIYj771zsUvPcTA21VGxk+V+J2SJfWWdCb
 t3FBrNQmCkZnwctQ86d4mcP8MxHuDARWwnE8YNmb8WwfN/7rFCFN9WpLKQCuF9/Q6Q7pzfcfwj6
 2eXPNZUqeKf8ZeVIRE0F6hKFQN+Ayc0IRlPpZZmY73hnRw+PWjyV1802r6sid3D5rGOUq9Det2L
 cgP7v3u0JXnf2mkLZgoVqczEZXmyaio1UZ/+oxpa2VhFZmI6fxLjdi9a6oodGDoOvCOm22niiSk
 cnI1BlDopiky2ewKY=
X-Received: by 2002:a05:600c:820c:b0:490:bb37:9d49 with SMTP id
 5b1f17b1804b1-490ec4d535amr29022275e9.11.1781264276369; 
 Fri, 12 Jun 2026 04:37:56 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263923sm5144311f8f.2.2026.06.12.04.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:55 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:55 +0200
Message-ID: <20260612113755.252388-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531194738.1379915-1-romain.naour@smile.fr>
References: <20260531194738.1379915-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264276; x=1781869076; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G9e4MO65ax4XM7WYTF/am2yq7MEWiGPSzUMYNFZuLmA=;
 b=DJgeO8EOQbAk4gvPjNpP1rhwEIL0gfcQK1EJjt/oqQNDcCVQWmXUl6TWStn+ZWyW4G
 OXYVCt+s4ReiXBM3DTFUvKdNd5XhpjzTdevNnc6NDT4FURk3IPPqBc0JiUkDQTTYguD3
 zRYki8BMQbEgOiNlk6pHkFQbM7jKGlFUOAlgjSFVgY4+fV6zZ6e+tEDljv8AyFy8oh7a
 AC3M06InnKuN2CA86LKtVbJWIXAa197Rbh8Z71maNaaHeAodklZQ61jgG9TUmzt5oBzi
 HAUGDWRGwueWuhGygsf9rrqAkmfoUwsmvqIwM8cDyNEqX2nqA4ZfYrXrRPIebPmBBHRE
 SsGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DJgeO8EO
Subject: Re: [Buildroot] [PATCH] support/testing: TestXfs: fix build on
 Gitlab runners
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
> Our CI uses "/builds/buildroot.org/buildroot" as build directory.
> Unlikely the xfsprogs build system misbehave when a directory in
> the path contain ".o".
> 
> While generating .ltdep, the sed command used to convert object file
> (.o) to libtool object(.lo) replace buildroot.org by buildroot.lorg.
> 
>   .ltdep: $(CFILES) $(HFILES)
>     $(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o,\1.lo,' > .ltdep
> 
> Building libfrog
>     [CC]     gen_crc32table
>     [GENERATE] crc32table.h
> gmake[4]: *** No rule to make target '/builds/buildroot.lorg/buildroot/test-output/TestXfs/host/include/urcu.h', needed by 'avl64.lo'.  Stop.
> 
> Update the sed command to avoid this effect.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335648
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .../0002-include-buildrules-fix-ltdep.patch   | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/xfsprogs/0002-include-buildrules-fix-ltdep.patch
> 
> diff --git a/package/xfsprogs/0002-include-buildrules-fix-ltdep.patch b/package/xfsprogs/0002-include-buildrules-fix-ltdep.patch
> new file mode 100644
> index 0000000000..f17dc51edb
> --- /dev/null
> +++ b/package/xfsprogs/0002-include-buildrules-fix-ltdep.patch
> @@ -0,0 +1,48 @@
> +From cddc06c0eef874c01293cdb6e60090771a347c56 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@smile.fr>
> +Date: Sun, 31 May 2026 21:08:09 +0200
> +Subject: [PATCH] include/buildrules: fix ltdep
> +
> +Our CI uses "/builds/buildroot.org/buildroot" as build directory.
> +Unlikely the xfsprogs build system misbehave when a directory in
> +the path contain ".o".
> +
> +While generating .ltdep, the sed command used to convert object file
> +(.o) to libtool object (.lo) replace buildroot.org by buildroot.lorg.
> +
> +  .ltdep: $(CFILES) $(HFILES)
> +    $(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o,\1.lo,' > .ltdep
> +
> +Building libfrog
> +    [CC]     gen_crc32table
> +    [GENERATE] crc32table.h
> +gmake[4]: *** No rule to make target '/builds/buildroot.lorg/buildroot/test-output/TestXfs/host/include/urcu.h', needed by 'avl64.lo'.  Stop.
> +
> +Update the sed command to avoid this effect.
> +
> +Upstream: https://lore.kernel.org/linux-xfs/20260531194553.1378795-1-romain.naour@smile.fr/T/#u
> +
> +Fixes:
> +https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335648
> +
> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
> +---
> + include/buildrules | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/buildrules b/include/buildrules
> +index 871e92db..3fabbe5a 100644
> +--- a/include/buildrules
> ++++ b/include/buildrules
> +@@ -140,7 +140,7 @@ rmltdep:
> + 	$(Q)rm -f .ltdep
> + 
> + .ltdep: $(CFILES) $(HFILES)
> +-	$(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o,\1.lo,' > .ltdep
> ++	$(Q)$(MAKEDEP) $(CFILES) | $(SED) -e 's,^\([^:]*\)\.o:,\1.lo:,' > .ltdep
> + 
> + depend: rmdep .dep
> + 
> +-- 
> +2.54.0
> +
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
