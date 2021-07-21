Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835F8C6377A
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:53:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E64196121E
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E64196121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nklabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A722782909;
	Wed, 21 Jul 2021 22:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlLxMX5gAach; Wed, 21 Jul 2021 22:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAE1D827A0;
	Wed, 21 Jul 2021 22:53:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65F981BF2A6
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 560B5827A0
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZ10B1YR_fe4 for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 22:53:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B52E82792
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 22:53:26 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id z17so4191888iog.12
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 15:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ah62GJDwD/jIAOY/L3K2+LoqbEGkm9CrFYV6FKDZE1U=;
 b=L7r0f+3WCT6cKkxz9K+IR/+eL+lrihobbFjJ9Xr4TbnEsGOG/Q7pUzIWCVTP7egXYr
 +n7Usc7ENESzNTqaSVXnZ4qzEcnQFqq6ubwFPf+KThXyJ8iNtXHmcl+EDqiW5vHXAYdf
 /rVs9Xe0qRzGQlyIQMt0cWcn8ulQ4yvSdEOt+gizucd1rR/rUKFwsHe+GSyIjXbaKR9A
 qJE/sA7vowg4twHHAQXGuRSOy3PixMgEKVxISRjwTD3JFRtiMCB3k8DtbB1HhNbdE2C4
 Z90sgbPQ8GhF6siBK60CHAeFkjDzJ53tPDtzCwG2QdTD4UiguboLwBobRDKrbneWSVHV
 bPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ah62GJDwD/jIAOY/L3K2+LoqbEGkm9CrFYV6FKDZE1U=;
 b=rAOtO67WGj+TOG+EmED6Ukj9LX7eqLFH1zpnvprG+NOOKhaW5kMHuPsb7gSVAhO2/6
 pw+fwB/v4tKTmoa2wsAtXMoud7GHvW0JJBEbKQkRyMDeZJGudJgqgJiE7PiZEcmIxxlb
 uWa2KbjefoFQeDOE3AIw0j5KGHocBym/Z8w1hBM5XS4j6FkWPwwSOsB4O9zzF3DDq7Vl
 oRS/BsnECCzh89B/FpGhyFCrJC0vxiVauMJv/vVCMsrC9R09vs4imprdFpZMUB3fl0pw
 +3469ix0Jhnwe/xrHWb9iM+XTWcg0XPlgc/V9uqDPXCLupzrid7fLtEclpnFiIaJG67j
 sW5w==
X-Gm-Message-State: AOAM531lIFXBVUP2FbLQ8CAXCtn1bSQAlWPEZ4HoTHL11keMzQqC8msU
 YlesSAC0XdWEU0mBGja+cnRctF2UyO2D7wEnYf+lig42Esg=
X-Google-Smtp-Source: ABdhPJzwlsReiRYvs7OuhrGksZBwLA90q/R8MpAVnD0S1knEu9RrDbrXg4FPJi/iTHuN8tsEWFUv2W3LQPnH2mavpiA=
X-Received: by 2002:a02:85a5:: with SMTP id d34mr32419617jai.132.1626908005967; 
 Wed, 21 Jul 2021 15:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210720224806.09e5a5b2@windsurf>
 <BAACA597-C3FC-4275-9931-4D3F619F94EE@nklabs.com>
 <20210721094154.74005093@windsurf>
 <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
In-Reply-To: <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
From: Patricia Holden <pholden@nklabs.com>
Date: Wed, 21 Jul 2021 18:53:15 -0400
Message-ID: <CAJ6EmCfj3LjcUJ30GbWxxQ4KXET=3tJxnSKv1GTx63veHMsyQQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] Question about pkg-config pc files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============3020226935184469290=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3020226935184469290==
Content-Type: multipart/alternative; boundary="000000000000c743b905c7aa091e"

--000000000000c743b905c7aa091e
Content-Type: text/plain; charset="UTF-8"

I think I found my problem, I stumbled upon it in stackoverflow.  I needed
to use the engine function addImportPath().  "import" in the qml is for a
module in /usr/qml/Qt*, not pkg-config.  Took some digging.  Their
documentation is a bit misleading at times & I'm not an expert in Qt.

On Wed, Jul 21, 2021 at 3:07 PM Patricia Holden <pholden@nklabs.com> wrote:

> I looked into QQmlApplication examples, they all use pc files.
>
> I'm attaching the files that are doing the import of pkg-config pc files.
> This is the customer's implementation.
>
> The attached URL provides examples that use the same implementation.  Note
> all their examples use the "import" statement at top, this is what is
> looking for pc files:
>
> https://doc.qt.io/qt-5/qtmultimedia-multimedia-video-qmlvideo-example.html
>
> On Wed, Jul 21, 2021 at 3:41 AM Thomas Petazzoni <
> thomas.petazzoni@bootlin.com> wrote:
>
>> Hello,
>>
>> On Wed, 21 Jul 2021 02:23:55 -0400
>> Patricia Holden <pholden@nklabs.com> wrote:
>>
>> > Yes, QQmlApplucation I am porting for a client it is using pc at
>> > runtime.  Would it help to see what they are doing?
>>
>> Ah, it is your customer-specific application that is using the .pc
>> files, not QT itself ?
>>
>> If it's your customer-specific application, then it would be useful to
>> check why they are doing this, as it feels odd.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
>
> --
> Patricia A. Holden
>


-- 
Patricia A. Holden

--000000000000c743b905c7aa091e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think I found my problem, I stumbled upon it in stackove=
rflow.=C2=A0 I needed to use the engine function addImportPath().=C2=A0 &qu=
ot;import&quot; in the qml is for a module in /usr/qml/Qt*, not pkg-config.=
=C2=A0 Took some digging.=C2=A0 Their documentation is a bit misleading at =
times &amp; I&#39;m not an expert in Qt.</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 21, 2021 at 3:07 PM Pat=
ricia Holden &lt;<a href=3D"mailto:pholden@nklabs.com" target=3D"_blank">ph=
olden@nklabs.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr">I looked into QQmlApplication=C2=A0example=
s, they all use pc files.<div><br></div><div>I&#39;m attaching the files th=
at are doing the import of pkg-config pc files.=C2=A0 This is the customer&=
#39;s implementation.</div><div><br></div><div>The attached URL provides ex=
amples that use the same implementation.=C2=A0 Note all their examples use =
the &quot;import&quot; statement at top, this is what is looking for pc fil=
es:</div><div><br></div><div><a href=3D"https://doc.qt.io/qt-5/qtmultimedia=
-multimedia-video-qmlvideo-example.html" target=3D"_blank">https://doc.qt.i=
o/qt-5/qtmultimedia-multimedia-video-qmlvideo-example.html</a><br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Jul 21, 2021 at 3:41 AM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.=
petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,=
<br>
<br>
On Wed, 21 Jul 2021 02:23:55 -0400<br>
Patricia Holden &lt;<a href=3D"mailto:pholden@nklabs.com" target=3D"_blank"=
>pholden@nklabs.com</a>&gt; wrote:<br>
<br>
&gt; Yes, QQmlApplucation I am porting for a client it is using pc at<br>
&gt; runtime.=C2=A0 Would it help to see what they are doing?<br>
<br>
Ah, it is your customer-specific application that is using the .pc<br>
files, not QT itself ?<br>
<br>
If it&#39;s your customer-specific application, then it would be useful to<=
br>
check why they are doing this, as it feels odd.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Patricia A. Holden</div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Patricia A. Holden</div></div>

--000000000000c743b905c7aa091e--

--===============3020226935184469290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3020226935184469290==--
