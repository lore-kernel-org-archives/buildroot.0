Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA49CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19DE0811A0;
	Sat, 10 Oct 2026 15:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeTaJeUZSoki; Sat, 10 Oct 2026 15:56:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4575C81136
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791647778;
	b=BySB5i48714oq9DPSwUN1ChsLCuYZkwh6nSvcyhEXCuv8POcq+dmdR051BN0tDsTD2Ol
	 Dtw/Huy83dh8C4Itx4bE5FPqvonLA/bAvChKhFYO1Dpy3r1nCydMygyV34VKIKQ4k2iRf
	 N3OkKOYa+XAGoQ7fzb74GoGeaTwPQI89lCKVjpc/UMjbGWvZBgzQHxuZi/qQamXFty5B2
	 tcGWqsu+L7IeK51aDIlv3p95/TTxZAjrkURSmGaoP8sn/IMZp3aKAFwwwKHNvcPofPsVz
	 dV4/KVoEl/2mYE5eg+LoPidaOq87sWFsuXzG9WQMnJtnYX9baiafTdZv+BqysUsFZoA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791647778;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QiF0r7519jQSeNEqIhjSk5cj3sIdGoXlq2C4aqERVs8=;
	b=fauqp6Scln1oqQvGnhpZs8CvAxemGCDXuIUQ/clYttn+ef0Pf33Q8Ne8OdabG64wV2Ze
	 AOeH6vwheOH8WnwWTcPXWTrhfGROcmdGTpFfIVe+SrfIwf8GtlEuszuQct6Ra0kmjbzuz
	 rDr3CHxHVhSrQlt/LUjhIpxRWBfkT8t8ki/sxmxtpjnT2Qi2uJk0FtBN6hYD7u8RfJH5G
	 WlaG/mgeol5xx+228kLt0YiP/cakY4+B1LZLbco7fHTkA/SHM5IwXVFeGWL47cvphNS78
	 NOYu0lJOU1eEfrtvS1JHdgIw4RlvKJIwiuK38PUgoXWPc6H7WsfmXr/+duE3iLaAqmQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791647778;
	bh=QiF0r7519jQSeNEqIhjSk5cj3sIdGoXlq2C4aqERVs8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jC+swF/9rH96CSfvUNDH7i10QSUKUdWdqMl7u+Myt1Gb/AK48nvoGbyQdoThIFw3z
	 FRexJL9vPSdOmGo9JisOYhJblN3RtLDTaN+KxY0l1AtClLeEG63OQeBWlS5NQeqVEf
	 4Sqgib3HEDSbemLhahN8Dls0oBmRN4JwhvjnNV/JGcYPsNgTpAeQPgQ+b/lgTFcCJV
	 JVKUeEo7yqZLyCnBffBbyFxOokbFO61fuVBdMGde72KdvO9fUamBleJLE1qJo/vBhc
	 u113qLKDRkEt/xBUHeay1UYgqUqHPBHQMDdPRZlNATBnI8ncpZV2oGQ7h8FX8M5AtA
	 WIpk+FFzeQpnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4575C81136;
	Sat, 10 Oct 2026 15:56:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B007C317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F0874080E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uu5aDCjvFRIn for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:56:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F2D48406B2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791647775;
 b=srK9jp+Sbsfj6c4pFm9l05PiTQj+cxHBnoynwUNz5TQ06T6VZxcjv45cmu/Hs+grSVdq
 2r5IyXhVJxqSyFatmnIOf7OMBXhtxSofvKNza5MKXJOP/RuK567ZftIMgBiUTIriG8BkP
 xYww3lyVSyy2vS8c6Rfmr9R0aMNhN9y7rdd2Ar8DrEp/ew43GL4HCfgIuJW8y5Vny3VPM
 /f/ORyhL9BfnCfRuxd7/Gj9Z7Ynh0kMKkt/QSnYPQIKQCHxoFXhWg4EbZRk6rr9EJXXRW
 AJ4b8NNXSBr0lQO3QQZRuMfS38LpqvyrvzVtF/AIKgcduWdN5o/plqg8XpUJhjCfatQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791647775;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jIy2lHfuY/J5lAY6sfvRfVUwUmUbwa2V28UTurhaSDA=;
 b=TPJQcsDCzu4iMKR6vWDZBurp2YhTWanghHh1qIA5NUDvspmld1wmwob/6m/ArClRVmqK
 mvYGWInhjE2Iubp5qgj754Msf68Uzw/arX0hmr/EqTrEI/i8pknJMA5bspINt9jAjtHXi
 OKi5SCdAkm0oD8PKosLegML9b4Y0B4f6T81aG0narygefvvCTBjFxLesDtdwPO2yjZ4J1
 kiuurNDlDfAiUDjhvX4Wszrqmjk2AIpFnkvxKMD4pV5gKMS+EFQdJGx/7yM57sfN4KW3C
 2UAq7U63JzzfY5gGIM8uEuljdZ9Cq4xLpG1g70VRbP+JfOTjym6Twm0zEITYdOQmjTw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2D48406B2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:56:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9304F9229C; Sat, 10 Oct 2026 15:54:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:55:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ddf1d86477041f5cb3b32e18f6852d4d729e81a
X-Git-Newrev: ea0f27d64f84894f53170bec827aeff4370104fe
X-Patchwork-Hint: ignore
Message-Id: <20261010155456.9304F9229C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: extend help text
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea0f27d64f84894f53170bec827aeff4370104fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 boot/edk2/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 2620c79076..7d170fde3b 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -14,7 +14,9 @@ config BR2_TARGET_EDK2
 	help
 	  EDK II is a modern, feature-rich, cross-platform firmware
 	  development environment for the UEFI and PI specifications.
-
+	  Select this to build EDK II (and OVMF) to be able to boot
+	  Buildroot in QEMU (UEFI mode).
+	  
 	  https://github.com/tianocore/tianocore.github.io/wiki/EDK-II
 
 if BR2_TARGET_EDK2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
