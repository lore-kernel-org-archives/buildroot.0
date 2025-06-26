Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E17CC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA15D612B3;
	Thu, 26 Jun 2025 19:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJ-xQci2Xm4d; Thu, 26 Jun 2025 19:55:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 358686128A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 358686128A;
	Thu, 26 Jun 2025 19:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79A8810A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F948842B3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iRxzH_9iK1p for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:55:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C8A481E89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C8A481E89
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C8A481E89
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:55:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-608acb0a27fso2283375a12.0
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967751; x=1751572551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W7/hX8YTKabenxYVWluGL0S6fL3vvLwlGO6PeWO9xuA=;
 b=h7IbbPJCTecOWOtj8jwHBnmf2Fgpy6rDhNWel0Nqy088DF88vz7ypmJGXfh2cXrcQu
 75m2Pw9NrUjAJ6/cNp1GMCT4KSnEMn5S9rgGV2uI2bG3MrK7cbDsAAWBwRA6h54LDaLo
 X0CplKgEaxh8/5rT3rbbU1Jhh+9/7xrw3cJoIEc/QRy06a74Vu6VzHwRq4q0FGafUGjU
 DiA5J4hk1GMjWdoA/WN7d+pHHzOqRCUL6IquYNbb2oq2vqXsV+fol768PIT3jiRcSEo+
 5K9/6v50nSa6jPVX/Xb4PABJjE8pWajn+QnjWyNdUsTxPW6NP7UYjuUQ9o6/G47jCxJV
 QoZg==
X-Gm-Message-State: AOJu0YzuE9hyM6NWCD5Fzujz2w/wP3HJlPVod4HZKTq8S7kiRE3kTR2H
 5rMbRYzgOU74+cYTZyibri7j6Sk8wwsr8BH3RQgb46QolZ/qa+eRORxAH+4bKEU54KqK1UzPuwj
 TVe4/
X-Gm-Gg: ASbGncvkTXePphhz5nAR0r40aiiDvhkKjU5f8U4GsqSRfzi8Blsh+bkmSJ/+Uq+Nd2X
 pFOQobuCRB3NOGsQtSyM68y/WPnfmUhDL3FuwSzVlatFhTO/9ZF75KoDhopcbiCMUabef7CZO82
 F0SQ3+X9qZ1f09KIzcVuS1J+86cAK50y29dhdUmAULny2TO+V+SFmYd4yn6dMKrAKT1fftxu3fl
 gb1p/3VW5VCx2P+uQsXUfYpheGp+Qfa0LTJgdH8PIm8/0oLkxf4xz1KXg5zsAwHmISyvMKPHT5Y
 AMLsJdq84Jz0ErsiU5WnPod/tA97U+bk4d231w0PIVom0F1XiwmjfKYH7jrqO3X66UrkBQvgGvI
 M5VgmL47BdJeycSWkmzQb4whxwzusaTtj
X-Google-Smtp-Source: AGHT+IGfNBp0p59llCDPt+I+c1/YHuHN30yzuMBQbUFO4Ec/oLAg/b3kpNsGTy9lS4jrnMq6zhvFAw==
X-Received: by 2002:a17:906:68d2:b0:ade:2e4b:50d1 with SMTP id
 a640c23a62f3a-ae3500e035emr33351366b.29.1750967751152; 
 Thu, 26 Jun 2025 12:55:51 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae2235afd53sm45547266b.165.2025.06.26.12.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:55:50 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:55:42 +0200
Message-ID: <20250626195542.16148-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619135259.405906-1-thomas.perale@mind.be>
References: <20250619135259.405906-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967751; x=1751572551; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W7/hX8YTKabenxYVWluGL0S6fL3vvLwlGO6PeWO9xuA=;
 b=Fr6TtYg/8n2JR8jpR0m5U3IUknmWSFBd0/eGYJB/kx7zUzsSAU6BuALBy3gyZAX3ty
 cFKvUAtBDPy79f7MYBzekV8Zs39lB+0iC020z2hDnsG898ZT/6DIUdZ+83FoGr2f3qsd
 wnaUilwFBHbCQsvz1TXBR/rT1aiYEm3iZLi/RWKyTFjdkn9+lTM7NgVMSNbel7QUEsu4
 hWsYFOKndvO95cBKRjIuHypsFAiTn09UrRiBbwZNVFQQICVVzs2RqamBX6KkWTo+4DKu
 QajHFZYCj03qQ/hqRixoE7WRGSsqYH2ePEUfiYUKgjO5VxTQQkpaLLfm5kPTRYnPDs12
 jQEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Fr6TtYg/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-glslang: fix host-python3
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
> In reply of:
> > python-glslang is a host-only package and the host-python3 dependency
> > was wrongly added as target dependency with buildroot commit
> > f9fe0cf8f64f8ea48f3ee4af28053d7bea52b61f.
> > 
> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> 
> Applied to 2025.02.x. Thanks
> 
> > ---
> >  package/python-glslang/python-glslang.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
> > index 94f480e30a..c3e87da94a 100644
> > --- a/package/python-glslang/python-glslang.mk
> > +++ b/package/python-glslang/python-glslang.mk
> > @@ -8,6 +8,6 @@ PYTHON_GLSLANG_VERSION = 11.13.0
> >  PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
> >  PYTHON_GLSLANG_LICENSE = BSD-3-Clause
> >  PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
> > -PYTHON_GLSLANG_DEPENDENCIES = host-python3
> > +HOST_PYTHON_GLSLANG_DEPENDENCIES = host-python3
> >  
> >  $(eval $(host-cmake-package))
> > -- 
> > 2.39.5
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Applied to 2025.05.x. Thanks


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
