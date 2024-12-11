Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C889AE77182
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 17:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72CB980DBC;
	Wed, 11 Dec 2024 17:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAZcA2yQsldD; Wed, 11 Dec 2024 17:28:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9492080DCC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9492080DCC;
	Wed, 11 Dec 2024 17:28:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F021D962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB05540519
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zHpTx4c93Rw for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 17:28:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com;
 envelope-from=tommyclee101908sun@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2CA7403E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2CA7403E2
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2CA7403E2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:28:02 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-51640f7bbd3so1218090e0c.2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733938081; x=1734542881;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3QzdHbwJShskkuTW0TcWZXPqQX1asCIjYEmHpEu5x+M=;
 b=eXXsGX3b5AcsVdVcVzvcs8jPN39bYdaPaV7uWz7jZyNnhS0sPN1VvhAW92VDW5cBce
 a2WSgxkbSpAkznmVNdRoXKTrfUhj3QADx/qsK82L7c4ibJDs6Sjyg3Sq2M84Mo+f8qJf
 xLKDvmR/xLMQI5QXmuTfJrUH8S+TkOMXq/x9mb4uS8zxe4SSLl6rCJkJVv0AVcaLRcXE
 +pgFwmTlAfnDMA5s+E9cc+znujf8JcgRs9BCSWrOV4wuzb0AmRwZkWdtnyBElAWmw0SJ
 b0UkLdNYd48yHV/WBKhE/FmdsrBiqwoOuBgyitiLESDYNoVxnZ496gRtrSA7X+P5chdP
 Vx5A==
X-Gm-Message-State: AOJu0YwNjMA9IWcED0F+ANyk0Z9pIaF1SN2i+JGQIEkzjwGK8flUgpHV
 PL052UQmImHk+YTwtZAlB9tYeKY3VHv9mBl9cQO79vfyD31n2BXQIW+OzxCYkVabUeLZUeDu8M8
 FUCPso4nDTYrTFUoTr8dTjIzwXzJQMaWw
X-Gm-Gg: ASbGnctdoHNc9iYGt7EY/SvdqgtrPDNbOCFbEPtMyIC0m5vDr0uAfOEBA5gHhyrhz3p
 gmrhCwsaR3BRTFUhU8ixSY+imhIlE9c63KeA3
X-Google-Smtp-Source: AGHT+IFGbTivP7tEE2jpKOi9vGgl+OZoPDaLQ9pXznl7Ix9z1ArRxWCNXISu7xpded/zQEIhM4+hFNCVNKPuvyIdtUs=
X-Received: by 2002:a05:6122:65a4:b0:518:8753:34a6 with SMTP id
 71dfb90a1353d-518a3c456d7mr3853999e0c.10.1733938081442; Wed, 11 Dec 2024
 09:28:01 -0800 (PST)
MIME-Version: 1.0
From: Tommy Lee <tommyclee101908sun@gmail.com>
Date: Wed, 11 Dec 2024 09:27:50 -0800
Message-ID: <CAGJPcGYG2eOTcC8XeKmj30KcVc1PbpN7GpkmotJd-WZQkEG_8g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733938081; x=1734542881; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3QzdHbwJShskkuTW0TcWZXPqQX1asCIjYEmHpEu5x+M=;
 b=FSE45Q5fA2JkxtZ5AcGrQpgqyPRQzkWKD0TqsiFtD36eypZvcs6st2SqFPZhItvN7s
 DRbLkr/fPX3gqrhght5DslT88EjB05QkWbf9GmtXza+ncM2E01tLbdv0b1JP2ufdHveC
 S+7L5vmOiUzCzPBE9RQf7LtDQkLfgSwQ4t8y/Q2pwWVe7GWdAxwvPYYBat/8sXsTayCB
 iFWBjAv8C1Zn2FrNCC/KJShRSj6uDLNni8VLRn7ufs+j5zMoq7kjlkXiX5Nwc5kPH4Us
 c7OYqwXA1zzQrXRe3v3L0VpV3FshXbJo+xLKTbQeSCh0aWg5rNGTbtCgdC9lvMDDlGo/
 RHIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FSE45Q5f
Subject: [Buildroot] The buildroot release which has the gdbserver
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
Content-Type: multipart/mixed; boundary="===============4114511782864382438=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4114511782864382438==
Content-Type: multipart/alternative; boundary="00000000000068330b062901ebaf"

--00000000000068330b062901ebaf
Content-Type: text/plain; charset="UTF-8"

Hi Buildroot,
I am glad to be a new member on the Buildroot list.
Please tell me whether I should send my buildroot technical issue to
buildroot@buildroot.org.
Thanks,
Tommy

--00000000000068330b062901ebaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_default" style=3D""><span style=
=3D"font-size:xx-large"></span>Hi Buildroot,</div><div class=3D"gmail_defau=
lt" style=3D"">I am glad to be a new member on the Buildroot list.=C2=A0</d=
iv><div class=3D"gmail_default" style=3D"">Please tell me whether I should=
=C2=A0send my buildroot technical issue to=C2=A0</div><span style=3D"color:=
rgba(0,0,0,0.87);font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;=
background-color:rgb(248,250,253)">buildroot@buildroot.o<span class=3D"gmai=
l_default" style=3D"">rg.</span></span></div><div><div dir=3D"ltr" class=3D=
"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Thanks,</div><div>Tommy<br></div></div></div></div></=
div></div></div>

--00000000000068330b062901ebaf--

--===============4114511782864382438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4114511782864382438==--
