Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332B4CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF89608F5;
	Sat, 10 Oct 2026 09:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id DFcWrHVmWJlp; Sat, 10 Oct 2026 09:22:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 04B4F608D4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624144;
	b=aww5QkL66E2ckiUnCoUoXm6MyumEvbkXq//2+FjwJiEX4mmJNLWgmhZ8O2XIYaX/MpGD
	 RdkfRapBreNXaA81KZE2yI9aBTQzoeJ9slj/5PlXDVYkAPv2zQGYkeIQfpEBPUy2Kx97o
	 Y8jrjSFJbMZ7qSKmL+0n+aQyIZbyfTOBMhTvu8eUPT6RnLe6Rp4ZfUTLFdUhQpjfUlgUk
	 loV+EI5o6PyXyCQLiWRLwknU2JB0uYnXzJUvF4QGtJZgFu6zHhG6BGd76AyLu74m8xqfM
	 zK91YaqZHrB+2UEP3yNme1V7vzXjvyppDggLoo9dU7aadWwmXThDLMIzul0heMsVMng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624144;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=N97hFzAGS78V9XFHMt6NHNO+ssP0iDn/6vhTn72tsYo=;
	b=UpK5YDZVVQ3uPKZYWl/OVLrDJG17K4/1AbezHr28tmlal43aJr01Ryvj2dQwi0vZt76d
	 85wMtGRauwm36kQgAz6CBC4IMiLhbnar8Z6MOMiQKX3WUhLXw6tlp2e9dMvi2nMxcIo7v
	 pUcE80uXr8ufVIt2m9EUJfPvdEv82cIn0pPNb46XBiQUxgZBUDtETjsOZOEs4LsmvQ50g
	 IV6JTs/R+5q/ea2O9GnfrkDDdin0KhBR0C7Pr0VJ+8vDjaZZCoutZMeJN6V6W4VZ7+wWB
	 7+FFmHOC6XCYsjL8IWR9csqCYN0103Yii9UJZCYjEB09cRXxetrUkRXFZ4e/ZNQGc+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624144;
	bh=N97hFzAGS78V9XFHMt6NHNO+ssP0iDn/6vhTn72tsYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r8EunN863aZELRnjkibwWll0zoc4HQyazNpedCNZV6YEZvISFVcIGC9EW6c5n+tiG
	 zMqvU8DeTYTRLK3tIbBZ9pPKbWfxBq4m8/CxjOdIVEBuv6L1IfTzrWHAO5ZY3gRTVf
	 I9cjwuB22HMw/sjO3cSFWqDDzMLS/I44XVtB+mhHJ81QwzZzMyFBpuEDr/OhQS+prz
	 PGmrRVMaktfFcE3+9yTuz6DYgCNE8qaFPH4t1FZih/fku1eAo/1srt49GGbnl+idwD
	 oxqHw0UhW/fLk12xrbiLzjcceTykugn03Gr21DpboAYeZG8+TtPySrD3xL8OrEMS66
	 1ZOjUjOeZQZQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B4F608D4;
	Sat, 10 Oct 2026 09:22:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA1B9FBF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BF3C60670
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIe9rXJmh2-I for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E19946066D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=rDsbSbJSS94RzmTmj1bKDtVwXuMXzl58U9lWxziGP7rP/Usp0U5md3MHIvvzRMyK7iMR
 IoCHE63xrbaHt235wgngfQiC2TpJ/utNs9Ni3V6J5hC762SehcVWsT++EYmt3ghPkJ4Wn
 pYrueT3eN4Gjpugc5fpJnS9qApBhMDTQj3/eh0gxB+T4eNlkyecgiFZeptEyKN7xj3NGw
 T+d/6KMU57egv4lIYDdKzVNF8ahCi6Bn37iqU60dYJCyUHbg4K6TpAwqjAWPlu43X5VuC
 CzON25jVCIxAen279OzSb29GyineI90muPMKHyjwnemIhmeDAHRy/+2OCDpzMVHsmTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SdlZ/vzJheIlZfUVhUKO5K8DIGdgb7M4td8SurpeSFc=;
 b=Rv1H3yXP3L6DwblCJWT3aACxn81dKgPy36xuc2rddlxN9Nu0wVNRJMW9A5WYMpS1OH9c
 BpW42Gr3F2fwNukgrO11aDWT1G7bAv+CKVOTsVmDh7zCRfcpeaVBBC8kwoifqNKEp1mZr
 v+MK2Igp6I/JPYnbzbgWT7bxEI+iwrBxEddI2ncjkhhAVUpM7wMOpkyLACyzE18U00nkS
 yFTXbDCHHavGIuUk0sDynJQwhwD0guiTLcNglLZKzesBmROgz/fYlmd6rRlYWAuVPe0gC
 u6JMK9dil6ojDk+gVykaI1RbS7cgJ+8kMCT+1mp5R2PY3iENbCLfuGbSxE+u+1ksq9A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E19946066D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB86B8F0B1; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:29:56 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 71a0aff9cf58791f2b777f2e52f1505270a8b16d
X-Git-Newrev: 98ef053c24c4a8c533fd41c5e23f335353801613
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.CB86B8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/openjdk-bin: add
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
Content-Type: multipart/mixed; boundary="===============5276676773466114882=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5276676773466114882==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98ef053c24c4a8c533fd41c5e23f335353801613
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index 5f1922dea5..4a21cbb460 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -29,6 +29,11 @@ HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
+# Override automatic CPE ID because '_' in $(HOST_OPENJDK_BIN_VERSION) is not used by NVD
+HOST_OPENJDK_BIN_CPE_ID_VENDOR = oracle
+HOST_OPENJDK_BIN_CPE_ID_PRODUCT = openjdk
+HOST_OPENJDK_BIN_CPE_ID_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
+
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 

--===============5276676773466114882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5276676773466114882==--
