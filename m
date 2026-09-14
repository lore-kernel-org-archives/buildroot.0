Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC948C88E6E
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 09:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6656740582;
	Mon, 14 Sep 2026 09:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqyNWKvLCguN; Mon, 14 Sep 2026 09:26:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 879C940587
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789377987;
	b=LSHVDMaHRcovODXfyHdWNMhlC30TzXTRzygjXuzBtda9j/YLSobaA3JpdMFnlF0F6o1+
	 Jl2zXbJpZaAPMAhLc/9RRWtgtPhkRNVuhGTG1XLfZCPqABs0DyngKzZ1wuS1feY7VSDtX
	 fUFIp64i/gMmF1PQNNiTSHj/DNklNp0mZE2VuXG7AT7UV6Rf/7vFUa67ZqKpOEWuBJDm0
	 IcxNqZIQa3yFbh7OFDoXeMkra+jS2bCS3nDzyTPCTz4L0zoGJALBLIyBJbRUDHY8XPfvi
	 wMuAQhCBCsrtXr4kysAz1AhjNnaXpO+MP63Kfs/IpNo3JwzODcmXV6xc4PdGVTvSg3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789377987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=D2Qe2vy35NlQUXc9oQfb4UkPbdMpYQUqOSwTGBheqZM=;
	b=DMtM6A25MS5GLAXF/Q3EXm0xX1W2nxQY3C6fR0xHPLmLi5Jyaj2xvYOK8OStKNFUs6Vl
	 8UyGdkzi2mpshaKU1ufTPHc7qBGhnH/7nno0QA3S9IsGiuxIq4gvqwCEHQDJqPx9jgugk
	 eHDVrnN2eoIUbVM0RKD0ltnxcRSMGXRDtqS24fof3gUTpYWnrNNorfqRMuR3/MnFxeA8f
	 w+hrQP2eKlCUxvExvBLCbjG/mi1qpKsvKbQ1eO4f5+UW+V3ylbr7JBd48JncAVWaBzJGP
	 TJIfrI0ksLtzAtlVj2qJhzjsnO3y/xUfEbPeczPkGpzVpRp/r7B31i/T+Mi/TiLSXPg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789377987;
	bh=D2Qe2vy35NlQUXc9oQfb4UkPbdMpYQUqOSwTGBheqZM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=rAA7VOrmCUl9XBU8qv58I7ki5aGSdYA4DkHEveGF0BKQvy9/K4KfFbYJoYWrkTEWp
	 KID0wEGfG2hT88EMfG5L5auCx52Kzi7B8ed/Musp2mnN3PwpGeGny2gvqXpzhbNyPV
	 3px0kF5t24WXXROZmKwt1GucvplZEOzMsb2MF6BC4zVI2YZG6muzaDnmDM0si4EEoo
	 FTnBP041leIorrWAw9OVT6tkESTy4tYi5KMIyzFW+MISnoD/lgz8ig0n5HkchVXoY5
	 cCHJCiDWVeEMqsLoxVEXJrVxC7Pl0qKYGZT1w40hc30NiE7nkQjtZVKPd/t4InauVL
	 FIrmfjS3l5YRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879C940587;
	Mon, 14 Sep 2026 09:26:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ACA324D
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 09:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C5A460689
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 09:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KudhbcWB14a for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 09:26:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0F63760684
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789377985;
 b=pp1FahvibLCvh/9b7jk2MF0sBW9SIY37lXrVZZVRG7q4OiHPn4elBDd17LlLobgd05+A
 QF3L9not3P/ILMQEu6e5M7KPxwTuPqhcpp37PZEdVbWBQh9xCOKZou6yqV6pnGvtrv84h
 BKo7qy7n19qdxfAudZr8gNxWOEQnul2+FHZH8uStA/G0h0Hkqnq3+V/1TYR07XB108Gl4
 /+m752d535eYlLvutxJQsaIkF0BOhGR3wbcZI6oPIiK6PQzl1W9KgjEdVG/sf45swdGBX
 5wMcI0UHt5mSzy8Y97+nCtVQ/i3impK72oMMDAT2ltBz9CjilNnDVMtlsE1Rel023oQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789377985;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=IXnbiU4NinRNZ+KqSCi7gAfFAo5Ik/PuVMfkitqrf9g=;
 b=Yice/rxfeaeWt5mSGp+GXD4L045on5avWaUjxwBemUq2xJS9etnpPCgCo5vcUvvAfr40
 bgDqwxvm2IeKalHxPcfwjUHV1es2TDUHojnn9DTBR6GOD2aKYLu6xml8C34l+PYkE3fwG
 hcgByh//BvIAtk86MJVFy6Q3NrSj+g/CbFaifQxmebRnnDWltBGSPxZZIfh0bvaYg8P7I
 wibG3OZ/PYfXHccKjGH91IVslmthZBr+9lt6JtEQBv7kdfI4CNkdMKNElb2I9oi5E/xA5
 C996G3cw1RWq4WztdmBdtktUfomLEl0S210W5g3DPDQigiaG6XyvCqn+r1Rha/DJd/g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b="hT7og/U5"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F63760684
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 09:26:24 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6a9bd4db6ccso3517351a12.0
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 02:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789377983; x=1789982783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IXnbiU4NinRNZ+KqSCi7gAfFAo5Ik/PuVMfkitqrf9g=;
 b=HJHXZLxMoyOD3QeVNXLVopztmj7rzDDWv47Za3lT/0z5cPcubefS+GT53plvwm5nY5
 G0gB0wqDzp+dscbK3LxXBRQwT95J94v8QCw8u3NckwvMsuvKmPEF1L7pbgDicEzd7U8B
 mCW8eM23gCn+MW0SPJocmxyWYYsKWfYHGAxpfwM7mFB8YVyK52xpRz5ZYjL1sgdxecyy
 lnJGvmex/z6Qrkv7/pnaitPYehIXcRGSJnDFLC/lbtk5jr1gt4g/USFAbBck/kzJDDay
 2t+c9EtgRX6i0k6N33L5jIjs8u6KJLVTmz0OVMd1lnlXgNB3DjuMyoo00VrHUvvdKmLK
 TXrA==
X-Gm-Message-State: AFuF++nSlpuWojwACMJzUBTpkDmYvEnvfqR5gD+Hl8rfgso7vU3wCieF
 LVHGNOa3TQ2LJiO+8KyLiA45uO3O3AOJzMEbnn+7or2DdjNlSlpkBNqmyvDkfQ==
X-Gm-Gg: AYBFou1stzGnK0vmcnW4jqJj7L+iBMXvydK6XrwPUkIW5ezx68RCzZGukglgF75nYIz
 ucDTtPXZeyqj21lPKw8Hqfs9Ql09TGC7N1zpleXLCENtwoGHhxiwzBCnuYjgaqsbMzVeCtHhurZ
 y2C6g/fs/xFVM4Xuy/a2u2sUMNj0FGB0nwAtspIKXt+a2tXsyz7XEYbscnkV8EFHHwcoNDIlG8z
 jXVnMhqatcA0+KYEreuyoKnbwtqlPM4PBMfsJr1XDU4K0LblJDs0d0M/oIee5XLhIUnivyhXzDn
 SbD6OtITq1nWDJwAhxL0LVYJalSvEBIj0hGp3klnOtOcOL2mIB6BDAJX7S/kS73sUhkK84H7rOR
 btDyhCfZfyAJgdKGRIoA2Te9DB8/i6gpDpgpP55L+XBzwj+Ko7TAKaJ5B8u0TpO3knDptDyp//j
 dXcbIgBQUhTwZf+bZRrNf4o2uEAJdKfXRr4zfolAc0epTi+IEZBMfTKEGJo1x/4toSaamGwf0L5
 rDePz75qOASc83mM2KDEmFe+tvmjccMA5nlsseEQNU+MM4=
X-Received: by 2002:a05:6402:210d:b0:6a9:946a:d085 with SMTP id
 4fb4d7f45d1cf-6a9f625f75dmr1167520a12.19.1789377981410; 
 Mon, 14 Sep 2026 02:26:21 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a9b5830e39sm3730992a12.2.2026.09.14.02.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 02:26:20 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 11:26:12 +0200
Message-Id: <20260914092612.1283030-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qemu: host-qemu does not support AVX512
 CPUs
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Building gobject-introspection for an x86 CPU variant with AVX512 fails
when g-ir-scanner runs the freshly built target binaries under
qemu-user:

  qemu: uncaught target signal 4 (Illegal instruction) - core dumped

The Qemu TCG engine implements AVX, AVX2, F16C, FMA3 and VAES since Qemu
7.2, but it does not implement the AVX512 instruction set at all [0].
Therefore no -cpu value passed through
BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS can make such binaries run, and
user-mode emulation is simply not possible for these CPU variants.

Mark those CPUs as unsupported by host-qemu, the same way it is already
done for x86_steamroller and x86_core_avx2. This relies on the existing
BR2_X86_CPU_HAS_AVX512 symbol, so all AVX512 capable variants are
covered, and it disables gobject-introspection and nodejs, which are the
two packages needing host-qemu in user mode.

[0] https://gitlab.com/qemu-project/qemu/-/issues/2878

Fixes:

  https://autobuild.buildroot.org/results/7ed7f9c36dae1ddb965a0f0021db6cd319927b47/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/qemu/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index c7dd5876e5..e5379e7224 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -23,6 +23,10 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_xtensa
 	default y if BR2_x86_64
 	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
+	# The Qemu TCG engine does not implement the AVX512
+	# instruction set, so binaries built for such CPUs cannot be
+	# emulated.
+	depends on !BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
