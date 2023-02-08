Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E571C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD4C440C28;
	Wed,  8 Feb 2023 16:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD4C440C28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZEYhw26SdMk; Wed,  8 Feb 2023 16:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DADE40C22;
	Wed,  8 Feb 2023 16:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DADE40C22
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DB641BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28D2540C22
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:07:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28D2540C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gjHpj5K7Evo for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:07:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55CFD4014B
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55CFD4014B
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:07:29 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so106649pjw.2
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 08:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PX3dtmc0Ln4C+PUvo97wqcHkJsY42Z4hYrA8XOczE8Y=;
 b=Jocvi6iREVrlHvEN0TB2vfWx5jgaT4nz7z+hGjPNpfc3AJNad2iQUmt6kZLmfa4uMi
 yq9L64RbQg+IX4ANxev6AA+71llJG4vNgXL3VqOUk1Z2hAxpVaSbuKJ+gsHoVhmsKSZW
 WvnvwjvL1M7rx29xkP8kk5/hiQe+N9KaIiPJvCykrvLYa4+tA3kQbhH/xEw3NTgpph2X
 OIR9fbZSP6goWtGby3WOvv+GIVx5O9/YCNx17cxtEZYINIU3s/U4WSjQ/XtCRJWyPDhN
 umMbLkf6u8qlrEHRAhxfO/Q5MqVsfvLjdZiaWbGrqJZw/dtuhcR9vBdW9/iVJb0JmCvJ
 MbKg==
X-Gm-Message-State: AO0yUKUy3Y/YgJtL5wBBCZUsbE78nSABp0A10dd7h6xqfcWmTe85JL+B
 o1KHxa7yTLE7o83iSd7xoao7kkZ78QLS+Mkrua6WODcR
X-Google-Smtp-Source: AK7set/MxQyZ0L/koCHHdR98QKMNZyoWZO8oiqSMQJbw6si7rsTmPagtkQLWNMY3ZqQw7bhcH5PvvnFoO7fzNkPlFzU=
X-Received: by 2002:a17:903:3249:b0:199:5262:f127 with SMTP id
 ji9-20020a170903324900b001995262f127mr326038plb.32.1675872447883; Wed, 08 Feb
 2023 08:07:27 -0800 (PST)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Wed, 8 Feb 2023 17:07:17 +0100
Message-ID: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PX3dtmc0Ln4C+PUvo97wqcHkJsY42Z4hYrA8XOczE8Y=;
 b=SJxL5+VNWAcnSdw9YOQw53Oc8eGsdvXh/Fl09xMBd9AdpToQLELCjnxE9upZ8xaq5Q
 xXlUhUyaPuJwndt8sBtzThWh1+B0+bek4u9d65ieH+RQl5cwwrwFLik4J6r4btO16l8y
 pG/jTg0dNR+/dmV+WmNWa1q1UiANA+GfM+tkY4IM+UXACffCFmM5rDNcauw1C78KUS2/
 P2w2sULAKV6Wu5a3EUOHtMkvO8z07S2nRPxIEgpeyu8mNd7uyOW0EY1IjJJYOJW/zZJO
 Ak+NB26Fgc7JDNi5OGb9bsTMe3PFnj1BG0+kCX4cRHoL5e4+X9/26dFtuqZX19t0jSC0
 1OUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SJxL5+VN
Subject: [Buildroot] How to install custom sdk in buildroot?
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
Content-Type: multipart/mixed; boundary="===============5554186634401154380=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5554186634401154380==
Content-Type: multipart/alternative; boundary="000000000000f1edd905f43275b0"

--000000000000f1edd905f43275b0
Content-Type: text/plain; charset="UTF-8"

Hello All,

I want to install a sdk on my Buildroot based Linux machine. SDK location
https://github.com/aws/aws-iot-device-sdk-python-v2 . They don't have any
packages which I can add in Buildroot.

On a native Linux machine, it can be done via pip. But how to do this in
Buildroot?

Thanks in advance

--000000000000f1edd905f43275b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0All,<br><div><br></div><div>I want to install a=
 sdk on my Buildroot based Linux machine. SDK location=C2=A0<a href=3D"http=
s://github.com/aws/aws-iot-device-sdk-python-v2" target=3D"_blank">https://=
github.com/aws/aws-iot-device-sdk-python-v2</a>=C2=A0. They don&#39;t have =
any packages which=C2=A0I can add in Buildroot.</div><div><br></div><div>On=
 a native Linux machine, it can be done via pip. But how to do this in Buil=
droot?</div><div><br></div><div>Thanks in advance</div></div>

--000000000000f1edd905f43275b0--

--===============5554186634401154380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5554186634401154380==--
