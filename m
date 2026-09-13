Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006E3C88E63
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B76B40593;
	Sun, 13 Sep 2026 19:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ctrOa8xmVy3; Sun, 13 Sep 2026 19:03:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5FC07405A4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789326201;
	b=jYycwJu3Sa/TLIk+sV9ck2d9P3/MLV00vjM5dA5JuTOYCbDMZfA4PgKYNLIZkv0mJBFg
	 CYPnDMfwT0/yN6izfuzrLsWo6MvNVkDSexEKFjiDV1GMpOnI+gu/fo0on+4ap8EciUA0b
	 4OX3SG42U8sPlAlySoI1W0YLhpf88eBu/tdM6Xf7n9o0IuGyXOKzl7/6prXmrOIbzZ77c
	 +b0YiGJLQZG7NYayb7RwBUZDdQoDXQU2lLNRijLXYs4UbJfqRzSEhj0I3v03cm9HOhJ+3
	 ng4SuO6b90iFWza2hHZ83PDvzjSGszpW6scNfPL8K02XFeYqRmjEdW38luCqjLkhwEg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789326201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=SlX8//rNzAEpJCqfiaAVb0JRKvI5toWxV32Rr4ZpEn4=;
	b=XW2T77EYCKddrDfraIV4sYHeVgloXb3tNFyhGYLBBtd6VlQ8AssienUgh6C+vMbH52hP
	 ol6OemdGuwO1su9o0DuaQICfhbqk0miw+HbYRFdUpi+QZO9d8PwlZQJsVsG4FFMpccT3i
	 khlN6qRHL2c91QF29OcQ3RKdBPJPjOu+L0YZnaVNV7oHOe73n+2zggHTe5GEQKWCHmOsu
	 SVFTGXFnF6/oE/pn5kLHq++kX/iYvibjTLHAbYr67ls5jS+GYfQfgViPDL3MiDN1QZLI3
	 IiuJVbSD8V+tCO6d7zZxPtlvgwYfiCG8f6Q+dI4mANg+DySzrf6+4pl1BJivY5Bacxg==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789326201;
	bh=SlX8//rNzAEpJCqfiaAVb0JRKvI5toWxV32Rr4ZpEn4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AU/scckVki88b9+sz3CoZDJJ1K65tr5t/6WVlZqZM8aY5w0RydYHtNDzS9JysyLIA
	 Hd72VqpITIEHRi4oNzeB6CVVcxDNJoURsDbfRL4pS7nHiBhucUlz2AUyPKsioLbAEe
	 99+9LlDI1cpGsXUq4s8Jo8Q8GxNKflogHhW7gZfzrOXFTkwQb9XUAz0yXS0dhoztVu
	 8QKQ4BWUtAGPU1xsFNM3ulvmNmP6zOiHGjoQhKonPLEw0Kwe96lhzNiU4lc9+KxQJA
	 IxkrlCG/EbqqKES4ebuxeGIqly5nIGT8AqkgKrWYC62QUSBwkh6X2cu2M2kvLV6rRc
	 yV8N6Y+Ozy5MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC07405A4;
	Sun, 13 Sep 2026 19:03:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7587624D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B62080C9A
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nl00FvozlBIm for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:03:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EF4568086C
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:3a::f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1789326198;
 b=cODZ5Q3g3Igm1oYsUWeuxNaY8bk8RMBofXCiFlUN94R+O8kPQg9GyJZUHRtxgFuES5Ud
 FE9/yW2saDvy/OzyQi9EZXqOOlIcWzVZ4TFoWSNQqw4+apZ4xpx3XhF23hPXvqPprYNWi
 IEFRv+CGHTwxbVcWPWwCWiWptxiQt5PkvbxZBH3tWupkgdiceRfBauq6PDmdAH5WBzUYg
 Kvx/Ub8JvclmFwhXc4ddzHXWpEpypuMO2F/l/A96hO2hRfb70jpT+CNFtQVkdu6GMyerR
 e12o3WIsUQEdoSo8lzjX/KLx+C4mPEPClfhcKlqFRdCxbSnwa3rvCgC+QrMcUpvhcxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789326198;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type;
 bh=vVbVLtZEnbZj7rNhGeRymCTzU7YAZ/x253j4rhoEQ6c=;
 b=b4ZOkisD3sDxJmOoTusvsfwOIFWTWQ99MaYKgEYpSbxEXbBmScPx0ZDK8z/Z2SeFkcIZ
 6bEctmo9asmoBVovfb+rzBD07pBy3OvTzrz+jJDPbQMKIcgGc17oX6KASo23Tl6zo39/b
 HSWA13MbarzEzLGY8UqIPoJ8PdsdzzxgnnDyFi/Dtgcj/Mij1q4JzLgwPeP5Kt96HzThT
 EM7z1tUYmYTK/41qtHgoH3Id+Av+ZYzrq2YdSoRpIfupfEPqEtFS8yXe6qIiezkdtRmig
 bsTaXUo9uteJ16578vwH0dRQ7waUamMCNLfsLxs4/R33HCiZ2ME2U2WQ0V6r6VhQYmw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="St79/l2V"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:3a::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:3a::f;
 helo=mail-vs2-x0f.google.com; envelope-from=francois.perrad.86@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=St79/l2V
Received: from mail-vs2-x0f.google.com (mail-vs2-x0f.google.com
 [IPv6:2a00:1450:4864:3a::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF4568086C
 for <buildroot@busybox.net>; Sun, 13 Sep 2026 19:03:17 +0000 (UTC)
Received: by mail-vs2-x0f.google.com with SMTP id
 ada2fe7eead31-79022baa364so344329137.1
 for <buildroot@busybox.net>; Sun, 13 Sep 2026 12:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789326196; cv=none;
 d=google.com; s=arc-20260327;
 b=iIRwz2JUKakRsar9RAb6VKWWEISHyKAOPPwgRJC+PERAUtIB5vIl82VUUfoMn0h5PZ
 ktSMQYCoM1XRMQ1iOZoQe9wiPY7YB7zD4irMfKJvheUIsSN/Mp863a3CJ3EZ5zsS5S53
 5RNrSjQqgZ0nJjYUi6ll85FPkVyYgcl5YxWltSR82f84otjKKtbetrqph4ygU9JMJVJx
 F9kZf/9YINzKtPJ9SXNzET7pWa+j1H0hjpchIXbzpotBH3+ieDYbNFTnQ0i8Hp3uSTdC
 8/L8K5PGZ+GUcyk8zgvL+aewNKvD8R4y7qXhP61pVTGMekf7vuBU64dpdJsDXAV8PJlM
 9fuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vVbVLtZEnbZj7rNhGeRymCTzU7YAZ/x253j4rhoEQ6c=;
 fh=J6ywOFdhM/uDHB/p6B23q5fRdRpCJ7kirBPCytknF+s=;
 b=ne0pPZF5qitdpr/DjEDKDmu1BRsI04xStHL9iAEZVf6Zw447Y4rwMSw9O4ANfMK6o4
 5HuJCtYYh/8Y0GVJGjJBYR8Q8+Xy6vGJ0qwPCbgPsA9T4P7s4pmgVc6avyPHnAAaHtLu
 IJi/3AYYMbsd+8eDP41VOCpJAWU/IJHr3u3jHYWmrnKrQqhiKNkXaPxiSlz182f27564
 GpJm1OIrwTKeLiy2n+8xzNalba5iT8lb6ThrkrusJkid9r44xzqYOp207Alqi+1oTt0q
 eQvPCD/6Cnef5WiIbspD/abwyJci8vO0moeVBhn7ytlyZYaEYlbiNrxyOOzybwB8j8+7
 OG/g==; darn=busybox.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789326196; x=1789930996; darn=busybox.net;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=vVbVLtZEnbZj7rNhGeRymCTzU7YAZ/x253j4rhoEQ6c=;
 b=St79/l2V4pyA4u0X2y7YcqsBhEUmmHzB7NP/FEXdIzZ+kPsScsaecMnXKC09U+ovCT
 L/KCC0eDhpZnw/Yq5Ngzr34GT82MUSEnmzOJvuPxOBsRzB1V/AMtYckOhj9vHi9aqCmx
 poXkaEux6b0AHJ3vopAEfdQiDos8l/QNlhd7NAdTvWW5EUXdRMJaAaRKrXtt6jo8uCv8
 3mfr++1M0TecPrlT14xdaYb//EBfNs8U6KPJeli1Bu1U9AF9oQPNTcDmgRzbP7Dk7eyX
 l9zyQsRUIM9pbsEoM3qUE0r0ifFOAY8gpNKV0ZNdVMHPrDIIh/03gHcAg0M5dT5QdJuZ
 xV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789326196; x=1789930996;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=vVbVLtZEnbZj7rNhGeRymCTzU7YAZ/x253j4rhoEQ6c=;
 b=V56oCKZQz9cnit0AufcCSLv67iaWd/UbrxdDid9mqoxIRJNwGyZ+AG6Z1Nna2IfBQg
 dGwPprMG/NfdGAAKmVAZ8NVvP5jO1gAmYKoyxjatTnFDWUhZjVf5cZY8TbHs+ecqLGHt
 EqukPhD9ilB5YMqlTbdPMpGeZvL/FiH9qM34ODPlU5bl6TWpDJT1pz3+LxnKT4PvmfK5
 RckjoK6SwHponu2yRqRbu6F8cMeFkIE3XibfHI5C8p6Bl1B+EHxh1sANdNdRk4TWb46e
 3Wo+jCAazYBCUM9GeoBLpUrJMLvlpiKWBQ07EKzysJp0q4MbDNCQ69lNYnaZSUj16FR1
 Txlg==
X-Gm-Message-State: AFuF++n+inesTWvUEZ42qj5DEtt7T/Sutepqy6rCwD89Wv6ZeCv7dw90
 YrDS0cIXZwO4CWVW/82XbtqIDaOfZzD6/BKhBUqBJ4KkjwLYPcPMZjpOIfXQGyHbUd7DN5mAJaV
 lkIQ96/8i00riUZJ5UsCf0O1IHNO63kY=
X-Gm-Gg: AYBFou1C/AnqYVB1T4neZA9kUvk2nlxwSUpdiSXU+kb88gjjifwvPndxF9I0YO+p3+s
 yljsauNln16PZ0U17l5X39VQIyw1gDW9cs1L4HdJZzYZcNK5ZyqE7PSEgjUnis45SvfhWiSDvt3
 oPchTaZymuRma1c38BV+vkaIjuLVecUZcikwLtiszgG4/TYeKJBKNDdz44xwdnxsTBVEUqqxSR1
 lAVX0VPay8z7Npc0U+T1B6P/fIF2SOb2wuagJWUgErH6nygvZCBtGMvhRc6oCIzCB83rMtzYws/
 eaRvGCHRswaGJjmPUA817KF8SvNEXp0SrqO2kpQn20RekQw/W1m9jDTjW11rctiIotsvPcoLmvV
 lsuS55tJhiDrtUJ7Kf+teHG7yWw==
X-Received: by 2002:a05:6102:3a0e:b0:79a:a5eb:e7d6 with SMTP id
 ada2fe7eead31-79aa5ebf218mr95405137.2.1789326195955; Sun, 13 Sep 2026
 12:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260911080611.55857-1-francois.perrad.86@gmail.com>
 <20260911080611.55857-3-francois.perrad.86@gmail.com>
 <aqZSBEd2SO0aHS6V@windsurf>
 <CAMTop881hu=pLy=3N+rPNtorZFawAC54-xfvWbfAaPz7UrE+Bg@mail.gmail.com>
 <aqZvcahE2rYBiBL6@windsurf>
In-Reply-To: <aqZvcahE2rYBiBL6@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Sun, 13 Sep 2026 21:03:05 +0200
X-Gm-Features: AcwNN1Xeb4TPXrYurXYN1LnQNhjo1W8a5MDXjZW6u0IBxCSo_6Q4BiC2Z5h9gts
Message-ID: <CAMTop88UPXqzwQHz0suGGjQaA6hBWO_k9iNjqvT9zWZQUcMHKw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Subject: Re: [Buildroot] [PATCH 3/3] package/lua-lunix: fix incompatible
 pointer types
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
Content-Type: multipart/mixed; boundary="===============3361375796353215253=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3361375796353215253==
Content-Type: multipart/alternative; boundary="0000000000004c1ad9065b61f81d"

--0000000000004c1ad9065b61f81d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 13 sept. 2026 =C3=A0 11:43, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> On Sun, Sep 13, 2026 at 11:30:45AM +0200, Fran=C3=A7ois PERRAD wrote:
>
> > the version (=3D date) of this package is quite old : 20220331
> > on autobuild, there are failures, only since 2026 (see [4]https://
> > autobuild.buildroot.org/?reason=3Dlua-lunix-20220331-1&step=3D100)
> > so, I think that the issue is appeared with gcc 15.
>
> Thanks, but we need more than "I think". Test the build with gcc 14,
> then gcc 15, and verify if that is really the thing that causes the
> build failure. Otherwise it's basically us maintainers who have to do
> this, and we have 700+ pending patches that need review, which is why
> we are asking contributors to do this investigation effort.
>
> Thanks for your contribution!
>
>
autobuilder does these tests (https://
autobuild.buildroot.org/?reason=3Dlua-lunix-20220331-1&step=3D100).
there are no failure in branch 2025.02.x, which uses gcc 14 or lower.
there are failure in branch master, when using gcc 15.
so, this patch is for branch master and 2026.08.x.

Fran=C3=A7ois


> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000004c1ad9065b61f81d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 13=
 sept. 2026 =C3=A0=C2=A011:43, Thomas Petazzoni &lt;<a href=3D"mailto:thoma=
s.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, =
Sep 13, 2026 at 11:30:45AM +0200, Fran=C3=A7ois PERRAD wrote:<br>
<br>
&gt; the version (=3D date) of this package is quite old : 20220331<br>
&gt; on autobuild, there are failures, only since 2026 (see [4]https://<br>
&gt; <a href=3D"http://autobuild.buildroot.org/?reason=3Dlua-lunix-20220331=
-1&amp;step=3D100" rel=3D"noreferrer" target=3D"_blank">autobuild.buildroot=
.org/?reason=3Dlua-lunix-20220331-1&amp;step=3D100</a>)<br>
&gt; so, I think that the issue is appeared with gcc 15.<br>
<br>
Thanks, but we need more than &quot;I think&quot;. Test the build with gcc =
14,<br>
then gcc 15, and verify if that is really the thing that causes the<br>
build failure. Otherwise it&#39;s basically us maintainers who have to do<b=
r>
this, and we have 700+ pending patches that need review, which is why<br>
we are asking contributors to do this investigation effort.<br>
<br>
Thanks for your contribution!<br>
<br></blockquote><div><br></div><div>autobuilder does these tests (https://=
<a href=3D"http://autobuild.buildroot.org/?reason=3Dlua-lunix-20220331-1&am=
p;step=3D100" rel=3D"noreferrer" target=3D"_blank">autobuild.buildroot.org/=
?reason=3Dlua-lunix-20220331-1&amp;step=3D100</a>).<br>there are no failure=
 in branch 2025.02.x, which uses gcc 14 or lower.<br>there are failure in b=
ranch master, when using gcc 15.<br>so, this patch is for branch master and=
 2026.08.x.</div><div><br></div><div>Fran=C3=A7ois</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000004c1ad9065b61f81d--

--===============3361375796353215253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3361375796353215253==--
