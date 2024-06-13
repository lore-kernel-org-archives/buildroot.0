Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E196C27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 22:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26C4441577;
	Thu, 13 Jun 2024 22:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWYI6EX8okVb; Thu, 13 Jun 2024 22:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D65B24158B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D65B24158B;
	Thu, 13 Jun 2024 22:01:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 656C41BF341
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 22:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52B4F41785
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 22:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13jvqVvybEMq for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 22:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=hannah.kiekens@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06F2D41784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F2D41784
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06F2D41784
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 22:01:28 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dfa71ded97bso1273447276.1
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 15:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718316087; x=1718920887;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a7rpVxbzyNYFZU3ON/U/BwnlFd/NQtGuhHIFrNB9jFE=;
 b=bBgqCI0SSX4L2m/a8SlHQUgQ2A5dXQnfQplqnJzJwuAhu6IJcXz9Hwxb5cQ1iBajTB
 oHaUZeA+N9rh0lYaFOWayhHyd9RQl1z6GDFMP2PKE9kGEYPYbvhsWEvrWRsVbQ1rS0Kh
 SW2qPdhNkpFp9UrId46QdR8wgF9o/V/PhvEIbTdw2z6JJZBdHExgwosAMdIhOvlks8ru
 KZFfykrV+4EKBQpsnmUxq9Xr6MF9g6Pk3d49d0GsUbS3h/Z5fR3l/UIYqf47Ybv9LaRs
 oZ0HV7+E8o1S7QsgJgv8UqcGposJ4+H5MTst/kgCzJGxGdRCQE+PRMojXQTa45d2atXB
 VoUw==
X-Gm-Message-State: AOJu0YwQdSj8wB2NigmgXzaTnHhNRXasuQfaXhDDFqgNuIu1+XJ5E9wM
 VYZn6xatLvYkoxkVaLELWZjzlF4IACnf4nGdpHHUXMOErVKg7Ut/1EDagTGttpJrzXtoyqEoIsO
 jbxw5wCExZMH4x+yn0x5q8MH1HzzPjMPWRI2dyQ==
X-Google-Smtp-Source: AGHT+IH8GX+MHe2O1u3r8GdSM65pvaE8PYrk4XJuDaGua+QyngFpRGrEYrPbFm+2z1w69S9yJtuwrUPqdeQgvMdO+Sg=
X-Received: by 2002:a25:ef06:0:b0:dfe:1a4a:9ba with SMTP id
 3f1490d57ef6-dfefecf465fmr2230353276.30.1718316087130; Thu, 13 Jun 2024
 15:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
In-Reply-To: <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
Date: Fri, 14 Jun 2024 00:01:16 +0200
Message-ID: <CAP07Bnk1GgNw_Ltz1Y2e52PvPBL8CLLM0KzeavNbDvGWQ+EdWg@mail.gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718316087; x=1718920887; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a7rpVxbzyNYFZU3ON/U/BwnlFd/NQtGuhHIFrNB9jFE=;
 b=a2hYCbNqQzHfbCNbtHctJwn4estVC0g1N3DFosBzeXiDr++uqggFTNF8vTS/Hf54Ok
 0lNxHYh3b1RcjVBxL3Q33nG+jAfS5wVW5bJu7gzfw8BHPA05JobxQ6V9HwWGmsj/YS5k
 /rZtb3kyrbSioEh/dnMLQIUPHD5dl3iCwJ9hgs2PSQQ1TnDdZNW+vXoAG+PyDtrmIpuR
 b1Tc1Ay2Dux+wf9t11G25TrB5nFDy3Z76XOj066yjBzedPlHEplom5WUkko3Y89VK6Ro
 9UIqPvpqUONsb4EVu92sr2MmpJlH53tUeiZq9kNNqMaCtuuIspUMTm+0uGj6VC/4NXQy
 HWKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=a2hYCbNq
Subject: Re: [Buildroot] [PATCH v6 09/14] package/qt6/qt6declarative: new
 package
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
From: Hannah Kiekens via buildroot <buildroot@buildroot.org>
Reply-To: Hannah Kiekens <hannah.kiekens@mind.be>
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: multipart/mixed; boundary="===============7302781010080389776=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7302781010080389776==
Content-Type: multipart/alternative; boundary="000000000000fc5d69061acca3af"

--000000000000fc5d69061acca3af
Content-Type: text/plain; charset="UTF-8"

config BR2_PACKAGE_QT6DECLARATIVE needs to have
    select BR2_PACKAGE_QT6SVG

otherwise I get:
Makefile:574: *** qt6svg is in the dependency chain of qt6declarative that
has added it to its _DEPENDENCIES variable without selecting it or
depending on it from Config.in.  Stop.

--000000000000fc5d69061acca3af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>config BR2_PACKAGE_QT6DECLARATIVE needs to have</div>=
<div>=C2=A0=C2=A0=C2=A0 select BR2_PACKAGE_QT6SVG</div><div><br></div><div>=
otherwise I get:<br>Makefile:574: *** qt6svg is in the dependency chain of =
qt6declarative that has added it to its _DEPENDENCIES variable without sele=
cting it or depending on it from Config.in.=C2=A0 Stop.<br></div></div>

--000000000000fc5d69061acca3af--

--===============7302781010080389776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7302781010080389776==--
