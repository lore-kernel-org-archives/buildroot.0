Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B517CC25B78
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 17:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7559E402F5;
	Thu, 16 May 2024 17:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLYUs6Padtx1; Thu, 16 May 2024 17:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7577941D76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7577941D76;
	Thu, 16 May 2024 17:33:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BCF61BF841
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 17:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02E8A41D77
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 17:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBd6M5dAF9-n for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 17:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.173;
 helo=mail-lj1-f173.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE4D3402C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE4D3402C6
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE4D3402C6
 for <buildroot@buildroot.org>; Thu, 16 May 2024 17:33:36 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2e27277d2c1so14926991fa.2
 for <buildroot@buildroot.org>; Thu, 16 May 2024 10:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715880814; x=1716485614;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FatcadfIOcubU7AwiVNy1FYw7DSzl9CGVHJvsLskBHk=;
 b=etW3YZmsGqYTE5JP5W45LkBQzN7zj7VoPEDv+1hfOdYsecRRR1IWEzhfAemKJBJ/I/
 jrK7TA3YsCKz9PMWE0s0zddKNbZ/lEzvOzydYxroCDmVW4qljJC7ISNzNLoUE97Jir0f
 n7q4hJBcLAczyujzjLM6Udi8vOimBwePIqg/vthGL5H6cB1VsbQmKNzQVU4x0SMks29Q
 IP08GpRxPSG4bO61FEoOkgSCsbeu7LnrwvmqxkIeZFGGvySiCNg5YL/dT9fOowJvdUxN
 /2gbOHpzBCl8NEB8uGHxJ28GgcuZ3IJ3NRODAFrP1ysHwAJmmbgs+tbPEbgFS88DYMEw
 vlBQ==
X-Gm-Message-State: AOJu0YxYf6Q2kM7fZv+2KMIPbJP+LbtkPK6sJ2bAqTlrow7gphVenQop
 /5Cmh8fA10q+HD7HPZaxkLspn++3LFg+WraRRE8yr1K1n2WdTkreExC8IQ==
X-Google-Smtp-Source: AGHT+IHiXqI1XJKS3nV/NVOetJd3U2yoZMiZcrOdHMqM2mVEgQFYkDiiHTI9YHG7cxkacNoJVfmiqA==
X-Received: by 2002:a2e:9410:0:b0:2e5:1dae:178b with SMTP id
 38308e7fff4ca-2e5204cd07cmr118832411fa.50.1715880813972; 
 Thu, 16 May 2024 10:33:33 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e6f641833dsm6103301fa.45.2024.05.16.10.33.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 10:33:33 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5238b5c080cso1416372e87.1
 for <buildroot@buildroot.org>; Thu, 16 May 2024 10:33:33 -0700 (PDT)
X-Received: by 2002:a05:6512:b88:b0:523:b19a:2602 with SMTP id
 2adb3069b0e04-523b19a2849mr2382990e87.54.1715880813167; Thu, 16 May 2024
 10:33:33 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 16 May 2024 19:33:19 +0200
X-Gmail-Original-Message-ID: <CACXRmJgPqvXJYt3Q2xh3abjoGxSs_AHXF6xPELYqc1M5ZTG_-w@mail.gmail.com>
Message-ID: <CACXRmJgPqvXJYt3Q2xh3abjoGxSs_AHXF6xPELYqc1M5ZTG_-w@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH 1/1] package/syslog-ng: fix libcurl build
 without C++
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2781985359537544682=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2781985359537544682==
Content-Type: multipart/alternative; boundary="0000000000005892c4061895a293"

--0000000000005892c4061895a293
Content-Type: text/plain; charset="UTF-8"

Hi Fabrice, All,


I saw a very similar issue when using libressl.
https://github.com/syslog-ng/syslog-ng/issues/4923

Perhaps, the usage of libopenssl should also be added to the condition.


Kr,

Thomas

--0000000000005892c4061895a293
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Fabrice, All,=C2=A0<div dir=3D"auto"><br></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">I saw a very similar issue when usin=
g libressl.=C2=A0</div><div dir=3D"auto"><a href=3D"https://github.com/sysl=
og-ng/syslog-ng/issues/4923">https://github.com/syslog-ng/syslog-ng/issues/=
4923</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Perhaps, th=
e usage of libopenssl should also be added to the condition.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Kr,=C2=A0=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thomas=C2=A0</div></div=
>

--0000000000005892c4061895a293--

--===============2781985359537544682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2781985359537544682==--
