Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4027DCC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 066BC814C4;
	Fri, 16 Oct 2026 15:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MstEu529-m3; Fri, 16 Oct 2026 15:01:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3C69181511
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162919;
	b=YQtK7T7DYlSf76Dl+AiWHxlAFEpa6GJtPXfP1geje2U8JIqJ0tTStITqUkbCHBuLa2V0
	 6z8vSNgo3UcZrX2QG+4AC1HMV4Z7rryFjAl6wzF3iqKOdgFCVpgVSn/0G+mx8Eboeu5ur
	 ZwWmvy1+L/lxCZQlVr8I1BslVx79w9vQQfuMacAM8yCAxAhWQrO0jy8QxSiwUMDqBg0i8
	 VfFQ4Z6c8juzBfeLOL/ZV0EYffovRiIyfazCYSkAp9RB6Jf/MXJMGmsNJhXgLBbAXiMBd
	 dif7Ye7Wc8jArKZBZ7PqdtUggiIbl8MZNcw1naj31qIjKGSeKKpKAxKu/yWPyrvztEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162919;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xF3RBczB1aq//YxycAB93PdaJonEa1CeIC6ZINeeMAk=;
	b=EYayfsSbEcBD5+i2Q7FHXF1dN5dySbRr4H/BpoPBajw2m/DuV0lODlXDuaLGuAXKgomI
	 lEruZJXEo1Zu2EQ67yVb+vyDzjWYZy+vpzNPwUjARZX4ck9cfB7dgMRlRC3pvL1/NV2fQ
	 Ci2WPVuMpErhYmc5N9krfyOK0dxQmiD8+za3kcaxmmNX0gZbHRx0MpXFgmuiYvFWfViIZ
	 XjBEu8cYCHNw4AuyOotUkXR0B8mJQK+TS9LW1ghFR3pkWU1YlXfG1tPq/fw6Fzl01o3+Z
	 tUURagHLj0fxWZ2hppi70BTUnShMrcib0D7Aq4BUiWlOsqAJdNp9PWVPZj7bDnr/efA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162919;
	bh=xF3RBczB1aq//YxycAB93PdaJonEa1CeIC6ZINeeMAk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Agt+CT8CiPHBRAiEUSlZzz+uat06VrH/bPOeL5PmAamulcMpQOOg823dzGBzduKu7
	 e1L2SbhGogyj90B47NeAC5R23A4Is7xehwaYogM3LaGW/a9snU94H2ss9UjTVsBeR5
	 FJKvi/82rjQshLUBtZa+lIfTvy+TrkQ+vqLP8MVdYzah0VUru6//JY8FXV5f+zU5Kq
	 w3Xwrdis3MIftQ0JPUU8DrXZ2osj5XbU0xEi9GzqO8Pu7boTf4gwlwY6DbaogKL2YF
	 vj5nGFUD16VCmHt4t7B5skVBnA6fF6LQhks/6ov20yhKNwCODN4csT4WWJRkU2JQeb
	 72eJZ+0FDQBMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C69181511;
	Fri, 16 Oct 2026 15:01:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 658C5255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BF2C4016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCFyaMAngYQM for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:01:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 433F440042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162916;
 b=n9/YQadsk/LBfve05LQfLVXmjC94Ue/hPLk8K9PXjgOJD4is0LAWADkjbDLgXjmCYPHV
 q6m7n+XyiEtEIAEcoCVzlEDyZN5rL0W1MVkQEj/26sN8joVCW4FHchA9CBQGN5KOpo+cr
 c//pm0U3FYQebgi3sU5WWUNXtoNngyFGvD0i1vyPvE+7pbhySpiG9YzffXNfXuaHLY1Kn
 lU7AjIV7LjE0Dbj87KpqSIbj4MmvNpXseD+YtVMb+STdOEbmpaaVDxxyQCYJ4nGzgmBmm
 6I3Y8rlVo+x8GbUjQr0Xfy/8BI4y5/Snb9KSIB/vfrl6I0LGQwk5xBUxsLfaeOkty1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162916;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=B8Semq/O6EISUHEGKAEVRHQ725i9BjHX0c/1r21Xmis=;
 b=Bbvo5sGS17005cwhWusH6fFg5QJoqueTSfH8TMJbXPNU2Mk5h2O2iU8Y+EpO63Z/dsi4
 kc3jReToTamxzsFe/BrYoecnVbUR6SUGJ82Ec7BTvsaWs2BwekyMuPi0jOD5pTbThEvc9
 Kb8dNuu4NeY22cog+Y/EgKLYPn5MgkmuKmg2B+aa8KgLGtq6cwcWBPGm9QZnqrL8oVjU+
 O8H+jPcnNqmM5SCcX71FA5o9E+aOC3Lbj1H8NXDb7MINjGva0efbl48KzsN/9ynEcW/pV
 hju3bd5hMNic0ZcCSAgrDmyd3kDfd4hw9YJ3l6G8uhYbUtzVcrRLLLGb5NSjmQH0tvQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=U+qXq6Jg; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 433F440042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso456235e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162914; x=1792767714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=B8Semq/O6EISUHEGKAEVRHQ725i9BjHX0c/1r21Xmis=;
 b=mysAxb1WIw1due7kiNtEUTbTo0W3Ae5qUWpIEV6Mbu6a+naEsWm40VdDW4X2+zlQMV
 wJcwCfdVtg8Y0DHgwn8hz8lnri668C5PK3IlNJ/bnzO0vIq/uxy9yhQeQ4pLVu5C8gzW
 eqwhPiNigNKJ7Si+AfmlSh1E6jrDZY3tfMfjYs7B9pmQT+xdxbZFZglBbEfJGldhCX2u
 X6I9ODzvGQvkd7ydsL92JPkFbwyiP004j2nx2cNYjK6w/WBhg8Paijzn2jgOSnYrlFkg
 gpWQNKae+OwLTaQqVbIBtlVl2WMwvuHidbyNnXpbuVmVLJe4MCVOOwg1HSqbjChDCikp
 +WxQ==
X-Gm-Message-State: AFq9FYJkEuGwWGbOcBfPWVfU2vbEedDT9B4ikQ/Tf1MBCNVTEkp1Lamb
 aTSNTriTFUg1i0FHcKcKbz5DhjVjGCH3VtoSh02ELewfQS5o9kB98lzBPLMEM7dbS0cz15U6f4k
 Ydv09SKE=
X-Gm-Gg: AYBFou146DqQh7hybV2w55hQwyq0cXpo23pSzku1Djn76+NLZzIf1sTwJgygW+dHYHV
 ky/FzVZ1BFyURnqZxnej/QQWCxpFuL/AP502DNYDJNYyrptp3p3wHGQlx893jL40/y0ZGnJ9hLD
 gejcGggoYoX9kllswopVaPSdMfg9uamKmT8fgDdf3IdINvhSiSqZxgkKCw2g104CnymBi6GTAYH
 KVhRuh+f03yRM6ByIjEErudennhP+3OR6czbtfzi4XgvXQnAy9YIX7E5Fv2FMy6NJ6nxOOOnGYM
 dFfyv6DaCudX3iG/rQRuPMLyfjIJRJYMGPH1UqRsILNJV1gW8MxRUJ0CDgKG8gEPhmjYuLOPK5h
 Ppcg2FxE6aRhh321ez5WmwIvf+ti5GqyD4Jcur/uRX7QPAyJVZpqU0ruvnlBRQcuOSi8zxEqsXd
 f/Lie32z8Frcpujjrq4LpqrkJS7JXFtWA5c2tEdJtKom+smL8nD8yduQ2iF4wyc3nVchiXF37oV
 Zns2KGYIfQv/62ga7r0ueTLDuMnIdnDVNPCs0PsKQ==
X-Received: by 2002:a05:600c:6296:b0:4a1:7ecc:b23c with SMTP id
 5b1f17b1804b1-4a1d75e6feemr1582055e9.6.1792162913927; 
 Fri, 16 Oct 2026 08:01:53 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1ce33155fsm38144095e9.4.2026.10.16.08.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:52 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:49 +0200
Message-ID: <20261016150151.60226-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-12-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 11/11] package/x11r7/xkeyboard-config:
 add CPE exemple of detected CVE
 https://nvd.nist.gov/vuln/detail/CVE-2012-0064
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
> Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/x11r7/xkeyboard-config/xkeyboard-config.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
> index 7c9c814d95..9c8461b23e 100644
> --- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
> +++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
> @@ -10,6 +10,8 @@ XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-con
>  XKEYBOARD_CONFIG_LICENSE = MIT
>  XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
>  
> +XKEYBOARD_CONFIG_CPE_ID_VENDOR = xkeyboard_config_project
> +
>  XKEYBOARD_CONFIG_DEPENDENCIES = \
>  	$(BR2_PYTHON3_HOST_DEPENDENCY) \
>  	host-gettext \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
