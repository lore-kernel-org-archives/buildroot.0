Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAFEC25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 11:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F39B829DC;
	Mon, 13 May 2024 11:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJLHQFVqMFDp; Mon, 13 May 2024 11:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8590282A7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8590282A7F;
	Mon, 13 May 2024 11:05:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC6661BF479
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 11:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8B5160880
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 11:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hTZEoI7uXQq for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 11:05:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com;
 envelope-from=jesseevg@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3BA160870
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3BA160870
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3BA160870
 for <buildroot@buildroot.org>; Mon, 13 May 2024 11:05:17 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-61e0c2b5cd2so35131767b3.1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 04:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715598316; x=1716203116;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JbYw+KbMrKp9+2P/frSEQuhJJgyqQ2deAWR3SbM6GZ0=;
 b=SZwgVCO68DsuHKDgFdxYQf1kGlwRsfgEbJ3ODicxvEjc8nU7HE4FDWqxCe51iwHBX6
 lfuTADPU/BCkzzqHOxlfBgBVUQf6Iok0c3VZ97wVgWWQ9pct8E7kJmambMU01cmIp2cl
 J6MZl0XnTa2OhjNskfTFhzQDVHdsCkLaz3fpQQymQvl0qFFAknzhAXhcXcyud5LbvSWO
 4IPgzVSSu7mCO/YOtmG45xAGZrm3Uunt0Q+b91H+cZcJtW1TzcvOcD8UrnkK2FexoCce
 bkyPYkfmz2D2Yw5ZMd9kW12dYSoMl8Ttg8T7lFQKbzH+TBv7SjRaeugbd8P+hVQaNxlB
 sceQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUniMNFWz0LfqAwOKdSr1RbwhgLsIpKQ4CTJVsxgmqc1KoUgtVF1JIDry9T3y0K92bZEt4O375snRlTcqY2K/+VcExeVpwhOw==
X-Gm-Message-State: AOJu0YwW6PmrQ0tcqoIXb+uOnEmS4wRhxeLPiOBlTW+fgTR6b9ufD2M2
 qqZHoUlvdO5QmCs2mQz9CGGR8bd0lAFpCMwZq83hdIC7l8UVru4FrNWZOy/j3L/muAGdts1q6bt
 SkBPUM+0WbLiLG6j9qZNx/hMNyAI=
X-Google-Smtp-Source: AGHT+IHJI2DqGZwC/QJo52TWnhQMg/Ku9X78RzxwsVZvRB/A4IHMw5OLQcoRlkiduZADpmZqVy0BbGctg8PMmfIbY1Q=
X-Received: by 2002:a5b:e8b:0:b0:de5:5a90:5acb with SMTP id
 3f1490d57ef6-dee4e4784eemr7507384276.6.1715598316317; Mon, 13 May 2024
 04:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
 <20240512114617.2564569-2-roykollensvendsen@gmail.com>
 <20240513084026.4513d1f6@windsurf>
 <CAMdwsN8eL5Urj5AyWn0RStgBmeZ0_afz7aRAgr5iwfxjhV_Vgg@mail.gmail.com>
 <CA+R_deoKLT7TYE5kKjD9pOUsVcNA-iJOfmekfBOTA=gN3z=YoQ@mail.gmail.com>
In-Reply-To: <CA+R_deoKLT7TYE5kKjD9pOUsVcNA-iJOfmekfBOTA=gN3z=YoQ@mail.gmail.com>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Mon, 13 May 2024 13:05:05 +0200
Message-ID: <CAMdwsN9p5bpK48UqTBXFgXtB=3y0Vrr18HqLyYb6e8wU4YXZsA@mail.gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715598316; x=1716203116; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JbYw+KbMrKp9+2P/frSEQuhJJgyqQ2deAWR3SbM6GZ0=;
 b=hn7nc1ljTIUrxvmyTkd5dmheIR9NlwRFbrOVyB27eYMABSfdbJvViH7dhGJ81hmYJD
 87ba2ylTiXkRBg09iAJSqWvkFUhBWUClSqH+SlGpYzq5Kb57sWfv9z0Hk3nvlzokcgEO
 q/P4pRpCor0Lw7rt2vokCDKYyk2lc/wIP5LCA46JeKT17ZZVUOv4V/ppy+c3GO5Xjyxk
 aM+AJp8SsPRO5VCeQpkrY2+iubFXzFH/iU2q3lNyEF55ZEkw0Q+bPsq0NuD3nTnH1eql
 M4WIrUyBx9lCS36rmhi1WKHK8Weiyjp0FC+8RYMtLKXj8byj9kYhOLjuRj1oO5xGnxcO
 4+0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hn7nc1lj
Subject: Re: [Buildroot] [PATCH v3 02/14] package/qt6/qt6base: patch
 CVE-2024-33861
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5015468278600651161=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5015468278600651161==
Content-Type: multipart/alternative; boundary="00000000000038b4d5061853dc0b"

--00000000000038b4d5061853dc0b
Content-Type: text/plain; charset="UTF-8"

Hello Roy,

On Mon, 13 May 2024, 12:29 Roy Kollen Svendsen, <roykollensvendsen@gmail.com>
wrote:

> Hi Thomas and Jesse,
>
> I assume I should add this information to the commit message and make a v4
> patch-set?
>

Personally I don't see why that would be necessary, it's applicable to your
version bump only and it's a valid CVE identifier (even if reserved for the
moment) that can be looked up, putting the exact same CVE info in the
commit for the patch seems a bit redundant

Best regards,
Jesse


> Best regards,
> Roy
>
> man. 13. mai 2024 kl. 09:57 skrev Jesse Van Gavere <jesseevg@gmail.com>:
>
>> Hello Thomas,
>>
>> Op ma 13 mei 2024 om 08:40 schreef Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com>:
>>
>> >
>> > Hello Roy,
>> >
>> > On Sun, 12 May 2024 13:45:49 +0200
>> > Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>> >
>> > > From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
>> > >
>> > > Got patch from:
>> > >
>> > > https://download.qt.io/archive/qt/6.7/
>> > > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>> >
>> > Thanks for this v3. However, you're again putting a fix as PATCH 02/14
>> > of the series, after a bump. Is it because this CVE is only applicable
>> > to Qt 6.7 (and not the 6.4.3 we already have in Buildroot) ? Could you
>> > clarify this point, which is very important?
>>
>> This is not applicable to 6.4.3, the affected versions are detailed in
>> the bugzilla report below and it's only 6.5.0+
>> So this seems perfectly valid to go along with the version bump.
>>
>> OpenSUSE report:
>> https://www.suse.com/security/cve/CVE-2024-33861.html
>> Bugzilla report clarifying affected versions
>> https://bugzilla.suse.com/show_bug.cgi?id=1223917
>>
>> > Thanks!
>> >
>> > Thomas
>> > --
>> > Thomas Petazzoni, co-owner and CEO, Bootlin
>> > Embedded Linux and Kernel engineering and training
>> > https://bootlin.com
>>
>> Best regards,
>> Jesse
>
>

--00000000000038b4d5061853dc0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Roy,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, 13 May 2024, 12:29 Roy Kollen Svends=
en, &lt;<a href=3D"mailto:roykollensvendsen@gmail.com">roykollensvendsen@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr"><div>Hi Thomas and Jesse,<br></div><div><br></div><div>I assume I shou=
ld add this information to the commit message and make a v4 patch-set?<br><=
/div></div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Personally I don&#39;t see why that would be necessary, it&#39;s app=
licable to your version bump only and it&#39;s a valid CVE identifier (even=
 if reserved for the moment) that can be looked up, putting the exact same =
CVE info in the commit for the patch seems a bit redundant</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Jes=
se</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div></div><div><br><=
/div><div>Best regards,<br></div><div>Roy<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">man. 13. mai 2024 kl. 09=
:57 skrev Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">jesseevg@gmail.com</a>&gt;:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hello Thomas,<br>
<br>
Op ma 13 mei 2024 om 08:40 schreef Thomas Petazzoni<br>
&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank" rel=
=3D"noreferrer">thomas.petazzoni@bootlin.com</a>&gt;:<br>
<br>
&gt;<br>
&gt; Hello Roy,<br>
&gt;<br>
&gt; On Sun, 12 May 2024 13:45:49 +0200<br>
&gt; Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">roykollensvendsen@gmail.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; &gt; From: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.svends=
en@akersolutions.com" target=3D"_blank" rel=3D"noreferrer">roy.kollen.svend=
sen@akersolutions.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Got patch from:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://download.qt.io/archive/qt/6.7/" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://download.qt.io/archive/qt/6.7/</a=
><br>
&gt; &gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykolle=
nsvendsen@gmail.com" target=3D"_blank" rel=3D"noreferrer">roykollensvendsen=
@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Thanks for this v3. However, you&#39;re again putting a fix as PATCH 0=
2/14<br>
&gt; of the series, after a bump. Is it because this CVE is only applicable=
<br>
&gt; to Qt 6.7 (and not the 6.4.3 we already have in Buildroot) ? Could you=
<br>
&gt; clarify this point, which is very important?<br>
<br>
This is not applicable to 6.4.3, the affected versions are detailed in<br>
the bugzilla report below and it&#39;s only 6.5.0+<br>
So this seems perfectly valid to go along with the version bump.<br>
<br>
OpenSUSE report:<br>
<a href=3D"https://www.suse.com/security/cve/CVE-2024-33861.html" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://www.suse.com/security/cve/CV=
E-2024-33861.html</a><br>
Bugzilla report clarifying affected versions<br>
<a href=3D"https://bugzilla.suse.com/show_bug.cgi?id=3D1223917" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://bugzilla.suse.com/show_bug.cgi=
?id=3D1223917</a><br>
<br>
&gt; Thanks!<br>
&gt;<br>
&gt; Thomas<br>
&gt; --<br>
&gt; Thomas Petazzoni, co-owner and CEO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering and training<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://bootlin.com</a><br>
<br>
Best regards,<br>
Jesse</blockquote></div></blockquote></div></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote></div>
</blockquote></div></div></div>

--00000000000038b4d5061853dc0b--

--===============5015468278600651161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5015468278600651161==--
