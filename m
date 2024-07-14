Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38385C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 07:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C19D44069D;
	Sun, 14 Jul 2024 07:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqyErOh_XSZX; Sun, 14 Jul 2024 07:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4549940698
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4549940698;
	Sun, 14 Jul 2024 07:51:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EEE71BF3E5
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 07:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AF0540698
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 07:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPv4PdtiRzSg for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 07:51:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7405840693
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7405840693
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7405840693
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 07:51:16 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e057bdc936fso3345078276.1
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 00:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720943475; x=1721548275;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q0THnVQ6P7B3LzBoS3Vpc8lrBolMGiDpnHGOurqgafo=;
 b=kWjZw9mzSALTLs2gJULCRThzJ88v3TKdTOXB1B8AR9OKFPFW3dfB2xhsXgvNAL/tIX
 E25Wdbdn1unAiTVZ4RSnT8TXHeSK+5jR5tfD0IqV/7+IecLfcxiGs/e/p6zW+dTX54Wm
 tBXkYW79jFsokZo4jtbahRyAc++bqa/fTChUGs3OdnrYGpC6urXnVuOfqv7CGGIsSK8x
 ukt+R8Wgk8y4NrJCClvQQhS66XNXjRMpAehseFXaeafc6pSCJsTcat2abLfXcV9jBpFz
 /4d+ye0nDLwdDoAYhBodpOClbcBushPIlcGJlO4NDR/j8eQioIlJ0fpTXUBJRVVRS36e
 ASkQ==
X-Gm-Message-State: AOJu0YzMX5dGit23+AXLDvvwAmnotpGYsgzKG0qDBrkZmEOeborPcG2D
 yA4RrXAWyL3YsPgTJEz2Xgxg8xhWHUcpcHQ03h3AcZS9V5qPucwPU0GaJfS4NR973zLzBKkcK1C
 odBJzMMxXxjY7JJ66qXI01fkq8PvKph1s
X-Google-Smtp-Source: AGHT+IF4Hntn61TY5qOZY0HZJXPGAIzm+rr1j0RBt+B7PZihmG5OiMmgQML6W5EI6PY3byD0C5KUa1reuMdzn3lCJC8=
X-Received: by 2002:a05:6902:2603:b0:e05:a8ef:3df8 with SMTP id
 3f1490d57ef6-e05a8ef3f99mr2589443276.12.1720943475161; Sun, 14 Jul 2024
 00:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240713205404.3375131-1-roykollensvendsen@gmail.com>
In-Reply-To: <20240713205404.3375131-1-roykollensvendsen@gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sun, 14 Jul 2024 09:51:03 +0200
Message-ID: <CA+R_depsBAoqPgOhW2jR9LeWvweJD55_oMGKRtO1Tii7BvKYUA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720943475; x=1721548275; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0THnVQ6P7B3LzBoS3Vpc8lrBolMGiDpnHGOurqgafo=;
 b=EAThHNePnmyEJDCYoA15xtXtF21Iy9rYFsgy7FsL11WJHdWX0PmMU5Y3ZR5OaSLPrR
 k+4PDKe8S0ASDp8bK+QOtqHqZGM2mPbc4HiVTGjDn7SuuEzIAhL1E+EC4XLs+7ovt9/d
 W3oAzCYVkIXl4BzAk7ZH3keVCrqs+DGNfQ46zKKyRD8JU8CwiDEPBWBN9oqqPMJYidOr
 VlDVeEPRAWe8H9IlrzkbQ8X0xqVpyT+f65VhvBJqlUqq68xMoaaZ0OunAubN5NrcqIfj
 SjLaW5ZvjqqzXGhoTHVAKPhWsPjfV/Il8Swfpg9FshCTNZZFIfy0qmu83oOwWdrLt3jx
 KESA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EAThHNeP
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: improve qt6
 filesystem layout
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============7978779947492382204=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7978779947492382204==
Content-Type: multipart/alternative; boundary="000000000000840a8d061d306036"

--000000000000840a8d061d306036
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

As usual the safety net works, and the maintainers save me from doing
stupid stuff.

This change did not have the intended effect, and also resulted in
installing includes, doc and mkspecs to output/target.


Roy

l=C3=B8r. 13. juli 2024 kl. 22:54 skrev Roy Kollen Svendsen <
roykollensvendsen@gmail.com>:

> I here use the same layout as on Arch Linux.
>
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  package/qt6/qt6base/qt6base.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/
> qt6base.mk
> index 5ab61ba3e0..49c6227428 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -43,6 +43,12 @@ QT6BASE_INSTALL_STAGING =3D YES
>  QT6BASE_CONF_OPTS =3D \
>         -DQT_HOST_PATH=3D$(HOST_DIR) \
>         -DINSTALL_ARCHDATADIR=3Dlib/qt6 \
> +       -DINSTALL_BINDIR=3Dlib/qt6/bin \
> +       -DINSTALL_DATADIR=3Dshare/qt6 \
> +       -DINSTALL_DOCDIR=3Dshare/doc/qt6 \
> +       -DINSTALL_EXAMPLESDIR=3Dshare/doc/qt6/examples \
> +       -DINSTALL_INCLUDEDIR=3Dinclude/qt6 \
> +       -DINSTALL_MKSPECSDIR=3Dlib/qt6/mkspecs \
>         -DFEATURE_concurrent=3DOFF \
>         -DFEATURE_xml=3DOFF \
>         -DFEATURE_sql=3DOFF \
> --
> 2.45.2
>
>

--000000000000840a8d061d306036
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>As usual the safety =
net works, and the maintainers save me from doing stupid stuff.</div><div><=
br></div><div><div>This change did not have the intended effect, and also r=
esulted in installing includes, doc and mkspecs to output/target.</div></di=
v><div><br></div><div><br><div>Roy<br></div></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">l=C3=B8r. 13. juli 2024 k=
l. 22:54 skrev Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@=
gmail.com">roykollensvendsen@gmail.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I here use the same layout as on Arch Linu=
x.<br>
<br>
Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@=
gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a> | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noref=
errer" target=3D"_blank">qt6base.mk</a> b/package/qt6/qt6base/<a href=3D"ht=
tp://qt6base.mk" rel=3D"noreferrer" target=3D"_blank">qt6base.mk</a><br>
index 5ab61ba3e0..49c6227428 100644<br>
--- a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
+++ b/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
@@ -43,6 +43,12 @@ QT6BASE_INSTALL_STAGING =3D YES<br>
=C2=A0QT6BASE_CONF_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DQT_HOST_PATH=3D$(HOST_DIR) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DINSTALL_ARCHDATADIR=3Dlib/qt6 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DINSTALL_BINDIR=3Dlib/qt6/bin \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DINSTALL_DATADIR=3Dshare/qt6 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DINSTALL_DOCDIR=3Dshare/doc/qt6 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DINSTALL_EXAMPLESDIR=3Dshare/doc/qt6/examples =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DINSTALL_INCLUDEDIR=3Dinclude/qt6 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DINSTALL_MKSPECSDIR=3Dlib/qt6/mkspecs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_concurrent=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_xml=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_sql=3DOFF \<br>
-- <br>
2.45.2<br>
<br>
</blockquote></div>

--000000000000840a8d061d306036--

--===============7978779947492382204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7978779947492382204==--
