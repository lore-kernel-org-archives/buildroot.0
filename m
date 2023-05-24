Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936D6C77B7C
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 20:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E7B642A28;
	Wed, 24 May 2023 20:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E7B642A28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsRzQl4xFpgy; Wed, 24 May 2023 20:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2BFB942A1E;
	Wed, 24 May 2023 20:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BFB942A1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DF191BF2F8
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8DD642A1E
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8DD642A1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6BkdqxjWFcau for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 20:12:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DD7B42A1A
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DD7B42A1A
 for <buildroot@buildroot.org>; Wed, 24 May 2023 20:12:41 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-96f66fbd770so39040066b.1
 for <buildroot@buildroot.org>; Wed, 24 May 2023 13:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684959159; x=1687551159;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ACjyvDHADgmszM3ZJ6IKrh0A3zm4uuaJFLfTKtXgEc0=;
 b=QfsfwNP58fhKEmkPffxWgSkblZFQ1xWiW504UHewUd4bA78BRkqZLoHLKHnSEj+kHk
 dlGhxn0Gs+/FPyHySygIh0Ov1eMxNMXghsrTZedkbQnnLNmfjRwrwqovaZQE5oxrGCte
 S4hnsnPUFLWUWaXPndeib5VMA3V501w5A0sPHj73nLaG5nIDAPThjlwiOAepzxsICqDs
 vdU7G9CgSGP6bbT5Z8rXlAB8AmL1C2prGNboyw0QUGirIXutU2ECLMNDK+MZa8vTunZp
 6My68xNA7a6SUuHQXBvnU6qRGtKl+80ZMrW8gC0Uz0QZLdD5YXfO+Q7DvV+hGj6e/t6O
 8Quw==
X-Gm-Message-State: AC+VfDxho0YvFG4jJka74bAf2bgtPS15GlzoGg8uKI0HuorA92dHDHae
 qKRKTBs6i0Gj+Y/8kRrGDV55IEvX6nh7+Fze4lb7v3rkrMllXSr90IE=
X-Google-Smtp-Source: ACHHUZ51U9sxOiR3yTlbvzddAtWMU00xO0EgPFkiI/qCSR8HbhmvFcVjTr40EEIdpweztRxh30LmiBeQEWwRLRS3Lqg=
X-Received: by 2002:a17:906:7495:b0:94e:9efa:a9ed with SMTP id
 e21-20020a170906749500b0094e9efaa9edmr17740230ejl.7.1684959159423; Wed, 24
 May 2023 13:12:39 -0700 (PDT)
MIME-Version: 1.0
From: James Hanley <jhanley@dgtlrift.com>
Date: Wed, 24 May 2023 16:12:28 -0400
Message-ID: <CAF++6AOAo=ZBwzQoKK0_udS25xVxJCbzRhBwn9q4ZZPnuRux-A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dgtlrift-com.20221208.gappssmtp.com; s=20221208; t=1684959159; x=1687551159; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ACjyvDHADgmszM3ZJ6IKrh0A3zm4uuaJFLfTKtXgEc0=;
 b=bTy1UNGc6u5bVAEdOirD+ekbsbo4qAiAhmMxFSqkvmUEkr2mSJzv7RV5bJD/iatoAo
 QLhoHuyYdk7/vgwx1Yw3ZFwJrc2YQE94E5p03vR3bWtlya8yYs3Rxv72+oihNRU9fRCX
 PjzQvagPYWty+IOe4wRvfSOHbM8cqIdXwKSjqOFL2+hMcHwXVTlNFBGblLSwpGzw4xfp
 nW87DqkcsHXUR69fAy03LmJEZ8jnTxN4mFQD0YYqtsb0Pxw/anpT6Pu/919no6HJY3Hg
 kdlhkU4R3FFP8SkdKZ/iGbF8dfSWlPu3LJ2v70Ne19Iu/no5phbrU6YxG/fqwp6grYIS
 pIiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=dgtlrift-com.20221208.gappssmtp.com
 header.i=@dgtlrift-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=bTy1UNGc
Subject: [Buildroot] [Feature Request] Linker intelligent binary
 differential patching with Courgette in OPKG
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
Content-Type: multipart/mixed; boundary="===============5696529836976176766=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5696529836976176766==
Content-Type: multipart/alternative; boundary="00000000000028a59205fc762061"

--00000000000028a59205fc762061
Content-Type: text/plain; charset="UTF-8"

I'm unsure if this belongs here with BuildRoot, Yocto Project, or OpenWRT,
but I'm starting here first since (I believe) it involves the build process.

First, what is Courgette? - "Courgette transforms the input into an
alternate form where binary diffing is more effective, does the
differential compression in the transformed space, and inverts the
transform to get the patched output in the original format. With careful
choice of the alternate format we can get substantially smaller updates."
via
https://www.chromium.org/developers/design-documents/software-updates-courgette/

By incorporating this into the OPKG package management, change deltas can
be more compact which may be appropriate for IoT applications with either a
constrained network interface, battery-powered, or scaled-up population of
devices.

--00000000000028a59205fc762061
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m unsure if this belongs here with BuildRoot, Y=
octo Project, or OpenWRT, but I&#39;m starting here first since (I believe)=
 it involves the build process.</div><div><br></div><div>First, what is Cou=
rgette? - &quot;Courgette transforms the input into an alternate form where=
 binary diffing is
more effective, does the differential compression in the transformed space,=
 and
inverts the transform to get the patched output in the original format. Wit=
h
careful choice of the alternate format we can get substantially smaller upd=
ates.&quot; via=20
 <a href=3D"https://www.chromium.org/developers/design-documents/software-u=
pdates-courgette/">https://www.chromium.org/developers/design-documents/sof=
tware-updates-courgette/</a> <br></div><div><br></div><div>By incorporating=
 this into the OPKG package management, change deltas can be more compact w=
hich may be appropriate for IoT applications with either a constrained netw=
ork interface, battery-powered, or scaled-up population of devices.<br></di=
v></div>

--00000000000028a59205fc762061--

--===============5696529836976176766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5696529836976176766==--
