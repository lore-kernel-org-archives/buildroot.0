Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3124DCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C0C60F31;
	Sat, 10 Oct 2026 09:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8mEoz97n33o; Sat, 10 Oct 2026 09:28:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 57D7F60F27
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624492;
	b=bYwFjGUq+r6ODVGF+3ScPXhS5CBYEFE05U4johma19IcnUEDfV5Rrwn4vGj85ip855Wl
	 k2YdNLlJwQo60rTOmJB0XMP3i0pArOVmTRG5TwQUcC30TUlk/to5QRlFYne1cSUUg9bQO
	 pbp1fbYISk/VZeK9rZ5vr9BLbzWHnmTzk2ZWi2HOb1yAcQAa3FVcmjggO1I9GTgsXmnQD
	 3FnX229keRZEJropA52rUl6pLOLnJww8uM7tj7/Ey2jgMixOBW3hpYWkpgz/9Q6QqaZ0o
	 Hq4LDDN9GseaW4fOOuAtDXyyxlM9+U80h5XL9O3HH0esjGYoVm788Nx8cdSqWR/1Bmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624492;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oFOyr57wcYAEmfhdaQZzNY4E7JbreUFtnv03R0DpYmI=;
	b=IBbe8ixyWMP6wBKjT1pghi5nh/4FTLTI+PVwWtzR3ARyif+MZPIAMQCxmuheeGIhOf+D
	 +FfhFLoBTlKGMlF+vDcfw7q/1Uk9bzsxxvHk8ZIP52gM4rDWAhnE6MABGO5I5GiYzabi7
	 qwkYQRtOh4mXWxchQqsqPUrnmqMX2hdBwSUKXMa7YS2ELXIGwOSng7vjSOd4t2LgaLQVY
	 MChjwi+l91JWgPwWlxk2qxLE96qQ7jqYVjJyKTdZNcWT5V2IpKKUuiIk6gn5ui0X2Kadp
	 eJu8iPhpldrNcB9GPwjDE/dtn2CPzN+7KxHooE4tOx9xURp36KHIXhWOvy3ZpLfdolQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624492;
	bh=oFOyr57wcYAEmfhdaQZzNY4E7JbreUFtnv03R0DpYmI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GXsiL2t1LLW2e3FVNErJty8xjJgQlCzmp/Im3SXnbt8L4ZuHxuCJ7LnZxLayAxivQ
	 GBXr1a6k1/eLLdTyGYzCNqz8SOi/DuiAhYZDH/xwyVybAmuvuBdMQU2zoslm9M6rxs
	 p+oLui9/W6hqkyqE94snhmrhGRNmuNeZR35KDvb8gGfdEEXgDqFFzEavwzg5vlbQri
	 RfXw1Ty0FkItA9C54hiaJ4Nhg1mMsHCfv39rlTKI6enFlRAzrq62zlEpCzNZg+4yZk
	 NK9rzMijZB44FN8WEBIHLsEM2Cm84VL7/zfbCuhfxU/EnpEV/GjDiRCfMcDUgNL526
	 nPEZku2poSFcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57D7F60F27;
	Sat, 10 Oct 2026 09:28:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5AACA64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7EC381126
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6kBYP25gySh for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 97CE6811F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=IewY+JLl+yISnx0i5QxEUs34vgLK5TXX0Bh1b86Izpab0VgGvnSFsD1f615CvuzJSKrX
 3ZGolYxkmE+s3O19FowlG4EisuFRN6NCItkv1rk/0mANEGVDRLK8ao3KVRX7HseG7Q/kO
 DjTfhfJa2Fh491z2xH0atEOjDBWZ2pOE+7t9eCdyI6d0w0l98+Cif2V82xji+QE1OkBue
 rECNFDneI/WSLDBJm5i3ARruDSmHIMekhplSx1gbNLn+4W5m1M2iuxYtJIf9bkvnMMDuA
 /XNvEg9S8qv3Ooudc6ezyXWH3MoEj4332bzuGrvjDd5Z5XyBHWIzS1fj1onkBmD0q2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cK+KSN5ZShBgEFaxPm3ZeVRpidWbrLCzYcIYI/NXrI8=;
 b=bfWVurIfNSzJi8iY6Q+iydfE7TGEy/CcAwMNuWExpFlNPZgPgk8gm4NDQ2nbqp0dpOnR
 nbO0q6Y6i9uBbiPIUzXP9WaOT7lHLfn58SqCytQL2zuTXxDDG/0BO6Ysmt7QklG12axE7
 OwRF5QYfmz3QiNNRrIYQmzXm/ZHlBAfp66Txa2/D8y86lKI4tjbp857nYKSOs8VsMY1YV
 YewdzIs330cZeJnqJD5314iybyZzKck5r/HkpvncagrrT98RJvxUwhB6qO65UCjTUBZTX
 k+SoSLZJ8l9nHr0StRaILMxSLirCQ7wNlf4TxC3ifIxETjHeWnmI9LHsxHNH1f+MMfA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97CE6811F1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80F6C8F0B1; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:56:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7b9c2637efa49b7b35e8bbd4756f70fc0951c714
X-Git-Newrev: fc0f3237b2d66d55c0f598b5f0dd87e8021ec21c
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.80F6C8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openjdk: CPE ID
 for openjdk
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
Content-Type: multipart/mixed; boundary="===============2280998236623755112=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2280998236623755112==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc0f3237b2d66d55c0f598b5f0dd87e8021ec21c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE ID on version 21.0.2 in NVD:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:oracle:openjdk:21.0.2:*:*:*:*:*:*:*

The automatically generated OPENJDK_CPE_ID_VERSION cannot be used
because OPENJDK_VERSION includes a '+', e.g. "21.0.2+10". NVD will not
accept a version number with '+'.

Signed-off-by: Bjørn Damstedt Rasmussen <contact@bearware.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 875cc7bbf18f7878d9f32d3af9e02575703c3719)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/openjdk/openjdk.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 6868ca191d..7d1573ae7d 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -14,9 +14,14 @@ OPENJDK_VERSION_MAJOR = 17
 OPENJDK_VERSION_MINOR = 0.12
 OPENJDK_VERSION_BUILD = 7
 endif
+
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_BUILD)
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 
+OPENJDK_CPE_ID_VENDOR = oracle
+# Override automatic CPE ID because '+' in $(OPENJDK_VERSION) is not alphanumeric or ._-
+OPENJDK_CPE_ID_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
+
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 OPENJDK_INSTALL_STAGING = YES

--===============2280998236623755112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2280998236623755112==--
