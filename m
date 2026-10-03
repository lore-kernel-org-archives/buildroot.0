Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02073CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AC8960FD7;
	Sat,  3 Oct 2026 15:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63jBKbMkPdGY; Sat,  3 Oct 2026 15:56:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A8B8F60FC9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042991;
	b=Fc4QjQ3KzrGOT+tBg/R55YgioV5ewWyDvcQmrNfJ01fkT4nHvcG+TqkyFGOfIn+PJukP
	 4dX5PkMh5MTpEpQG7nvMJdTIWPM1npaVRwZAdl7llELTNlyzKw6r8Zu4apDzIv7sACt7J
	 fuQMBVlKEB+IQBZ+CSpyl/AQqi2qkl6TaOYz2wD4pL3qJvc1xcH2BrE/P6XDoABklYMQE
	 cyIdupuhd9Z7RueofHGpr7rrY52rSFI2MXjnLrCjvdrM43PoL+AQlmUyRXdPVqMShWsgF
	 /Ylq+R2mn7ikOWstqAtr07VnKgRtlcTwLC5njga0bJKpiOjNyxBKiyUCSgqQO3K5j1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042991;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ugb0cUKl0QqjVLl5c4BmNMv1WDiHLbhy8qwjUqNVXkY=;
	b=iDZe8cpm8OTz3sVRQOhDu14ZTqz+KgAepaWO6jo3bQ3FmNV+iwST6N88/FJcz9raFoIf
	 AtcGeuyjsABTEi2HZjaYxXfq19+UEJ6ispczvJQo4irTvNzPZZ1EEfochnu9qrcAQgoLf
	 kAO3gGDbqtTmUC3aU1NOcculqa+U14YrZTOArXi7e59vGe50jKQdniotHwHewsYoGqfLY
	 LXu3XW6HVuozQIKShOxh5vnOV2yWuJ9vT7GRYdYs27izsdWF+XAljSiRXb5T+fUp1GV0C
	 so0B5/qQW3Zw+BOE5JTjaXN8QflVZdE22GoA3KdX/g/mfjwu1lBeIwpX7eIUD6d9zyQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042991;
	bh=ugb0cUKl0QqjVLl5c4BmNMv1WDiHLbhy8qwjUqNVXkY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d98DcRF6quOTqX+imJJoNLzog+7Ay/am5Qq051Wk45tclaVMw1suGElP3PGjUJxiI
	 TaQ+94yHvotgHjfAwT6rkI81fR1lQXqMXMmnj4/R4PZnjq6plC/TuYhSgcfQq49zMu
	 ZKlLA08lOoCbuZajfYnUx3WZcPXD5DNAX9vENEZEqtxe5dLN769Y/RYrqedrF8tVMD
	 YJcbETzKtXKxat/3f17ihhWiYK/lGM7yHDE8q+tluFKj1Rt4nEE3kTb4XVV+jtH7H/
	 OQWNwum6w/noPWBk9XjBjBaKE4B+oTC4+IWD3NsJFeK7SrLMyjVgSS48cq6Iiw+YuV
	 5fB/vZO9PTlag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8B8F60FC9;
	Sat,  3 Oct 2026 15:56:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF8171D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DB126067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVVOUbNIWj5L for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3D856606A2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=jnDVgFyN5kqRByN+Xc3hdDa6N7P580eCKNib9iwYWL+5hSTwbo2hpqZuMmHYzQPyCPtU
 h7s40nDSEL1FkFcsJjlea7W3QEFkZeqzmcA+Q+UEUyDmXndPUz+E7kQu9A2W86XNmBfhY
 4OzZoCKC3YdOp1DJK4I6Cx3r7V1245yHst7IQI+enuqLoXwQH4aQO009g+TvtGpi2DGS9
 YJAK2sLUAuPTeqzTzBvZmQwpHt43Z4ZCBF3PZEsKkL/GW5nGr5NGzvY+xTBuZzvi3ZHmm
 w8KBxNQLtWR9/ThhCVg7mH09L+csAyT3aVV3qhZJE2OJmib1x8FF0GqaP0iMMRobn1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ArqrvhtSJbR+ZkY3MishIRabo4mtmfT1UuKgMBnHjgM=;
 b=htMFGuE+FYylYR4OM1sViuAenbGJepw1PSrekBh3fuWXGNKfQliOfz9x8fvDeEHvux6M
 eLALeWU46rdEFtTH4Gxc1QOF6pQRjaREQMmTpzHazR9ach5AK+igIOhlBi8qIPK6Vu8RJ
 HlZZbyLLsZlgH7LznJJwunW5RPP8Rwd96kEzJnueLiyllT4TlTWzEgeQ3ToHukHGR+nty
 FkyfSj+QlFTpU/8Y+Vz6aw7jcnh1BGShhNPLBhX0MygGUm2oxhEiW8cUq6gdyMNKeV7Va
 MrOhPWql8XBZRqn4ezSIQWg7UTuTVC6K8gazi53oXvPT9nFYOaeXqttvcHUbRWxoVfA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D856606A2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F6A78908D; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50123022760cb3ec7b307a9a4eeaf36460cd40af
X-Git-Newrev: 94263d0bf29ee82034e1f3e6102d645b3585dc24
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.7F6A78908D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-falcon: bump version to
 4.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/94263d0bf29ee82034e1f3e6102d645b3585dc24
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index f7d2d358cd..6a78f0f617 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  d4d156864d62dfd93abc2fde90ad6fa0  falcon-4.2.0.tar.gz
-sha256  c13e86e49696d6655411fe09473c34997e49ff45e8cdf7576297b0ca71ceac3d  falcon-4.2.0.tar.gz
+md5  f6ed9db875cb6ea8d26791b5345cb0a6  falcon-4.3.1.tar.gz
+sha256  b5081be62f1e2d4f5140f4bad6993fd2bf8b1e503ee7261f56d324b87e41a67a  falcon-4.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index e6ad8f5d80..44ba1c7bc4 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 4.2.0
+PYTHON_FALCON_VERSION = 4.3.1
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/ba/15/5a4d8d62e8b338d2ec4430965b51b592695e859d0c6bf104afa1ce927eed
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/a0/02/a51af369a4feded77801d744f2d4669c7fa0a294bc117acf6ee06439937b
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
