Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24134C52D7B
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 09:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A62014019C;
	Tue, 13 Aug 2024 09:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZGyLHOuqOSq; Tue, 13 Aug 2024 09:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65FFB401A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65FFB401A1;
	Tue, 13 Aug 2024 09:21:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF90C1BF3DC
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 09:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DCF5606B6
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 09:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgWO-TB9ciVJ for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 09:21:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com;
 envelope-from=jp.baltazar.mendes@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6FA46069A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6FA46069A
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6FA46069A
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 09:21:41 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6659e81bc68so52918107b3.0
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 02:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723540900; x=1724145700;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t3ywXvE9AyKmQl6FnN+87GEBiCWERl+68D1/wxFmfGk=;
 b=omMUG07pQt67bb2Oc5LyCPRbi62v3dYs+WdIV6v9h/Vw+DH42Mm007vKQBP/rNC0ZU
 Iwu1ota9JVQSzg8+mS2SzpoRx268LJ/P7HPUFade3PonIxtJtuOUc1JeHy+XJiTymllh
 CcfayvSktgFGOrstGNUsTdXD3WMfjUmnOFz2ORFprazeg6e4IPXTrXoSl0/hV3e0rItA
 5+eDYN+vxCgix9mTolK7gqXMowoRlsYhkT9eNoYBncISHM4eNa7pIiVBkSrZRkDp7efH
 iTGI1sx14jzPTbXzVQ+PzjfqxTgSLbsDfHy2Cx/2HAQ6jk1egHq3zjUD0Q6Dv9UhZM9l
 tfRQ==
X-Gm-Message-State: AOJu0YwnjrYjZimvPRsgvX5MlqFpbnbJk+JHtjNfy4u/5+CntQpcxwDP
 dATtanSlTy1wFoP67YHSNUp+a6H0FYaAFGVbKRRe+92/wcduKNZM44GzqVFZ/DfFOQMRieq4dn6
 NyfKHEg2bVAkMHnAsOZyZs6s7w4bH
X-Google-Smtp-Source: AGHT+IFQdx13aBgOJOcRhnz8129CAtFb0tkVJM2TrZ08TCy4O4OcyuAWebttgwrhqkU3R/OFuK8+mXfG/gKq6hyKo0A=
X-Received: by 2002:a05:690c:18:b0:643:92a8:ba00 with SMTP id
 00721157ae682-6a96be50401mr40018317b3.0.1723540900271; Tue, 13 Aug 2024
 02:21:40 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Sm9zw6kgTWVuZGVz?= <jp.baltazar.mendes@gmail.com>
Date: Tue, 13 Aug 2024 11:21:04 +0200
Message-ID: <CAFAK9+dq5Sru4npWX=u1P3y70a5bveavSLRhBoB-6r7wZZyg7A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723540900; x=1724145700; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=t3ywXvE9AyKmQl6FnN+87GEBiCWERl+68D1/wxFmfGk=;
 b=VgeEe44y9IXvyDmKMqJ9rlHvPi9vMuowmT5tqmrrN8OlB1fHcmSliJLE6LiAfvNOWE
 OzVm/U+MLHL+dbNU/5b9NXqZns2lSKundhm1uJDmgol7UOugvIkf/pFSK3ih6PDpj7eA
 QA/aebMY5fRZ9qyjueCRXtNu4P90/dj8s/GVxvjrbIY+N5hKI3od9Sl63iKyuycmzw1O
 vpiO+Gvxh/hv78itcrweNqb5qJ2+WGzyK5H881S6VClssEW93eNL5EUk85qiX1tNfME6
 YoBOkiAVUnL/xftSx65WrUfDb3e9Y8QkrN8SjuYts+0o6VKGZ/68BbI+VELONojQsbQo
 Jn+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VgeEe44y
Subject: [Buildroot] Raspberry Pi SPL
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
Content-Type: multipart/mixed; boundary="===============8014242537731116676=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8014242537731116676==
Content-Type: multipart/alternative; boundary="0000000000001de277061f8d23d8"

--0000000000001de277061f8d23d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm trying to add SPL and kernel redundancy to my system. Currently the
system already has root file system redundancy but SPL seems harder.

The current partition layout is the following:

| U-Boot + Image + rpi_firmware | RootfsA | RootfsB | Data partition |

In my mind there are 2 ways of doing this:

Either U-Boot is moved to its own partition and I have the Image and
rpi_firmware in its own place.

| U-Boot | Image + rpi A | Image + rpi B | RootfsA | RootfsB | Data
partition |

Or I have an actual separate unit that can selectively boot a kernel / run
a Bootloader:

| SPL | U-Boot + Image + rpi A | U-Boot + Image + rpi B | RootfsA |
RootfsB | Data partition |

Keep in mind I have no idea how to do either of these as I'm still quite
unfamiliar with the actual low level booting intricacies.

Thank you in advance,

Jos=C3=A9 Mendes

--0000000000001de277061f8d23d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br>I&#39;m trying to add SPL and kernel redund=
ancy to my system. Currently the system already has root file system redund=
ancy but SPL seems harder.<br><br>The current partition layout is the follo=
wing:<br><br>| U-Boot + Image + rpi_firmware | RootfsA | RootfsB=C2=A0| Dat=
a partition |<br><br>In my mind there are 2 ways of doing this:<br><br>Eith=
er U-Boot is moved to its own partition and I have the Image and rpi_firmwa=
re in its own place.<br><br>| U-Boot | Image + rpi A | Image + rpi B | Root=
fsA=C2=A0| RootfsB | Data partition |<br><br>Or I have an actual separate u=
nit that can selectively boot a kernel / run a Bootloader:<br><br>| SPL | U=
-Boot=C2=A0+ Image + rpi A | U-Boot=C2=A0+ Image=C2=A0+ rpi=C2=A0B | Rootfs=
A | RootfsB=C2=A0| Data partition |<br><br>Keep in mind I have no idea how =
to do either=C2=A0of these as=C2=A0I&#39;m still quite unfamiliar with the =
actual low=C2=A0level booting intricacies.<br><br>Thank you in advance,<br>=
<br>Jos=C3=A9 Mendes</div>

--0000000000001de277061f8d23d8--

--===============8014242537731116676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8014242537731116676==--
