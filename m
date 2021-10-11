Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B6EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 18:16:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9726603E5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 18:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9726603E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81FF680F50;
	Mon, 11 Oct 2021 18:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vi2TN5kE3f0S; Mon, 11 Oct 2021 18:16:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C00A680ED6;
	Mon, 11 Oct 2021 18:16:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4231C1BF2C1
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 18:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 325F180ED6
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 18:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 635hitFUH36U for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 18:16:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB34280EC8
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 18:16:15 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g10so70364891edj.1
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 11:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=dlohsyiUD1ygOrp8rVHLYek69S1WTd7sQLbZQyorgS8=;
 b=PDbzrOypdfHwQJeoOzx1rWJM1U9NAZklgrHsJSWeNLQZdKUZeqlZT2LSm7mO90raI+
 7fkX5CnRxS8WKPATCmGgCZKh7mdnI1jioURvmJqbT+iZ1EjOozdT28rVVvaO8zbzcVTq
 V1L7Hqs4dWU/hTY41Ii6Z7ub5T9Vua4jpNX//gvN77eJ22ids345SrjH6xnCzJrax+gN
 g2FWZohc5/ZIw0MCgy0/bDBdeSwoDgk/nICrAeIQTGF/pElG/EavfAD6tF6o2s3yl5he
 1yvWsfYDTjCqpyyiyhhFVKQ0uFejkDPZ1lDFLlA90owNgtate5TIghdSe/ZJpwybMy3i
 1ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=dlohsyiUD1ygOrp8rVHLYek69S1WTd7sQLbZQyorgS8=;
 b=3Nl7omT9ORN6QUyiUoM2n7DD2spRiRCsd+gFnKI8/wbSkoDa1WTpw7Bazew5Z53zTP
 1zIUoSbP2eZicf7EDMC3oNMcyVYv8dioIzZl4svqTYm9chfwOB71STOplKlisjFZxf2Q
 pZQB9qyzWLxhDMAldHeSh9gypGjMOD6zcrx7g42JJUR/XARKNRuZ9vQpAuncTgmm8wHN
 MQnrnwQv3YP1DB6QkX1GWbGh+FEjhSBzwJAMyvTP7NEYw1mggvAt10HR/xcykW9Rn6lM
 1l2W2Jc6UVgyDlg/z7lQqQq9wkJIwg2+GECyxw/PXhMOBPHBYKTpEnsWOAQTPTQv9/SK
 gM7g==
X-Gm-Message-State: AOAM532dfC3RXl5WvX0c6F/RQTbFMpNnd3sSFbg2gujaJK1s0Wlcmaaw
 RoFrbx2KZ3WMYmB/Iw7O+Yhc0WygPrQJv/avbN5uEtS2wr4=
X-Google-Smtp-Source: ABdhPJzUnYOs7WGLEFfsTLnuORPxCZeg4sawbwYNApYf7vqO7RmdWMDfVyLUL87lB3yHaV/9AUAnC3uc2ekwg6OOkEg=
X-Received: by 2002:a17:906:e2cf:: with SMTP id
 gr15mr27407206ejb.468.1633976173376; 
 Mon, 11 Oct 2021 11:16:13 -0700 (PDT)
MIME-Version: 1.0
From: Charles Hardin <ckhardin@gmail.com>
Date: Mon, 11 Oct 2021 11:16:01 -0700
Message-ID: <CAN=fXj2_ph7V-0yj2CfMe_S1cZK+_oacpXOE_CQ=WeeNyfwwYg@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Host aarch64 external toolchain support?
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
Content-Type: multipart/mixed; boundary="===============4683897673456077650=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4683897673456077650==
Content-Type: multipart/alternative; boundary="00000000000062b9bb05ce17b9dc"

--00000000000062b9bb05ce17b9dc
Content-Type: text/plain; charset="UTF-8"

Just checking to see if this support is already being considered in next or
a new revision, it seems that all of the external toolchains are based on
HOSTARCH x86_64 at this moment.

We have some server arms for the buildfarm and likely will have some people
building on Apple M1 chips as well - which means we are going to need
prebuilt toolchains for multiple hostarchs.

So, it would seem that the flow should be to make sdk on the both x86_64
and aarch64 HOSTARCHs and then push the tarballs up. However, the
BR2_TOOLCHAIN_EXTERNAL_CUSTOM options seem to provide only a single
download path without a selection on BR2_HOSTARCH or a conditional.

Is this the incorrect approach to use? or what has worked for people
dealing with this already?

Thanks in advance,
Charles

--00000000000062b9bb05ce17b9dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just checking to see if this support is already being cons=
idered in next or a new revision, it seems that all of the external toolcha=
ins are based on HOSTARCH x86_64 at this moment.<div><br></div><div>We have=
 some server arms for the buildfarm and likely will have some people buildi=
ng on Apple M1 chips as well - which means we are going to need prebuilt to=
olchains for multiple hostarchs.</div><div><br></div><div>So, it would seem=
 that the flow should be to make sdk on the both x86_64 and aarch64 HOSTARC=
Hs and then push the tarballs up. However, the=C2=A0<span style=3D"font-var=
iant-ligatures:no-common-ligatures;color:rgb(0,0,0);font-family:Menlo;font-=
size:11px">BR2_TOOLCHAIN_EXTERNAL_CUSTOM=C2=A0</span>options seem to provid=
e only a single download path without a selection on BR2_HOSTARCH or a cond=
itional.</div><div><br></div><div>Is this the incorrect approach to use? or=
 what has worked for people dealing with this already?</div><div><br></div>=
<div>Thanks in advance,</div><div>Charles=C2=A0</div>





</div>

--00000000000062b9bb05ce17b9dc--

--===============4683897673456077650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4683897673456077650==--
