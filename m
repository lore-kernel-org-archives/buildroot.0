Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ED8CA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3531980B33;
	Mon, 28 Sep 2026 21:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7TbVF2z4RUqS; Mon, 28 Sep 2026 21:25:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 481B280B08
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790630723;
	b=AWdYjl0zO/GtL4tvcZV7WdEkMxe+1KiNL0nukClQA6bmgD8e/JiyZuqcvrLbXhynGBHj
	 kj6UWwgEUNIGWwtUAmcnsejyrtyaHqjCflJyfPHUerSpjMhP7ra58CBE2U0hi4HodReHh
	 Hwk6TBlZcGT9J+rX0fqjWfPyDaofjrkvY8b9UVVb7+YY6oGdZPLiS5dySib8MGFpVYSHh
	 wuNPJ65YQX8/RHpzxj3TEjyS2uXYQVcZtr48mmCGH320m2OultQQKAtAhEOwr+ofhO/hl
	 lVvumYcVlt758nBSsmBjh29XzkxiZuNsO9jCZslb3ut1yNVhAbjr6r0nSc2uzC33M4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790630723;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FXfD5Eh4m/ITTi9AKsb56wmDdjzsGZpVrcOvkIFj4jc=;
	b=ATM7dMsYyEXiDoh7XqPTcgQXE78ke3KlEeADtCnGYszwdq2FzcpDQIoUnUum3/i0deY4
	 RCPCYOeP9EDzOt2t8zOY5uMDrJpGz7YScJBs1MzuRa4rW7aUo+++NeLUZt3nCfNBQKNr0
	 2eKQYpRMek0HF1+ejxgr/qUT74QDzdUooRnBsd3hroL6vcSVBK4sbMLR5LkZPgMpSHo1A
	 KPA+6awNHLsrEMZDQflMKFVMz1t090UGZDsi/Ac1VB82U6D50tJEwiqXRlpjfHXgtew8J
	 pXic4BsEECBOab30NdFURlb0CD0aDTiqimtnRN04s7mix5Gec0U88W7agygOPTly/kA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790630723;
	bh=FXfD5Eh4m/ITTi9AKsb56wmDdjzsGZpVrcOvkIFj4jc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T+W//2rNMtbPhNxfCZKti79OLVFQrptzYk3/zwO5ek4RwACtxyhMXfuZT/Pt8Ni5k
	 Ld9Ln08ynlRZBd+MJKEMhR4kbHGo/BvgUlAK/5DMHHkaQHEZd8kdou6bmUsOo8FyAJ
	 aRxyu4oN3CGbssUHSQmOidTBSFw2WKb5foMY8chNV+1zv6x3mJTqHvkJrgb4IDEljW
	 gnB/yFBp5yO48pERWokxfan+RCtKLShpfOE4Ux0u34su9CdITtx99RjonA2cXyt+f5
	 E86tNhojsG7J7CbTXGR8dhTbYcCvAlnztfzvjG0QMjvMnZV93KNOUTpZ8VyrOwKz59
	 tSTyhO1+/Sx2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 481B280B08;
	Mon, 28 Sep 2026 21:25:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B73C335
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CE444018B
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIgR3924prFx for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:25:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 86B514008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790630721;
 b=naJ3N4reYS7N1uci6k9q5LgX09q7TQGTuifcS51usBPN+8BtnOnaC8i84POYHtaYDkhZ
 hhSIE+SlwXVNCoi9SG2HeqAO6waJOgyYCZ3wHkm/4i6yJFzHAmPOWbLscnECfd/LUXRXo
 AhTAWZfyzYSrGLS0twnaKXZjq5T+nnIyEyGBnHldT8wuCLLMzba4EVodtP5F1X3ARjFAX
 2YGk9d0eqbUq/+xqb7Z3NZXZXvGbAvx9Zst3rerxf00oAfWT/IrzACxNmDxs+w27NnycU
 iWvAImMkYrhx1xZTAsMDugBn8lDp4cTTOCnLilKfu7vTGGLe0zH8Wj+9xcIWXj92twQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790630721;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=57gPCp6+xaYwzAgga1RNwtiEng398BV1J+1jPMGRvgU=;
 b=qGyUOVPwMx2UklHTsd0lzcIKSFn97FAdTEQIp34lG+VnaRafW7HZHI1jcnWUnRD6Ln1o
 jdfIA4D8eNk58FsSHLmEyyX7Vl6+Q8FO9uiul4t5/AWdwjVrXgCZcmTBO59NyMxMs2gOE
 Ehku/mx0IQD6wvnkYVV5cM+q1CntkaGpfEgwfyUD4SFSB1/Xveup0Q0Qd5ES/y/pI2gdI
 jUPMh0Wn+bDuBYYJZuGoTd11P46mc+TjfgNr+hwCmVTKJXHMeiquk4F5kr1WIzO5yYF14
 gSJ8SBDg7AEkmCH9HmHJSy08syVVOu7fc6Fvvkj3XqtABmpRLWCDrCxWg91XK/n/jWg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86B514008A
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:25:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18B4D98401; Mon, 28 Sep 2026 21:24:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:24:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59b5c3d2bb8992069d68a2a0c650a736a7bd9aa8
X-Git-Newrev: 3f4e6fcd9599419b47cce241916ef29eb0dd3e72
X-Patchwork-Hint: ignore
Message-Id: <20260928212409.18B4D98401@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ufs-utils: bump to version 8.14.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f4e6fcd9599419b47cce241916ef29eb0dd3e72
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/SanDisk-Open-Source/ufs-utils/releases/tag/v8.14.12

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ufs-utils/ufs-utils.hash | 2 +-
 package/ufs-utils/ufs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ufs-utils/ufs-utils.hash b/package/ufs-utils/ufs-utils.hash
index e322759502..9f49763312 100644
--- a/package/ufs-utils/ufs-utils.hash
+++ b/package/ufs-utils/ufs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  96d15ce4b0990049d812d24afc2a62240c1a4aa534ea6aebb5aebd34dccb2dac  ufs-utils-7.14.12.tar.gz
+sha256  ccbeb98c8a83a95267a96e98600e8d41c6ee860f20ebc17be02c97376802e99a  ufs-utils-8.14.12.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/ufs-utils/ufs-utils.mk b/package/ufs-utils/ufs-utils.mk
index 1de7615a92..5f805e5594 100644
--- a/package/ufs-utils/ufs-utils.mk
+++ b/package/ufs-utils/ufs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFS_UTILS_VERSION = 7.14.12
+UFS_UTILS_VERSION = 8.14.12
 UFS_UTILS_SITE = $(call github,SanDisk-Open-Source,ufs-utils,v$(UFS_UTILS_VERSION))
 UFS_UTILS_LICENSE = GPL-2.0
 UFS_UTILS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
