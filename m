Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB5EC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EBEB81149;
	Sun, 14 Jul 2024 09:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFLYuCFa8NXI; Sun, 14 Jul 2024 09:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DAE4810B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DAE4810B7;
	Sun, 14 Jul 2024 09:09:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97E711BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 928F3600C6
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBpyeUjYOh-l for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C04460586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C04460586
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C04460586
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:09:10 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-64b05fab14eso32462097b3.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 02:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720948149; x=1721552949;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+WOWQxVzaC/6MpPbITShLWTdF84lLiBJzr7lLbrSf7g=;
 b=OmxqLGVtY5v9zKJGY8Lx6cEjChb+xFf8vKnHVSepTvaiVQSf+Yuc/POnG+k0tCunnU
 yoYPAMDtKkA0pc8w5SQ/XLZB6jJlR+M8Pe/jccg4RantthxAmkv66R/+BS3Ph3TqjJsL
 8P2wjxTTPWEC31m4ailIw9fbFmT5agNS42dwdeLeDb7F/K+ek9Xjtv+n0EaE9NODPRLI
 nZ0xCieqJWlPe6cNfbJCM0fe2YEZMc9BSI7LKA1KEWrk/vUIliVV7X+WJlVwQGlzmiy5
 BX0oeDM3FWZk1mIdVIKIrXLTmC0A3wFdtwaLHEW9RmYoGcGbS6e52/AYLxnRx4BLvlhb
 fIzw==
X-Gm-Message-State: AOJu0YzXJ13247h9TXBWa0kBX3XIZuApQH9w4SdTbS3u/qUt4vEh2+5Q
 jcdiOJqjoUQAEI+zKfU8BwIApTtVCKo8Z3KSuHctjvuvazMse3qhgD00ldzEGE1OFR11pm+9DWo
 uIS/XcpzUmJCFBDZ+0+9MRzqzmsDjaghh
X-Google-Smtp-Source: AGHT+IFR2jKwPXV1mYAd0NNQThsr+840jo90cuyi8kEh/Mwa7v7/4oyAqHOuW4VlkfZCJXMfV10HkHfl2RB9MknbaEM=
X-Received: by 2002:a0d:f886:0:b0:61b:1e81:4eb8 with SMTP id
 00721157ae682-658ee790bdbmr175257857b3.9.1720948149353; Sun, 14 Jul 2024
 02:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240712112038.17a13aa4@windsurf>
In-Reply-To: <20240712112038.17a13aa4@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 14 Jul 2024 11:08:57 +0200
Message-ID: <CA+R_deoOzYh6k_+VmbL2-E-A2H+iuLpk7oyqEbNs_qku3z_vEw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720948149; x=1721552949; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+WOWQxVzaC/6MpPbITShLWTdF84lLiBJzr7lLbrSf7g=;
 b=bHo8HIx1QGAeNt9EObizPPPKII7TBwkuku7M5mzUVjfSG0KFowF79QfaRhKy8IK6aq
 BCP7hPGkup9awhCCol4/gl6gDz/g1J7AlVWrbBrqRJHjMCZyQLdDK17NTnkF8Non1Fdh
 Nu0rgpyvnxYEecwRPxRJT+xYKCqNm7uzIIbpLrmKMY0F6uZb+u4qpHggeeuFUF1OJT42
 kZcaoA3rWT5xsaB6lSXOSlG7SXl7q8aqoK5vWogOU9rHzzpdb6AVllkgi/usrUnRaGf9
 ndMpBWJUEJLr4ujW7Jj8Fos77WyjpC1ru+6nCUiezDFa/pA/EetOFkswf6lbZdchkFHM
 xn9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bHo8HIx1
Subject: Re: [Buildroot] [PATCH v9 01/14] package/qt6: bump version to 6.7.2
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9043648551975552874=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9043648551975552874==
Content-Type: multipart/alternative; boundary="0000000000001e84dd061d31777b"

--0000000000001e84dd061d31777b
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Added myself to DEVELOPERS for package/qt6:

https://patchwork.ozlabs.org/project/buildroot/patch/20240714090141.407553-1-roykollensvendsen@gmail.com/

Best regards,
Roy

fre. 12. juli 2024 kl. 11:20 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> On Tue, 25 Jun 2024 23:18:25 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > For details see [1], [2], [3], [4], [5], [6], [7], [8], [9], [10] and
> [11].
> >
> > [1]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.0/release-note.md
> > [2]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.1/release-note.md
> > [3]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.2/release-note.md
> > [4]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.3/release-note.md
> >
> > [5]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.0/release-note.md
> > [6]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.1/release-note.md
> > [7]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.2/release-note.md
> > [8]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.3/release-note.md
> >
> > [9]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.0/release-note.md
> > [10]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.1/release-note.md
> > [11]
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.2/release-note.md
> >
> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> > ---
> > Changes v8 -> v9:
> >   - add release note link for 6.7.2 to commit message
> >   - bump version from 6.7.1 to 6.7.2
> >   - update hashes for existing qt6 packages
>
> Another request: would you mind adding yourself to the DEVELOPERS file
> for package/qt6/ ? This way you would:
>
>  1. Be Cc'ed on patches posted that touch qt6
>
>  2. Be reported build issues detected by our autobuilders on qt6
>
> Considering how involved you are in the qt6 packaging in Buildroot, I
> think it would make a lot of sense.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000001e84dd061d31777b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div>Added myself to D=
EVELOPERS for package/qt6:<br></div><div><br></div><div><a href=3D"https://=
patchwork.ozlabs.org/project/buildroot/patch/20240714090141.407553-1-roykol=
lensvendsen@gmail.com/">https://patchwork.ozlabs.org/project/buildroot/patc=
h/20240714090141.407553-1-roykollensvendsen@gmail.com/</a></div><div><br></=
div><div>Best regards,</div><div>Roy<br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">fre. 12. juli 2024 kl. 11:20 =
skrev Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">=
thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hello Roy,<br>
<br>
On Tue, 25 Jun 2024 23:18:25 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; For details see [1], [2], [3], [4], [5], [6], [7], [8], [9], [10] and =
[11].<br>
&gt; <br>
&gt; [1] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/=
6.5.0/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt=
.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.0/release-note.md</a><br>
&gt; [2] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/=
6.5.1/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt=
.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.1/release-note.md</a><br>
&gt; [3] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/=
6.5.2/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt=
.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.2/release-note.md</a><br>
&gt; [4] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/=
6.5.3/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt=
.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.3/release-note.md</a><br>
&gt; <br>
&gt; [5] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/=
6.6.0/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt=
.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.0/release-note.md</a><br>
&gt; [6] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/=
6.6.1/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt=
.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.1/release-note.md</a><br>
&gt; [7] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/=
6.6.2/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt=
.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.2/release-note.md</a><br>
&gt; [8] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/=
6.6.3/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt=
.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.3/release-note.md</a><br>
&gt; <br>
&gt; [9] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/=
6.7.0/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.qt=
.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.0/release-note.md</a><br>
&gt; [10] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt=
/6.7.1/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.q=
t.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.1/release-note.md</a><br>
&gt; [11] <a href=3D"https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt=
/6.7.2/release-note.md" rel=3D"noreferrer" target=3D"_blank">https://code.q=
t.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.2/release-note.md</a><br>
&gt; <br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensven=
dsen@gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes v8 -&gt; v9:<br>
&gt;=C2=A0 =C2=A0- add release note link for 6.7.2 to commit message<br>
&gt;=C2=A0 =C2=A0- bump version from 6.7.1 to 6.7.2<br>
&gt;=C2=A0 =C2=A0- update hashes for existing qt6 packages<br>
<br>
Another request: would you mind adding yourself to the DEVELOPERS file<br>
for package/qt6/ ? This way you would:<br>
<br>
=C2=A01. Be Cc&#39;ed on patches posted that touch qt6<br>
<br>
=C2=A02. Be reported build issues detected by our autobuilders on qt6<br>
<br>
Considering how involved you are in the qt6 packaging in Buildroot, I<br>
think it would make a lot of sense.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000001e84dd061d31777b--

--===============9043648551975552874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9043648551975552874==--
