Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D100C021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 08:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 058CE6084F;
	Thu, 13 Feb 2025 08:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-7v9IEcF1n7; Thu, 13 Feb 2025 08:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF9C6116A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF9C6116A;
	Thu, 13 Feb 2025 08:18:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BD1FC2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B517408D6
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OMvX_Za1u5j for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 08:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E897408C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E897408C6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E897408C6
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:18:23 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4395dddb07dso6110555e9.2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 00:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739434701; x=1740039501;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mPQFIMzvkawP+WoS8/546X3GDL5fAoVufMl6blITK3I=;
 b=koEKzNSHTy9arHwDqO5bKT40x6/sneRQUpCWtqqWWqTwz/ApkPdfJGa9HVXwiwW2P+
 ba4xcw/IzyuaEz3wiluTqVGPTJwgWIx1zxb2pFae/mMS0vUHqHBMxovPB4kWGNl5XMxQ
 vBKiquHssKCow0OQMqmqcCrEk/aly8Ubu5W6ByOlsBHDHXrHOBavRxcpyOAGi4bGRIax
 8UuPkUI/PHPGEAhqXs+SqZhe440Y1tW/k0zylCtoOjXSvdwGWqarOSpZRJhpdeB2o34V
 kTFzehhRdIyhUidlhWRLMZ2RLFR6EQ/fAJYa18TluKB/HEFvFax8E9s8F2BwjehJ5bmV
 reqw==
X-Gm-Message-State: AOJu0YwSAdp0rjh6tMF4BLL3+f59BEMesixQrZ4NcJ69ogKbZV9zA0m3
 vswF5KzuyTD4utf3tsXXjH79Enowr//9E0nqgSi9h0bzEtqpsmjuvMzMaskBhrJz/BygOASkHte
 5JAwwI+U47Sp3AXYyHUkWTNco09U=
X-Gm-Gg: ASbGnctYoX7FF2SHb7n2r/vM/upH0BXJp8ckmelRDf0CpXE+JO5MbZd1oXFYa1ZgZys
 NQ6yIrmSVwTy4Vs3UALQMvm/I+cvH1vja02DbR8YVOiVGJEorKR74/NHGC99qDlp6poQAax/jA9
 AwMjvXTAI3xh/v3tI7eBtoyRUO8ERZjg==
X-Google-Smtp-Source: AGHT+IGaRRZJP0Tw8lLED5KkeIO+hIyWTlJmwbPxo/bye7713NV+WIyWhmPPyyu7v0VT/iNDNte9n7ueNttoKBUII3Y=
X-Received: by 2002:a05:600c:8706:b0:439:55a8:c61f with SMTP id
 5b1f17b1804b1-439581ca4f1mr68630535e9.30.1739434701152; Thu, 13 Feb 2025
 00:18:21 -0800 (PST)
MIME-Version: 1.0
From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Thu, 13 Feb 2025 01:18:10 -0700
X-Gm-Features: AWEUYZmAfJhpbesGjgMgrQB2dLqYbWmLCx0oCPrsyu4R_LwEbGtCGauekIdEv9c
Message-ID: <CAGrGpJAvUU9u4zF7vzvu+upr2RQBLp37ESRdQfBVmrXbmv802Q@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739434701; x=1740039501; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mPQFIMzvkawP+WoS8/546X3GDL5fAoVufMl6blITK3I=;
 b=DXctobsEdSm8fsDdK1KkP+Rp6o+FD5qC0nT562W/GgUJ4d5py+DIC9IZ5V6F33jDVr
 FLiE3ysPybRBcx6C1uB5haiX5VYiDaln0zgFAQr2R+7Sd+/eNLkGnZsMEH5AQVCPSAWI
 D7Uiq69QaOhdVbUy25uQtkDl8hvmUJnF36UhadIaM4TsPK/6g/e/04WXcp0PwmpaIOjO
 FEFsOa7ntJiu2ZreG3AmYLrWWVoCYgvonYFpCDDQJBAZ2WU+epbSIfbQU31pA23VvLi7
 0mYIZMRMpW5Rs9FjryrsRtrE2i1eYFI6cg9Hd9X/XyEzBenj9nsUlvZOj61iLlVGsHTG
 gGrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DXctobsE
Subject: [Buildroot] previous sdl2_image and sdl2_ttf patches are wrong -
 please ignore
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6354191347064486146=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6354191347064486146==
Content-Type: multipart/alternative; boundary="00000000000078e834062e01b360"

--00000000000078e834062e01b360
Content-Type: text/plain; charset="UTF-8"

Hi Julien
I am having a brain freeze on this update to buildroot package sdl2_image
and sdl2_ttf.

The previous 2 patches just sent are again wrong and I have resubmitted 2
patches that are hopefully correct.    Third time lucky (I hope).   My
apologies!!

Peter

--00000000000078e834062e01b360
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien</div><div>I am having a brain freeze on thi=
s update to buildroot package sdl2_image and sdl2_ttf. <br></div><div><br><=
/div><div>The previous 2 patches just sent are again wrong and I have resub=
mitted 2 patches that are hopefully correct.=C2=A0=C2=A0=C2=A0 Third time l=
ucky (I hope).=C2=A0=C2=A0 My apologies!!</div><div><br></div><div>Peter</d=
iv><div><br></div></div>

--00000000000078e834062e01b360--

--===============6354191347064486146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6354191347064486146==--
