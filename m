Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0352DCD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 12:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B157A60F7D;
	Mon,  1 Jun 2026 12:27:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEVyKO--6O1Y; Mon,  1 Jun 2026 12:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C86A5610CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780316862;
	bh=w9SL5tIF5B+fm7F0iGeq1QYf4VeFjT2/qF+JmTKHhMw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fmZkMHVkTClbZzuSUHc3Re72EM+tXS9RewF+VL/gDTbD5h/fFDfKRqqbcaIP6ZZdw
	 W1mKMRFBa9nGZ+mxyCU3DmMnoVr3aHxLH26M+FyYaPioeMVjI/8s7RXtTs2WzIaV3W
	 xb0OJpYrdS9QO1ey51QqZ0JqFg1Pt3T+BnDAC+0gSzkMnU1SSTZIHVpIGvMBJ4fWkF
	 nbGP4Z/VTBx20RP1GLF4TFgerCz2yQMc8qmqHFJtRM/+f0EEfMKei4+7sHylkdiZ7q
	 8vwDKsZrJ8gWeXrTEYw14zS9ktnAfGB2PAKitQ2WRBbxYLbRMJCw6QykMgOPwlk1Kv
	 Sk87AlQ3Hqvjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C86A5610CB;
	Mon,  1 Jun 2026 12:27:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4F94257
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB97940893
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jndWOpYrcpt0 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 12:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BAAE40888
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BAAE40888
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BAAE40888
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 12:27:39 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-bec450b950dso158141866b.2
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 05:27:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780316857; cv=none;
 d=google.com; s=arc-20240605;
 b=Jv8IQ8lHzXY6vJM3XIPFmNSQgjb0/838ULFMq5YPLUq7QeLDIUAFVKlcmfuMz0KALM
 hCZMxsoWn+IKFWHxbaCVBhLjN8DUCKzsQzMKGFbfByUDljCYkvm1sXBM1KQgE34fyCmD
 dOsIwxJ8t2cwI6BdtP6c5AR4g2tAKwdwOdgpNntEGSJjiururTQ2QaI7sK12gPBdmTnS
 MGvPf0At4btHajVQ5ZJyoyxqPXPU93EHa0FxqTaCpoieoo6jCQXMZmhlVOAf3WvsXrcP
 s4GEjY0OqNCIZ8ePUFXp+O9R6hBsW8rnExsGF6w9LxSNqs3I0Qkksdyku0Z1q/ekMJpX
 sTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=CrYbhIHpqG5OxwijoFXN+p6XzpqFEER2Vy4v9jdUcDQ=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=XegqZWgDWt/70/4OWEe1Etc4Yo9tWcBu8r19l++ZpzNugzWa+5EbbgtFf89E6pzoqP
 VSQ6MuiHsxrDKCU4GdoiN0MaNb+dTi+KR0kr5UchflMCFOvpVxsCTNpH/xwS//S1aeSc
 XylJH0oT49ey9QlfslUDrGr2LZAJh2DmlN4pRPFcVTyXgiAbvQzamanubwSZtq3SQc+W
 d2ydwWTrI9zPLsonnkTS0av3C9eX0xfnyAg6/4yMfL+hlp3JjKoTcKL9fuAj2nlXtxLp
 HDAVnj3vAHTfOXkwp/Yx/GcPhaSwmCWq3AIOGooJEyT6xXXs/4w6/DhwM+LU3mFAnjFY
 t3EA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780316857; x=1780921657;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrYbhIHpqG5OxwijoFXN+p6XzpqFEER2Vy4v9jdUcDQ=;
 b=JLkWTkX1YgjgeUSW8974Lyk4NtloAavXpJyqyMUd/d2Fxh6s5QmLHfcxNdOl33abzF
 ot5DHzcJ764zNvxwRE0QIR3qbmKSa/8uIWxg2DWYdEqTwhUVmdtmhxtVfqiAKyxAu08Z
 WvCtl3YPUz3JICjPeHgyNZpc9dtl1AuYpJXWKVEwq/XWU0V3vXOSGTR+4gTORmZRsjaO
 kbHUfgaUNRhm9sXt9HDKbOiJT1nZu4XAWSTmqaKuBmujfGmad+FT7MWBUgfOzAVpERNd
 ygJ11+dh2KYqZ1WTTA0Xh2fBl9gR7ycypi6bSBD/vNaD3Wx7gy/23i+QBBsCg6nIFX5Q
 ovhw==
X-Gm-Message-State: AOJu0YwVKBKtvebWpMmq/Ufa6U41ukPF9RobDY7d2Hso51RrbzVDAjgr
 qyWKZN+nDdDXNvSHAP91ZRGsJLykEXfFi+qmhMRGPTIF5PqnDmd4FAgcL1Zjy4uuXTgW0MdltuC
 8BR3sBqlcGB05vUr65ZRxyhkB1B9l50OeiQ==
X-Gm-Gg: Acq92OHnzW5hZU6K7ooptiSgH4X+NNQ/eguUnyba0M1XFL9/UFRZPab0DlVCa+ugAfY
 vOUvHxlbcw+5Auru+Laf4clTzjj4Xz2OWssiWmdk995mJJQ9wnKZnsyhg250wk7YMOShLjafgG4
 4moNohcMd4GJvDiKd7HUyarue5IwXlIpqAjYRH+a0pvcbHsudvII1Tdj7RKpWpAsb1lKAp6RvQ6
 DxgjT71778vESFt+t2FvA9b1ogEdypw9MUqbPm+ZNlxy1TvZwnc0znjNncIyMEu6QKHWBc1wRr3
 uCMaMoykZZ8ybrJ7VcJl0oHywGLrIBaE2XN0hDdI3DMoW28XvUmXmpyLgSfc1AlLNP7jCHz56/3
 d2eMTy18TN15LDjbdNiQKJeIz96lKc6hToHZvAF+AtGWrgRhDx5HPZgeiw7SaYJDSA4oa1LUxe3
 rgjLOcpJaf3uWmRA==
X-Received: by 2002:a17:907:cbc5:b0:bee:ed4:ea17 with SMTP id
 a640c23a62f3a-bee0ed4f227mr167672566b.26.1780316857113; Mon, 01 Jun 2026
 05:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260420-wip-obbardc-add-package-dtui-v4-1-5be457a32cce@gmail.com>
 <ahrkGO9sQOwRDDkB@windsurf>
In-Reply-To: <ahrkGO9sQOwRDDkB@windsurf>
From: Christopher Obbard <obbardc@gmail.com>
Date: Mon, 1 Jun 2026 13:27:25 +0100
X-Gm-Features: AVHnY4LtUdKtxHggwItvzPVIKZ7Kq_bibp5A8fqDWXRGMq1BDsvPCr_qZbfktcM
Message-ID: <CAP03XeowJGhQdWY_iPLztTXdPDSLv2vSjHSZP-9WCPvbPJYiJw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780316857; x=1780921657; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CrYbhIHpqG5OxwijoFXN+p6XzpqFEER2Vy4v9jdUcDQ=;
 b=YZkF7u6zzYP0z1e4H1wjk3qSGFf/Mg0d7JuHo9SULwDOYidgz9X6DvUtpCUoxxDZRD
 QkDLGFAPzyah/CdpPvuYEilJtPDW9OrLpycA56w6nQz42CtNhCJF4g8cP9FG8gSqpiiR
 i5SEMYJTU7VIsgbTx60VXvHdigFVbuF25VGsM+zLfqD+Zb+PSmtpvEYaP38Zlv9iEaDe
 PFj7JImF+JQsuNdX5ofhDAd1NBOtCLrZOQvpxmrIPMACN31rsZwkCqlLQSOFBAI4Qms2
 nK0SkElk1f945fpD7sBX0vt6HcEoHA9kWpOykBEQSW9Cd6ilCRI9Nt06H4/0LUjGp5FX
 GaNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YZkF7u6z
Subject: Re: [Buildroot] [PATCH v4] package/dtui: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sat, 30 May 2026 at 14:21, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Christopher,
>
> On Mon, Apr 20, 2026 at 02:51:33AM +0100, Christopher Obbard wrote:
> > DTUI is a small TUI for introspecting the state of the system/session
> > D-Bus. It shows current services and lets you introspect objects and
> > their interfaces.
> >
> > This package is built with Rust/Cargo.
> >
> > Upstream: https://github.com/Troels51/dtui
> > License: MIT
> > Signed-off-by: Christopher Obbard <obbardc@gmail.com>
>
> Thanks for your patch, which I have (finally!) applied. Some comments
> below.
>
> > diff --git a/package/dtui/Config.in b/package/dtui/Config.in
> > new file mode 100644
> > index 0000000000..524407d272
> > --- /dev/null
> > +++ b/package/dtui/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_DTUI
> > +     bool "dtui"
> > +     depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> > +     depends on BR2_USE_MMU # dbus
> > +     select BR2_PACKAGE_DBUS
>
> I annotated this one as a runtime dependency:
>
>   select BR2_PACKAGE_DBUS # runtime
>
> > +     select BR2_PACKAGE_HOST_RUSTC
> > +     help
> > +       dtui is a minimal TUI for introspecting the state of the
> > +       system/session D-Bus. It shows current services and lets
> > +       you introspect objects and their interfaces.
> > +
> > +       https://github.com/Troels51/dtui
>
> Here, you forgot to add a comment about the threads dependency:
>
> +comment "dtui needs a toolchain w/ threads"
> +       depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +       depends on BR2_USE_MMU
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> > diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
> > new file mode 100644
> > index 0000000000..18ed484f44
> > --- /dev/null
> > +++ b/package/dtui/dtui.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +sha256  8ccdf97b0b9e949cff11abf0ed505a409bd04f52161a782707ab15b94f622efb  dtui-3.0.0-cargo4.tar.gz
>
> I had to update the hash because we're now at -cargo5.tar.gz (it got
> changed since you posted your patch).
>
> Thanks a lot for your contribution!

Thank you for handling the changes and the detailed notes. It is great
to have that kind of feedback when contributing to a new project!


Cheers!

Chris
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
