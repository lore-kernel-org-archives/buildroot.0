Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108A8C02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 18:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C16FA80A55;
	Sat,  8 Feb 2025 18:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ny8eNNHYjO0z; Sat,  8 Feb 2025 18:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCBC381754
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCBC381754;
	Sat,  8 Feb 2025 18:02:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9A1A12B
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE40B81754
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wPCO1mH_XsW for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 18:02:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.49;
 helo=mail-lf1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 070FC80A55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070FC80A55
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 070FC80A55
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 18:02:16 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54504f29000so676579e87.1
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 10:02:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739037734; x=1739642534;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pxhj2iILBb6zFmPS7YhF08wUy1vimz5E2lxLQfeImYQ=;
 b=A7HN6STqbgSIuYWLlR8aRQ6FrSKuyh0eHrMMT0pry/+u/AYCrZQ9tOZ72ATa8gVgG+
 DHIaP3TPS+Uzkw7ArHAOGf9O114HAOfZBAgrp3YPoUEXwhaH+NYH9Q3C72PXROIa0GZX
 Mf194CMUhOLZHE9risJO1e6/T0gpYvngyfI0q56W15cbbh8Cv7HMMOB9hOnpcXPQxZ5F
 wCk9/ctZfw3KtWgjFAsipBMxE+a9NOktkuNd+9j2SIWEnW8LMz/G79DFDCITiguvpd5z
 37m0OFV1jzTvncvUy/bSB1l5KzEFpDTpRDAAmGtn/i0Yja7YgAX4c9tmnzHNpgs5I/5m
 Wnmg==
X-Gm-Message-State: AOJu0YwEazQqsNNnyZvOXW6FvrR5vZ7Al+o17XjxqK8turjwvs8sGgzF
 JOHYcVa46PcCrdQORgj+HGW9buCw751znOzArVDny5GXDvZMBmLqmA8nyBvt
X-Gm-Gg: ASbGnctjKEoimm5yD3pN7lGeDUwl8hlO4zIPoooVrJ/giF3qYP0c7IUTjJ2ls3d/x1v
 K+XvZtwDTCp/FnkOn8Uk+22GUIHZWPVllSzvwj2AyNVAdaCjqyQFnfWhv0EzM9MezjnbXHwjzLJ
 uZKPsiZGlLCLC7kNcm+AKK3GGIRWjRjbKq1FYpqO+Cm/6lK4jMJydDEjZ7E9wlNHmYGbNPHZq/m
 giaUv52/8EIsU1/mmxy/qEUPpWbdiwQOosMZ4JcpdAKRmiRDz9RVaUpisLIE981z8SIet2LDref
 W0ktm+Ggfbf1isLHF7jfx1iFL1gEos0hJYdjo3kBVa8PIvEJ2DsB
X-Google-Smtp-Source: AGHT+IFKL7tHvkm3ZYJv7P1on8ZALpF7ywvavj32shOcMPaphUrZPDAx3ljxXS5n0LnY8qdhlSCaEg==
X-Received: by 2002:a05:6512:3b81:b0:543:e411:cc49 with SMTP id
 2adb3069b0e04-54414ae5236mr1907213e87.38.1739037733918; 
 Sat, 08 Feb 2025 10:02:13 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105f2f74sm770944e87.189.2025.02.08.10.02.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2025 10:02:13 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so3424093e87.3
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 10:02:13 -0800 (PST)
X-Received: by 2002:a05:6512:230a:b0:542:29b6:9c26 with SMTP id
 2adb3069b0e04-54414aed208mr2410614e87.47.1739037733412; Sat, 08 Feb 2025
 10:02:13 -0800 (PST)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 8 Feb 2025 19:02:02 +0100
X-Gmail-Original-Message-ID: <CACXRmJj=e+nER8erscK=DHYJ7To29vix9AF2tjg0srRjrF3eCw@mail.gmail.com>
X-Gm-Features: AWEUYZlMtuj2oR6boVEdgrBJelSCiaz96rjwIjhQnPeUsHHTaa43c7Igyx9OMZM
Message-ID: <CACXRmJj=e+nER8erscK=DHYJ7To29vix9AF2tjg0srRjrF3eCw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH] package/busybox: disable
 CONFIG_FEATURE_IP_LINK_CAN if headers < 4.11
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
Content-Type: multipart/mixed; boundary="===============1331340898776044613=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1331340898776044613==
Content-Type: multipart/alternative; boundary="00000000000059f062062da546ed"

--00000000000059f062062da546ed
Content-Type: text/plain; charset="UTF-8"

Fyi,

This was also patched upstream in commit
https://git.busybox.net/busybox/commit/?id=8953429a8253176adda4dcfbed4738e55ee3b8ea.
Disabling the feature all together solves the issue obviously.

Kr,

Thomas

--00000000000059f062062da546ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Fyi,<div dir=3D"auto"><br></div><div dir=3D"auto">This wa=
s also patched upstream in commit=C2=A0<a href=3D"https://git.busybox.net/b=
usybox/commit/?id=3D8953429a8253176adda4dcfbed4738e55ee3b8ea">https://git.b=
usybox.net/busybox/commit/?id=3D8953429a8253176adda4dcfbed4738e55ee3b8ea</a=
>. Disabling the feature all together solves the issue obviously.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Kr,=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Thomas=C2=A0</div></div>

--00000000000059f062062da546ed--

--===============1331340898776044613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1331340898776044613==--
