Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1F7C432BE
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 13:05:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 736E36102A
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 13:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 736E36102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2921A4049B;
	Wed, 18 Aug 2021 13:05:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dUqIO9pDNWM0; Wed, 18 Aug 2021 13:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 692C4404A5;
	Wed, 18 Aug 2021 13:05:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 316F21BF287
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 13:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2052C80E1D
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 13:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01QmL4dkyAC9 for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 13:05:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBA0380DFF
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 13:05:13 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u3so4940913ejz.1
 for <buildroot@busybox.net>; Wed, 18 Aug 2021 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=OmERXwMi7d6U12YoHm4csFd3kbdU31w9U7KsNOGSi8w=;
 b=hxoNZ/F+Mbi1hxrHCmC7GkyVfyGjzo0f5E6g+ySW2saBJv7OFsUL4mucjm9Ip/zdNN
 Ohh4BoBCXvRd61apSz3UHOC5FeKHv62xAi8sDYikgbBtMlJeiO6659Ii+tMdaUGG5OpV
 K0P5+Zzmp54VGp0LCntWvmRU1L2Lbkfqx8pkIHI8e1mCuOe4dQrkSVA1wsDY9nvHvVwk
 kCFFJGDeX25Sy45Ki29lpmWGUjDr8FhwLvPD2Uw8cQbgqLsqEdvJxficAZMcTZ6AGy+U
 H46ZBZ5ZBfQ7t9X/3TslhPrS0qa1qAhqea1lp+1PmiruNuz6y2fWOKfWlvxj9eEZbc/u
 JEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OmERXwMi7d6U12YoHm4csFd3kbdU31w9U7KsNOGSi8w=;
 b=audoPWdMUm1o9zezcfv+G3ip1UvrxVoVanyctxW4BYuvTcvnJ8OHdpsMCkcMkbTph3
 jBAjkghn4oyMZ6dtY+zJkGMJ7iYYHgEJp/QWxdumG2BA8saj+UPve0d8M9yehd+vZKef
 y05UzDrEoYrIW6s0DhnhDmpKEWNUrGy+iRCr58y6Y+0K3lnBkSYDS1LYBiq2/TJkkSWE
 qXA8xhtzVoKN2uUrJdG9nftDNvNPGhwKg2QK+DzmtbSjrOzi3F8SX8EIzt3l9Gn8cnEr
 UlA0w/HcoIPMR9cQKguBySobsHsxYtIpU4IlXbyfUOeaZWnQYmHH6sE7sHTsaxmXSwWD
 PNMQ==
X-Gm-Message-State: AOAM531CX2XuC/qK4qYCxg0f3/yDg1GPrZqj/8zajeM3nQ0iy7CfppSl
 zz38ID9E2RsZ08c0n1tpV9pUASfYXtM5uNF0oWlCJ5Bxs0Y=
X-Google-Smtp-Source: ABdhPJxUWBk1qFeK2sMJJY+aKiDlZI7BCckoXiwwaukf52ypNlaIMPsngz4hhjpGD1fOigVJwf/Om3umbEGiv5ynpp0=
X-Received: by 2002:a17:907:7895:: with SMTP id
 ku21mr9825931ejc.361.1629291911994; 
 Wed, 18 Aug 2021 06:05:11 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Honor=C3=A9_Julien_Abijuru?= <abijul001@gmail.com>
Date: Wed, 18 Aug 2021 15:05:00 +0200
Message-ID: <CAMF_Hqkdoregortj-vDGDUoDThEQemdUcXn36x9z1oweUvbyUA@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] [Bluez] Bluez5 utils/tools not found
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
Content-Type: multipart/mixed; boundary="===============6395653646772866200=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6395653646772866200==
Content-Type: multipart/alternative; boundary="000000000000a65f7705c9d5156b"

--000000000000a65f7705c9d5156b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm using buildroot to develop an embedded system that uses bluetooth and
for that I enabled bluez5-tools and bluez5-utils. I got the images for my
target but when I test them I have any blueZ util/tool. Especially I want
the bluetoothctl command line tool.

My systems specifications are as follows:

Buildroot : 2020.02.1 (obliged by the target designer)
Toolchain : mips-linux-gnu-gcc-7.2.0
Toolchain C library : eglibc/glibc
Bluez5-utils : 5.54
Kernel : 4.4.94

Thanks in advance for your help,
Honor=C3=A9 Julien ABIJURU

--000000000000a65f7705c9d5156b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hello,</p>
<p>I&#39;m using buildroot to develop an embedded system that uses bluetoot=
h
 and for that I enabled bluez5-tools and bluez5-utils. I got the images=20
for my target but when I test them I have any blueZ util/tool.=20
Especially I want the bluetoothctl command line tool.</p>
<p>My systems specifications are as follows:</p>
<p>Buildroot : 2020.02.1 (obliged by the target designer)<br>
Toolchain : mips-linux-gnu-gcc-7.2.0<br>
Toolchain C library : eglibc/glibc<br>
Bluez5-utils : 5.54<br>
Kernel : 4.4.94</p>
<p>Thanks in advance for your help,</p><div><div dir=3D"ltr" class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Honor=C3=A9=
 Julien ABIJURU<br></div></div></div></div>

--000000000000a65f7705c9d5156b--

--===============6395653646772866200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6395653646772866200==--
