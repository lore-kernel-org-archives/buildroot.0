Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331A3C77B6E
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 21:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97129616EF;
	Thu, 13 Apr 2023 21:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97129616EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxFcqNg330gp; Thu, 13 Apr 2023 21:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64AA60C22;
	Thu, 13 Apr 2023 21:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C64AA60C22
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99D7D1BF389
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 21:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B77441EC2
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 21:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B77441EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWUhaY_j8zJB for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 21:14:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E929241FE5
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E929241FE5
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 21:14:37 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id i26so21242283lfc.6
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 14:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681420476; x=1684012476;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nOSm3Gw3xnup4+/kgPfl7wW0I2j6/RuUQWKjZrqFphA=;
 b=SoPBiZZ/zpKnOP2w9+Jo+pdKfmrnri5eSmz0tqJ6GTvsZFZaswXCxX9PU6XNBwWSao
 rV48mWfqb67MWJS5P5l1A+akW5eLrdc5YqqNQPGhQF5n7itR8n/MO5fUCxvyQczlDoI6
 Sbwc0usyZU9jJVK3I/8vvIVbiBuVUJ4W9Ap4uOoSJFfbvdkGnaTceC0SglcSfk0fN+N4
 N93skUQSwlc4Q6KsSXU3WyV0qtZjdpMIUwPtevB9qhUkMI3CzMvUrBCz0o5j1g/Xmnv+
 Eeq8xcU0T65GhCDmRfpvCaDp6rEdZhcSDsIzYrmw4UPj5Z61xljy0/AKGtiTncmZCFEL
 tQXg==
X-Gm-Message-State: AAQBX9d607/cpR/HMLxjwQg2V44mqz0ph7kHGHv2pZub7hleb0hOsVV1
 kzPSvoG9N4jRyh4IQ/jhDLxatiWAiZ8IkA==
X-Google-Smtp-Source: AKy350bOke7/Vwuf1Ol7xhZEMkTnZrgQBO1YsgdTqt/QogHVd4dvt4DghpOeUnrzwEqQQjUOMMbWFw==
X-Received: by 2002:ac2:4895:0:b0:4d5:a689:7580 with SMTP id
 x21-20020ac24895000000b004d5a6897580mr1399061lfc.47.1681420475491; 
 Thu, 13 Apr 2023 14:14:35 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 h14-20020ac2596e000000b004eaf6181a32sm464776lfp.75.2023.04.13.14.14.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 14:14:35 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id b40so422201lfv.4
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 14:14:35 -0700 (PDT)
X-Received: by 2002:a05:6512:7c:b0:4ea:2dce:fa0a with SMTP id
 i28-20020a056512007c00b004ea2dcefa0amr1210322lfo.10.1681420474861; Thu, 13
 Apr 2023 14:14:34 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 13 Apr 2023 23:14:23 +0200
X-Gmail-Original-Message-ID: <CACXRmJjkgX6iek7DyuqDbc29QF+N0ALjS5w7qfPEaU=O-fmw+A@mail.gmail.com>
Message-ID: <CACXRmJjkgX6iek7DyuqDbc29QF+N0ALjS5w7qfPEaU=O-fmw+A@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: allow both X11 and
 Wayland
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0670034020328133435=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0670034020328133435==
Content-Type: multipart/alternative; boundary="0000000000001f4fca05f93e3629"

--0000000000001f4fca05f93e3629
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a serie of patches which are still open, related to that atk bridge.

https://patchwork.ozlabs.org/project/buildroot/list/?series=343801

I was also planning to make a patch with webkitgtk 2.40, but didn't do that
since my other patches aren't merged yet. If you do it, know that I already
upstreamed the host-unifdef package and that the minimum required GCC
version need to be bumped as well.

Kr

Thomas

--0000000000001f4fca05f93e3629
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">I have a=
 serie of patches which are still open, related to that atk bridge.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://patchwork.oz=
labs.org/project/buildroot/list/?series=3D343801" target=3D"_blank" rel=3D"=
noreferrer">https://patchwork.ozlabs.org/project/buildroot/list/?series=3D3=
43801</a>=C2=A0<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">I wa=
s also planning to make a patch with webkitgtk 2.40, but didn&#39;t do that=
 since my other patches aren&#39;t merged yet. If you do it, know that I al=
ready upstreamed the host-unifdef package and that the minimum required GCC=
 version need to be bumped as well.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Kr</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thomas=C2=
=A0</div></div>

--0000000000001f4fca05f93e3629--

--===============0670034020328133435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0670034020328133435==--
