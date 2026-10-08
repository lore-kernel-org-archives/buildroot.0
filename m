Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A69CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F70F60EFB;
	Sat, 10 Oct 2026 09:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xZJ-JqtCnrD; Sat, 10 Oct 2026 09:27:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 26E3B60EF8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624479;
	b=HpM6Xu1Ggp7q9+H67jl7Irg4NHgPaM/fKrRFEYG/HTAglJpoYROO5BJ8DkMjBaN1FJ8d
	 kK51EP/7q32FBJ8C0BLXLUchDmTe5Nyzf3NwoG/WMSLuRvV0XGUTweSWcZjeDzJXhwcud
	 VTeYqSaYqLWCUtb0DnSg7GErVrt5OSZZWZB4IT/L0igHCsMSMSoADf2TriMOjj0CkpsG5
	 AnNpCR5gKvAFDZ+WpA8XwZq2pg7oRpgM73A4df/DlIE4jN10u5n398bzVs/p5TN82DGGx
	 sBonRdGln6KPBkEnnh4UA0ngibRZbFgStbZ4fRR5YwHD4AFXuXroFX0MsddtqET8TrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624479;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Kd/55aI6wUBKDkKExleIKP1WHKf41l1v7B8M6kA96Ao=;
	b=UMKBkvJxzFYGfqOiwoD73KkZH143IndJ4FJUF/hnU1hXemp/hjBwgjSxQQnY1JnGjBl+
	 qQwTj9dfIkfzLOFDKZ/03kry6ZiNQKwXQltfFkwYM8HDBi5l+k5eoU0BiZwz9JH7ezyzt
	 YOC6ywVhjowEqkHNGICfnTlwDMeWlPqBxWuKk3kL6+0FpgmbwdzxvwDRs8edZLN/G+Rdl
	 8zT9j462GT3LeOSMKwigohoo7JtvyU0Szh0rr93HpxdjR2eZIRTWiqh436rgSShUSXlmv
	 zjvzwi8eQmAK8JeWzKMJnsUYChBjhIR9UizoOE299UmXsbaT5zduDgOG2yZnngUjF9w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624479;
	bh=Kd/55aI6wUBKDkKExleIKP1WHKf41l1v7B8M6kA96Ao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iHdOhDx467eqVcwiTblSNpAIUCj5MYkDu92cykNfWWwLMaJByTSWI6zZIDigCDhGz
	 BObx2lSEjzMjeGUgTJPbopuENrNtH9NPlR1NiIPOkVebyDqv/gmXb06jj2q58RAI3I
	 ryu7FBKJ4og1pEaHooIrQfCLPELzF70al+q+J5+vouDiT+Uo5lPdeyKWGc55mA1jZ4
	 uOr9jGrixGHXCyjV63Qt3tOpOCjZJsix87Z8dUcUasomlFzDqCin/rTijQ6pc5YwKB
	 8IM034OLA/jGN5o7LaYHCNfEViAQVh7ZvZ2b4X4txQxRttL/xVdMMGV/oSeqrswl0G
	 40ji+bIkjpOzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E3B60EF8;
	Sat, 10 Oct 2026 09:27:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 752DB9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6221140345
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laoDQYBBGCHk for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AD40F40318
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=dwMdSKHEG7nD95R9G1DhgH5Oj7Gj/HJ4u2W38imoA0Fb1I8LnJ4+cmgV3wNoOwjaIYue
 SEuMwG3P1Qay8HwmehKRtSao1W3US/Jtt8+YzMC9OU4wmarKIeF0MeKWgL9lK0oThnPuK
 n/pWxiJFop05C/eJifKwjG2LnGoqaXuFQKvJVquvUovtLXhwlMqcXZyLG/K5VTj1B47jk
 aZkQQJ24MNARL72IRQnpHQCKk6ItPFoD7zCzNWhpkzBthIb/LAQhhwwXetm7It6clZlsM
 0y/lRpZjdW9GNZymi4x87hN7B5cyZE65pTwBdtguSbCnDlNH4pES6S1yFSUkDNhUZJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DbqasEebQq8o8MBAunmk4ev1+2YUUZ4Ib6y/qDFPxDU=;
 b=MKNsOKesdn/X9cZhHvHybcjhIwrL4MEtcsrPDrU8iVIr+bh1MnwWn60HZcnyptpHo/lq
 6iYPw0YdmVPHLWJYZisFgRK0I+n8ap42fRLnHNQHoEH4f5TewP6tKlUnRBYT8SMQSKcSR
 G7YPNBmD6Sa0Gmx9fwkF3dZV1g4zws6ZTJRNDJ5lPwIiNb+fMMJ54pUx1clySKDtd5XOe
 Hxh8nE0gbX9wOQ4TrZXgSvcPesFFuRe8lAJRroKwXA9CYaIKWjyw9Me7e7H5j16dDcYwp
 39laPsTYmtw/kYx2XH8/anAjhXR5oGYDSBWdMtmfuE5+Ae1g/ZxmF/2JMOzhlkov4Eg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD40F40318
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 974248F1BF; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:56:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d143df8d07624f9c3179780a7254849c989ebd94
X-Git-Newrev: 12d976476947ab4bea0954bbfbd2796838a75703
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.974248F1BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openjdk-bin: add
 proper CPE ID information
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0743363248847069301=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0743363248847069301==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/12d976476947ab4bea0954bbfbd2796838a75703
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE ID on openjdk version 21.0.2 in NVD:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:oracle:openjdk:21.0.2:*:*:*:*:*:*:*

HOST_OPENJDK_BIN_CPE_ID_VERSION has be overwritten to match NVD's
versioning.

Signed-off-by: Bjørn Damstedt Rasmussen <contact@bearware.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b174bfd0b29b8ad81b4e583c022aa6449a6f237c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/openjdk-bin/openjdk-bin.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index e6c74cf6d8..5d8c29f080 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -25,6 +25,11 @@ HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
+# Override automatic CPE ID because '_' in $(HOST_OPENJDK_BIN_VERSION) is not used by NVD
+HOST_OPENJDK_BIN_CPE_ID_VENDOR = oracle
+HOST_OPENJDK_BIN_CPE_ID_PRODUCT = openjdk
+HOST_OPENJDK_BIN_CPE_ID_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
+
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 

--===============0743363248847069301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0743363248847069301==--
