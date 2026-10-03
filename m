Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A922CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A578D60FBF;
	Sat,  3 Oct 2026 15:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bsoci8Whnooo; Sat,  3 Oct 2026 15:56:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6EB4660FE0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042994;
	b=HIqxHS4qPl9BmTw6kpo9hAggmbRLP5hFiURB+aRcUw9FFIuu6asvB2lYwul+oSE3m1qM
	 cYQ0Lou601x8m2oKosI2yXTCY/JkXnI3+Xt1iwIryXey55EpZkzjuuaisMrBvyYpGGc8V
	 nNEt7WZe7MYDKamjPKIUcR5lLsA2owJ64Pr/wuLpi27pVIRc57ri2ap7ryHvOGouSvUQk
	 iW4Jda+NCGdIZ2isXFgUs3iDPkfABEZ0ustmq0uLueF3R/WiAGBaJRrE862r67577YtyH
	 0yoLam+Eo80do7LXKWs+bhT6oHznEoGpU8N7pzVzYOzZt0g4yAbmO72VPaAZ+k2KoNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gsaCZ+L5ruNLlm0HOMYkBe5iEq55Io1BR1MBuFBkbxo=;
	b=JaTQY3iUx5ekmd/LKgnXvueTfB/gYkXcbDJXTcb11hhN8gmV3O54NCS9Y/LsFsorPUNO
	 Mx0iV2jTvPHK52TAAG/hKeMLnwRzoIeelr/26kYNO5GSCTVcnMNPPEIzYh8bE3LSI0ppQ
	 27vpuBcWRNEhsXNfsboVouKcsSA3Io5BWHutcy/vH9gWdCJMeM1rGu68Ah7W1C2+87P1Y
	 g+7VdlQK+8NTiYV2mvVdmZ+Ok8Afn4+vPo425DLG4ybUdbFRV9nrZh95dr/F4UYM578hP
	 TYcqwqPBzyyj6/FzpuHx/+cu0PZxQkQkIHWRJffotkSG8BoVebp1mcnCEE9w4Le0zxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042994;
	bh=gsaCZ+L5ruNLlm0HOMYkBe5iEq55Io1BR1MBuFBkbxo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C8TSjGjiKhNiQFBZ7vFCgNWe7eings+mN/sah+f+5zAu9Ftma0SGJ44gfi3zr02on
	 1TclslmcoK5Z3NbCKdzl/yDip3DtJhnlqKGxUKy1dLJxGIekbBIoljy39khjO2GuGF
	 E+V2rQAO+TK7LF7pDh1GJbjOhbeE6bsCyJGpWZy/LIHIX63uorb9WG3+b1G7tjc35d
	 ti0CgBmoA2xAzW+js972zJ5xEXiWHyxPggw87cBxOyS9sDlBOWvFasHcSixjgNOZaH
	 iweT3viGR1U4F8p++/WSs/fZRlBXbFnlaSQ3Tbc5YEa3aIFGDMOFlMJvCzsHH9fsvG
	 OIDLuptUPiq8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB4660FE0;
	Sat,  3 Oct 2026 15:56:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C564F4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F6FD60683
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37qXl3i_cyhC for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2B6196068D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042847;
 b=TRd55CYk1MQHobLtEej6sYL07lqWnKNZGxEMw+Ei5XHGBaJRD/LkEcyUoVV+nAIsvgnk
 xC9w9iG6Ox8YtI07EGC16eJO/FfuGyZlVUAomkKy3VrA2PdvBMEn5Xm1tw8RnuOeA14eR
 +tyviImP37YfyljtCTMWUU8kv+FdkW8WakZaG3zyFedy7mt7p5q8bOpBTH1TkirPyu/El
 FclKBCPwoFt8WFtW1bKFzDccA8OJRzVdXLhpqbUcqYjV1q3DGqzNYUMLmrUnH4V/HB1+i
 RVBxQ3vYP+C5nNQ9D0xz/UtH0py3WuumcOT8oSVrp52G6sOccuXhjxz0KJFx7+Uqhyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JBmFHXfniMR45dYhrzcPl0dZhRt6WPocqd1mnP28uHE=;
 b=I9spQ5LNIJ9lM+9lPrNMGzOh53ApDK1q9ejT0Hi4QCf02Cmc+fqTQvYvVkGlgwS6q9IQ
 T7GwlaxrvO9qfJ/ZdLzbhC7nnUHtwUXAWNSM9957B/oijGUN3wsme2yofhN2OOdNJvUXb
 MBs+j45Pb9At4Bizj/Vk8Lvi+EUJT55n6J5yZEU48+a9VgtMQlo9n/d3DxVTgAM2+ljW9
 pPjRHw9W1pkUek9OkErScpF+thmDg5sXmHZv/lnVLeR/UosaxgrsvH6fmVyyqSnMkWoRS
 9MxqNCOORuSXcICQ3US2YWeZ1wn7DEINMsOgTmVoUnMPknM5ozNEfbKG7sdSiwFROdg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B6196068D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BB938A4B8; Sat,  3 Oct 2026 15:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2b3e91816d5ab6217281d1633409f0836833a62
X-Git-Newrev: 50123022760cb3ec7b307a9a4eeaf36460cd40af
X-Patchwork-Hint: ignore
Message-Id: <20261003155252.6BB938A4B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-evdev: bump version to 2.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/50123022760cb3ec7b307a9a4eeaf36460cd40af
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-evdev/python-evdev.hash | 4 ++--
 package/python-evdev/python-evdev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-evdev/python-evdev.hash b/package/python-evdev/python-evdev.hash
index 9011065a56..b9f2e969b8 100644
--- a/package/python-evdev/python-evdev.hash
+++ b/package/python-evdev/python-evdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/evdev/json
-md5  d07e455e36642752ecc3ef161f15e5e6  evdev-1.9.3.tar.gz
-sha256  2c140e01ac8437758fa23fe5c871397412461f42d421aa20241dc8fe8cfccbc9  evdev-1.9.3.tar.gz
+md5  d2352944714abd2a29e817045261df05  evdev-2.0.0.tar.gz
+sha256  442fb3f4c8dfc9e61e901133c356220c02d663eca8f34722e0cecdd637eba504  evdev-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d4554960d6496150c88c1fd02d7973121a9a57b961ea58fe349fbf8ada3816b2  LICENSE
diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
index 169055ab27..ee8cf67b5f 100644
--- a/package/python-evdev/python-evdev.mk
+++ b/package/python-evdev/python-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EVDEV_VERSION = 1.9.3
+PYTHON_EVDEV_VERSION = 2.0.0
 PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
-PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/a5/f5/397b61091120a9ca5001041dd7bf76c385b3bfd67a0e5bcb74b852bd22a4
+PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/2e/07/eb30593524303d1367f0dc00c1c66582c994dba412a47751e34bad9fa29b
 PYTHON_EVDEV_SETUP_TYPE = setuptools
 PYTHON_EVDEV_LICENSE = Revised BSD License
 PYTHON_EVDEV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
