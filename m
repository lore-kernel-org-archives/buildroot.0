Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1780CC4345F
	for <buildroot@archiver.kernel.org>; Tue, 23 Apr 2024 11:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 941FC4119D;
	Tue, 23 Apr 2024 11:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KjZNLM4uPSQ; Tue, 23 Apr 2024 11:33:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3712440CA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3712440CA1;
	Tue, 23 Apr 2024 11:33:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7171BF5B5
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 11:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37E46608B2
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 11:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CmIBBMSF5Dm for <buildroot@lists.busybox.net>;
 Tue, 23 Apr 2024 11:33:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB2A0605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB2A0605C3
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB2A0605C3
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 11:33:17 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a559b919303so345676666b.1
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 04:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713871996; x=1714476796;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5adCZbDMsYVc0Hk+xunVIAE40K5WOWNLoAa15hmd680=;
 b=pVhnjdECBujRcDAil5Lkh7Kedtr1qjVi1is2Yj0xEGYhsC8UNtI/yQcjhYFn6L1Kwa
 bCXaaKSS3eyBEvXvdLyE/l6DII/O4IouCYykZCO+FO1DDa3eKy1hdr+9CC4UVu8iCRF+
 kW3mTTAg8HQEzsUOzfm8gOHUqrwyWKSFUXF3K72g8KAYgsb8QEAbGz/ukVLpJZ3MqbAl
 1SX03k/BdsmOiSBCG/wVxZV6/jthz2MXhggKLNDRDfGI2y2Jwh/x+TNXKyLiTsI/HK9W
 6Q0s3Juf7GQgvcbp3VDCH9zyyxboXsZYhBcePXHkADlzjJVoOGJwRxndIKgurNksgE26
 3bnA==
X-Gm-Message-State: AOJu0YyhL3zOw72sOvMsc6y6+C9BxXvrzfyW2ruLvHe+dScmgLv8AZoh
 tA/qKnbsuReBGEQYRAt+7oveP5XpKTphNRA5PTidG63ygFoF/4flcT9afaZYAw7QCkdn3ggk+DP
 DmD+tQZ7duiGC+fBMicw932qM5IyCsq29As9GHO3IPfO/dQIq0c/4m+LTt30Llw==
X-Google-Smtp-Source: AGHT+IGtPnsn44TTeHiiQfzUFOp2VYsqzzvkoiBjEsmNl6p6pwu88jZ65dccqn3g9Y2SrKBXWNevfw==
X-Received: by 2002:a17:906:3412:b0:a55:bd0a:9ddb with SMTP id
 c18-20020a170906341200b00a55bd0a9ddbmr3974230ejb.63.1713871995752; 
 Tue, 23 Apr 2024 04:33:15 -0700 (PDT)
Received: from theia ([2a02:8109:8abb:b200:c1b:e970:931c:13])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a1709063e5600b00a5209dc79c1sm7027985eji.146.2024.04.23.04.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 04:33:15 -0700 (PDT)
Date: Tue, 23 Apr 2024 13:33:13 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240423113313.GB527510@theia>
Mail-Followup-To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1713871996; x=1714476796; darn=buildroot.org; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5adCZbDMsYVc0Hk+xunVIAE40K5WOWNLoAa15hmd680=;
 b=rsF/jSlwKmeakUy4ZS4UfiN5CSnKFFE/3Tlu4BL0QviYdj6o7EX/m8YsNlg8RQNW0G
 7fPYVC3wxPTcigsnpdBaWE5cGBtj07tIhnoOjNFme3HCpz9mQTecf385uxKBrz0K5Fyz
 Ujmwgry71Dl6tcoXMF7EHiIK0QtxqDepxZtEV2wKJQ//ZBulJKDgo8gEegKJpMECUrX7
 Tn/Xkm/Czdms3+qItN133aNTQmUB2r3MgMHxAhEeS5iDC3sV6JMMTP7ooIbOBSUBu3Xa
 O333CERW9Of91K6IwutviqkugPmyRTddBCjy5H8JnDmQdKYW5vCffdLtLuCppM+b0tjY
 sWtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=rsF/jSlw
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

I tried your patch, but it didn't work for me. bmaptool failed with an
error. The issue was that my home directory is encrypted using ecryptfs.
This does not implement all ioctl options that are needed for bmaptool
to read the block allocation of the image file. There also seem to be
issues with ZFS, so I would recommend to not enable this by default for
defconfigs.

A workaround for the issue described above would be to sparse copy the
image to a mktemp file and run bmaptool on that. However that will only
work if /tmp uses tmpfs (iiuc). And will potentially eat a lot of memory
for this step.

I generally like the approach of bmaptool and think including this in
buildroot seems like a good idea. Maybe the documentation should also
include a section on that in "14.1 Boot the generated images". Currently
it only covers NFS boot and Live CD. Different optimizations for sdcard
flashing seem to be missing.

Best,
Gero

-- =




---


grandcentrix GmbH | A Vodafone Company =B7 Holzmarkt 1 =B7 50676 =

*Cologne* | Phoenixseestrasse 18 =B7 44263 *Dortmund* =B7 Germany
| in =

<https://www.linkedin.com/company/grandcentrix> | phone: +49-221-677-860-0 =

| email: hello@grandcentrix.net <mailto:hello@grandcentrix.net>


grandcentrix cares about privacy =

<https://grandcentrix.net/de/pages/privacymail/>

Amtsgericht K=F6ln | HRB  =

70119 | Gesch=E4ftsf=FChrer: M. Kr=F6mer,  R. H=E4nel | USt.-IdNr.: DE26633=
3969

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
