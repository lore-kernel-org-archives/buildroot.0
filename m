Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED0BE6F086
	for <buildroot@archiver.kernel.org>; Tue, 23 Dec 2025 21:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD4C160E69;
	Tue, 23 Dec 2025 21:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id In0mGbYOs0lO; Tue, 23 Dec 2025 21:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EC2260E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766523733;
	bh=zD53EeM48m6EtOL1KJHodRre0hPqHDRoEh0l/z7Ux/4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jIz1nFh3bMVyGD8UuQLJ3NOWCt/YDbGPwYTLNiWiFqzAc/MJYkVaa9bzNocB76265
	 kXAa3OvXodDsSKI8u6YgB6vLXk/L8o3t+5y3DJXXEvhELPWk0IVFa9H+yWnIdYjMCY
	 25lyozD1/ImEuwiC2PsQTrSoFiXL24s8a2PDEynOHqTR0KikC1hotL0Zt00QIwLX4X
	 1b4CWoMBJF3Z87pvufbqFFEK7493azKhGG0Ivh0OzbIfVFHg7Fz1KuvNOG+PPfxdZB
	 H7lWxZNFqpK50U8b1IKt3Xq+WcjdO2dyEu2i91LI9legu8S3AW0IxFKN5BEcBP7hCq
	 tQH/V7Xys3uSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EC2260E7B;
	Tue, 23 Dec 2025 21:02:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73AB7B9
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69B7B80E68
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSPi4LLLCRph for <buildroot@buildroot.org>;
 Tue, 23 Dec 2025 21:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AAE3780E31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAE3780E31
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAE3780E31
 for <buildroot@buildroot.org>; Tue, 23 Dec 2025 21:02:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9A7CBC1AE2C;
 Tue, 23 Dec 2025 21:01:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B54BE60716;
 Tue, 23 Dec 2025 21:02:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44E7610AB0D3C; Tue, 23 Dec 2025 22:02:05 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Qais Yousef <qais.yousef@arm.com>, Romain Naour <romain.naour@gmail.com>
Date: Tue, 23 Dec 2025 22:01:58 +0100
Message-ID: <20251223210159.405013-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766523728; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=h41jrOqAoLeitXTgtk9LbBSGH00HCrsOMhpl5ZmWw1c=;
 b=MKDzPdSgV50hr/48p2Qgm/uWK32fmN3uI/Dnbf6dGVidmiSpBntlgArPxrzWSbgI5lcGC/
 9gb5IaglDSbhrcT1xBHZtkra3dTrCcW31Li7wN8LRMAmpFBXAKz2IdNsYsirazNdNi7N3e
 Y4NBP+w7Yk5oPXfF19ymxzx2uOuiLjaXsTOBYpvvOTRIkVzVJM0NEuQ6vXXyBO0hMJhJRM
 d4NQJCSd0srdlYw8cVM3DNng1IlHxWwzp6FkUXafwbKpv2w5Fxu/WUZgNWt5nSAb/Eg/11
 NKvmhTS+ojyKwSDI5+SdxmYOq46AOJZGXpRpDDrmkGx8vQLnky1hWH5uu+aTLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=MKDzPdSg
Subject: [Buildroot] [PATCH] package/bpftrace: add host-vim as a dependency,
 for xxd
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump of bpftrace to version 0.24.2 in Buildroot commit
97e2f63bdf4cc992787c570b17b099c41c5535d2, the build of bpftrace fails
with:

CMake Error at cmake/Embed.cmake:3 (find_program):
  Could not find XXD using the following names: xxd
Call Stack (most recent call first):
  src/stdlib/CMakeLists.txt:1 (include)

This is due to upstream commit
df21d917d9cced77ebde1202c1b3508a169f46a0, which was merged in 0.24.0.

There are no autobuilder failures for this issue at this point, but
the following defconfig exhibits the issue (of course on a host where
xxd is not installed system-wide):

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_BPFTRACE=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bpftrace/bpftrace.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 4d7033eb9a..7b1b41781a 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -15,6 +15,7 @@ BPFTRACE_DEPENDENCIES = \
 	elfutils \
 	host-bison \
 	host-flex \
+	host-vim \
 	libbpf \
 	llvm \
 	xz
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
