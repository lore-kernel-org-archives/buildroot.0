Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D72C77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 16:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 899DD6FE79;
	Mon,  8 May 2023 16:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 899DD6FE79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VFJwlAk41Ywf; Mon,  8 May 2023 16:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDCB76FF00;
	Mon,  8 May 2023 16:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDCB76FF00
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2396C1BF35B
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C5B0420B0
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 16:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C5B0420B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ElL6h8kWS3Jg for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 16:52:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ACD94208B
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8ACD94208B
 for <buildroot@buildroot.org>; Mon,  8 May 2023 16:52:11 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4f1411e8111so5335850e87.1
 for <buildroot@buildroot.org>; Mon, 08 May 2023 09:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683564729; x=1686156729;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8OuXJEJ7BwtiJ18MlsJfa39+ESQAfDrryOUjLBKa+KY=;
 b=KikrMAYxhGrRFtAknA7XI3Wjh153Ysa+waRUWF/Ntl5z+G0QqJ3bpEHdsDJOiH/wIt
 LzkjEbmkK2BvA/z6sdE4v+KZOW50fjNVUM9+57U19c8rJEUhdaiYJaVOymtw3HDl+3Kq
 jl6XfByQ8adkt3uRi3NO2PfmjcSSmpW9DLR/QqHogJCiRk+U1g4Fz8J/8AG9BTKyhbDV
 HXdnqRyuklrVicslzk5Eoolr/8hgwk8VLnhLSakIOBiya8/FadAVvLXjbYxKMnT5lyjr
 VQacH/6XMPaWQB/GAF0mzLh8ahkxAYor7xKsmZNq7kYlyI3kgi7mR1zZOBbfuDLt4yLB
 BrhA==
X-Gm-Message-State: AC+VfDzDFgtO+pPpXdFS7C/Bn+c4ajL7qGcZtGscN8JkOpl71upe6yyw
 RKk3iogy9vwQQWb3+QwgmjZL+q5tqIB+hfjm
X-Google-Smtp-Source: ACHHUZ5SMbimBHDUtp4ee0F81/U8gUiRVsLrw5kkyp8+8nRLstGAqLVyJJ2KUYrdZbi+xvtbKte17g==
X-Received: by 2002:a05:6512:208:b0:4f1:866d:9b01 with SMTP id
 a8-20020a056512020800b004f1866d9b01mr1811827lfo.3.1683564728951; 
 Mon, 08 May 2023 09:52:08 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 a16-20020a056512391000b004f0c9120a41sm41715lfu.214.2023.05.08.09.52.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 09:52:08 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-4f1411e8111so5335822e87.1
 for <buildroot@buildroot.org>; Mon, 08 May 2023 09:52:08 -0700 (PDT)
X-Received: by 2002:a19:ac48:0:b0:4ef:d482:9c91 with SMTP id
 r8-20020a19ac48000000b004efd4829c91mr2479150lfc.47.1683564728622; Mon, 08 May
 2023 09:52:08 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 8 May 2023 18:51:57 +0200
X-Gmail-Original-Message-ID: <CACXRmJiBdi1U4efVAryrFeF_xMAyfQ7-+Wnv=4BHNhRpS5C=Dw@mail.gmail.com>
Message-ID: <CACXRmJiBdi1U4efVAryrFeF_xMAyfQ7-+Wnv=4BHNhRpS5C=Dw@mail.gmail.com>
To: giulio.benetti@benettiengineering.com
Subject: Re: [Buildroot] [PATCH 1/2] package/libgtk3: fix build failure on
 libinput due to the presence of atk-bridge-2.0 in gtk+-3.0.pc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6398827344967716976=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6398827344967716976==
Content-Type: multipart/alternative; boundary="0000000000009b253e05fb31756c"

--0000000000009b253e05fb31756c
Content-Type: text/plain; charset="UTF-8"

Hi,

The patch is dropped on master:
https://git.buildroot.net/buildroot/commit/?id=05f9c34ad0b6bb3ef719db3df5fb44e3d6a5c2aa

So this patch can be dropped.

Kr,

Thomas

--0000000000009b253e05fb31756c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">The patc=
h is dropped on master:</div><div dir=3D"auto"><a href=3D"https://git.build=
root.net/buildroot/commit/?id=3D05f9c34ad0b6bb3ef719db3df5fb44e3d6a5c2aa">h=
ttps://git.buildroot.net/buildroot/commit/?id=3D05f9c34ad0b6bb3ef719db3df5f=
b44e3d6a5c2aa</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">So thi=
s patch can be dropped.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Kr,=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thomas=
=C2=A0</div></div>

--0000000000009b253e05fb31756c--

--===============6398827344967716976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6398827344967716976==--
