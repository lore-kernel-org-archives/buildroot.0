Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B666CC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 16:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09C1260B42;
	Sun,  7 Aug 2022 16:46:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09C1260B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49TP_uS181Jv; Sun,  7 Aug 2022 16:46:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA5360B2B;
	Sun,  7 Aug 2022 16:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AA5360B2B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE18A1BF681
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8641827A5
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8641827A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6P3GLlwCu5BK for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 16:46:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF2B7827A1
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF2B7827A1
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 16:46:33 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31e7ca45091so61251227b3.3
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 09:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=RaZnFUNOLdikWwv8p5bD4oSkCiqi8i2+Xv4XAEK5cDM=;
 b=MMZR8GkGi4QruRCAd4sLWkKcbe+poPveB+ZYLBOdAb/qUnVaPsBtJn+aDHLmPgv7j8
 KpM7FtS0/m159vhtL4gjAcAdWeK6WO2penB/9unVDGkqfPJQjMcXfqAK0cmBHQVVJdWX
 aetwPivReimr1z56WeeDDwDuvZ+KaK4euVurv/oyibfxT1O8SQeVuuIfz0VSVvsBPG1W
 jpfxQFZa9u3iEmyVxzFYji543qZCltf99h11x/VbQJlU3fc7klyqJMfOmeQLkty3aeXP
 Xb+cR80XxPoJgRRAKnVrsdrVUe/mvsSBiHPa6b/XEr+sKGSCkiqLiQzItXNPQo0UEqCh
 ei6g==
X-Gm-Message-State: ACgBeo3TdXMi0mcpevJGLL3tCJc1/ep6SiBUOv2fqItUuVZpq2LKFPHt
 EFmcJQJIYy5+HGAVVGDv38gDc+P6O1e1xwc4yvI8FMBDIDA=
X-Google-Smtp-Source: AA6agR5l1AZ5v5RFE00LTAiT3kQ3reBkn2FUCO31/Tt79Nds/oILCDl3q5/ZBHb5deC4Al1Wui+w1UgM/vONAJUqG3s=
X-Received: by 2002:a81:59c4:0:b0:31f:4804:76ad with SMTP id
 n187-20020a8159c4000000b0031f480476admr14651425ywb.143.1659890792592; Sun, 07
 Aug 2022 09:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-5-emile.cormier.jr@gmail.com>
 <20220807181220.7688111e@windsurf>
In-Reply-To: <20220807181220.7688111e@windsurf>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Sun, 7 Aug 2022 13:46:21 -0300
Message-ID: <CAM70yxBzagJt5b-3_vKO=AaknpvLbKhyLMPhbs=VC5XO0RgbOQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=RaZnFUNOLdikWwv8p5bD4oSkCiqi8i2+Xv4XAEK5cDM=;
 b=f3DgmLsGNcnxrsoxHOjmQx3JZX6tT9Ws9LvGHRObx3ZuErxaizFwcJc2yeQgcerJax
 hFx1Btp/B21MfzvjDUEa5U7taPTmOGYf24qqgkOn1TrczezqrEVo/TqSOBOUC+jJkbl8
 ycOrwEXzOdBC35ESECpo/zwD61l2eXtXzg96ozC30usJKwq5ys3Tz9SY+gHSKJ+gpYVG
 TwiMDL0kTWoZTOCz71JqovWraiOZIsNgYJ+pDj1HlbUnfLUtPrGxpHmqucSooi1s/erW
 /ZiBhtqO2jZv0ykypBw7fxDMreK6nnQNW4IuDP5iObHv6Le0dqHWMPO97xvvVHPXPZpm
 8hgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f3DgmLsG
Subject: Re: [Buildroot] [PATCH 5/6] package/python-autobahn: add missing
 subpackages
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9058213953931590488=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9058213953931590488==
Content-Type: multipart/alternative; boundary="0000000000000efa0505e5a971db"

--0000000000000efa0505e5a971db
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 7, 2022 at 1:12 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> I do see the cbor2 dependency being expressed in setup.py, but not the
> cbor dependency. Also, I only cbor2 being imported in the autobahn code
> base, so I dropped this line. Of course, if there is something I
> missed, let me know.
>

Are you sure you were checking in the 22.1.1  version of Autobahn?

The cbor dependency is here:
https://github.com/crossbario/autobahn-python/blob/dc626948d5ffbd741ec1e3a7906870eae1a4c69b/setup.py#L82

"import cbor" is used in both these places:
https://github.com/crossbario/autobahn-python/blob/dc626948d5ffbd741ec1e3a7906870eae1a4c69b/autobahn/wamp/message.py#L36
https://github.com/crossbario/autobahn-python/blob/dc626948d5ffbd741ec1e3a7906870eae1a4c69b/autobahn/wamp/serializer.py#L660

--0000000000000efa0505e5a971db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, Aug 7, 2022 at 1:12 PM Thomas Petazzoni &lt;<a href=3D"mailt=
o:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I do see the cbor2 dependency being expressed in setup.py, but not the<br>
cbor dependency. Also, I only cbor2 being imported in the autobahn code<br>
base, so I dropped this line. Of course, if there is something I<br>
missed, let me know.<br></blockquote><div><br></div><div>Are you sure you w=
ere checking in the 22.1.1=C2=A0 version of Autobahn?</div><div><br></div><=
div>The cbor dependency is here: <a href=3D"https://github.com/crossbario/a=
utobahn-python/blob/dc626948d5ffbd741ec1e3a7906870eae1a4c69b/setup.py#L82">=
https://github.com/crossbario/autobahn-python/blob/dc626948d5ffbd741ec1e3a7=
906870eae1a4c69b/setup.py#L82</a></div><div><br></div><div>&quot;import cbo=
r&quot; is used in both these places:</div><div><a href=3D"https://github.c=
om/crossbario/autobahn-python/blob/dc626948d5ffbd741ec1e3a7906870eae1a4c69b=
/autobahn/wamp/message.py#L36">https://github.com/crossbario/autobahn-pytho=
n/blob/dc626948d5ffbd741ec1e3a7906870eae1a4c69b/autobahn/wamp/message.py#L3=
6</a></div><div><a href=3D"https://github.com/crossbario/autobahn-python/bl=
ob/dc626948d5ffbd741ec1e3a7906870eae1a4c69b/autobahn/wamp/serializer.py#L66=
0">https://github.com/crossbario/autobahn-python/blob/dc626948d5ffbd741ec1e=
3a7906870eae1a4c69b/autobahn/wamp/serializer.py#L660</a></div><div></div><d=
iv><br></div></div></div>

--0000000000000efa0505e5a971db--

--===============9058213953931590488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9058213953931590488==--
