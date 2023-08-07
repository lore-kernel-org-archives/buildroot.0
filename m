Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A956C00528
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 13:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75D4381AD7;
	Mon,  7 Aug 2023 13:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75D4381AD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y8Tcsve-enyX; Mon,  7 Aug 2023 13:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A20A81E61;
	Mon,  7 Aug 2023 13:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A20A81E61
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF0C51BF2F6
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 13:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5350D8174F
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 13:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5350D8174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FYF9cKbNttlo for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 13:42:06 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6422881DF4
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 13:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6422881DF4
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-686d8c8fc65so3002846b3a.0
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 06:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691415726; x=1692020526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vhBz6uNIcqMBdpQg7aQz4CbSWhsAXknIn5upF9N3Llo=;
 b=NNb1nZkCRdKnpON2/6Ekng4VPkjkXUlcjON62fhIR71z+jf09j5M/IwTY75nHnLzox
 mrYLEJkTgXjE9A8nX9VIsrh3sx1q9ppMeaYEY3rE8FRp0VfIjFsm3Wb4lOuFXk0LTaLO
 L7ZzGFoBqqrN1jGdjDqEqXIlnY7TWwb3Eo7K3jbPf3Z9BFGahIWWqFuz2/GMGOgt89d1
 UR/5EDQLU1VgO3FAn0Vpv6hlqJA6mO9NYgGu4qch59YYA6K4PWXmR66cF3rbbBh2HUqg
 nEcWOhsXaRPcTDpEhsrWD9zpPt2/hTfK0+OL0xik40cKP+hCbdn7nN3xeTYgmU1Oo+wf
 OEnQ==
X-Gm-Message-State: AOJu0YyL45JXx+0hHHk8T8CiJlGUZzBtyfDDC3GJLT6AfCG8ZsHRWLdl
 10cLqURE0nAtKFd/Q8XATGgKVbMgTWzy7kZg+Fg=
X-Google-Smtp-Source: AGHT+IF4mdTMMVWQ5oPJDuVwTBii9vZiWb0r6urLpc2THziC17z1mIYxXx6ul8bSvaV6MolaMKx/lxaztQUe9XRPzjo=
X-Received: by 2002:a17:90a:d506:b0:268:7262:1067 with SMTP id
 t6-20020a17090ad50600b0026872621067mr6307472pju.36.1691415724820; Mon, 07 Aug
 2023 06:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLWrZ8O-mF6RnuX80SmS7Mn5Op=o0OJMp6-wbhjUfRBiqfnXg@mail.gmail.com>
 <20230806235806.307605e5@windsurf>
In-Reply-To: <20230806235806.307605e5@windsurf>
From: Andreas <andreasembbuild@gmail.com>
Date: Mon, 7 Aug 2023 15:41:53 +0200
Message-ID: <CAOLWrZ8p5g6xSYjXrDYseTDz_wW0MqWQ81EpeiHf788NnwhN8Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691415726; x=1692020526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vhBz6uNIcqMBdpQg7aQz4CbSWhsAXknIn5upF9N3Llo=;
 b=j4Mwq+JXYgCToBG/PUtAA2I+2ygos94RXi6HO/OGqn93BHQj783qSECC+SJWyuWjf7
 ZwghSns39wOJl34EM6nVH9ZvLWVTYv9uZdSjA4+9f7Og7OzC7IXJQVFTBHx6mIaJM4FC
 KoJp9vrqB5CKkQ1fB86JiHV2doFg7Ukd74/q6h2LCFZt9TfrHJcqtStdyCkBhIL5YHJX
 wLvPlc+klspG1GYu4nnmJcMfcJ7p9avKpr3pvmS7+kSwWYw4kYSviWW0uIb1KziUvQpR
 hRgsFVZ+WnBs/CXgyQB8Dbj47eNLdtlpt1zXYpgzZJD95TGqXiGCKzLP+FtLU678NXId
 Of9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=j4Mwq+JX
Subject: Re: [Buildroot] Support for lapack
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
Content-Type: multipart/mixed; boundary="===============2905205415958232483=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2905205415958232483==
Content-Type: multipart/alternative; boundary="000000000000720e760602556926"

--000000000000720e760602556926
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thanks for the hint. I followed this patch. I think from the errors I saw
my problem is most likely the toolchain. This dependency
respectively depends on BR2_TOOLCHAIN_HAS_FORTRAN # python-scipy. Since I
am migrating from an old buildroot to a recent version of it might also be
part of the problem. I know the toolchain menu in the menu config but like
to set it programatically in the build config. But I don't know how exactly
and which options depend on what. Basically I think I need a toolchain with
support for c++, wchar, threads, fortran, openblas and arch. I found this
resource:
http://underpop.online.fr/b/buildroot/en/dependencies-target-toolchain-options.htm.gz
but
still don't know how to set it properly in the config. Can you point me to
an example?

Thanks,
Andreas


Am So., 6. Aug. 2023 um 23:58 Uhr schrieb Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Andreas,
>
> On Sun, 6 Aug 2023 23:36:34 +0200
> Andreas <andreasembbuild@gmail.com> wrote:
>
> > How do I configure Fortran properly for lapack? I need it on host for the
> > python-scikit-learn package. I get the following error.
>
> Please look at the patch series at:
>
>   https://patchwork.ozlabs.org/project/buildroot/list/?series=314036
>
> for python-scikit-learn.
>
> Note: this is difficult stuff to package, you're now starting with easy
> stuff :-)
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000720e760602556926
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas,=C2=A0<div><br></div><div>Thank=
s for the hint. I followed this patch. I think from the errors I saw my pro=
blem is most likely the toolchain. This dependency respectively=C2=A0depend=
s on BR2_TOOLCHAIN_HAS_FORTRAN # python-scipy. Since I am migrating from an=
 old buildroot to a recent version of it might also be part of the problem.=
 I know the toolchain menu in the menu config but like to set it programati=
cally in the build config. But I don&#39;t know how exactly and which optio=
ns depend on what. Basically I think I need a toolchain with support for c+=
+, wchar, threads, fortran, openblas and arch. I found this resource:=C2=A0=
<a href=3D"http://underpop.online.fr/b/buildroot/en/dependencies-target-too=
lchain-options.htm.gz" target=3D"_blank">http://underpop.online.fr/b/buildr=
oot/en/dependencies-target-toolchain-options.htm.gz</a>=C2=A0but still don&=
#39;t know how to set it properly in the config. Can you point me to an exa=
mple?</div><div><br></div><div>Thanks,</div><div>Andreas</div></div><div cl=
ass=3D"gmail-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:=
22px;margin:2px 0px 0px"><br class=3D"gmail-Apple-interchange-newline"></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">Am So., 6. Aug. 2023 um 23:58=C2=A0Uhr schrieb Thomas Petazzoni &lt;<a hr=
ef=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>=
&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Andr=
eas,<br>
<br>
On Sun, 6 Aug 2023 23:36:34 +0200<br>
Andreas &lt;<a href=3D"mailto:andreasembbuild@gmail.com" target=3D"_blank">=
andreasembbuild@gmail.com</a>&gt; wrote:<br>
<br>
&gt; How do I configure Fortran properly for lapack? I need it on host for =
the<br>
&gt; python-scikit-learn package. I get the following error.<br>
<br>
Please look at the patch series at:<br>
<br>
=C2=A0 <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?seri=
es=3D314036" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.=
org/project/buildroot/list/?series=3D314036</a><br>
<br>
for python-scikit-learn.<br>
<br>
Note: this is difficult stuff to package, you&#39;re now starting with easy=
<br>
stuff :-)<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000720e760602556926--

--===============2905205415958232483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2905205415958232483==--
