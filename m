Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9F4C5DF66
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 01:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1BCE6061E;
	Fri, 14 Aug 2026 01:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1pLdN6LR2G5; Fri, 14 Aug 2026 01:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B950160633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786671635;
	bh=hbJVABnfckIpEpD9QeYlae1jX7RIe8bLnJsrO57IC40=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q3DfxnXucC0FFz5gCwYdxVKs0FR9JxS2CmDFCVf+MOP42CZ1OH3PXn0kUJYOySyOF
	 LcgelSAWE4DqGWIv4lGNeNPf27RCqB2bPTXVvvll+SAhGqJyAT1hTgdW5c6SMDEuSm
	 VEqMXcS30sOD0Eh+uhKZAWR2jVjMBNq5xtwwJwMd5542XVMz69z67usseHox8LFAmT
	 HLzb6bPLfYoM1jm4GNzYjhQ1IiCEZMIINTtLaXPSd1eFtLdBgBzG9oGE+5aCO0z2jM
	 O/AcE7hBzVu/F8YvZDzQwxEM/y39MOEpbpbe2RqBG+U8Yuc2QV7Fk6mRwE6Us6ytfD
	 45LuV1W+R4umA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B950160633;
	Fri, 14 Aug 2026 01:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DB68139A
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 01:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1715D81164
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 01:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjYKlkSeQpO4 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 01:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=ocd2057try@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3910781160
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3910781160
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ewwQ8CMU
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3910781160
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 01:40:33 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-84f38f3b36eso267629b3a.1
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 18:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786671632; cv=none;
 d=google.com; s=arc-20260327;
 b=owmdIuuNrwd30Ia40ndzRFKS4xwoTIQ8n36lS9CH+7rV8yc40++RAukBGRTQPn70DE
 bxTKCVfQlC0hiDnS7eBdxFnAIlHoAO9jocBoGSgiMUi6aLqWroLDrmyoJK9laVlA0NEy
 anMcWHh5Z1DJfUaMgg8h6INjN0F97JQWaRlRaSG7lrD9Z+flq2absqHtuP8MPbmMl8kj
 i1yjnMSskmJUmuwuwPfB5uSNDPO7JLDBqMv5WGhhFwfPchT738zNU6hXBzjsyVxVs5Pj
 6PzUHmpALnfudUm5APnEWNoosPmU/Pxmdv3pa0fQfngApmG+LBONlDwoNeOKzCDX6tRi
 yy8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OMer/BKYLXxlnKJ9ZUZnzjlOR6pdqYtYb4uxOW4Ja0M=;
 fh=ldGajbQN5ldNp0fNyRWoCctmVAt336FuobC4mtGh9/4=;
 b=NpZh7k94fSvuWkFMuLurEhMv6n4IiBIG3jHF5WzgabEcF8hy+RRqvKYOaTFq/sM/ce
 ghrzPQzwmIZ+dys/U8myVg/D1v0NTVBzQydV/Sd9TpwRipWDsuCvEN9iG/lTcokg7jK+
 1u4utIlz0RA/a7Ue0VY0XsLuRwxLV9rhoVF8kYzzFNIK+YgsuufC6mMvF+N/rPYJqdbJ
 fngIj2YUUbrLSSgc9AqrbLN0Hn7ov8nyCpXdJuu85R281TFApCKKrFGfw93h/tyj1E5x
 75cI182Hgxim9HaUEO1ka5hwCnwHbma9eyvaiQWL3qFq3eJcFd2LpLWbLMYuB8SlEpVo
 VaCw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786671632; x=1787276432; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=OMer/BKYLXxlnKJ9ZUZnzjlOR6pdqYtYb4uxOW4Ja0M=;
 b=ewwQ8CMU1YWunLdBpDo90o3b0hLmfoY+gD4Wu9OI86lM5kKET8J4BtL9UnHp5TQ/h4
 XmCqNmyzWqqNBeFymtibkaUK7903e8mn1z8pTgFZ1HEecuQcCdWR1apd9e/H40JP/Ikg
 +D9gTVuWpU9Ker3SOZ/ThvxFnGGclzwl/Qsyk9bNlKnjurW/hTn/0MVj4POeGAkMCIQ9
 RKYimPxS8xEu1JF8CBwn6yAhBN0bP9k8ixO5OdWW7fhvyHicN15jhs2Jx9OMfvqIiljz
 ZqRQuPsTT1aoxy3J/5kjCMxk/f63xEKztXbTM/7VLF543StqRj+Wet8vJ/1j+O5X3WyF
 a07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786671632; x=1787276432;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=OMer/BKYLXxlnKJ9ZUZnzjlOR6pdqYtYb4uxOW4Ja0M=;
 b=Lj+xdAHu4BjefC9waGyJRqjkjmwe9nf2xqG1Gg+45x3qhWkoqkXfOFES/0QPqCW4fV
 gj9y0R2FnpWd4GCsZ0X62U6vDtXIarwg4dBi1CVddN91h5Arl/lG3j1oI4G2+nFqaXv9
 EkYKMYf4daktqeIYa50XKHTltQ+GIKaWumI3wBq1PpJuB38vWlQr8F/oXQPH2RjmMZOR
 3+kXdye/0i9M6xcTrae6qOsU1eXYrp749ikTKecto9WlKtuqogcMRhnLZX0CQ62Fq4r0
 mBW2aX4b/3GW5R3PK/Q2/uMqNDaNrX5D2juXoZziCl0y9s+Iymj5RerxmZtbBMYm+FdP
 PPBQ==
X-Gm-Message-State: AOJu0YxWmdWdJf/f3p3+7ywGpy/3f9o4TthO0Pxd5rVipblh3GYWyEsW
 qvIdKRjLZlKs+YSzlWixem74I24alBmzOGXI/+ZIow7tDVvKEy99XnCuGIUcX0nXm+eLCvwf4AP
 ral/pykWR4NDeZt/mrbtRfzg+22AJ9JE=
X-Gm-Gg: AR+sD12gmTQkB/ez54Bwyhg90bHi12nTIznDkQMMLp6nuBArGHLyG8k/xSP/IQxCR6z
 Oa5JJYtSN08wUCv9kUBN6zNcgRvv6zGFpEzniZ7PzRlkKFgfFg34eLYjHkKz8IEWOm7CC0z6rMb
 G4XfKvjy/hpKnzZJJKrb5RZlGBYljQTYPCPofeAUuAvRJ/7/Mam5F6aQxo0s3CnqUWpihU8KDP9
 Odo7ENssRgE971vkWurvYJ3NGCIGihBxpBU07tSBCuNUyYBn9dfVRClWwx/HwNqrYtaqOMAWJX5
 UeY0WrIajLvTsE6EU/BWp1Bj0dfcIPuwfUu74Wso4e7N
X-Received: by 2002:a05:6a00:3981:b0:848:2eac:bfb2 with SMTP id
 d2e1a72fcca58-84fde004804mr2296911b3a.13.1786671631728; Thu, 13 Aug 2026
 18:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260809060542.31279-1-ocd2057try@gmail.com>
 <a207d4fc-58f0-4205-8de4-5b1d2627d8fb@mind.be>
In-Reply-To: <a207d4fc-58f0-4205-8de4-5b1d2627d8fb@mind.be>
From: OCD <ocd2057try@gmail.com>
Date: Fri, 14 Aug 2026 09:40:20 +0800
X-Gm-Features: AUfX_mxSodqRneaEomWkftrHzC5molyuHZKlYR5M6vrQo7tJJitdU1tD5HqtDZA
Message-ID: <CAG5N19cT23RZiW=Eaz8NqiahaSJ3TrVQcpj=KgEm1h0a_2HO6A@mail.gmail.com>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/qt6: bump version to 6.8.4
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
Content-Type: multipart/mixed; boundary="===============3128274515043933717=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3128274515043933717==
Content-Type: multipart/alternative; boundary="000000000000f083020658f7e774"

--000000000000f083020658f7e774
Content-Type: text/plain; charset="UTF-8"

>
> Hi Titouan,
>
> Thank you for pointing this out.
>
> The main reason for this bump was to pick up several Qt Multimedia fixes
> included in 6.8.4:
>
> - a1f3429c releases the memory-backed QVideoFrame after QRhi::endFrame(),
> instead of retaining it for the texture lifetime:
>
> https://github.com/qt/qtmultimedia/commit/a1f3429c4eddd7716b461031ffd7726fa75edc58
>
> - 3356d630 fixes GStreamer memory leaks caused by incorrect object
> ownership:
>
> https://github.com/qt/qtmultimedia/commit/3356d630d78d5305ea22be5a11478a544e70985c
>
> - a24d805c backports the end-of-stream policy needed for QTBUG-129764:
>
> https://github.com/qt/qtmultimedia/commit/a24d805c174086debd7bc04a9048b95793cb612f
>
> All three commits are included in the qtmultimedia v6.8.4-lts-lgpl tag. I
> should have included this motivation in the commit message.
>
> I selected 6.8.4 because it is the latest Qt 6.8 source release available
> from the public Qt archive. There is no public Qt 6.8.5 source archive on
> download.qt.io at this time.
>
> We have not applied CVE-2025-5683-qtimageformats-6.8.patch. It applies to
> qicnshandler.cpp in the separate qtimageformats repository. Buildroot
> 2025.02.x does not provide a Qt 6 qtimageformats package, and the affected
> code is not present in the qt6base or qt6multimedia sources used here.
>
> Therefore, this CVE does not affect the Qt 6 packages updated by this
> patch. The qt6base entry in the security tracker appears to come from the
> Qt CPE mapping.
>
> Kind regards,
> Conghao
>

--000000000000f083020658f7e774
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div style=3D"color:rgb(32,32,32);=
font-family:Menlo,Monaco,Courier New,monospace,MesloLGS Nerd Font Mono,Menl=
o,Monaco,Courier New,monospace;font-size:12px;line-height:18px;white-space:=
pre"><div>Hi Titouan,</div><br><div>Thank you for pointing this out.</div><=
br><div>The main reason for this bump was to pick up several Qt Multimedia =
fixes included in 6.8.4:</div><br><div><span style=3D"color:rgb(149,56,0)">=
-</span> a1f3429c releases the memory-backed QVideoFrame after QRhi::endFra=
me(), instead of retaining it for the texture lifetime:</div><div>  <a href=
=3D"https://github.com/qt/qtmultimedia/commit/a1f3429c4eddd7716b461031ffd77=
26fa75edc58">https://github.com/qt/qtmultimedia/commit/a1f3429c4eddd7716b46=
1031ffd7726fa75edc58</a></div><br><div><span style=3D"color:rgb(149,56,0)">=
-</span> 3356d630 fixes GStreamer memory leaks caused by incorrect object o=
wnership:</div><div>  <a href=3D"https://github.com/qt/qtmultimedia/commit/=
3356d630d78d5305ea22be5a11478a544e70985c">https://github.com/qt/qtmultimedi=
a/commit/3356d630d78d5305ea22be5a11478a544e70985c</a></div><br><div><span s=
tyle=3D"color:rgb(149,56,0)">-</span> a24d805c backports the end-of-stream =
policy needed for QTBUG-129764:</div><div>  <a href=3D"https://github.com/q=
t/qtmultimedia/commit/a24d805c174086debd7bc04a9048b95793cb612f">https://git=
hub.com/qt/qtmultimedia/commit/a24d805c174086debd7bc04a9048b95793cb612f</a>=
</div><br><div>All three commits are included in the qtmultimedia v6.8.4-lt=
s-lgpl tag. I should have included this motivation in the commit message.</=
div><br><div>I selected 6.8.4 because it is the latest Qt 6.8 source releas=
e available from the public Qt archive. There is no public Qt 6.8.5 source =
archive on <a href=3D"http://download.qt.io">download.qt.io</a> at this tim=
e.</div><br><div>We have not applied CVE-2025-5683-qtimageformats-6.8.patch=
. It applies to qicnshandler.cpp in the separate qtimageformats repository.=
 Buildroot 2025.02.x does not provide a Qt 6 qtimageformats package, and th=
e affected code is not present in the qt6base or qt6multimedia sources used=
 here.</div><br><div>Therefore, this CVE does not affect the Qt 6 packages =
updated by this patch. The qt6base entry in the security tracker appears to=
 come from the Qt CPE mapping.</div><br><div>Kind regards,</div><div>Congha=
o</div></div>
</blockquote></div></div>

--000000000000f083020658f7e774--

--===============3128274515043933717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3128274515043933717==--
