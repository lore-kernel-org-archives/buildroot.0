Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEB6C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 06:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9198A61516;
	Fri,  3 Jul 2026 06:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RABNmIzF3zP0; Fri,  3 Jul 2026 06:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E543061336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783060993;
	bh=Tn1GsMHReOsUhlmxy4mNF3ON7ydJyVktt+PUP1qclfQ=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sF/oybRM6pi56XOGVqtnrd10FLiUp9cKhE5d7sMH2HNx7GE5IL1uGlfk4LM4Q7Qzw
	 3a7+Cd74VSwtzS0i5zBd4xguEoUYhU0+RW/Ep0Vt+fhGg1m07Bu3u9XesSrFG7WPXH
	 RJpRK9rUxruRQjufYNlUNvaf9cGlr5LgqJRk14MKJ1bgfkV9e3V4mmj3k4wdfWZ+Tr
	 Q+ms+i/ob+gpeh0Ovq3E/H/ruU3PqPiH5cY9dPA3IHWX/sPI6JqT8mR9eqt4AFkMDZ
	 0puyvfX1HZEr2jg5+G6L7pnoKMoaYuEuH594elz/SCM6dsLJRNLloFELRNqXJS1wFm
	 YhFD3ba174FnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E543061336;
	Fri,  3 Jul 2026 06:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1A7F316
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 06:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF1C341961
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 06:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sAl-HiyKhYb for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 06:43:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=jkoch@outrider.ai; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D126F4196B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D126F4196B
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D126F4196B
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 06:43:10 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2caced6038eso2696295ad.0
 for <buildroot@buildroot.org>; Thu, 02 Jul 2026 23:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783060989; cv=none;
 d=google.com; s=arc-20260327;
 b=dtdAShKG73q8X++nMlvb+3DW8MOcAvi47EBRNroFixxnoK4SEW7a6boX9f2Ftq5zIm
 1XccF9OB2jJm6rdfP/abJ4AgKFFj47/gZcqIAGcFY7C8wNjD1Di0tQy9zZDY7hUdiTnB
 URbc+iKj/pap0WZBpb2uGVI2EdiZzmS+b3S30yxIGeaPZODR9xMgFUFIMXzWcMiFd7Ek
 lNxRKEzL1SAeUg4A7MrWc4R1hshDb5ILv3yGVtPDRwm/3JLkppnCAqtEBgnCIWawMdDq
 N06l7yB9VC1CscM5SSlLoRpAkeRtDjsqhlgG92ygKebdy+6wGO4ffQo8XFHdkX58atTF
 Ghfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=vyigvOmkvcK1bzs7xKauglXhFP/bJELHZLFr06ALuNo=;
 fh=3pWBXGdSiVldOzJ6ypfJcTUIWlbrikH1EIZUHFIjzuo=;
 b=rfRFz3ExCDGn4YvlUvHJRAideoqEL1o1YLB0W1HlIafSloyx5NE+Z6VfZasX1giUIF
 P0homsxNpT2iu8nwHi+MjeL91Oh3w4hYXqO5pzQgM8UCv/LFxOzOL5BW5N+6mNyQ6YvH
 wkheBVCbVLxRpyhoF+nBJryHJl98yIi1x/b02GbfVgWVGO7tRM9O+4cX8DwZPcrQcS3b
 NTi0miyR/eGBVbzYminUkEa5BdAgTDKTbbF2Yb73yMN+JDu96bykCfnIttjT/UFsXEzU
 FirqdTborIvt7MJZP8/WMV0Qd7/1arQzDxGph6h7tveSlZIyNA1Z9T4cyCrnT6t/t4cF
 Oatg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783060989; x=1783665789;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vyigvOmkvcK1bzs7xKauglXhFP/bJELHZLFr06ALuNo=;
 b=Lg7Zajzm8hXUskaJSNAoxP6EiPgBYAIQb32nL/Gz0MhYSkwAkUW6AQVn6v5jl57nzO
 ER0TvkeFOtRgxqnBEvwz/gxJz+5Sg1XGZICQXU2Tgft0u8YkzyosOabiOTNUNOtKxThE
 U6rNKAG07GPRLX3AzPOT6nds4K2g85ImmIeBTyqSpUeFfwVj6QfrJ+X+bgSliZHrpKB1
 9BHnNLbWXDiXqclYlpcVirHyPW7sJ+VGKHjka6ulrTmK+9cvowXD16QUaxjgRA1QF06M
 XIlv4xjnLITGYq9hjieNaeNcxi80XqA1pfV7qNrSjrGU+pKSDnxSJ6yEgD3ivdqkYhyH
 nYMA==
X-Gm-Message-State: AOJu0YwaWu5Ft9LN2L4y1U3thsc1Kn6Sp35e784u9L+czJUHRE82K9GP
 CRXJAlcmegNm3l5SiFRd7oYnA0KtTCa/eists3vGAZy2MfWjl1muGIXyEJrPEPVf37T9b0Tronp
 yQ+3eFjZy3/ur2P8rQh0WJ/vxrJpe4221s0nVCLuCQTLACANyNmTr6Q==
X-Gm-Gg: AfdE7cm9nTYKXcZossVtWg0+CvrTx4gdTrVbbbU5WQGwUjM5iEJbMkHxjlCJClR6jeT
 Ml7OXzmPBpOyEASQn/Hk736fBPChm7N8yJS/17MP3Ipb+DHydYeTiAPUW2ZNBJ72SetDZLc6mS7
 /AyLakV+RWqkDMlF5X/2xKd6dgzeWSt2TumkwMjfAuxYquEu4v2x/HlMBiFy7evwyOyYHqXiDiE
 eDkVoEUPKJOR6Yx2e0whC49ktypSVf/diVPlDm2VzTpTKEh0S1oeYhTeMklkzeWgg2nvLc=
X-Received: by 2002:a17:902:d2c5:b0:2ca:5023:f983 with SMTP id
 d9443c01a7336-2cacb1c7b68mr29177075ad.29.1783060989275; Thu, 02 Jul 2026
 23:43:09 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 3 Jul 2026 00:42:57 -0600
X-Gm-Features: AVVi8CdjEY_e56OtyyWBIhkwkAu_MoGVcI6yhSh8hX9qAlSXBAbmyzcfGZr0QAU
Message-ID: <CAMQGCciOiowjjOXNJPpbZ-WaD=pSf0g_vsdVgXMVUx3jfrj2uA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outrider.ai; s=google; t=1783060989; x=1783665789; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vyigvOmkvcK1bzs7xKauglXhFP/bJELHZLFr06ALuNo=;
 b=UWgJtqMLub0gn2L7kjcJrGbGf/iu0YMMd63OJCWIvhn/0UA63s8WJtlD18z6dCIcb2
 5C065ADJWyZCHnxOO3WLM7e3YFuXbFsGw7nOVDySiAcJYR07DYYdz4qF2/qlB7oN+jt4
 SQkaTm44l83CK3Ytc8Qp97cgmvKwvg/Rt2OHP4Dtx56f4EJzWlSQz34SQ/cpNn2C5NIz
 jE6JO5jxWCKGqFAiQhtRYGiJyQUdkf/FNduWivqHLbo+clkBEmIBs70tS0t10cZzL/ts
 67ozDbwClra8SwhDkQ18NrtB1aBskvgZCMFu90r9rh8/ICerx4I1TxVptDAB0/B7Vf8V
 ERLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=outrider.ai
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=outrider.ai header.i=@outrider.ai header.a=rsa-sha256
 header.s=google header.b=UWgJtqML
Subject: [Buildroot] Updating nvidia-driver package
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
From: John Koch via buildroot <buildroot@buildroot.org>
Reply-To: John Koch <jkoch@outrider.ai>
Content-Type: multipart/mixed; boundary="===============0501562722213449317=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0501562722213449317==
Content-Type: multipart/alternative; boundary="000000000000e1047f0655af3c1c"

--000000000000e1047f0655af3c1c
Content-Type: text/plain; charset="UTF-8"

For a while I have been locally modifying the nvidia-driver package to
allow its use with more modern hardware architectures (e.g., Turing and
above). Recently I also added support for the open-source driver which is
required for the Blackwell architecture (and beyond). I believe I retained
support for the older legacy architectures but I am unable to test those
due to lack of supported hardware. Would there be any interest in reviewing
and possibly merging these changes into the nvidia-driver package?

--000000000000e1047f0655af3c1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>For a while I have been locally modifying the nvidia-=
driver package to allow its use with more modern hardware architectures (e.=
g., Turing and above). Recently I also added support for the open-source dr=
iver which is required for the Blackwell architecture (and beyond). I belie=
ve I retained support for the older legacy architectures but I am unable to=
 test those due to lack of supported hardware. Would there be any interest =
in reviewing and possibly merging these changes into the nvidia-driver pack=
age?</div></div>

--000000000000e1047f0655af3c1c--

--===============0501562722213449317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0501562722213449317==--
