Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C69C4332F
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 21:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A810240914;
	Sat, 12 Nov 2022 21:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A810240914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zODkPoxl7301; Sat, 12 Nov 2022 21:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAB61408FD;
	Sat, 12 Nov 2022 21:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAB61408FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2DD1BF36F
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 21:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3773400DB
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 21:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3773400DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DGnEb2wUZP9 for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 21:36:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F65B40012
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F65B40012
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 21:36:53 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id r12so13442111lfp.1
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 13:36:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G2plker7xrVJ0uGQ4Vw4Tk02YvUwfnG9KvgGJMJoVD0=;
 b=ankcGyQyAcuDsUoz0aPtjF+Fhz8doFrIEayqPEMu89CUxPGLMKbo455HAuGO8Q6KLW
 dy1zlShg7eurZb7SThhnqR/czoj23eif0MZe2cz5J2zW4xZ4rowX89f5ZxAA8kydz3t7
 i2IEGfQELtezKjtHQq+afbT3SEwD/49/KVSAP7743pfOsNf0+dUPbmQd5rMnlJro/1/N
 0PPSKLhFLKOhT0Lw7Wp+vSSo1VIvb9GbzFP+md6lF6Ql3DTA3GMJu06/vjriQXb4N03C
 f3Z+jD9eY1wDZYS2F+u5hZ1h1r+LO7Ev2wyYzufJp54uN2b2r2lwTxIRMSFh3Dxm9dd6
 uVMQ==
X-Gm-Message-State: ANoB5pmiALdufXOHAF5hmThUc1SVWLhF6ziU/QL3hlu1fWw2mQEjt+92
 /EBjvn7WExEITvwlsp8XD1ngPaDzPv73oQ==
X-Google-Smtp-Source: AA0mqf6zuPiUh4bK2XmBDtBbk4zU22cjHbxFpi1hMyfggKeRQEAB0vRAuxRhe09mTBtZz9UxZlTJfQ==
X-Received: by 2002:ac2:4e13:0:b0:4b3:ec7a:6752 with SMTP id
 e19-20020ac24e13000000b004b3ec7a6752mr2715225lfr.79.1668289011227; 
 Sat, 12 Nov 2022 13:36:51 -0800 (PST)
Received: from [10.0.196.136] ([98.128.186.104])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a2eb118000000b002772b70c1acsm1120969ljl.21.2022.11.12.13.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 13:36:50 -0800 (PST)
Message-ID: <de28802b9f14d311c4d98d0bde650c86178b84c7.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Date: Sat, 12 Nov 2022 22:36:50 +0100
In-Reply-To: <20221112212034.5472-1-fontaine.fabrice@gmail.com>
References: <20221112212034.5472-1-fontaine.fabrice@gmail.com>
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=G2plker7xrVJ0uGQ4Vw4Tk02YvUwfnG9KvgGJMJoVD0=;
 b=QPYwsg4gYJGXJZV+mheB6p55OULzgJcAwobKaKHEO4NQLvCRYvec5+Em7jfkv6uZ9x
 5wg/dI728zp67rn8ExOUdL+6NvFfRQIIoPO/Z0wUYC8sMP3zJ9WoMHi/tZsyRjSJZpD1
 aimgMAPnirxrZ2Ji5pbeixTEj4grF1J8UABcH2aOySwvl/1UzdnNJHJo5pS4nBSadByL
 3C8aDe7pfn1Yk4PgwpgHoD69bgfhROI7Ta5wd1Sal43mNB4DvGx+fqtRcT3O8IasMlVm
 SPzpo9L912Mprp9dLGoVE8FFKJgVvYX206OlhS+w2t4ErSGqrV1XdDUpipYceWMh+wZR
 qh+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QPYwsg4g
Subject: Re: [Buildroot] [PATCH 1/1] package/mdio-tools: needs fork
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAyMDIyLTExLTEyIGF0IDIyOjIwICswMTAwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3Rl
Ogo+IEZpeGVzOgo+IMKgLQo+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
L2M1M2FhZWFhMzRkZDRkNmQ5YTU3ZGExOTY2ODdiZWVjYWVlZDlmZTIKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KClJldmll
d2VkLWJ5OiBKb2FjaGltIFdpYmVyZyA8dHJvZ2xvYml0QGdtYWlsLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
