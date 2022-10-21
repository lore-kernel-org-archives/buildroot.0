Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3444C4332F
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 09:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FC6141170;
	Fri, 21 Oct 2022 09:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FC6141170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l40Zhpmvl3U2; Fri, 21 Oct 2022 09:18:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BADD40585;
	Fri, 21 Oct 2022 09:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BADD40585
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B32971BF29F
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 09:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E938408E9
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 09:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E938408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OhPCIgdQth8K for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 09:18:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B7740585
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83B7740585
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 09:18:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id t4so1756089wmj.5
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 02:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5OnIFVqvLl/TjDI/axFvLi8qkpBXqWjTkFUySdBe3dI=;
 b=sU/aqHhdX6BcSJqoPUdbyZqDzIhc1SQSSkUNMN9RYhMV95sfoapIw8AcsNcYZKFzTE
 1espUbFRu23M6QQwQllBTLAv5sDqoJemrUyZX2Ni0Je7ysOcvYNVrxCCzPF4dvHk1uO6
 SwiDRlbArv8Hy9fahmtYuuGpDfRDge0CQSE5i+dfBwvzv5Y3zl03gm7rZSYOZdLqzV8r
 Ox16Uqif5k1D93c/ESUFFan89vffFKO3u1J8AwOZ+LfP2WOIww+15UNuXOdrbQQ1Q1yz
 t63P8AshcfXdy0e/mC02nRbjT1RN8ITa3dyxZgr6NW00a1UsVOoa/NX7Qj8EhgQWFOR5
 QMgQ==
X-Gm-Message-State: ACrzQf0F0ChAwEHzR1RygVhC02itpSDgrxFiwl8pGqU8cDS/fSJrtLrX
 ES+Aq+InXBPan3jp6I/vxUQpKMIyw/Z4L0cZlZyfYTOdlzw=
X-Google-Smtp-Source: AMsMyM7FJA6sbSHHdnyY0aEcLejWL49kkZfIgTYyCXPrTkkLmMPE1BfiNlYEZAO2RhN3geixk+NW7LztgU+AsK3qJNw=
X-Received: by 2002:a05:600c:4113:b0:3c6:f5d7:aa8d with SMTP id
 j19-20020a05600c411300b003c6f5d7aa8dmr18688011wmi.167.1666343897692; Fri, 21
 Oct 2022 02:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221019215741.2854410-1-oguz.ozhan@mind.be>
 <20221021094418.2f6ecae1@windsurf>
In-Reply-To: <20221021094418.2f6ecae1@windsurf>
From: Oguz Ozhan <oguz.ozhan@mind.be>
Date: Fri, 21 Oct 2022 11:18:06 +0200
Message-ID: <CAG1ZjYN3YW=yvrqbS+m-KGZ2vF1KKQm3tnfan1_pRTW6MuzrMg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5OnIFVqvLl/TjDI/axFvLi8qkpBXqWjTkFUySdBe3dI=;
 b=BkZl3GuigzdJTlbjrECcKZ5w6UcdQ2an5+Rou3YGmEoS2pNASDqGSOeD0tULBL2n0y
 hHMlnvlGaaZlBC2zRWdz7ayQ/fLU3u9jxc7nfSYp75F83OgutBCS3Ngy0+jH9B1c0Y2f
 nDSVcRe14DHoevKeQWcBM7Y6jLoJYn/68HDCQGSGv1+0Y514QHz4nipuwTX+Koa8WtGk
 pHxY42uDfReFbBPLMYAMZO/TL+E0ED2Q++pZw6PVfvolqUs3MiqEYHHHEqqD8tAph/uk
 VfY4odrVoQe5MYekKWbQ6hnc2nRh/e2TP5PaabKOpQCZkursuLkulRKF1OrjJoBsbJ4N
 IFaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BkZl3Gui
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: replace nose2 with
 pytest - Dockerfile
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1824474813769830934=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1824474813769830934==
Content-Type: multipart/alternative; boundary="00000000000018952f05eb87ece5"

--00000000000018952f05eb87ece5
Content-Type: text/plain; charset="UTF-8"

Hi Thomas.

Thanks a lot for your comments.

I inserted more information in the commit logs and re-sent the patches.

KR.

Oguz


On Fri, Oct 21, 2022 at 9:44 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Oguz,
>
> On Wed, 19 Oct 2022 23:57:39 +0200
> Oguz Ozhan <oguz.ozhan@mind.be> wrote:
>
> > Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>
>
> Thanks a lot for your patch series. However, all commit logs are empty.
> What is the rationale/motivation for the changes in this patch series?
> Why is pytest better than nose2? Could you send a new iteration with a
> detailed commit log for each commit that explains the motivation for
> the change, and also describes the change itself, especially in PATCH
> 2/3, where test cases see changes. BTW, these changes in test cases
> could be done in a separate preparation commit, as they would still
> work with nose2 I believe.
>
> Also another concern is that the series is not really bisectable, but
> admittedly I'm not sure it's easy to achieve without doing all the
> changes in one single patch.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000018952f05eb87ece5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas.<div><br></div><div>Thanks a lot for your commen=
ts.</div><div><br></div><div>I inserted more information in the commit logs=
 and re-sent the patches.</div><div><br></div><div>KR.</div><div><br></div>=
<div>Oguz</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Oct 21, 2022 at 9:44 AM Thomas Petazz=
oni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bo=
otlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hello Oguz,<br>
<br>
On Wed, 19 Oct 2022 23:57:39 +0200<br>
Oguz Ozhan &lt;<a href=3D"mailto:oguz.ozhan@mind.be" target=3D"_blank">oguz=
.ozhan@mind.be</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Oguz Ozhan &lt;<a href=3D"mailto:oguz.ozhan@mind.be" ta=
rget=3D"_blank">oguz.ozhan@mind.be</a>&gt;<br>
<br>
Thanks a lot for your patch series. However, all commit logs are empty.<br>
What is the rationale/motivation for the changes in this patch series?<br>
Why is pytest better than nose2? Could you send a new iteration with a<br>
detailed commit log for each commit that explains the motivation for<br>
the change, and also describes the change itself, especially in PATCH<br>
2/3, where test cases see changes. BTW, these changes in test cases<br>
could be done in a separate preparation commit, as they would still<br>
work with nose2 I believe.<br>
<br>
Also another concern is that the series is not really bisectable, but<br>
admittedly I&#39;m not sure it&#39;s easy to achieve without doing all the<=
br>
changes in one single patch.<br>
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

--00000000000018952f05eb87ece5--

--===============1824474813769830934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1824474813769830934==--
