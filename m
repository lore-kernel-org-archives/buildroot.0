Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F448C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B22EE403FC;
	Mon, 15 Jul 2024 14:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQqbsmomE2hq; Mon, 15 Jul 2024 14:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BE2C40650
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BE2C40650;
	Mon, 15 Jul 2024 14:54:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE34F1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9D0680FA6
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x7xkRt5fNVWu for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:54:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1AEE80F97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1AEE80F97
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1AEE80F97
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:54:41 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e02b79c6f21so4493681276.2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721055280; x=1721660080;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8MKr38Qh83PWWdpJjFlToRhPPiFOfQ3HcnF5rKSntXQ=;
 b=OfeG2d7+zZQh2S5tnqGtQ6qKtnURnZXbBC8yqqUNieQS1CBwYYcyKY3cR75lyEf1+u
 EoF1ceFJLt1/1cAdQreqSYQnmkQgCZF3YWJ+ETpMwkSt9chyrjoOjQ6dmeiBM0TnTrAT
 oOZee4bxLEcq6Emg4A+3XeBAxYP2fPBjoPD0MFyNw5hL43Aq4LZ4nZYOY35Q+bcqC8zL
 LcBX0MyEkkpIkpiszpbauTnUzj84QUB9BNIFsEWef+/NDRkxVNOaeUKXBK2W2Sc+M0Pb
 FJbdOiEunbv3InOzT97JVWrUjuTbkW1GKARz30Nhk4YTav0OuKvaR8T/O23Ssqk63uHz
 Gseg==
X-Gm-Message-State: AOJu0Ywn+WJWK9puq2kS1NFhZAxQB+BfkUpZz7tIfeZXUMIw8j3FAzgA
 Fe2aPpccJQxCcAs5nwlqAYsmzGurcdZ5kASpV1Ro0mRySvDKARQZ8S7ojSdndkLaPRiuc0t8LYx
 j9bNuGXVbtrX7POSfHj7pDJI3X4s=
X-Google-Smtp-Source: AGHT+IE+uKg+uViMyP7oF/QU+BDOv5G/B0TWXGoqGLkKNaehoNWuxUq4GKLInFEVTXeZQNxu6G7NXJQnsxzgzqzHxeU=
X-Received: by 2002:a25:9004:0:b0:dfb:1e8d:1313 with SMTP id
 3f1490d57ef6-e041b0b91c5mr20405065276.39.1721055280455; Mon, 15 Jul 2024
 07:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240715101607.1288233-1-fred.lefranc+evs@gmail.com>
 <20240715111003.1296141-1-fred.lefranc+evs@gmail.com>
 <20240715160809.351cdc89@windsurf>
In-Reply-To: <20240715160809.351cdc89@windsurf>
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Mon, 15 Jul 2024 16:54:29 +0200
Message-ID: <CAGkXw1V5bnDFuXPOukDKdqNF1FgAo1JjtbRYKS8EYCj0V9bo7g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721055280; x=1721660080; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8MKr38Qh83PWWdpJjFlToRhPPiFOfQ3HcnF5rKSntXQ=;
 b=AWaYColXxCHQpw6OHkBmZsDJS1rGfDeza2CElOVcyIZ7ru+LdiAqB/jiWpW+mggBTj
 NWWd8lOhvVVKAg+Gh6/nr17dIM6aXLqFUAHzfn7SlZrlKF3ntlPFEQ8Wx7EBcmO2u27I
 As/HIKkgEPTJsDjfwMeFUwOZRIvwnD3bktDODCF0iKdQq99f98laSHAK1v7kp6vPCjCD
 jXQQl7Fpg4cwEwhUmWEA/no0htw7Lh6E60bMwSHcSy2hLXW4f0NJkUT8fTtLsNkxoo0a
 WYq6zc279LyAgUjQqBO7kUXI/5qKGNZA92Yfbt5oWYH2VOTOVJrQD0cyWGx2UHXbSSnH
 Yejg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AWaYColX
Subject: Re: [Buildroot] [PATCH v2] package/busybox: fix build with glibc
 2.39
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
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1036358286318125847=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1036358286318125847==
Content-Type: multipart/alternative; boundary="000000000000a167b0061d4a6850"

--000000000000a167b0061d4a6850
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Sorry I've been too fast to write the comment as I merely (incorrectly)
copied one from a systemd's similar patch.

Would this comment work for you?

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing busybox's libcrypt dependency this
broke any busybox build using glibc version 2.39.

To fix this, add the libxcrypt dependency to busybox when
BR2_PACKAGE_LIBXCRYPT is selected. The user still has to select the
libxcrypt package for this patch to work properly.

Regards,
Fred

On Mon, Jul 15, 2024 at 4:08=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Fred,
>
> On Mon, 15 Jul 2024 13:10:02 +0200
> Fred Lefranc <fred.lefranc.evs@gmail.com> wrote:
>
> > When glibc was bumped to version 2.39 in commit
> > b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
> > libcrypt support.
> >
> > As glibc's libcrypt was providing systemd's libcrypt dependency this
> > broke any systemd build using glibc version 2.39.
> >
> > To fix this add the libxcrypt dependency to busybox which is the
> > preferred way of providing libcrypt support in busybox as the glibc
> > variant is only used as a fallback due to being deprecated.
>
> I'm sorry but I don't follow you on this last paragraph, in particular
> the part "as the glibc variant is only used as a fallback due to being
> deprecated".
>
> What happens is that recent glibc versions no longer provide libcrypt,
> so libxcrypt should be used as a replacement. And it's up to the user
> to enable BR2_PACKAGE_LIBXCRYPT if the user enables an applet in the
> Busybox configuration that needs lib(x)crypt features.
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000a167b0061d4a6850
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas,<br><br>Sorry I&#39;ve been too fast to write th=
e comment as I merely (incorrectly) copied one from a systemd&#39;s similar=
 patch.<br><br><div>Would this comment work for you?</div><div><br></div>Wh=
en glibc was bumped to version 2.39 in commit<br>b5680f53d60acf8ff6010082f8=
73438a39bd5d97 it removed the deprecated<br>libcrypt support.<br><br>As gli=
bc&#39;s libcrypt was providing busybox&#39;s libcrypt dependency this<br>b=
roke any busybox build using glibc version 2.39.<br><br>To fix this, add th=
e libxcrypt dependency to busybox when<br>BR2_PACKAGE_LIBXCRYPT is selected=
. The user still has to select the <br>libxcrypt package for this patch to =
work properly. <div><br></div>Regards,<br>Fred</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 15, 2024 at 4:08=
=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin=
.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hello Fred,<br>
<br>
On Mon, 15 Jul 2024 13:10:02 +0200<br>
Fred Lefranc &lt;<a href=3D"mailto:fred.lefranc.evs@gmail.com" target=3D"_b=
lank">fred.lefranc.evs@gmail.com</a>&gt; wrote:<br>
<br>
&gt; When glibc was bumped to version 2.39 in commit<br>
&gt; b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated<br>
&gt; libcrypt support.<br>
&gt; <br>
&gt; As glibc&#39;s libcrypt was providing systemd&#39;s libcrypt dependenc=
y this<br>
&gt; broke any systemd build using glibc version 2.39.<br>
&gt; <br>
&gt; To fix this add the libxcrypt dependency to busybox which is the<br>
&gt; preferred way of providing libcrypt support in busybox as the glibc<br=
>
&gt; variant is only used as a fallback due to being deprecated.<br>
<br>
I&#39;m sorry but I don&#39;t follow you on this last paragraph, in particu=
lar<br>
the part &quot;as the glibc variant is only used as a fallback due to being=
<br>
deprecated&quot;.<br>
<br>
What happens is that recent glibc versions no longer provide libcrypt,<br>
so libxcrypt should be used as a replacement. And it&#39;s up to the user<b=
r>
to enable BR2_PACKAGE_LIBXCRYPT if the user enables an applet in the<br>
Busybox configuration that needs lib(x)crypt features.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000a167b0061d4a6850--

--===============1036358286318125847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1036358286318125847==--
