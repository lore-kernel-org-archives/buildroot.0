Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B131CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 18:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B4FA40659;
	Mon,  1 Apr 2024 18:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCBwpPiI3J8C; Mon,  1 Apr 2024 18:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7B90406D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7B90406D8;
	Mon,  1 Apr 2024 18:57:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 163F71BF28E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 019C5406D8
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2z_-mJyBjV7P for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 18:57:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DD5C40659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD5C40659
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DD5C40659
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 18:57:05 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1e00d1e13a2so28360785ad.0
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 11:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711997825; x=1712602625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aU+RJCdYkAji3HsxeG2umwGMsObuNVm7onYLYixLL1Y=;
 b=aUOi+VMoBuS5p/UH9yhjvbmiJyK3W4aQUk6XyPvolSgly6kIG9fpHOQ/2vbp8wM51u
 c7fqEnUZmaZ55h/vTXj/SbeZxPLtSxUZu/7SZEvuFw4f8sHDq6h8+UZJviM0OfhIU9i/
 /HHip5r4oznQfFvMhGY6P+jSuG+lbJWjee3LOnlh7AXsA31dXU1w4+aU7JtHYKMBK9VM
 0L+rpXi3Mex8I/2Ut9TLhygWYcTnX/eqHh1qLV4gPCN63UMKKas2S1GfQjhvHIsIzVmg
 +kq/1SRcZrf+FqzDohR1g2L+9zW3R+L90VmB54aDvFC2aIWMa2dxtg4mLZUJqkxQE70+
 3taQ==
X-Gm-Message-State: AOJu0YxIExlXqfDmRhRJfqc2lGmLG21kTRUqE7mGlSJZACg8LSYqQ1qB
 6rR9kLyDOe4b8Tn4spdWjDvtHz3yoLKn9zIXLD7dPiVOwXg/YroYVgwrt+CPG4U4JjorIAdfXwA
 K+bBPigLkY1vW/6e/e8B13LNE/wjv0n2W3mPxX3sJWu7rCoYqOkw=
X-Google-Smtp-Source: AGHT+IGOSP3sBP1tsfX6VBdQIuJ3hhh/tWdJvR2EiYhWrp7396NNPzfozIpRM/lVCTvts0m7vYbr3EGxfhOEBC9OqP4=
X-Received: by 2002:a17:902:e802:b0:1e0:b862:5330 with SMTP id
 u2-20020a170902e80200b001e0b8625330mr11655418plg.54.1711997824963; Mon, 01
 Apr 2024 11:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ6EmCfd_TZwz3=RKequ=1t1-2Q5FbHENkcrPTu0ebwMEWq_HA@mail.gmail.com>
 <03d6dfc8-3a39-45eb-bdca-7f1654fab9a3@mind.be>
In-Reply-To: <03d6dfc8-3a39-45eb-bdca-7f1654fab9a3@mind.be>
From: Patricia Holden <pholden@nklabs.com>
Date: Mon, 1 Apr 2024 14:56:54 -0400
Message-ID: <CAJ6EmCcEAuv8i_RC5FbVLueXaCLYm1T-GsuEtmo1wNCPOsRmCw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1711997825; x=1712602625; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aU+RJCdYkAji3HsxeG2umwGMsObuNVm7onYLYixLL1Y=;
 b=OyDGj7fDMpdmppBRee9r2MHTmRQd0wcloaKorKvBKJxlMNQsn5wdDYlRKjAHbRPVOZ
 DDT+Y9id5ik4LTg9ZFhUmdm+ZOmPb2eOahd6JNQolMrElQ5kYtlKVyvlPfcmHAhELoyN
 MXDBDlUkwMQgMnMBXpITR3M28wmKWh6gpcbfzUiuJCcYDWS59GPmWI9u4C4zXX9ebX12
 Rn73NdfcA+ODekANHeuTtXwffZiIqv3mxrVuwOZgSpDj+i/anae14tMYabqVm8iwuQGu
 qWMYQRwa6gGoRoq1c1dT23jLQ4DQC2r5ism+0Auo5iUoCMvkCEs14ng0JsY6wolTzodn
 IVVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=OyDGj7fD
Subject: Re: [Buildroot] Is there an official browser patch for Buildroot?
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3916149219154317670=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3916149219154317670==
Content-Type: multipart/alternative; boundary="00000000000036c31306150d8e41"

--00000000000036c31306150d8e41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just need a simple web page I can run a react app on.  If you know of any
examples of this, please share!  I have tried using matchbox, but not sure
I'm configuring it correctly.

On Mon, Apr 1, 2024 at 2:38=E2=80=AFPM Arnout Vandecappelle <arnout@mind.be=
> wrote:

>
>
> On 01/04/2024 20:00, Patricia Holden wrote:
> > I found a few topics online about a patch for chromium, but they are
> dated 2018
> > or older.  Is there an official patch to add the chromium-browser as a
> package
> > for Buildroot?  Or how about "minibrowser", which I have also seen
> topics in an
> > online search?
>
>   I don't think there has ever been an attempt to attempt chromium itself=
,
> but
> there was an attempt at patches for Chromium Embedded Framework (CEF).
> That's
> not a browser, however, just a browser engine. And anyway it turned out
> that
> Chromium (and firefox) are way too complicated with too many vendored
> dependencies and crazy buildsystems.
>
>   There are a bunch of alternative browser engines: qt5webengine,
> qt5webkit,
> webkitgtk, wpewebkit.
>
>   There are also a few simple "frontends" for these, that basically rende=
r
> a
> single webpage and then allow you to browse (so no things like history,
> bookmarks, plugins, etc.): qt-webkit-kiosk, qt5webview; and a more
> complete
> browser: midori.
>
>   Finally, there's also the text-mode browser links, but I don't suppose
> that
> that is what you're looking for.
>
>
>   Regards,
>   Arnout
>
> >
> > Thanks!
> > Pat Holden, NK Labs
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000036c31306150d8e41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just need a simple web page I can run a react app on.=C2=
=A0 If you know of any examples of this, please share!=C2=A0 I have tried u=
sing matchbox, but not sure I&#39;m configuring it correctly.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 1,=
 2024 at 2:38=E2=80=AFPM Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@=
mind.be">arnout@mind.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><br>
<br>
On 01/04/2024 20:00, Patricia Holden wrote:<br>
&gt; I found a few topics online about a patch for chromium, but they are d=
ated 2018 <br>
&gt; or older.=C2=A0 Is there an official patch to add the chromium-browser=
 as a package <br>
&gt; for Buildroot?=C2=A0 Or how about &quot;minibrowser&quot;, which I hav=
e also seen topics in an <br>
&gt; online search?<br>
<br>
=C2=A0 I don&#39;t think there has ever been an attempt to attempt chromium=
 itself, but <br>
there was an attempt at patches for Chromium Embedded Framework (CEF). That=
&#39;s <br>
not a browser, however, just a browser engine. And anyway it turned out tha=
t <br>
Chromium (and firefox) are way too complicated with too many vendored <br>
dependencies and crazy buildsystems.<br>
<br>
=C2=A0 There are a bunch of alternative browser engines: qt5webengine, qt5w=
ebkit, <br>
webkitgtk, wpewebkit.<br>
<br>
=C2=A0 There are also a few simple &quot;frontends&quot; for these, that ba=
sically render a <br>
single webpage and then allow you to browse (so no things like history, <br=
>
bookmarks, plugins, etc.): qt-webkit-kiosk, qt5webview; and a more complete=
 <br>
browser: midori.<br>
<br>
=C2=A0 Finally, there&#39;s also the text-mode browser links, but I don&#39=
;t suppose that <br>
that is what you&#39;re looking for.<br>
<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; Thanks!<br>
&gt; Pat Holden, NK Labs<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div>

--00000000000036c31306150d8e41--

--===============3916149219154317670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3916149219154317670==--
