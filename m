Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6DFC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 068AD60DDA;
	Fri, 25 Sep 2026 14:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2SbzV_7NIyx; Fri, 25 Sep 2026 14:44:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 27D6060D8F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347481;
	b=s/4WB17zg71XzrCgGGaDu65E/X5CrmwAyrmGD1o0lIAtOc/SCeQk/NbJ+XFDKiDZkI40
	 zU2WRqpgmEXvGXt6b6djW3KCf6U31nNRlZsn42Roahxh/Mj7TFkokIf98DmkmSboGPrRj
	 ajKcfOPdS9CPJp1Ha/DFgbQXHMYkemwWe+8ZZo4mjU4j4qNLGfPRbPKPhhto/J9Pk//CK
	 qgDWzZwXrMDNwpGulXTHsVSw1fdgesMNPQyi6cjsut+i/E1AWdTny3OuxLLsFM+tZ1qOz
	 k7DRB3dAiN6v0CjfP9LTg+KnF0zDukUdNPbqxRF5GtPdFBKxUGxUoJHkjG7pietNIcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rhLJNZNhSAiUWADX+v6l8v/ZdwK1sicjoHL0mr4ed2M=;
	b=pynvfolG5ZfFd20nqXwz2At5Sw04h3WRqfTEJjsbR2PctReal9uTaCWxHYlEaefub8kt
	 oARMxpGkDMVOAaxVgCB3wIJd4Ei1GhTeDUboyCd5jCO2N5PhaRD+Q7FxQK8qwfvQwE6fa
	 kV6FHzHPzteclz+lbXafCVggcMYw3QEnAprjUdL2ZUrn9cdPkGFoqqS6dPUSPU1r730p8
	 +D92A7L7DzNZ9NS1AoR8hICcuq1B2seZeA+q7+TqMg3GxnpqZ404grrPLK0D4oPWwLMCO
	 bZlYadJhnxBQzjBrUfNozHrj4TctDgkGiXFfKK/lxGcYvDiZip4Yeav99K4d5XPClGQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347481;
	bh=rhLJNZNhSAiUWADX+v6l8v/ZdwK1sicjoHL0mr4ed2M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jRq2Fl+4Wj81aGn1MJuAc8KTwv87apQBWSfTpugJUucC4f6JX74VaR8EmuB9Sdq9R
	 D1iKQRYb9XMVBk++GsYRmSW8xLFuVteTzxSzXrbQyOYhPlWsHqGotJbbzR9ChHG7XN
	 KEceMPpDldPIhtLJAubGGqUqG3Fa0OgmU0AgydNRWcv+TbAgC3OcqnSmwsYO2REGSP
	 10UVxEU556TlH0dRBPuGz4//Zd5flnSDMYwJqRJivjRl/bVZxOVK2O7wOpjhFN90Kl
	 /ed8ancgYjTENq6Mo8dB6sV3G3Kl1XniJ/TR6w47chtdN5jzpKM9Fq1MAj5LZdo6yd
	 cBCdb7WFCZQwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D6060D8F;
	Fri, 25 Sep 2026 14:44:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A252332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C81560D7A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8W6OvtziiJoD for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9BC7D60D90
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347479;
 b=I4S28HRAkywEHQ+lFeZRb7+yfJQTGWHNpjVxOgge38fM0px9dWq7c1Ldo92M8LrjRe+C
 CYyGw0QkpdNC+Mz85tSVWbMAxqOIYfDOlxASYzOZsLMHj1rr3a6FvS8lSr2WIed0f5Xqt
 X4QxEijw0eCQA1N/SSrk7an+2bvD/y5a1qmClomjd+4NDdCESvU9IrrV6TShyoW4S9XEZ
 gp1Ptnkgc6ZKOJs84Fjm9GOd7Aq34/GKdtk+lEw6AjlCMw8L5ufK3/5T9vvPdtAH/HS3v
 Dvbd3vquf3Xfi0/6AaoWvXDrYHiCBYEBAcrJDWD7+4UdHhskD3C8G/TGF9XsIdNWmWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347479;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=+nUGKUQP2iF4MdcloMSzTBTcgm2LEi/pdl5IwhGsPXA=;
 b=ljJeFgmlpjJ2h/hBR+xmjjGwQnTscpHUbEovbRn8ratt8pgXs4mkKuMr6uo95CyD6mPL
 dOm6r2Vfo4RlSMJieq6JhEMXWUh7xQc2S4yAj6SahyzBEqJyDGkdsB7Pkz+Lt0MuSL6KX
 4GSh24uOAhX9p09lqGLStQBt5TB5EhQ0tSsZ+wnnE3I8ccVnTJxJxOsdSNMtV98EeQPX4
 zqCOM83PI+njgg6mG1ouOtMw8rgegzW94C4G466zTaIXC9XtJs9hwyqdUe4By+8pDKByx
 eVs24U2oV9MnaOlEYvlK8ZfF6OtyHMKd6i9TeKEmOi6VUsj4ls7Abx7PGMXgvNMywIA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DewzIqd0; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BC7D60D90
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:38 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso8593775e9.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347476; x=1790952276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+nUGKUQP2iF4MdcloMSzTBTcgm2LEi/pdl5IwhGsPXA=;
 b=EVaNDT1L0ewovzEJRJ63HONbGBsFmdycqBSa74VrK4QIaWWFabNPLEkMuHKGrIy0xY
 nR1v1MvHKQGVVLN/bTOBc0mYjWn57L6wBkzgyCgTXi9yMPrQUfhVL/knxmrX6nXz2yCD
 biui/VsF/rmY8Ch/ov4nIjJpNt3QM+LV/sQHRCfQcNaEkP63jS9mMNgZYmSRKSV4j7Iw
 otDQoWDmDiDPemlwGVCcL+31z5gBWbnsud+TDc8mNjdBuUS7d7bFtszHrHONaJ4hJIe/
 HPlBeou26uInw0/XcPj7zwrXpls2Xmh9WP6LCTpkEmYVr8jEXEa/tg/hP/cUsk+YW4Yr
 L5Kw==
X-Gm-Message-State: AFuF++nXSzLKpzuA0M8+XD+6vpTEfplEKD0ox7SxRket5LysNVvrpedE
 4FwyXysn6cg6iJqs8V7DFGltuTnO7v2LrbjjePRHsTYmPGR7PmVUT32uQHOnGX7DlHqrTSda05y
 RbzNiM0PL/g==
X-Gm-Gg: AYBFou1zCZurpzLrHnnQQgl13aGKvq67wJ61zTaTISxeb4eojpqw+DYxA5y1nKu8sZP
 KtULLgfqZFe3Ijp7MWUF8FIt7s2b8OEDyanUfRqy8Fo27Z5MD/FW4JDSowzU916aCV7H5uNUZHh
 m8PYJv6raygrAb7HS0znm5mqGsJ/oNCyHOGQniFP++uIzMOn6yz6rZ9ZievM2TNqoeDPVUUHA+D
 gu0IukMCx1WfQygnc0PzhhBQHR7x1cgM0geI8oAR0W4QY3XxgROA1R3YDMTJPxVuZfrGYBjoNx4
 gfzjLTMH7ZIJan8aVpoTWVl51zMq8OrS5IvHDZKOqSFurqYj2CsABfjcC0aReZknGkE4Bpy2/3l
 A65DFTkSZv0YLvfon5ayFeo0wo04XWfgQJguUXN1h+nj7M1WUEPLi/gyBMGOmtDWmXFjG188hcb
 0ZuPt0qXWbJHiVbEITckBkRY+Fa1nN0Z0shDcOMgC94ityRsOu87gsHjtolZyW7CXCTLzkN4ScO
 Zu88zMdMc5TcfgZEe4PTUpsVVzTfAQMGwnw9o72bUQs7RuDRRpS
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id
 5b1f17b1804b1-49fe66f4c7dmr100063225e9.18.1790347476362; 
 Fri, 25 Sep 2026 07:44:36 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a3625ccsm7966605f8f.22.2026.09.25.07.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:35 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:44:33 +0200
Message-ID: <20260925144435.4096405-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260914075245.1749775-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/getdeveloperlib.py: fix regexp used
 to find package infra
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> There's recently been autobuilder failures on
> toolchain-external-bootlin, but I wasn't getting notified in the daily
> autobuilder e-mail for those failures, which sounded odd as DEVELOPERS
> contains:
> 
> N:      Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> [...]
> F:      toolchain/
> 
> And indeed, testing:
> 
> $ ./utils/get-developers -p toolchain-external-bootlin
> 
> returned nothing.
> 
> Turns out that the regexp FIND_INFRA_IN_PATCH and FIND_INFRA_IN_MK
> used to find the package infrastructure, and ultimately decide if a
> given .mk file contains a package, was a bit too strict:
> 
> "^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$"
> 
> This would only allow packages named <something>-package or
> host-<something>-package, but the <something> should not contain any
> dash ("-"). So this works fine for cmake-package,
> host-autotools-package, but not for toolchain-external-package where
> <something> is toolchain-external and it contains a dash.
> 
> We fix this by relaxing the regexp a bit and allowing any character in
> <something>. Consider the rest of the regexp that expects $(eval
> $(<host>-<something>-package)), it seems highly unlikely to match
> anything else but the line we're interested in.
> 
> With this fix:
> 
> $ ./utils/get-developers -p toolchain-external-bootlin
> Giulio Benetti <giulio.benetti@benettiengineering.com>
> Romain Naour <romain.naour@gmail.com>
> Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> This issue has existed since the toolchain-external-package
> infrastructure had been added.
> 
> Fixes: 1c99d70e5210f9d7b475736e0360ed63d16584f2 ("toolchain-external: introduce toolchain-external-package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/getdeveloperlib.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
> index b5e7b89e72..4321df8bfe 100644
> --- a/utils/getdeveloperlib.py
> +++ b/utils/getdeveloperlib.py
> @@ -12,7 +12,7 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), ".."))
>  # Patch parsing functions
>  #
>  
> -FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?([^-]*)-package\)\)$")
> +FIND_INFRA_IN_PATCH = re.compile(r"^\+\$\(eval \$\((host-)?(.*)-package\)\)$")
>  
>  
>  def analyze_patch(patch):
> @@ -35,7 +35,7 @@ def analyze_patch(patch):
>      return (files, infras)
>  
>  
> -FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?([^-]*)-package\)\)$")
> +FIND_INFRA_IN_MK = re.compile(r"^\$\(eval \$\((host-)?(.*)-package\)\)$")
>  
>  
>  def fname_get_package_infra(fname):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
