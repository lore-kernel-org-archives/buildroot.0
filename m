Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F54CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72ABE8110B;
	Sat, 10 Oct 2026 15:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvP2exwL3eqS; Sat, 10 Oct 2026 15:28:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7660781124
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791646120;
	b=q4mFS/EPbh+BoCggmXytKA5fjp1YjSDPfhdvlpwZewkmrJiZ1p6MI4picCddaN5VFNRp
	 76fAOadUM/cwY44tsnoHw9D31PL+PYrAIP+jNxO7XvM1UbIFfG3VbtumQiML+0MTFy4gr
	 HY9ffjHEa9yyZB8TASIY20Zfd9Ss3yyg6m+reTmqxyafcNrwAJmKbbUP3W0H6A+MKgkG7
	 Qu4nzLgGh0gq/NZLoxhhmp/O+GO7fEN8D1GlLPddDNmcS46MlsCYsRvAJQH/7vtp7ZZp3
	 ZqitlouXX2iAejXf2/Y2smYpHYOn/Od9iIsGFkcWMiAUASf2WvuQbW5T36lnvZAqJhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791646120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=I9LbPn5rUZWZ29Ndt3XkJzAdS5Bl9B/4kkzRkS4bB3g=;
	b=SYqfG+Di8s9ES7Pb3IIlKlIDtAMp1YiPJXXbOlzGhQIFuI/Bt4qA8PDItFR53qPkB/yK
	 DZtmEVSS4Tm671JLvTu1LJu/CLOJVABYRUTOcd2xXsshZc7j7jddLRx/BVOBwwPgphKT8
	 EKc9XR/5XuO+eqeCKoV6Rafzjds8GG7todNKD+ltUJ+njYiP2tgeYtWv0mu+vXBIYSGCV
	 mOCHIcenz27f4yd+FLIlV/WRA/dgqoK0/OnXOGCW4uWtOSirT/mnGY1bpyPTZzAgmK4fx
	 sHpZTSyhuPQZB02+ln1CWysKYOd5+48nM7U5y4t4CoNs0zA5JzYzR52qrgRRW3fb4ow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791646120;
	bh=I9LbPn5rUZWZ29Ndt3XkJzAdS5Bl9B/4kkzRkS4bB3g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N4P2hk/536/7T++WFOT9x4RWx/8/ijbUS6g6FCtbBSmcehB1AfjjBZkREV82uC3g1
	 i00RlE++MmQxa3M6oisXCmZx61WQv8sUEDdmctRE5PT280MEkMG1UTd6gqcjRzxyCD
	 EK18igq9xFZiBmqypMbR0h0b8/fDxMz9Oz/Bkq/gKGWGzgvXEGd7r+sBK52nvoIURg
	 T+h1CJsMMyXCIiBRy4H7GjPMcbDzIil/0XZPhDrKbtgHeMl8Q7x1QD/xAY5jKdj24Q
	 ihArAVvzKSHv0yQuQwbRgUud5RbxAKJgVKE7wt7/puHJ+iAdbQAqe+a+0jtGX9E9Yn
	 BbgwbEWJkOMWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7660781124;
	Sat, 10 Oct 2026 15:28:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47C7F356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D6A881125
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLDxuFWJSK6q for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:28:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 746A18110B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791646118;
 b=SM/PPpRY5N1zTOLM3KvVJ3J0x/ZskQVB8q6HYwJkt/J+PkKjjfNsfyYFc0Z+TZyJIOrO
 uH6gWcEse7/AlaP4OB2Aq+mXjIcUfj9tpNmBoXUSJuBLFqc1G4OSts0XDQrEYK+caIzmh
 01VmPxxXybLuBa4u7Aop5ysi+zAZLjkO+VcsQHKOXdw/QAxsnb9wJrjH+sShh6qBRcWc4
 Z2kbLYK9tZsrj56igJ9bUSLg3e29Tt2UiorLIl7Tj2RjsPMcEpYu3b6sgXTXcH+UD7C7y
 5bHHmFTlkkDIa5mRULMBmfoG3i3QVC+ujp39a4QDfG1UxkKUHQbuoAXlojUnUwbUOeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791646118;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JO8okkUrrWe7IFtJsmJaKtiM65H5aKk6oP8zjcPEteA=;
 b=ftIPHU5q/fQlTqgeLfKiTMlvvlBOtcm8TXkmVRpH2ujV9aRWVW+M4CaMl0cLfaBiZ9Kh
 rDnKa6HpBiqQDJbHkrCsQUnaMcwOm3aUOUctxUfl2LjDkebE/fBzjKQ5sePIczkMMKxRN
 UE389bw6Bil/S3IWMZwerTbSNipqi+ugZfuwEYhpaT4mSfAKLTl7ZhNMc+wwVkRkYoUBb
 UmsLAm/g6LrpL7pu/O6BK0BBPqjTSPm6hJlDb0szCm5gR6/qLlEkdGt/ufG6ju1Aun4CF
 eGUtbx6h6CJ0SlilRwQoQEsLuP12z38fBACbuumUFAo4Wo9GkzGa4TAT+xw6du1e4+Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 746A18110B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:28:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F1C792083; Sat, 10 Oct 2026 15:27:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:28:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a625034ca8b8924667246624fe5321c431e4047
X-Git-Newrev: cec5f7af80a564b8862aee71e3cf516b325e41f0
X-Patchwork-Hint: ignore
Message-Id: <20261010152720.2F1C792083@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haveged: needs threads
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cec5f7af80a564b8862aee71e3cf516b325e41f0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the bump to version 1.9.15 in commit
2a28d25d0c61 ("package/haveged: bump to version 1.9.15"), haveged
unconditionally includes <semaphore.h> and uses named semaphores
(sem_open() and friends) to synchronize command instances. As a
result, the build fails with toolchains without threads support:

haveged.c:37:10: fatal error: semaphore.h: No such file or directory

Add a dependency on BR2_TOOLCHAIN_HAS_THREADS. Since threads are now
always available, unconditionally pass --enable-threads.

Fixes:
  https://autobuild.buildroot.org/results/814cb7b5537d8b7b2c23f3d90e37b2b41de7ee3f

Fixes: 2a28d25d0c61 ("package/haveged: bump to version 1.9.15")
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haveged/Config.in  | 5 +++++
 package/haveged/haveged.mk | 7 +------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/haveged/Config.in b/package/haveged/Config.in
index 0e49a2db7c..8862792824 100644
--- a/package/haveged/Config.in
+++ b/package/haveged/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_HAVEGED
 	bool "haveged"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # semaphore.h
 	help
 	  The haveged project is an attempt to provide an easy-to-use,
 	  unpredictable random number generator based upon an adaptation
 	  of the HAVEGE algorithm.
 
 	  http://www.issihosts.com/haveged/
+
+comment "haveged needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index e22712f016..bf3209cfdc 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -18,18 +18,13 @@ HAVEGED_CONF_OPTS = \
 	--disable-nistest \
 	--disable-enttest \
 	--disable-olt \
+	--enable-threads \
 	--enable-tune
 
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 HAVEGED_CONF_OPTS += --enable-clock_gettime
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HAVEGED_CONF_OPTS += --enable-threads
-else
-HAVEGED_CONF_OPTS += --disable-threads
-endif
-
 define HAVEGED_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/haveged/S21haveged \
 		$(TARGET_DIR)/etc/init.d/S21haveged
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
