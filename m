Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC7BCA6012
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 07:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EC8140921;
	Fri,  9 Oct 2026 07:56:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wtE93sLRKnRd; Fri,  9 Oct 2026 07:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 83A4F4091E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791532587;
	b=eu3fXsZYU4FSfZylMAxMXZK6Vw/6OV9XlOYG9giSKp8v/Lxav2ZcFkg+6/huwQA8IJz+
	 CON70Boc32/LN+8pwNwJRrmDfLFTdcl9eFIOxLAS1Nzbqmx7FvTQW+AAcyzPqw3u/Kxz5
	 hru25013gObw/QtwKpgXet0TPZg1w+5WQqCJQKDs0eh02ZmY2PdBbjBU9eiE3J52Yp/Bl
	 dXG1oVUpmfkJuLDL4ssCaPrdK5835FLiSnUGQT9ITWSdFelAMA3im8WyNZjwKkoRpwX1h
	 zQcrabqjPOvF/q0HCrqCQDxhU4sla35QHoVRcr88AX3gHWVtaZWrZHMERyfFe2d+nCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791532587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9c1RasJ9x/2gl4T+X4xS+irDafoKsPIXzlOmdE5IeqY=;
	b=IC4hEji2CLh7vfD815d7brXRoqTc9LOeyQlRKhcyr6NbrnfN9JHR0fw6Fns7FpJtZjA8
	 xFv/Jvft0InI6oHxDfxVjnAamAH1w5JH6jKz9+LDdY6k4oJZZ5P9Jvp1iaFivzQbHmaPO
	 x3JkILdoFP/Qsr28WO+lFv42tF57Xr74Ju8WU0YSv91lv9+vGvZQ+S+wROUKQ5HUzAP+m
	 DGoDSO7CnqCNupYEC9suP4AmsKQrQ1i6a0/3KTiiCTf8+YsG6QQuQMEQ6MK2F/ukAic3J
	 KjTtxWw+NSB1iWe3S9MIcfgsnT3CFqWtqZ3cToI31mqo8hwsoqNoIGc49vJi7R5CyHA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791532587;
	bh=9c1RasJ9x/2gl4T+X4xS+irDafoKsPIXzlOmdE5IeqY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WM8bjZqeniGGMsiyGaMSh0M7xfs9xSaCy/Pf7fHCXNc3eo1Irl17NLkHrAQ62YXxQ
	 hkFJJRk/bRbgEGrKYj3L1kKCK+X25M0BS9lFAkeDOlYqxWSKStPdZtFNH3oBwfc7s1
	 AgBmJ17DSu/82h/FmacHbJxypyviLcgwVXzfZMlde7kyjuKRvsA9pZlEECru+PCYz7
	 UNl5Vh3QrkL+ZuoNoS25c4ZT9SNR1aGiBFRzQYCr4OT6xPeGqCsl/qieXLLRB0KYic
	 fqdVw6JUCtA3rpbXdwQXZeBIqkWh9mCqcu/IkGZUhc8PlGlNXGFU3+JY/Was77SvNw
	 cZ3BBSiKuGgQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83A4F4091E;
	Fri,  9 Oct 2026 07:56:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92047356
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 837A0813F9
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9u0wndWlWmp for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 07:56:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6B7CA813F6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791532585;
 b=EyD2Iv13xwY0P8v6E5VIZ4pCtIFYTM1pfbA2otR0XG7me9P/+5oJykAcRDc4Wk2xo+wF
 vzBVS45WUewALvW62WmWHi3e+3Joc8UBiPwgRXsqZlTdgsfU74Reasc/2osOFYs2ViJWV
 rYvg7RpSM45NTMCzdBRcVa+/HwpUs/J4qW5CkU8u/z72T6+uPHtMphX8uoan0VPOkapMg
 uSTT++Kn1Jm/2hxSVRBk7NlGMcXSv71V0ntCEy9Ru0inHap8djL8qVERQhlZ9l9BeIvrl
 +Jv6f7Fl8emBVi4uSzmk1o02lLsrRYQ/rk5agViTmHMMXbRa+XodIOfxuKnoD9+FLjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791532585;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=TcCt8CLZwU8sOPJcHpKXn3QE8pH/QLzF/I9cMv1jMtc=;
 b=krPXSHCpGUbojwZ29QWphYeCvVjc9YefMY32BOyx+c+Y2Ss7XR4TfKHOyD2PaYCasCS+
 Aa4PpmCkUn9CyN8jlHuU+tMqgCGtH8cS3HCYp2cDCkTNPLVUcKOa/T4nZxB6L8hsa4Yd2
 sF7fz2juUnJZ6BaZd26AMd5p1D80muF5IohIpvo8V/TNxTITgZcUFx4RrGq16NeJaFywv
 wOP8aIpUf+4wpnwrX0QejHQioMVcpOQcC2Kc80t2jUKjZSJ50p7swS4FZkn5nv9JwZXjX
 RfY6ZXHGyMyuOMB6ubCWP44/r8ZXI3irU2C0OFKQZB0mfWzBQo7PqfMxPLJrWsqNmNQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B7CA813F6
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1791532582; bh=Zxx9xRgYqciG3Vuyr+mpL8DeabE6ntrEGVSEccoha2k=;
 h=Date:From:To:Subject:From;
 b=gvp6TJUDOv0p3xcuBF4Zizunn/X6hA2FDgC/N82nfuHwbHqkFDDNNWmmCbI1xioZc
 NUPBzQ3SvQgeiTOKnicI4arMUIqgrRS1JhSZNsR3iH9woUYZjA/NmhyBqeGCUAEoi1
 DL/MH5gKACkdq8fncCITNrOScPDyS9/vC7jsjhl/Nwhm8U0K2mhz9wMsxhv4ZnWAUu
 Kkkr60mxXtTmPLdIgk4NcxM0nUUVl6wNfMaaoX82vkblqsmOQV/3P+qM7ZjfHb0v6L
 34Iys3MgfP1VPN5bTDvAupDPVqzxYbR+CjXr+ybxRP30T+N5eRpnT2N6ZeWkEGVXw7
 MDH+5c4fJwZsQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 91B1E31E0BD4; Fri, 09 Oct 2026 09:56:22 +0200 (CEST)
Date: Fri, 9 Oct 2026 09:56:22 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <asieJnFzk1h4R5z6@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/quickjs: enable uClibc support
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

The internal Buildroot toolchain does support FENV
in uClibc since commit 4c5039b80ebbe42db35af189afcff7fb7d5cace6.
Tested in Qemu system emulation for aarch64.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/quickjs/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index 0ae0389b2e..99f1c66be5 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_QUICKJS
 	depends on !BR2_microblaze # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_sh # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_STATIC_LIBS
-	# No way to check for fenv support.
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_USE_MMU # fork()
@@ -15,9 +13,9 @@ config BR2_PACKAGE_QUICKJS
 
 	  https://bellard.org/quickjs/
 
-comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
+comment "quickjs needs a toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
 	depends on !BR2_microblaze
 	depends on !BR2_sh
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
+	depends on BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_4_9
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
