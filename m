Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF997CEE327
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 16:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D4AE6062C;
	Tue, 18 Nov 2025 16:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NTmncs74SopY; Tue, 18 Nov 2025 16:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BAF76065C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BAF76065C;
	Tue, 18 Nov 2025 16:20:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D6EB1BA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 16:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02B5C6065C
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 16:20:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_CAEf3U60-k for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 16:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.222.177;
 helo=mail-qk1-f177.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 513CA6062C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 513CA6062C
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 513CA6062C
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 16:20:02 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-8b3016c311bso124753185a.1
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 08:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763482801; x=1764087601;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XW31j6JHpOAGy2ACSUXYaVIhC6EmsxaObZp0K/DbQ+A=;
 b=uyotVS5Hdl/zP5BGzU+p1hzSG1EJaDNkIsR3XgPVCe26I71MadMRw5tuztny2WCIIC
 Y1f8ilcoQRZrmsu9rEJV413AbXRpYCRkDVdgoYFgXoMVEWWBR1bMEO1pHjcelg8K9xHY
 emanY5fLNiyIpbad5gb0aGk2V1bXrB7EtLxrWkTdFNhG6IzIiF+A1lpVjLzzJA6wylUq
 zwxvn7V3luzADSHvnxxeFhW+aauZs/+entBuJdyYA4aQdrWbPCyM+XZFgzwfwTFEUl3/
 FJ2wy4M/bkHg0nykHtos1ObUwHK1hr87vpCI7pxDGdjI2TLUHwox03WEKBDjH2ITbLib
 HEcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7Y13u8h2lm1Q6lcEvNojJFGcDJuEsjVvDwgHrsby5GFfDVfOa7iyXNmLlIp0NeQZT5cVRQoVXZ9I=@buildroot.org
X-Gm-Message-State: AOJu0YzH9nVdRlf+qMYD7110BsEa9eB7Do+L9lfwGFiGdmzFeEGZRyOi
 B+O3n31oo+P+0cu2qkq0Nf4pbCFg/GMPxX9rLYboW2FiqmX2gaNjCkx353qpypXZ
X-Gm-Gg: ASbGnctxM6+sFCgJe29/5p0H5jK9Cbf80Jn0JfkClVjnIlrklflcIsyFlSPUZMf05yc
 +hsVycT01FSNgN6zP6XPWaxxnDMcnHlh6VIkTFs30aSF83mWnpIICVGd61iyHPjqgmrGGjBCzhq
 tqlHJe0pyOdLlepbe33hCyNwEizJtwLIvrTj4Rn8IrdBN4jUIA3N0bOMsgU5hoxwLJKLJ9CAUR+
 zubmzy39b5xQd3A8uuI5YLIfHK6fSeBHp+FgpSiUgySkWHXtrskYxudua2uZBwfMhUocA0ZIMsR
 +37eyA6PJV6RCoPP9t+SuNjha166aIS9o0oQPatQ6OQ9BMHEmuvIyrezNV3Q89NJ3gG7Wr5Q+dT
 pwCMmTaTdor3fTbzXOAunWc404SsOVwG0fhbCrC9Qb6RpVlWrNtQJCV/SUW1MewmGis77vXtv6y
 stHs1RHir2NccgKeyKXWtsCtn0QQ7OdKtrO9F13VDs3rn8uGtD+WLus0B22A==
X-Google-Smtp-Source: AGHT+IHbxnd2JEygLNWcid7e8S82a/ETShz7IEbzCDThWdLLjcwIK+pzPjmrBONB4lDmTGDAIOc21w==
X-Received: by 2002:a05:620a:4048:b0:8b2:f892:9137 with SMTP id
 af79cd13be357-8b2f89294a4mr750693285a.55.1763482800688; 
 Tue, 18 Nov 2025 08:20:00 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com.
 [209.85.219.41]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ede87e2a78sm107932951cf.22.2025.11.18.08.19.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 08:20:00 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-8804ca2a730so76376656d6.2
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 08:19:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX493ihZiOKQz8XLKEgzzhX/6dJaFXZHKk6o3h27J3bEw9bFm83NAwGf6TuHqJoxKFY/gCbc7X9mes=@buildroot.org
X-Received: by 2002:a05:6214:4116:b0:882:3d7c:dcdb with SMTP id
 6a1803df08f44-8829258f380mr240378106d6.8.1763482799525; Tue, 18 Nov 2025
 08:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20251118145303.2215064-1-thomas@devoogdt.com>
 <f1f8a97e-f13b-4a9b-a17f-ce723845af9f@grenoble.cnrs.fr>
In-Reply-To: <f1f8a97e-f13b-4a9b-a17f-ce723845af9f@grenoble.cnrs.fr>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 18 Nov 2025 17:19:48 +0100
X-Gmail-Original-Message-ID: <CACXRmJji00qR9uUbPtaj52_C1DjFS7x93JhwnVT+3b_hiZAktA@mail.gmail.com>
X-Gm-Features: AWmQ_bkLbWYb_mtamlDRe-tLLWshrqRmlYyKsCFuGHyY069HpE9ysdpmkycFhbg
Message-ID: <CACXRmJji00qR9uUbPtaj52_C1DjFS7x93JhwnVT+3b_hiZAktA@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org, 
 Christian Stewart <christian@aperture.us>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH] package/yq: add new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Edgar,


I don't see any indication that yq might need jq,
yq is a self contained go package. I also don't see
It is used when running strace. It just shares the same
syntax as jq.


Kind regards,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
