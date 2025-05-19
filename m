Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D31C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78D61810D1;
	Mon, 19 May 2025 21:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9i7WHMLyqcy2; Mon, 19 May 2025 21:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44000810C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44000810C7;
	Mon, 19 May 2025 21:13:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6847193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2FBA40DF5
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMSgkYq8khSC for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 186BA40E04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 186BA40E04
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 186BA40E04
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:13:43 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e7b962a1518so1564826276.1
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747689223; x=1748294023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MO2bbfdb9vKNvkZISrVYMzTtcGglhq2eakOMVFm0Ttw=;
 b=MENNZXwFQfs0S4XjaHTEIqVbAJJroBe3pywodDAF4NgJTzM3Lo+nL+9GZcdYPbjw+r
 vAh3qS22UUKbXfeDbJp3k0p4QMpcZoheFqVnUZ5u3VLCkwDoliP64rADVbOA3SNML90x
 vZ2Sm+Sdr1qUi41oe+xTQ67QiUaiBWXiBsVwdqbc89zNjbMKxm92rHd0vJ5F4sPjmHWK
 CzekW8J8XBFTmX9H1l7cEQpkiMl6i5t2cDnlKDqXKa4oOphV9tX0a2QAoutfZAjXd7PQ
 YG1beZcT2fpQFNxx4r6ha+sWGTuPUEl/RWn9gSI+dqlABcglL+joetofLH0vPFbwnM08
 qhxg==
X-Gm-Message-State: AOJu0YwyYTpTXY2zjXQOKNTPeOwEKq4mugHvo0bm15PQY9TlwPMRtbQu
 vhguMC3GTIGrmJzBSH3KMYrz3Wh7pdroYTEAk0glpwIB7ACio7iqahb4MOukSi31DQwccKv90RZ
 8Dn/zSE25oylWkzB0f0q5c0kEs9GVMC4=
X-Gm-Gg: ASbGncuTWtn5OvUEUoTBwcx1gfNXchwNVLQgmtNG2e+W0puWqjm+to55YUshBbK/dpg
 +9dCGw8OceOncPrgguwJifgGhmuIkKhsI4OINlbj8PASwIic0Ez2zZXa6Hg//vcUKgqfD9X26P0
 0E2PlyV9XQvaVBhlhJy7wllcRlyYLrcmPUFg==
X-Google-Smtp-Source: AGHT+IHmJHVWyc4/tHM4u4U6oUe+esS00i3A2WVpa2EJ2f/ktA+ZnWyMHkzrB2i5+HFzADKRik0IL3YBkJecTP2Qd2g=
X-Received: by 2002:a05:6902:20c7:b0:e7b:51d9:5996 with SMTP id
 3f1490d57ef6-e7b69d61023mr19199270276.9.1747689222056; Mon, 19 May 2025
 14:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
 <20250515103632.2631227-9-roykollensvendsen@gmail.com>
 <20250516225158.706cccf5@windsurf>
 <CA+R_deo8cJVqYuPNiQdnXXbGuaY9o11rMYp1CsaRqVdfRSM_AQ@mail.gmail.com>
 <20250517084222.7b3a32f3@windsurf>
In-Reply-To: <20250517084222.7b3a32f3@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Mon, 19 May 2025 23:13:25 +0200
X-Gm-Features: AX0GCFvIeCpi6OPtkUncpO0wIVkkZToEy1QTiVOS7SBZUlDRGWK43PYkRviIJEo
Message-ID: <CA+R_deoV8hZZG_bSjD8oYRRR7HyDXaWsa5iWf17LRUkYA3jkAA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, 
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747689223; x=1748294023; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MO2bbfdb9vKNvkZISrVYMzTtcGglhq2eakOMVFm0Ttw=;
 b=U6CzfRiODzuOucTDp4/H0XZ45RxIVFV4Mxt8vZ0LIYr8NZy7b0FTe1Uxqy1jLObEL8
 jA0E8SXU5vgBsZk0MJKopwqi0xpKVyw84l3BEO708WIZgCdw1s18q1X39p6DVT6iPumA
 idcR2bdSpV1q65acdbTnZKorMWfPSFlc2L4ZnU0jZV+w4RoWLGntkPriZUXomZ5CMqWN
 L+KxZm80IChVJI8H1bFyGX3yXgIL2gXwTs3Ykqn6wIfONoQ+8GaXHhGqKLyz/r5cvUQ/
 2r22zNk8wHsUdK1dA/CL1iEW+XNXBz+d1uYLLvQjLQIhT1I4+nwMiozX0hIKuieubFWZ
 dSMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U6CzfRiO
Subject: Re: [Buildroot] [PATCH 09/10] package/qt6/qt6tools: build only host
 linguist tools
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
Content-Type: multipart/mixed; boundary="===============5882494996646233031=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5882494996646233031==
Content-Type: multipart/alternative; boundary="0000000000004466b00635839b6f"

--0000000000004466b00635839b6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

In this v2 I think I have fixed the most glaring problems with qt6tools:

https://patchwork.ozlabs.org/project/buildroot/list/?series=3D457528

Regards,
Roy

l=C3=B8r. 17. mai 2025 kl. 08:42 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> On Sat, 17 May 2025 07:18:19 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > fre. 16.
> > > What does this mean?
> > >
> > The last sentence ended up there unintentionally during a rebase.
>
> OK, that's what I thought :-)
>
> > I think it is best to drop patch 10/10 for now. I can reintroduce that
> > change when I need it.
> >
> > By the way, is 9/10 too large? Should we split the commit? Maybe it is
> > better to gradually fix the concrete build failures than "starting
> > from scratch?"
>
> What are the concrete build failures being fixed? What are the
> "on-going" issues that you are referring to. Keep in mind that we are
> maintaining a LTS branch, to which we backport fixes so we really want
> to understand when things broke, and therefore whether the fixes should
> be backported.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000004466b00635839b6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>In this v2 I think I hav=
e fixed the most glaring problems with qt6tools:</div><div><br></div><div><=
a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D457=
528">https://patchwork.ozlabs.org/project/buildroot/list/?series=3D457528</=
a></div><div><br></div><div>Regards,</div><div>Roy</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">l=C3=B8r. 17. mai 2025 kl. 08:42 skrev Thomas Petazzoni &lt;<a href=3D"m=
ailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Roy,<br>
<br>
On Sat, 17 May 2025 07:18:19 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; fre. 16.<br>
&gt; &gt; What does this mean?<br>
&gt; &gt;=C2=A0 <br>
&gt; The last sentence ended up there unintentionally during a rebase.<br>
<br>
OK, that&#39;s what I thought :-)<br>
<br>
&gt; I think it is best to drop patch 10/10 for now. I can reintroduce that=
<br>
&gt; change when I need it.<br>
&gt; <br>
&gt; By the way, is 9/10 too large? Should we split the commit? Maybe it is=
<br>
&gt; better to gradually fix the concrete build failures than &quot;startin=
g<br>
&gt; from scratch?&quot;<br>
<br>
What are the concrete build failures being fixed? What are the<br>
&quot;on-going&quot; issues that you are referring to. Keep in mind that we=
 are<br>
maintaining a LTS branch, to which we backport fixes so we really want<br>
to understand when things broke, and therefore whether the fixes should<br>
be backported.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000004466b00635839b6f--

--===============5882494996646233031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5882494996646233031==--
