Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BCCCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC816066F;
	Sat, 10 Oct 2026 09:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzoAi2P_cnIT; Sat, 10 Oct 2026 09:22:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CA7F0608D1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624138;
	b=fg7IBPNBSQKPYTAxvRL1hgGaas43KCGLdpKl1H+cFk0LuYsbx+978CWipv2jFw+iwZNU
	 PlhcEJmAIJSUTC3lInq+MLAyQh94AZEth8HZ6ffXZKnnlvciUP/Co6DGKt2v1FIuvh0lh
	 2kQqnnjVK4tzREloNm8kCvlwv66Ef2AS7l9Lhj5Y4qmARjUsc9tvo+RfqAIPc7Gm1GJMn
	 xiVG0DDkQ5RSY7FSaB4cc6BVRZNqsVcdl3iOFLeZY4d9knjnxRI6bkejGOUWdCwo0+ZvV
	 pnTu2ECiJoDlFBRSz/sT/DZ9bumI6SXkf38tAVGXymu+NOACjT3HZaOlgUI21b26N+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624138;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oEezSW1FkVOp/Ege+uVdozjvxbPJVPIPPrqyMiMs/BA=;
	b=VJaLp8a0SNKbKrgVn1vSYKNTV0N2b4OrnBXZqLhpSItmICtBTNwu26Knr3dJNjim+1FC
	 11As7/42nRUTQ6EpNxEnUFKUWU2kUFl+oFqLjRFVubIZwvK9EezIv9Qrr9NGgNpWbwRZZ
	 or90QJ+kvUPs82HnZ8q+OskBtQHSUaz5U3n3jlgmm5XZILcEGoV1AbUOWF7vJLMkkAgQ0
	 Y+mT4msSXeM2a5n6ijjwrk8AUhTI41q2+WmW6DqIc2cKHjkerg1+zB3KkY634hji3z9Kb
	 VHxbScPeJOxQXSflsMXjV84f9wDzm47WituI25eKSw5CRc8sT4FJJOO9UG8O39KLWrw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624138;
	bh=oEezSW1FkVOp/Ege+uVdozjvxbPJVPIPPrqyMiMs/BA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vp4Rweh4oTEhvFNKXowHdNXPLY1/pMWbuZk3cIbT1bH3ZdmqP0cRIk+YZGSIKD2r9
	 FWgD74/+rG2p/LpslQWODeU4DIQPWHWv6sm0noP4rU9skXZd35EH0BmgGGNh3TnIPF
	 gR2CIhO3dfImDyBNCuWmTQ1Ad1bOZqtmhbYN6x9bnFZ02kumVV/61yBfyJyaKQNu+O
	 lrHGQrB7BySAFBCQevrBmerzR5hyjiXd+KEPhnlhfbMMvVO8ZDLSrqDtzsH6exDeXr
	 BrjUyiB4DzpfKcIWe6BQwJ4uwBU8zIk9OEWnmYkzPb/yJo+GKYHDU5Ffq0hJxJ18p9
	 yVqGg6vWOiLYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA7F0608D1;
	Sat, 10 Oct 2026 09:22:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1E26DE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87F796066C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzzPCaEajQuJ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9396960623
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=WtfQ8aObXLJaV8diAv3NqDYRriNA3c2ICpHCGQtqFpxbuZ3hBgPiX/wpFbYNMEqQNP1V
 EApFfiTAhvCbs9CCL+pbbLgYF/y0cZ9rZlirOqV8JmzebWiEozt2VgtU6pVgojkX++5fQ
 wNoW8Yr9AusSqmiydGW4mJJGtSX/4kcHSsvfdY7r9crlWcPbHy+tPtyvt5sE9EpArf3WE
 4BIzlMOii/Bkkbaj/9eF2+BpyurigmqGJTZE83sC73z4BKS4QsQwJq0k0tX6F/Vqv61hv
 8gIrjYebZhgBH7ZXNFFs9vPRroPVxPig/UIcab3Yo43m0yCbbdI8P7r8kJyUIgJtHaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=K6Axq/cGXp75FQBtz5RLrkmDUVGkXgrIizJYIrPlOA8=;
 b=q1IZUGzx3OHX5xaUJBt15Zbx1hT5xrvwFnbTSivbGZtwlGNBbQMkXGxV73jvlb5QjkJI
 9OqGge205zODCbj/e6YhLeMIxwShj7oYswnuR6n4UTQJehQulKD22oqaBuHBk1VHNd80e
 GY72hmYTm9tmGHPLJfIg1jznruNw0jSPA9e9h5jFCQpr0ixX3iXma1wVV+2tg4t/2CTXl
 O66Stbzo8nFTkJsTlY95DQ3wwk8Su41pR/nXlOAOdXS8SZkYKnd7r9ttNj4RpA70Zi5Jm
 P3nVU3WLgZxG4pBmhqSQRjVvxdCBqs5FTeRbozVVd7AHgMtcK8ygEybQFWRYvucDAeg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9396960623
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D7358F065; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:26:50 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2ea8cf9afbe9796d5c046ea5b969340b389ea320
X-Git-Newrev: c58a9d0abe550adc8157e1d396d1c2c6f3329b14
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.7D7358F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/chrony: add
 50-chrony.list for systemd-timedated
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
Content-Type: multipart/mixed; boundary="===============8938549258373168360=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8938549258373168360==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c58a9d0abe550adc8157e1d396d1c2c6f3329b14
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

systemd-timedated discovers NTP services from ntp-units.d/*.list.
Buildroot's chrony package never installs one: on a systemd image
without timesyncd, 'timedatectl status' reports

    NTP service: n/a

and 'timedatectl set-ntp on' fails with

    Failed to set ntp: NTP not supported

even though chronyd is running.

Install 50-chrony.list, following the convention set by Debian,
Fedora and Arch, so timedatectl can manage chrony.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 079f168792e1520b615c64d436ed3bb100d9b6f5)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/chrony/50-chrony.list | 1 +
 package/chrony/chrony.mk      | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/chrony/50-chrony.list b/package/chrony/50-chrony.list
new file mode 100644
index 0000000000..6b9cca00bb
--- /dev/null
+++ b/package/chrony/50-chrony.list
@@ -0,0 +1 @@
+chrony.service
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index d1745419a2..b2311df667 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -85,6 +85,9 @@ endef
 define CHRONY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/chrony/chrony.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/chrony.service
+	# advertise chrony.service to systemd-timedated
+	$(INSTALL) -D -m 644 $(CHRONY_PKGDIR)/50-chrony.list \
+		$(TARGET_DIR)/usr/lib/systemd/ntp-units.d/50-chrony.list
 endef
 
 $(eval $(generic-package))

--===============8938549258373168360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8938549258373168360==--
