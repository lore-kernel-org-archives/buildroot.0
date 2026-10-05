Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DEECA5FCE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 11:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B69634061F;
	Mon,  5 Oct 2026 11:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MxMaNrMQ1EE6; Mon,  5 Oct 2026 11:20:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D135240647
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791199230;
	b=BYT1N0p05WavflnU+wTqShF7McE2w3zcMRu60wiVxpyUPl29qK7rOk22Qw+nkokHhkpE
	 6RGLg9WnMw+6QxVITc7FgNVk4l9MSMXdSWSOd0TxsNXdoTtFRJAIxFGA6nMJ5pMkIOA9s
	 /FE5edQtMqaM2xDvVsj3JsEtFF6fJpFXA03YTpIEhiKnByeowBXGZVR89TTRtVF+m6vuP
	 mraR2ATm0lNoPCJ6nQYWkg5G8Jlb+tf49QKMT2hMX9xhzRqlmhK/mWI4kN7syWVvl6JqH
	 CU66vFkKWaUaVPh2S6iNwX1mP4D02f5RdKYYye7M78xG59TfxtC6kteLLWu+4yYDO5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791199230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=VPYIGR+D9qSaG66QDHDtf5KGvj0asaQ+kfStUWBzrtI=;
	b=MwGzNBu0oxZp6RbBHMfGgKQna5BweF8CHulshsKF85qg7ZEJnKRL81ULF66vuDib2pSZ
	 I6o1IF5OORJBZD7GfoCpuWvNecJj2UxY7n0phqn9dOcgXvhKbvaIPOmDRddruCLzsIJVM
	 eks73snYMXoScR5lQmAKrLClW9/7BtRounxTa3yXw3XGrwcmj0tZZt2C9LHrZeVsTEpAt
	 fKz4luPHeZc661a2ZnNZ7tm5OxurvDDsef7E7lNe4ABW2RlY+7sbeIWMOxJElVXIs5CJW
	 ziCMtODmjHwIbGervtNWM5+Q3AwwPR/PQa3Pa4TMZ/TNjjLUhK3lZ9Iy6XE2o+xeyTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791199229;
	bh=VPYIGR+D9qSaG66QDHDtf5KGvj0asaQ+kfStUWBzrtI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=re6BzP/4BMdjig3PDUUuZab5+xxOY7J4G9rSDYfeAIcAtr6Mp2Sw0Mp73uckj96u8
	 y8LVf+kKZXVhjbe1bXg3UXo0g2bgarRf+SJuOe09vFErz4m+IySakCDz2PSw0TZFQ5
	 xv1UWmqfniqb8Ytks3rY7GpsY7GFhXeLxq1JaMl+X0GDIVBKEFXwrMmE8NBZzAqMq4
	 sAZ2EoKM9kqd3t/8aV6FHrihlCGXl8lDDnrVTlg4HgKpcBQEcwFO1SmL676JIbVX6h
	 XLHhr4ny903ldRKJWYMxdtUrdfWMHl9Qj0JD/MhSLVjYgsvwi2r1Q3aF2GxZBNKRhB
	 fEIY4oOuu1oeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D135240647;
	Mon,  5 Oct 2026 11:20:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 606FE282
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46B2180960
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFtXICF6dSZe for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 11:12:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7095380962
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791198776;
 b=nlAX4eZjnSdBznFTOkChPCdt87eh7n/0m41NUTkq+3Nx6hi5SzMupkcNLM8P959umc5C
 XbdHd3oeOcpd7sxFP+7cmBJCmxFn/zQgxEwK0hur0jXgg3RtFU2I0opsjawGrKMXaBPlb
 /eBcp5hQig7zS+CHtBH/nDjwWMqalEDNtBIOZjNG7qSUsujnqPnCrhWKjMKMEgY7QT07o
 /CMNucPBc97ZkXJ4nPN3l93JjJoZvvRvHsNn81Vyqp+hB/rq69sz0mmGR0n7xiUWy8XF1
 SfMbOFYibTvn8sOv7DH5P5b4Q8RWzj5cPI3HJ5qh/T7bRBVaJse6SnGrv9jlpXR8IgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791198776;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=A7T0WB3CozD5HtqHL1xYuSCDJ4R9ZDghu/KkMZ3ImdM=;
 b=co5w5e4cVqDRS7r7DAFoijddZlTXZurI9r8SdAbgNIV+hTNOELaGD4WNsC9xfnD0VCf1
 5RYUbn/Luyhik0zuMpUdt3gqgmQ0DpRZH43+ttFpFKp5lThhGfsLHCalnDXj9vXjfhoO4
 OzKpgR/vGR6QIB4qu2r7XGhPiAeC7oPFDUxw72KfUcBihEwHem01DmffYlYH4vuT2/EC1
 8G7ydso/j57t52fXdWmfIbF3F7JmloNXpdVf6PZtWlhG30QdhBfIoLWWK0bqN6RJ3srl1
 PHDXDcKXNDun0MRRTI55k8FlwFGNiLJp3ya7HQ708IRyRrVzrf5pBrXVe6JOPtTxWsw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7095380962
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 11:12:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBCCB8D586; Mon,  5 Oct 2026 11:11:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Oct 2026 13:09:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57ed2d0d6821971c62eee39696a748395502c518
X-Git-Newrev: 3b3f1d6d9d3cd6bff010ef8ab638b1f55defd58d
X-Patchwork-Hint: ignore
Message-Id: <20261005111140.BBCCB8D586@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tzdata: bump version to 2026e
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b3f1d6d9d3cd6bff010ef8ab638b1f55defd58d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VXIA4AU73OQL3OZ3ZBZHWIASIIVBGUJV/
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/L4IGHJRBUQR53F7RTEHM5IS7ZMBR3YXP/
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/NVHSX2PAQIT44U5FCCEVNJJYXQMMTJSA/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
