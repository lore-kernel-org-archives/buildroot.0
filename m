Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DD3CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E43D7611D2;
	Fri, 16 Oct 2026 13:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwtPT7NQ2q5r; Fri, 16 Oct 2026 13:12:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B5CA61179
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156325;
	b=chbaQUJSaZBN6KKmocwdQEZ8vbOfJiS2cNNMVjFo/XL+KsT8qk7kliHH4uN/XlGpyxau
	 Wk8QA/BL8D0/yV0WI/EUZVbJb7ASQdqKlvpgVnpQlTS6c6Ghsnx4dlfTO6RLhH0JaL9d1
	 KxGIDdBr5t+ARhPacVw9Yb+tlIKLZxZWe0MbxKQ5ix9keaWXpyDnqq3aMkqXIMXAabTt9
	 lmlgusYkK2wcf1zUn1hzRmBgsIsAUhoK6fkXelXqUnrqAYy1snu8xhklqnK2YFwQp1iLt
	 NipzL+qg8RmExc2TfI6EnQFvqPgpNLM8nMAPC4He2yKx15G3USOEGz65/X2syhqvuFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156325;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YvRd+Dr4KlVFXliJ1+nnsIQ7vhKYjt9e4i2Q/0Tkx+s=;
	b=CZb6CwCb4TSl1PGyKHFjV1QZ5XKCnXKWPX6ndMzM+Q9lshycOOI4II0by3mWmv0dV0ci
	 9X21GeKTiLAc6ZpmQOFBax747Ju42422fMcPCx8AYcF9nWoWe1YvqCcFek9+42cV2lpZl
	 rdl+Sz4C+KnyYtrQc+QHZWmz+Mdd4/kFdjQ8fGsKlMXHHzxDFzfMzc7ul8oPJ+KUbt3h/
	 Ndmq8VBNbquSKqkykRbKtb/fVuzTLEBu4yUrtz2A5pwBsYXpQAXyCx7l6/ry9ANdUZ1VD
	 rwWaZNIW8qIthZAVtbK9RkQXlTTHN4NH18dFGSqPgFxVecV4asbe4xhSsF23ueaywOw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156325;
	bh=YvRd+Dr4KlVFXliJ1+nnsIQ7vhKYjt9e4i2Q/0Tkx+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BdaYEhf7d3guZm5OLsLazM4lZRTpDOIgtpjUi7TLrSKHH81AlQ/53E2Kof0NmfQ1P
	 hIvnoMht4qX/aL8j1pc3EwiM4l5VZeCOBZeBe+vm5PFwdPmVUPWWQbPKfj3PejAS+7
	 +Mz7lJIg0kIrnpFXGwCeUIro1cD5p5vTfnI3FIchUDXdpw9x01MZm/Af877vQlNUCj
	 KOFDeUZ23eKvVfX9jrRIq82EMFNpfSgPRstPHpn9oxm+PckJbNF0BGS4tzlLEeQ/Rx
	 Ij+SXyBcmBpByzDbx96SUW1s23Ddg1xfbGdmnJYXkXqeuE1wTafVmWe6Nf+fYfDSRQ
	 ctYElk3Zi2hHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B5CA61179;
	Fri, 16 Oct 2026 13:12:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75CE7769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65BE060F0B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLrj0LLFieE4 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B9C5C60ED1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156190;
 b=EYdGIPJOIvmKfRwSu6GAbxFeKztkGDYGHntJx4tXc3UQw2RRDKAL4cO+F97J6ZKTbmpZ
 sM+ew9Sywt7oQVNY9ZAUxvOGDPVFHxd/m+6cI5TstKBxUHV1IEFRB7SM4gojkpaUFxh3J
 SmMy5GY61nSFh5kyS0Zp/pjxpxB8haR3dwcsi2Qe7oXSiYCRBDFVRcRDZUtmRR1Z29UXL
 Q+PWPFgo/31a6GCcAz8xRjgmYnA08uxsh4tAy1MeC87qFOBZ6q9h5TFi6rURseB5/I8qC
 W0BMO/YMJJndAMrG4R1CPTCt3T50pLjLL6cFUfJd/2yKQCaSfhrg0o25r7udP+eeWXg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156190;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=h6Kweh49smMUoSQnXi4qPdRpuAteXU7YAuZqXWlY5Wo=;
 b=jgH11rUSA9mqVPUQCT5rrrysEen/gRHeejAxBM5KdnCNgOF92oDsHTRM+gaiLwVngMe7
 A9HJmhho1k8pLBI6S8W4kS9yCgHf42tf+9vCCunMPN2tPw8fQ4W8laTyTyLUFVbNl7JvJ
 XEyogflkHGImrUsMg0rTwOKAZFq9vSY+0jzmU4yphepO0BOjcdm7x6uN0R53tQLPm9Ou7
 WsaNNcUsXFzoL8uYR0BfgpWpgp7ky0SMtIdj/fIDxUGqllBdt2uL6VP7FawcrUuLHo2rK
 nrYqs2jjG+eLCWCh8J62VVJ/n6Q8pJrFJr+tPVQ/PYJcYu9WolC02wBlQHk/9eEDWgg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9C5C60ED1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9F0B960DA; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:17:31 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: dc7e2cca5c333c5e653d48bc1a4e4cf006d447b3
X-Git-Newrev: 030dc6e2532b7047ad4a502b930d8aef3eebc62d
X-Patchwork-Hint: ignore
Message-Id: <20261016130829.A9F0B960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/tzdata: bump
 version to 2026e
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
Content-Type: multipart/mixed; boundary="===============8452774105133620882=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8452774105133620882==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/030dc6e2532b7047ad4a502b930d8aef3eebc62d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VXIA4AU73OQL3OZ3ZBZHWIASIIVBGUJV/
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/L4IGHJRBUQR53F7RTEHM5IS7ZMBR3YXP/
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/NVHSX2PAQIT44U5FCCEVNJJYXQMMTJSA/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3b3f1d6d9d3cd6bff010ef8ab638b1f55defd58d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 4d4d410ce1..e2b278ddac 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
-sha512  a44882258c0a7fbe587e8b73d6bb3cd5be7d4788976ea742adbbf176eb3b33e5bd7d1714b2fffe2972b1a42e7335eac39ed0bd63e819bb421550f8cae1df4f2f  tzdata2026b.tar.gz
+# From https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VXIA4AU73OQL3OZ3ZBZHWIASIIVBGUJV/
+sha512  5be2f875f73b75e5783c474bf7a6c768e433cc90283f8fc6a75e3d05bd92aec97936e8a55ccca5e880b5dacc18ba65932bab0e783e1ed5d2af4a3a4df95512be  tzdata2026e.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 71f8fc3ac1..221e34773d 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2026b
+TZDATA_VERSION = 2026e
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata

--===============8452774105133620882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8452774105133620882==--
