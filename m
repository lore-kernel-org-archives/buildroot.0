Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C2AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 12:08:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEDE361A7D
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 12:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EEDE361A7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A3780F03;
	Tue, 16 Nov 2021 12:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WtgqOD_dPw_E; Tue, 16 Nov 2021 12:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00DDF80EF3;
	Tue, 16 Nov 2021 12:08:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7BC01BF31B
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 12:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7AD8401F9
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 12:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zH8wT9VblSrJ for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 12:08:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 846CC401DE
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 12:08:15 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id g14so86776301edz.2
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 04:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=2qSW94dJwn3kfpwG/pc0+SvPox3AIh5C8Z2UCYR/7jE=;
 b=x7oSDeKopn+G+iwtXPstbrREjSuoNtFGTbD0RCW9Y4JXOhduE0B9jFXi2XLATpbmAo
 WCVP2TZNHjIMlZB+8qDfF57f5F8NmzZewTrMHS4j+zbO88OUMePAYtQ7gJrCbg5fAAlX
 DF0kmxOPEiXX55MGh60E5+FW2S9c/2W+yFa0fMaLpUXXZnSbI2Vaqjje8Y84yy8w9DgX
 qR4ovUfkSOJbxLs4iq9sK/4ar61k9LCpp+0lODMoFYIQgB19mx5r5qo04ZAjI9Qq5CEp
 9v00xqQ5hn+JPsWdeCMuUfnUgQwCJR1ydVUpQpzQPYcOy4jfDt/EPTaaeTD0TpFW0pTG
 R34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2qSW94dJwn3kfpwG/pc0+SvPox3AIh5C8Z2UCYR/7jE=;
 b=ptChCZFRtzN++3ya64P4z2P2xW3HH8lxFwJLWXnnudmTNMGi3EVb9kQyK94lsueSoW
 agtsN6BI7aw6ayZKzSoeOidNB4oaYt0Y2XT9CZUq/hDCKZsOePO7CblSR3p/OVnmCNks
 4Jrk0tmaIaOZmfFatGA0RDSjSbvT2TeRggpm4HVeMWBTYDSYnqgbkIgON2bKsySqKCyl
 sYWMiKsu241y/A4+Kd3Y9DeBciiyrJqjlTkqqbC28UELyC7+K1CBNbbijTfmN1o5Wr5z
 pQBGkYn5TvYuV4dFVSby6qnqL1xw8T6vR+3gCBi/fwtJf/gab/0e8UXUN39s/Dy1V/VL
 IhoQ==
X-Gm-Message-State: AOAM530iM/JuNZQrPkOuBogHJOWD4Sh//AQiJTZHYRZaH9HyUYC1T+CA
 E10LAcPKYNjw1eyhtMMB0qfiVUNRD3/esMoptXa9zwmdJvbO3A==
X-Google-Smtp-Source: ABdhPJxZGA60BXUalRJSpsdws1eZCJCDIH5HUkQz9IBiqcHegWNYINCTJ/L8GF6LB5c1PNjjr3nyHPXEG0dFwKpqwrk=
X-Received: by 2002:a17:906:309b:: with SMTP id
 27mr9063902ejv.129.1637064493519; 
 Tue, 16 Nov 2021 04:08:13 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Tue, 16 Nov 2021 14:08:02 +0200
Message-ID: <CAJPV9MpFEQJk5otMfJkC0D2YNjLnanijNhHWSYT3ymtLYd2yeg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] Running script after init
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
Content-Type: multipart/mixed; boundary="===============4282617610965123879=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4282617610965123879==
Content-Type: multipart/alternative; boundary="0000000000009c718905d0e6c77b"

--0000000000009c718905d0e6c77b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Any hint what would be the right place in buildroot

userspace to put an script after the init process is over?

Thanks!


Jos=C3=A9 Pekkarinen.

--0000000000009c718905d0e6c77b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><blockquote style=3D"margin:0 0 0 40px;bord=
er:none;padding:0px">Hi,<br><br>Any hint what would be the right place in b=
uildroot<br></blockquote>userspace to put an script after the init process =
is over?<br><div><br></div><div><blockquote style=3D"margin:0 0 0 40px;bord=
er:none;padding:0px"><div>Thanks!</div></blockquote></div><br><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px">Jo=
s=C3=A9 Pekkarinen.</blockquote></div></div></div>

--0000000000009c718905d0e6c77b--

--===============4282617610965123879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4282617610965123879==--
