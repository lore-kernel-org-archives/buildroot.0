Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD724CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 799F160808;
	Sat, 10 Oct 2026 09:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGMQNZD-O9EX; Sat, 10 Oct 2026 09:21:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9AF9A608DE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624103;
	b=DJIHirN8lGYlW2FL6uFy7XOGrnrw0FSrMilAIYEOWjLu0DlKP+1cSOpwf/4YutQ4A+UH
	 i4PMV91DfJ+U6tOfaxubESkayeiwTfYaMnPDDZVHRZ3e47zITR03OQUSTpzIFWWB1koXX
	 AhtE9L/D1TEvcksveYkOOOJspZ8gCXcxsFiPCWwT4r/wva6qPEfnvaJNwfLS2VdSF/KqS
	 b5j3qqL3/f3J4oT7l3dwYObJAbh157pDDFSrcCNIwYbi4Ls4GxxTgtk9xNiBSVwuOly+t
	 +1iZSUFuC5L395zPDImLKAGgKCv6ZxcwND6l6zGRzOg+Vx3bZ3Nt5vIbdIxrt9G06Qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624103;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=kotew1GY21pDIjKyc5f/+hDJGSd+Wyk1R1XcDL0rZIM=;
	b=c9O1NiHVQK/S/EBMEF8S2w1yJcag810m6y/jZqqBWpFg46dlnaAUaGOUKsRUmBViO0Fh
	 aTmkWkU+K9Akhi0ncq4H3T/4MobPczmNmKCrR3Xb1YrVWeOL6HCL71x1L2i/2A0y7Jgqi
	 TLi5446KWfNmxv4yCY5s971EMNRPoyT3xIkF90tLtqUft6xU2u9YYDx9bFt/gM72GhcLr
	 qjt2RmluDlTLcsH9OUKyfb+k8KVK0U6Hh5l9MtmxQ3WxOS4BL05LLWjSa24gd19NassGk
	 eLLQdzuxSvMLEY6Nne7DydhT4QtAG7uW6QaHK1UIRwBt3UlPM2P3kX8oRsV3teTt+3w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624103;
	bh=kotew1GY21pDIjKyc5f/+hDJGSd+Wyk1R1XcDL0rZIM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sMdzuJuZnRnxPoDbTTcn9/aAaM5gxVYBIBuOCCjb0YvqigroKOEA4msOLRI1zbqUi
	 iUiw7e+yBXJJhFKI4a9alisRieCoCCVFyEAoMwcdx9n2SuJUkgppNgnle72mQA7yXs
	 JllNCK6eHf0xYYp3YH8FlLHISExyn+V5Czm1zIbG3KFUpK5qLhXL7Ka7k3nsta/IqT
	 2P4XWl2n/f6pIIvGOp6eMjKeGERnO4a0WiQgqkVCtvi06yMXPJlMsKcyVdhFjMcgGz
	 gdM/0l2UwoYZEbaLAUTOQJJP86Q+B2y5o4KOICY8NdjBB00Qla5WTtUMWL842xGdIy
	 UCVfspVyMIvzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AF9A608DE;
	Sat, 10 Oct 2026 09:21:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B13E675
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 961DA812F1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLkZHfIgUMqb for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E2F9581299
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=TJ/OCdyuWHIJtK1q8OQsvmIoUE4BLY0nq+lgU35e2S9yfaWcLZ3QcClsx54/NdnTWGbt
 0Jo+f7LbrAZ6JnTObM7NVChIlyER75QEayl2Cu3dVhgz3TnV1nNLyr1kbhCShjwQnYd4v
 qALToxqfXaogJBkGSqtpZJCWUhTKFfo0ZnorPE790FuujCKgDEzOsOMTBUeMn/OGuM83R
 wButCWyaMzUTEFGKDTV+KLiDalyqI/FlMai5/bvcsHMVJ+3YfWU2WFQwBRJZIIuzcBt1Y
 RjWpldPoRP/5EyqDU4/+rUwP3Qu69mSICUlqGlqbF4RqLkvcnbZvL7GWRYdTeIb7ynA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Qht+Un20WmB67AkgjCC1Cn2YU6eAQeU+WO+pq+pG2Fk=;
 b=pZWYHrRfAtOtPCgU89U9ZEbH2rZyjnTmHDBcj8b4jrVWkcIqkFaCL2J+vGbAwXsLArco
 NCHz+e+1Q9BKm56iexcTAbrgqTMMcawvTtJIvXwU8TxX5w5G2m4tYQqbsJjTNNPu4et0y
 4BMs/To+9gCmAduAkG5mVQe3rP4OWjukgBxi158dpobv0eD+2KcYwbenKUWvT+F6wHpRc
 Cb/9u2WX7YnihGppmDTGTErY2nKfVf6fMlMj/Ktsh6P73aQQ6zELAFilHtMXNpkB9+SWN
 xtb+s2mCNMgwFIjwJUJf9tcsMH02HgBAf+qVmNk5Sa+TG7fe0e8RuolftKyqf9qbr6w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2F9581299
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCD2C8F0B1; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:03:02 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: dc8e76474f5b48a3dc05fd9ace1795c62fb26679
X-Git-Newrev: 902f6c9f37e47c67d89040abc702e52e18f7458c
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.CCD2C8F0B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/network-manager:
 set modprobe path to /sbin/modprobe
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
Content-Type: multipart/mixed; boundary="===============3282282671751089465=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3282282671751089465==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/902f6c9f37e47c67d89040abc702e52e18f7458c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

With -Dmodprobe left empty, meson setup searches /sbin and /usr/sbin
on the host, and if it finds modprobe bakes the path into
MODPROBE_PATH, which may be different from the install path on the
target.

Pass -Dmodprobe=/sbin/modprobe: both busybox's and kmod's modprobe
resolve there; a missing modprobe only costs an error log at runtime.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[Fiona: clarify that only /sbin and /usr/sbin are searched, not $PATH]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit dbb77fc03fcd505a02459a3833f0a8d2af4440d0)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/network-manager/network-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index bf4f29c3cc..c96f613831 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -31,6 +31,7 @@ NETWORK_MANAGER_CONF_OPTS = \
 	-Dqt=false \
 	-Diptables=/usr/sbin/iptables \
 	-Dip6tables=/usr/sbin/ip6tables \
+	-Dmodprobe=/sbin/modprobe \
 	-Difupdown=false \
 	-Dnm_cloud_setup=false \
 	-Dsession_tracking_consolekit=false

--===============3282282671751089465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3282282671751089465==--
