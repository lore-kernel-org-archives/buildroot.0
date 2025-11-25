Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F44FD0E6FA
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 15:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B03D825B9;
	Tue, 25 Nov 2025 15:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCGHifukggjQ; Tue, 25 Nov 2025 15:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E82D82564
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E82D82564;
	Tue, 25 Nov 2025 15:30:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4E5D359
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 15:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6C78408C6
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 15:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id musUfk0nzkQ9 for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 15:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7E30408BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7E30408BB
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7E30408BB
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 15:30:30 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-ba2450aba80so3353368a12.1
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 07:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764084630; x=1764689430;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cjpnCYSG5GpWG6LLivwZf7S0ZBzfDJAbNw532Kb0MRc=;
 b=RQ2lj690ATdaxOVvjmfH4mjCRuHC/Dhx6GZNfFdFMHcB/B2DKUdVy0R0LbMfTqmq5O
 ywzBtprh94bMv0poqsXT6X07Q6yPKbljM13Qwqm5LNE6ztNEchEk6y7/RC6DmpbVfPQZ
 VpGn32HvMzxt4GDAP67F0Ic3yF1Qygn9/BYKWI7viFXIG2JBQ924OQ/5ltBfzlRydgH/
 ReHAxj/pLhPWeTHFz5VJKaRGIRMnON5Zqnto9kYb+WIXKigpMnlmYhoN2z9HRHYHfqq9
 rxUWQlHwpiHS+lKmMvrsXICRSE7OQLZ/FLsD/wf1A8W1bQKF/QKhi3UtMRY2Msd7BIgo
 gi/A==
X-Gm-Message-State: AOJu0Yx/mZDkeidH2c7ojngN/cEoEZmb3d71NH1r0Dx8b+s3b+Aa4qaX
 WVVTREv1j50uaGJ/aUpq9f/zpcL5WJE1zwJF8pDgp/MVhDxMuoUE8JWk6Itc+Hzkj9CNPdv8tA5
 2DUUv5TV3zzCsCYmBkWN5CvPLjEBO39BDfks3
X-Gm-Gg: ASbGncuYu08CYnRUAQtTtKIOMaZ77k2uAvNNb86pMJZUr53uSkBI+yZgWcup8DD0Z5d
 CWzV7GrN5fcvnPcl/phVn3VULQE4B9lcpfF9x0D762GTBzmDF5wr47UC/HeUG8R2xWNLSDwmFTi
 +vO4jHPu0QJ+9bidL0Mvg5YEjWAptmTvdfovtChl8cLxElQWLV2QEityO2E4wzI2dYf0d0LxFUV
 DQeH5cQT2s9BEXKNXv9Wj9nAieFb6bpi4CotNHzrG51ZgnVH39ib+JiCAXwrUbwA8untPA=
X-Google-Smtp-Source: AGHT+IEVxQADheCG0c1fshD0M2CVdS/cu6BbZfFFwfpiuudTT/tXPmoaz1Xtecf156OmKy7z0pbOd9qTRVBbNFfjL0A=
X-Received: by 2002:a05:7301:46af:b0:2a4:3592:c5f9 with SMTP id
 5a478bee46e88-2a941593cf8mr1472033eec.10.1764084629478; Tue, 25 Nov 2025
 07:30:29 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Zolt=C3=A1n_Gyarmati?= <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 25 Nov 2025 16:30:18 +0100
X-Gm-Features: AWmQ_blRs0FVwOkmCuZrx3tp1DIpI43c5D9cAvYvlcBPlIm1oLMreIPVRUHVNIU
Message-ID: <CA+LtECCS=fru2mzA2r4Gz+SOU1GuW2AqnyV7HE29EiJ=_BMccA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764084630; x=1764689430; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cjpnCYSG5GpWG6LLivwZf7S0ZBzfDJAbNw532Kb0MRc=;
 b=Bbrx62Y6GRiwHpQ0V17kKaSbcOZCb46hu4Ol3RLtHjf+qYDFPSAn5qSgpiDMQMkyTx
 dDSqc96DrYByGoEgNhBWirlf+8b+lVrqyIBQPmRlAnKwRuo0Uq1ZJDpfbhQ449npYHsz
 Zyh3XiwWp8OJt1OQSzkzQnaP8u94PdxEn9Zp9Mb4u7RpgAbvE5BBPIjasGVHikDv8KaJ
 rEVZKkHXT+Idr2HODNxAHjL0ai0a+PiowzxKxBEYSwhVjAfMIymXF5/L4E7uwKrrKSF9
 FJy/+HDSpKiNC8/leEqpsjiMyXPMHs07dQDiOled6Fl08oPcVyXXRcknI7C2PJNXxacg
 /Awg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Bbrx62Y6
Subject: [Buildroot] Qt6 upgrade
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
Content-Type: multipart/mixed; boundary="===============5108604973774896864=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5108604973774896864==
Content-Type: multipart/alternative; boundary="000000000000b1a05b06446cf50a"

--000000000000b1a05b06446cf50a
Content-Type: text/plain; charset="UTF-8"

Dear All,

i see that there are a couple of pending qt6 related patches, also an
upgrade to 6.9.1.
I happen to have some free time and impetus to do the upgrade to Qt
6.10.1 and the needed testing. Is someone working on this atm? If yes, I'm
happy to offer some help with testing/reviewing.
Generally, would we prefer to jump straight to 6.10.1 or should we first
test 6.9.1 (for which we already have patches for from Roy here:
https://patchwork.ozlabs.org/project/buildroot/list/?series=460278).

Thanks,
Zoltan Gyarmati

--000000000000b1a05b06446cf50a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear All,</div><div><br></div><div>i see that there a=
re a couple of pending qt6 related patches, also an upgrade to 6.9.1.</div>=
<div>I happen to have some free time and impetus to do the upgrade to=C2=A0=
Qt 6.10.1=C2=A0and the needed testing. Is someone working on this atm? If y=
es, I&#39;m happy to offer some help with testing/reviewing.</div><div>Gene=
rally, would we prefer to jump straight to 6.10.1 or should we first test 6=
.9.1 (for which we already have patches for from Roy here:=C2=A0<a href=3D"=
https://patchwork.ozlabs.org/project/buildroot/list/?series=3D460278">https=
://patchwork.ozlabs.org/project/buildroot/list/?series=3D460278</a>).</div>=
<div><br></div><div>Thanks,</div><div>Zoltan Gyarmati</div></div>

--000000000000b1a05b06446cf50a--

--===============5108604973774896864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5108604973774896864==--
