Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A848C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 07:08:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F506124B
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 07:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8F506124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68CE9400BA;
	Mon,  4 Oct 2021 07:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90BB3qz0k1U2; Mon,  4 Oct 2021 07:08:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D5A24013F;
	Mon,  4 Oct 2021 07:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A41DA1BF306
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 07:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FF1442702
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 07:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sS3uSGpq3jLy for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 07:08:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04FFE426FC
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 07:08:22 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z20so9532253edc.13
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gOx/TMwXirRD5y7Uo9VnG5EGFv5JJghnEMOMNXK1iik=;
 b=5TjjntwnR1vjFz+IX8ow7YsZVGVv9b1QGlJ8hviREwMvGZgrRIJbZ+OJQ3m6pNG5kb
 ZEpQGphznOWPqsM9ikltKXu7UlOi1merSR6PktvgYMvkoQ6Z72/6hp3Nmlnazqkw+gip
 EQxhl7uCHJeOCc0m3JUtjKm3J+BxFFNaKUm70cltpHSn48Q7wTLHoa16YbdNsWn9/uvu
 4KYD7B3jdtg+ieqDhXk5B8BGBhUp5vaAcDQUIE6grqC3ZbpDLxG1lJtTMpwtwgplK5uy
 8DX/a7w7pFrzJxyP6gLWfyNdSW+YpeC7FOl7j5DgNu5nztFF/iByZBcVT5qvQYjo0aB6
 Di+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gOx/TMwXirRD5y7Uo9VnG5EGFv5JJghnEMOMNXK1iik=;
 b=cgqJ0La7z69mrnYp7YSaG1Y0CTGITGgVWQMcqRcLOst/9DQL/E+feckvjWShJ3FRMM
 qufaCJv54RrjXu+edGrMfyMmS/O2fY1vdKj2taYkNV4pkdRvDegJE2nJSEY1n3bGPCtx
 PS7Xl5XelWgLZS8ceR9VuyzV6vlRLq427qkwOel2tLI4xjtOKWkfqsG4+b0w1XHrT6DQ
 wu8FeHkaJXQZLkUb9SQFnBz9lPseVX1PeuVrQtktj5ylakfA2BFIxRZT+FzAS2DKPf3b
 QhAU71uAqwLJE2KUUpaofPGSjnDNim7gyS4Xn1nP4agB+7cvICEmUqpSMHIhOEEtnBKG
 k/lg==
X-Gm-Message-State: AOAM5334cTRhOOjfabSe26Kr9pE9FTpuZe7pgDg1miLE2YUOR0ObSeHm
 x1y8pHxB0aFBpJEW5fGc9aeSR/qVL1Na9Z8ki/P4bMZLT8CgXQ==
X-Google-Smtp-Source: ABdhPJyJM3WIFTyz6/l+TYcOhKSa01XeCEsWKm8KQ6hcidjNlxO9AQ1fFoYwzOyYbWnQNeETCLnXpBkJ2p+oEXoH4sk=
X-Received: by 2002:a17:906:d979:: with SMTP id
 rp25mr6318585ejb.355.1633331300298; 
 Mon, 04 Oct 2021 00:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211004064143.6281-1-jose.pekkarinen@unikie.com>
 <20211004090036.65722dda@windsurf>
In-Reply-To: <20211004090036.65722dda@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 4 Oct 2021 10:08:09 +0300
Message-ID: <CAJPV9MpbeTF4vGvOtP15bNGGLbt8StceDxYWs8LLebgyEr=gvg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] system: add optional rsync with preserved
 permissions
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5647589552100473787=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5647589552100473787==
Content-Type: multipart/alternative; boundary="000000000000f4876705cd819399"

--000000000000f4876705cd819399
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2021 at 10:00 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Mon,  4 Oct 2021 09:41:43 +0300
> Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com> wrote:
>
> > +config BR2_ROOTFS_OVERLAY_PRESERVED_PERMISSION
> > +     string "Preserve permissions of overlay directories"
> > +     depends on BR2_ROOTFS_OVERLAY
> > +     default "n"
> > +     help
> > +       Preserve file permissions of specified overlay.
>
> I'm afraid we probably won't want an option like this.
>
> The question is why in the existing SYSTEM_RSYNC we don't preserve
> permissions? I can imagine because sometimes they can be wrong in the
> original overlay, for example with version control systems that put all
> files read-only.
>
> Yann, Arnout: do you remember why SYSTEM_RSYNC has --chmod=3Du=3DrwX,go=
=3DrX ?
>
> Jos=C3=A9: have you considered using a permission table to fixup the
> permissions ?
>

Never heard of it, but after a quick check it looks like

it is a better answer to my problem, since I found that, for
example, if I want to provide, an authorized_keys file owned
by root, with 600 permissions, rsync copies the file with 644,
which is closer, but not perfect.

Thanks!


Jos=C3=A9.

--000000000000f4876705cd819399
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 4, 2021 at 10:00 AM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello,<br>
<br>
On Mon,=C2=A0 4 Oct 2021 09:41:43 +0300<br>
Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com" targ=
et=3D"_blank">jose.pekkarinen@unikie.com</a>&gt; wrote:<br>
<br>
&gt; +config BR2_ROOTFS_OVERLAY_PRESERVED_PERMISSION<br>
&gt; +=C2=A0 =C2=A0 =C2=A0string &quot;Preserve permissions of overlay dire=
ctories&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_ROOTFS_OVERLAY<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default &quot;n&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Preserve file permissions of specified ove=
rlay.<br>
<br>
I&#39;m afraid we probably won&#39;t want an option like this.<br>
<br>
The question is why in the existing SYSTEM_RSYNC we don&#39;t preserve<br>
permissions? I can imagine because sometimes they can be wrong in the<br>
original overlay, for example with version control systems that put all<br>
files read-only.<br>
<br>
Yann, Arnout: do you remember why SYSTEM_RSYNC has --chmod=3Du=3DrwX,go=3Dr=
X ?<br>
<br>
Jos=C3=A9: have you considered using a permission table to fixup the<br>
permissions ?<br></blockquote><div><br></div></div><blockquote style=3D"mar=
gin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>Nev=
er heard of it, but after a quick check it looks like</div></div></blockquo=
te>it is a better answer to my problem, since I found that, for<div>example=
, if I want to provide, an authorized_keys file owned</div><div>by root, wi=
th 600 permissions, rsync copies the file with 644,</div><div>which is clos=
er, but not perfect.</div><div><div class=3D"gmail_quote"><div><br></div></=
div></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><=
div><div class=3D"gmail_quote"><div>Thanks!=C2=A0</div></div></div></blockq=
uote><div><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><=
blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px">Jos=C3=
=A9.</blockquote></div></div></div></div>

--000000000000f4876705cd819399--

--===============5647589552100473787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5647589552100473787==--
