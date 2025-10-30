Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794D6CCF9F0
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 23:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E32B613A0;
	Thu, 30 Oct 2025 23:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id blsvDtJUyhmk; Thu, 30 Oct 2025 23:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24C76611E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24C76611E1;
	Thu, 30 Oct 2025 23:37:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80FEE707
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 23:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 727424061A
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 23:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i68p06ZtcbAU for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 23:37:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86C8B400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86C8B400FE
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86C8B400FE
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 23:37:40 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-784826b775aso20511607b3.2
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 16:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761867459; x=1762472259;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wmv5MUXF1OVlCIswEQcYyT77QBwbJ7KdMFORw/Zysxo=;
 b=Vv52a19XDy6N6m3/+CadkfG/mIxEVN5jz5FlVRKM3sC3WH/coRxm2YcMdl4bXMB6zj
 uaE9oMWWav+kI9gHBONZB1oTURwZq9Uq708YAJJbh7QLmN06QhGiEU/93YBI6HOgCKZA
 7TCLQkDOSQ+I7uK/kZYL7ubqjAJhNiq0JFdtKwq8XRT84QmlfJSWo62B0vdB4dZOHGaN
 ZTdxbAPzmDubWiGygYxLgbWKLUAlUwwMd1IkxruXMj4nWQPPwlkACsD2strBBuoc7p93
 l7hcqoPEX9q1U4bEjmXyvyS8qtGewskUTK7HT8x0H5vqpY+OEX95DjJgjKyMgY0CSu+q
 gO3g==
X-Gm-Message-State: AOJu0YwRB9ShhAA+bX4gSNvv8ZwDvWl1XE8zILGO/x0lebJaD2G65ec9
 018+HXJ7wrG3MNQS7g10uGmtpTBP1ROSNfZGUtz2Zo0omYV5dYRbIL6RWcfV0NvF7mMLE30YCbR
 rDvQksUyrAdC5LyGkr8qToPQsTd8f3AJe9Q==
X-Gm-Gg: ASbGncvg+l1q00rfR+/kCbbXLp5HcXbvv7bnJWXav3TR1q8Y6d4jFVEmtygYteZN3Dq
 yGEwUCemk5IHJ956eyNXAkXLsjcqP9JpKT9qOE0738t5wlimeFM19EEmOvNIa2/SHTjN0cVi0Vg
 XEEr+a4I4xtym62OsIBd+OFbVESGKCFCsWn1Jzr3+WCc7Idb2mTdLR0eHhj/D0C7GUHMvNfQOA0
 zPo0K/fthDCA2fRUoxsHPD6gkEwgcm6rrpg3LaN9PyzYs4CRx3/ci5A94PBvYbCINN3NYR+G0dV
 PGga/Ycl5VVh43NodoZ2nL+w8aU=
X-Google-Smtp-Source: AGHT+IHNBlyueB5KMobAVH429cYV57izgnYBwBWlBEtJjK73qbayRUGgneLfQRBDgWa81ZtoL8yfQ9iZo5r58fUqpdU=
X-Received: by 2002:a05:690c:690a:b0:785:b16a:9bc6 with SMTP id
 00721157ae682-786483e8a28mr12098847b3.4.1761867459070; Thu, 30 Oct 2025
 16:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251030202646.1825077-1-bernd@kuhls.net>
 <20251030202646.1825077-3-bernd@kuhls.net>
In-Reply-To: <20251030202646.1825077-3-bernd@kuhls.net>
From: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Thu, 30 Oct 2025 16:37:12 -0700
X-Gm-Features: AWmQ_blJf70g5QvOo72MVtxxig5VRr2bnHEHHlCZXsuoFG4qq2sQj3m9yvBbVf4
Message-ID: <CAMV0Ro_8cErOj0+GPHc9bpQ3vnKiXhNc6iKfHXfztVmOBNmnew@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761867459; x=1762472259; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wmv5MUXF1OVlCIswEQcYyT77QBwbJ7KdMFORw/Zysxo=;
 b=WaK4hk4EUWYNjQiGC7xSSymOraMfoYRL5BVxfKo3Mrd0ajehzJcOvI6G/rjt9p8mvf
 EmbWCFaqaMojwBywCubX7DrCvtkuJZGjyptkmAuVs7ZnRaYt0Wt3A1CM0zCrxAwuwi0Z
 9GczhD8T7oanolzQ4k/wM5XR7ezjebB04T6WzfJDwG4QTQxpGSVNWRn6rlhfMK5KuTAO
 7sZX5fbrH7PvXeZCehpIoqL9PLOt3Al20LTDFXUTwwkmKFQFXh5ku/sq0BuuFaD5u0SS
 fpIL77FvGmJPRb8AEsU31yRh9FE7CGkXIleZPdEeP/RZReSZ/ILFNOP3KMXKzzDSvN0X
 gJ0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WaK4hk4E
Subject: Re: [Buildroot] [PATCH 2/4] package/expect: remove package
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
Content-Type: multipart/mixed; boundary="===============8234442023360960047=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8234442023360960047==
Content-Type: multipart/alternative; boundary="0000000000000a0e4d064268bca5"

--0000000000000a0e4d064268bca5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bernd,

On Thu, Oct 30, 2025 at 1:27=E2=80=AFPM Bernd Kuhls <bernd@kuhls.net> wrote=
:

> Package is unmaintained and causes build errors with gcc >=3D 14.x:
> https://sourceforge.net/p/expect/bugs/107
>
> Fixes:
>
> https://autobuild.buildroot.net/results/425/425dadaa4a75eae93313511728394=
02a197749a5/
>
> Expect is still used on legacy systems for automation and testing, and
removing it would create overhead for users to maintain it in their
external trees.

Thanks
Akhilesh

--0000000000000a0e4d064268bca5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bernd,</div><div dir=3D"ltr"><br></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 30, 2025=
 at 1:27=E2=80=AFPM Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" targ=
et=3D"_blank">bernd@kuhls.net</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Package is unmaintained and causes build error=
s with gcc &gt;=3D 14.x:<br>
<a href=3D"https://sourceforge.net/p/expect/bugs/107" rel=3D"noreferrer" ta=
rget=3D"_blank">https://sourceforge.net/p/expect/bugs/107</a><br>
<br>
Fixes:<br>
<a href=3D"https://autobuild.buildroot.net/results/425/425dadaa4a75eae93313=
51172839402a197749a5/" rel=3D"noreferrer" target=3D"_blank">https://autobui=
ld.buildroot.net/results/425/425dadaa4a75eae9331351172839402a197749a5/</a><=
br><br></blockquote><div>Expect is still used on legacy systems for automat=
ion and testing, and removing it would create overhead for users to maintai=
n it in their external trees.</div><div><br></div><div>Thanks</div><div>Akh=
ilesh</div></div>
</div>

--0000000000000a0e4d064268bca5--

--===============8234442023360960047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8234442023360960047==--
