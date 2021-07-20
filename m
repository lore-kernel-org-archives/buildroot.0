Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=3.0 tests=BAYES_20,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4ABC07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1CD61004
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1CD61004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nklabs.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02C4F404EC;
	Tue, 20 Jul 2021 20:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BENFcwBGoDYo; Tue, 20 Jul 2021 20:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 341CD4047C;
	Tue, 20 Jul 2021 20:42:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 248461BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EF2B83A4D
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nklabs-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcZ4Q9WT0y1B for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:41:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59F8D83546
 for <buildroot@busybox.net>; Tue, 20 Jul 2021 20:41:52 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id k11so25496116ioa.5
 for <buildroot@busybox.net>; Tue, 20 Jul 2021 13:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ro8PJ3YTD5lCD6lzOpYtXsNjPRlZ1UNCx2rW0Wac73Y=;
 b=RidHY1oFc+ocwIqPJpv5qL4EFi3JxMQDnvip2UZim1WxONh/6wzfln2XVkKw7CCfTC
 knVxyc04lUI/o2KQqWuAlnlrfiw8090khq0oyvT0RNaN7H11AK6PAgObEwxe8zmeJFBp
 bws5+b3Tepe07B9uCTZdm7b2Em77orHURPoQb3pPfFf30cikDgue0X8T7qhiTDdFdMed
 66h7ICQXUWKU3ZkUlr7ien46MG7awEwIx1CiV7cbcClhPnqKakzmLOgTFuXq9tTp0f5Z
 HaZHZ/+Mr5Nq+PGdtulUsX3jKVOF1E/bBRy9mpMrm/9Eeh0cwky1lMo3R4p3vUEDGtHC
 a/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ro8PJ3YTD5lCD6lzOpYtXsNjPRlZ1UNCx2rW0Wac73Y=;
 b=j9Hqx3MWhe2DWLS0/iDaaU8t7ibVGfIGYiEsEfjEvJ0OWfQEau2/QazjEBUZK9O7W9
 CLRh9njiSQsz+60xgHZiEn8zz+W/SWUHDtRhrJ4jJuGg/w9kdrWbz5WkZvqF6QLnxGWy
 aWKR8eeXMUW13kG5tWNVyJd+g3131Rdtbn5iEzU7NNf+7w32QWxohPcK94HlQM41DEr0
 x4OBvth8SUFAx6JFqaPuFU+yKcmP1CVq4rqQqK2xJjSotlV45MFUS/+8gtuYxBMNGjZJ
 RkP9GUpq2Jbf2YAsNCvXDgjgMqP6IceFpoohi4q6rqlw5R2ztsPq32QmuwsiQnYs8ovg
 TLPg==
X-Gm-Message-State: AOAM533ngFTrgMkOZRw67zYTAm/PHUauMUGCLhT86o9vOcGcu2C752Y4
 HeY8LobnXPf+DUdCx50U4asyUMajWciZ+3jch+MdrC9N00PFSg==
X-Google-Smtp-Source: ABdhPJyv0/YzqHjLXJ5aLOYYkuRed7sCW6EwkPx12rz7zDMlZaSeEri+74bba/SI+VXnI7JLYElq4HF6z7FTrd2DkfA=
X-Received: by 2002:a5d:8602:: with SMTP id f2mr24195334iol.61.1626813711399; 
 Tue, 20 Jul 2021 13:41:51 -0700 (PDT)
MIME-Version: 1.0
From: Patricia Holden <pholden@nklabs.com>
Date: Tue, 20 Jul 2021 16:41:40 -0400
Message-ID: <CAJ6EmCd=eJUrY5Qa_SyJd5mVRq0bKtmuQTB-j1HF1bXXZpZn3g@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] Question about pkg-config pc files
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
Content-Type: multipart/mixed; boundary="===============8972371696037746024=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============8972371696037746024==
Content-Type: multipart/alternative; boundary="00000000000062527d05c7941512"

--00000000000062527d05c7941512
Content-Type: text/plain; charset="UTF-8"

I am adding a package that has dependencies on QT pkg-config pc files.  I
see the pkg-config pc files in
output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig/, but
I don't see any pkg-config files installed to target.  the QQmlApplication
code is trying to include multiple qt packages but they are not found.
Running "pkg-config --list-all" results in none found at all.

How do I get pkg-config pc files installed to the target?

-- 
Patricia A. Holden

--00000000000062527d05c7941512
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am adding a package that has dependencies on QT pkg-conf=
ig pc files.=C2=A0 I see the pkg-config pc files in output/host/arm-buildro=
ot-linux-gnueabihf/sysroot/usr/share/pkgconfig/, but I don&#39;t see any pk=
g-config files installed to target.=C2=A0 the QQmlApplication code is tryin=
g to include multiple qt packages but they are not found.=C2=A0 Running &qu=
ot;pkg-config --list-all&quot; results in none found at all.<div><br></div>=
<div>How do I get pkg-config pc files installed to the target?<br clear=3D"=
all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr">Patricia A. Holden</div></di=
v></div></div>

--00000000000062527d05c7941512--

--===============8972371696037746024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============8972371696037746024==--
