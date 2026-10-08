Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1573ECA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B876740935;
	Sat, 10 Oct 2026 09:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elgXpU-T7gnJ; Sat, 10 Oct 2026 09:21:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CE1124093F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624091;
	b=UNIhxqaLmp12kqHi7P85xPfAQbEflTQgGG3G9kWGi48DtBR/mJ2+UnETRv4LDD+0ZYtH
	 sjSyL0vqhKPn7vOCIej/7xVgnRmiOLc3APbTr1hR4xWXCQHTc2ytIKVo2UD6881eNIuSS
	 vRb36eCBLUCCs4mjDfK9Y9VpjkP2jCFWv2uP7o4R7q41Dd9zE95UEo7y9DFTuwxSGD8WN
	 OYiJRo/rjXb6cAdF6Ted6PvQHao1MUYnvv0rR3L3okk5T678uib9utWbp36eLf7acYZx3
	 IWKFSSU4FCogQiotRbsYqcM89xCvXp9WHpbGGSo9xoiTgBD08xCqaYycQWBsihV8JEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624091;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1XH1DEQBQNib5zRZhzABYuDwYyZpNAlYolEgW6Oh2WY=;
	b=W2XomPs0MNtpIW6apViw1JoulNCuGDhCGYtLW8v8S3RCXpW1n8evYoavsRXfTrqmBFhZ
	 9ioWiq+Ynoiv/Mk4SfhT0HGr7eBiX4F0CypixwEL98YVgPCGiBsrnbAL5/NXERqJ1Hbs/
	 9vjSBDPylFGu4gZKYG8ZXG5hDzLWGdy1HORUaptjOtkJ5nLuEIFrJO25veJ+X5vmimC0A
	 u2H74Xfyw50Sc9t80uHKzCEH8zRimGWXtt/xsEm6Yx5VLUJ4iaeo/8BXJvj0/hp6T98ub
	 0MBlJGJkL6iThb6fV65nWaq6u7F+5s0fU3ZOHkUs3vu/8Lne0Ugjb/X9Pp04/FxUelw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624091;
	bh=1XH1DEQBQNib5zRZhzABYuDwYyZpNAlYolEgW6Oh2WY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=opUvr9BRXcfpT5kgDu1dmWsjTlm9OHMoKSMhXG8y2iavxiwapdw0ylqERLwrrTE9g
	 EVTAvCIEBxgjY75UpXUp8Fq+k66/SjY0vOfWxyMFvBMsrAucVMdfO22BlnpgzDAGSh
	 JLItiFPMP/UaaLTFZHgndFXxREPmynC2SkDlV3A0tM1P3TiKI9KSAW2VeYEIGHICbE
	 K3l7rgoHXRj/cC4f4jEOJYwQxaUyhP2Xx6e60tfYzx25eaio+j/To8i9/JFjF9TooY
	 qPoOrWx0Mj7Jg1B5sT9MMWE8QOPPOwURVecMUpe/UDovFFvz7d4GGeebrsHmkSwLTt
	 deLllhGOGxhPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE1124093F;
	Sat, 10 Oct 2026 09:21:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 686A9DDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ACEB4094B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4O6jOR0HsBH5 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 40E2A40935
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=eQMSIBnfiDByuRuduq+TVMSvc1PiOZGMrWDWMbxxJbvvUAvXmRPru/wM6oDtqp6DLl20
 6ZUHAIVwJdDuqVwE0hFqYIniYpSzC7J+ikS/K0sMgzJpBmn5j/gIvbf1NE+CnTV76lGYM
 absI9CZQY3Cv1B2vbQ+o2GYbnpmstFxHT+41n5dz26F7R2/5yZpmeDxquDMerK/3mM8/o
 xMjFR0s8gKJqmP++28V4o6nPYJr7Zq9LK5xemX0Qq6d6k3/syzoYkpg0Db7r//v0oqX8w
 5sUfTK7DxXr+JK1mkAvA7GTtuYfuVxV3ArwUqOwu7EjkPp5ABQantQZXhDBr9p43Cmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=POiRxYYim8SClXOH3WRUL/12lJninTYZtp+cJXV6JWU=;
 b=O2LMPqUtzVmj2qz0LhowEI8NFeHsgGGrUcyYqd1vrX7TlK/cKs3SaAKZWjmZsrBORTap
 OVSSE40S5l4dFPH8jgBvYkow6jYfDLJCMhiaSGIssy5XVIhIGCyKHQxErqUDRfpSBJU9X
 g4Db1OI44MYu/NQ1lpDGt8hhcsXu9u+LPQjL3P0GNugCGvdbvY7shT+yr89rqBLSCNIDE
 w4VPvpcQ3LXVNfO878tq85QAWdDZoZ8NYtQuFmO0o9/qEE1/wMwggu9tLH8LJGP/0052A
 WmNadFFAC05QSt2lwW9+/Ldq6TJEBLqur7CoCpDxdSEugWYGwp+OTdXpby7CJbFmCxQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40E2A40935
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C8588F0B8; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 11:47:13 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2210953f2328bf3ea84a00bc341999bf62bc41b8
X-Git-Newrev: d351d851e408547dfe5a1e809c1d49d613fb16b5
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.1C8588F0B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/util-linux-libs:
 Do not install to target
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
Content-Type: multipart/mixed; boundary="===============5815433383719749757=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5815433383719749757==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d351d851e408547dfe5a1e809c1d49d613fb16b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

util-linux-libs was introduced as an intermediate package to help break
circular dependencies with util-linux, and therefor only exists to provide
more basic versions of the libraries util-linux provide, to break these
dependency chains.

There is no need to install these to target as they will never be used
there.

Under all circumstances the libraries are built and installed by the main
util-linux package.

This only solves the confict for target, the conflict will remain for
staging as that conflict is much harder to solve.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 8b57f2f4215992fd9f53af92d15b507dd5d433fb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/util-linux/util-linux-libs/util-linux-libs.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
index 6716a656d2..d434a8f461 100644
--- a/package/util-linux/util-linux-libs/util-linux-libs.mk
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -24,6 +24,11 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
 # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
 UTIL_LINUX_LIBS_AUTORECONF = YES
 
+# This package is only used to build other packages that have a depdendency
+# on util-linux libraries which in turn may be dependencies for the full
+# util-linux build. The libraries that are actually used on target are built
+# by the util-linux package.
+UTIL_LINUX_LIBS_INSTALL_TARGET = NO
 UTIL_LINUX_LIBS_INSTALL_STAGING = YES
 UTIL_LINUX_LIBS_DEPENDENCIES = \
 	host-pkgconf \

--===============5815433383719749757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5815433383719749757==--
