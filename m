Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE1ACCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00AE781544;
	Fri, 16 Oct 2026 15:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0x1AZjldLHww; Fri, 16 Oct 2026 15:02:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 30F60812C2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162930;
	b=ddsU9/4PPNaM+jIyadi4OUWwO/FmLWCPGUxC8DqEvTuuJH5bNGm+s5LLIZvgYIGQy8bG
	 XlqCEPALXSDZqIL4l/Oh/bxqNuA7pJ3sPFn5NtA/tSdMEcY01tC14yTxiMe1C978vHMOP
	 Z/TI+PsfGNra9nsE4e3haoiD/gKkdnx3M7uVlC0jGabX5R4tEH38yPdgxcnkZEax7KW7j
	 6Y8lmNYGKgTkvTuxhcu1mxHaJc+K1Zk/Py+YN48dPPb7PC/+sk8FHjTRqZmiPfgMONun+
	 byBweaWUM3tDW7IIHxrJ7HRchoas7b/prxGxbE7wnKz+i+oKEhJzEy2eDNYVl3PZx0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162930;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YPQYkP2OA3mB6GnhgRriSUmWQoeJmMH7vBGZag9UUSU=;
	b=fgKzxb+vt8nMhSb13XjW6xxLwTBSQgeJmvuYXRmoy3s66AJ58ue98BWkIb6s8fYiqqCx
	 k2blil7r0Cse6hLp/OmtvyAP7JQc1SgbXyHH8qILVXl+denM4sioFSeQYcIuwyvdJX3Rs
	 yKsceqLw5E9uSl4AyhyIMOJUWbXwQlxtARlxkbfqOBNbilioJ9E27UXzFAVm2fgEN7jFj
	 BhZskAEG8jSCT5NrjfWhsIUVfPrbHcmkMEJL0us0FZYou4JXNf3o2Ue7KJ6PP3wBFhOCb
	 WFyDPNLdw08n/I9g6vH/xKWB99vnu6BIab5ahQY7axRW8Zxaq+athlk0wkVpO2fwA3A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162930;
	bh=YPQYkP2OA3mB6GnhgRriSUmWQoeJmMH7vBGZag9UUSU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ryD92oHyAUmsO24bRZyub8YqJzAWCrVlwutq0gmPk0vIvoiIqnY5UcTGGzrKL0xUv
	 40mydGxt5AXfu6c0bO5zZKWwDkOvnGw7noXdTxbHfV2IGdj9V7Fjqp6ZPigS6wGcTL
	 P6mUDJaV8t+qVpRImQz7tOjnh4nL8msP25lqH9G1PIoRAT/E2aeVJ2Ld7Mv/56Sfo5
	 fZmlRecG0eFnVWwEyXjgSRx316jl9FmwbG0DlDYYbsVxGsXmbXA6uGyHd84ZyicYxL
	 sWFYpPgxFcwTT85OgFKiD6lV9toTsi840VUntZZMJ+aRxW/F7XoRZW7V3TC874LimB
	 IDULh1p5MfoMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F60812C2;
	Fri, 16 Oct 2026 15:02:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8512255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A54B4016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVx93riiEy5o for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BD96940042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162928;
 b=fnY35OtSe8ilXapQJZs7Afs+atYJW5PGdwVFUb+Sqo0XiAUu5C7J588x3lXTktnr80TU
 N9l3rNh99t1cm+a/jecs/QJBXRtG/Ec0VlM16YSNI5RDRfffPrlWu27zs2uUPZ/Gn/2hV
 8gl6WeuEqTMn0s4CnZ+LDt4qcU7h9tAXKyO8R/GZC4iXpeHvNwv7+OkMOqceZSBkjQAbG
 D+3fEc001Fs6VLcXLBVGd06YqKtkl02Nk98yw6UEXlwXntDXOFxOFfEvNksSNNhofmN+c
 gnbE8EOKErQDXDCdzchUgyg94zKBvQrrPe82gMlOo1iXAUml/e6GGMq5Wv7ZO+g/f4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162928;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=4X968HYcsPWDcyc0C+nerCC+XUAHcyNEwuMtm/91rIk=;
 b=TG+tlz9+zfIeIHYQcCdpZob8xpdWNbY8v2ksNfDcKGSKqH/g5r4/LlScMjSltwmrjVwF
 mfvnDpGPeLJ1gFyKoGPfSUl1pLWn7I1A+3Y0ANGqZwN7qm6xg/bJBt6xWOyiS1E1gjKU0
 FyPYvbvCrDmmo/pKqQdEvNq935lTg7MXk8O3I5j0zyaWfJEWdKaVpPmbnU1UdkYIDgg2E
 Z7OZe3BtpTvjbMhVKycrp5popurLPDDlLOPPuA2SKh02WsiiW1Y3w2+BCumRqmvsnMlTL
 hGSVDpJl9W9mKM3/64wiEoITGhLu4v32/QKAhYqYud0B5H9MwDQDSTNi2yFAYqkXM/Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=f8EoEM2S; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD96940042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:07 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a16c399641so406675e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162925; x=1792767725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4X968HYcsPWDcyc0C+nerCC+XUAHcyNEwuMtm/91rIk=;
 b=uCs/3oxcbHDP8/aCG0SZNOHr8tMTV38UEEBLpq+lcMknC3oIR1ZQhuZ1S2lDpW01yK
 H6c1XHQjMHnBEGsZnW/hZ0/o2yX3hoDBzoiW0yIfQMMfkKZbD7zJLQsCgr7TI6Dkem58
 5YtjlPZwLuCtthZF/znOzdhW2d0FhpcIj8nLduPJMUJdyAaDpa+yXcYapK/H9HUHcx5f
 5ZSa5RJr41ZLGQxmb0HmkhB8ZmQkHhAFVaN4uhdPmV+uuaMLp0n6mrYUm+m703z1P0/G
 L7W+7lali5FzsC85sBMk2il2Izri95gmCs4QsxeNvagR8Y5g1gxZXi/49p0oRTLb1zps
 6IrA==
X-Gm-Message-State: AFq9FYJ40dfHydVDAhODECcuRBa85lJISYzhibF2xhT/dUmqEjbSwwvq
 6OcjuWjR6Rl3zYU6RZLgYP109g1u5whpiYUQBmmNIzeG9R+23zuiXXZFTfnC//bffBFUQItH5+O
 KSEdrq4E=
X-Gm-Gg: AYBFou3Lrp2iwkbHeETjDgO8RFyfWuMUn8PLI0VEoRTNc3BKMBZJ2umL1+vkGNrlpU7
 cYAVvRmMz4+6P+TMsjxLxpkLm+m/x7s5f8+RA9WfZ5hzy0PUYbZYiFCTay+HbnRKa1czo6UloYx
 K+jxFBRCiSYlpHPmcnBcRvyO/+jvjQRBqVzKAE2zzkga2krHxdaeWg3XodSRdRfLy4hBudrDrJx
 AdZ08cQn2P6WCc1wlr1KNVbpGV3KxjPxfjkl0bwU2lmJ/WxMH+mQmjcVVQr4tJ+OOoGlXu3zj0x
 SYNO5bgyLYzYTkSFLC9r5CBzktSoGW/H+GA1j4JszoRmD1hMvMT9jB5Bf9W32vf/F5a2FkORKp6
 AVQWT8jQc+rB4IbJAL4CiPSOdiUUHJI7DSlwjtPj1c7VNARaydmFNwwOXVG88FBYGIQo3X3JudH
 M0ZLpUuYbDfL+Sb7kYsJo0K0mW8n++swTKRTrmSJ2YHG7uTXHrfd9FKd7XOtz1mOCpLIenTrVPC
 0Qz0IEwzvPMf9jutsIzEHdcTg2nQzqaQZiJrLUvxA==
X-Received: by 2002:a05:600d:82c7:b0:4a1:775b:5eb2 with SMTP id
 5b1f17b1804b1-4a1d75f9389mr1409475e9.13.1792162924202; 
 Fri, 16 Oct 2026 08:02:04 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1ccc15aa1sm59171195e9.14.2026.10.16.08.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:03 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:01 +0200
Message-ID: <20261016150203.60335-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-4-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 03/11] package/htop: add CPE
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
>  package/htop/htop.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/htop/htop.mk b/package/htop/htop.mk
> index 4fa8e4fb5f..72d9755ef9 100644
> --- a/package/htop/htop.mk
> +++ b/package/htop/htop.mk
> @@ -12,7 +12,7 @@ HTOP_DEPENDENCIES = ncurses
>  HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
>  HTOP_LICENSE = GPL-2.0+
>  HTOP_LICENSE_FILES = COPYING
> -
> +HTOP_CPE_ID_VENDOR = htop
>  # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
>  # provided by autoconf relies on wchar_t.
>  HTOP_CONF_ENV += ac_cv_prog_cc_c99=-std=gnu99
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
