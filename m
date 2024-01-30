Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6147C47DA9
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 07:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F21D41744;
	Tue, 30 Jan 2024 07:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F21D41744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ClrZHfOz-zo; Tue, 30 Jan 2024 07:52:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4248D404B4;
	Tue, 30 Jan 2024 07:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4248D404B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 264F21BF3B0
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 07:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F325360FF8
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 07:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F325360FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mnb490ARvAcT for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 07:52:35 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 047F160FF3
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 07:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 047F160FF3
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5110c166d70so3373092e87.1
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 23:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706601152; x=1707205952;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=APHOc28iiVSBJgSP+ziGEFxbNTIhptkSA3ZFpXVa0l8=;
 b=pSR7213h0Sd8HPiLairaiNG3xijfr+OZTO3LgrwRPTnc2XZkHWYu8PJgzSSU5bKsil
 NZ9bVcnDJVLOBgHx9Sv7SGoeJ2uOZQbi6xr0K/9XL7ErTIAKkQF6aRjHXeDsf84r9kTA
 AtSHACCu+CuVZHtbqonG7iP/0z+6yZWXb/1qmnbtjnrfBCSM83PSd9y2dJc3RbFc9jpz
 /ENr+PAt4YsZk7WZcXHx1kZdZvFaiWC+uOa1TisLbcUi1YwGOr16RtUUuJazo6am+wPA
 7gSW2ijqQ+2RYL/ErjrHWW1zYlyF0Vf0IPunp/vt+1IJPQdg3PLM/oOhPunGNwGECLoy
 vU1Q==
X-Gm-Message-State: AOJu0Ywqzk8yctoNjo17pIycogW0rplSd3G/gCB3Ymj6Ji1quD0LsN0j
 dnWPq5QLK4PUyhvLMNK635JRYLH185et0cOzu90dKa81ztjNOBZwFcy6WHEjJdHCrg+2/HbOPDF
 nBTIGnAF2SzgC+eT26kCiMKvmTKgedJVK
X-Google-Smtp-Source: AGHT+IFNA895ptjh23pZqWYPncElqNGIdB+sKqYFn0u36wn3V2OwcgdU9bTkX7DIJv2uysMuWsXdV4zemMOKRvYZxVA=
X-Received: by 2002:a05:6512:684:b0:50e:d636:6be8 with SMTP id
 t4-20020a056512068400b0050ed6366be8mr5057398lfe.48.1706601151998; Mon, 29 Jan
 2024 23:52:31 -0800 (PST)
MIME-Version: 1.0
From: Zvi Vered <veredz72@gmail.com>
Date: Tue, 30 Jan 2024 09:54:53 +0200
Message-ID: <CABRndgy7KsqtSyzJJaw9r6a7c9atEpPQpbbJgGn2qY=yi=nLFg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706601152; x=1707205952; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=APHOc28iiVSBJgSP+ziGEFxbNTIhptkSA3ZFpXVa0l8=;
 b=fM7+5wsXJ510FBKhMqZEiuNvvtrPjIawvF/UOELl+z/Ve5dfZco786DQC1gSo5gVrz
 4Dp8e0g+BtXthvMxx2UkOSE0Z2zn6yOtu0G+niKDN294O43iJa49rme1tVRHvhRHBpge
 39TbFeC+654uhvD31R/8bcJPL0lE7vAoPyUw0rG5PQYfyzgTLmC8WmhH7smD0iJmWzfy
 UPZQqI2ypPWEfe8W0Ky2fznt6zru5YPMXiXxorJuUBHafkYRJ/j/bGMQ2WUK8AbiED/X
 5bbYdvA7AS8gsDK5yFDvqG5rN3eu0epyRI7Fo6NwZD00u1eUGhMuLa7qEn13L+tHTAz0
 EocQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fM7+5wsX
Subject: [Buildroot] LKUS in buildroot 2023.02.9
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
Content-Type: multipart/mixed; boundary="===============7084573452843154848=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7084573452843154848==
Content-Type: multipart/alternative; boundary="000000000000702e780610250bf0"

--000000000000702e780610250bf0
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm booting an x86 Intel CPU using Linux 4.9.20 (32 bits) and buildroot
2023.02.9
I consider using LKUS in order to encrypt the disk.
Is it a wise decision ?

The motivation: If someone will steal the disk, it will be difficult to
copy its contents.

I can not use hardware encryption because I cannot replace the disk.

Thank you,
Zvika

--000000000000702e780610250bf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m booting an x86 Intel CPU=
 using Linux 4.9.20 (32 bits) and buildroot 2023.02.9=C2=A0</div><div>I con=
sider using LKUS in order to encrypt the disk.</div><div>Is it a wise decis=
ion=C2=A0?</div><div><br></div><div>The motivation: If someone will steal t=
he disk, it will be difficult to copy its contents.=C2=A0</div><div><br></d=
iv><div>I can not use hardware encryption because I cannot replace the disk=
.<br></div><div><br></div><div>Thank you,</div><div>Zvika=C2=A0</div><div><=
br></div></div>

--000000000000702e780610250bf0--

--===============7084573452843154848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7084573452843154848==--
