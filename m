Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85570C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 13:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF90F40769;
	Sun, 27 Sep 2026 13:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1Th-2GQkJwa; Sun, 27 Sep 2026 13:09:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DCD114077C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790514559;
	b=rkt71YLJljIMIJZbpsRYWP7zGNuRfUaJfXMal5rwNPuZwuaDM8zX5okucSt+6ImxsxAu
	 8CUaKubn0HLMFfxyV88g3TpTX5K7DWwTDHqgiwCg5F9CABFAEl5H4bcOq5wwZxGawwMDh
	 ZsrWswwnfGOcBP3NI2IBJ8ppjz98/4ifb3hxEt8YSPpOdTj/D89AinjdSgExsHTQTdD3V
	 jSQW5xvL9Nf8KFx46nsr6Vfxjm51TpIKj4qEw8h+k7bMKitJ/+MxxUchJwYkXQVgkkjM6
	 hpKJlgPbzO7KJWnGLT306xRtRrcR2365se76UK1Ntc6XR0UjRG0ifgOWkLGVBk7Gknw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790514559;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t+nEnzmfoNqc+W0u3+JeXE+vxYL+eMb8yrdT1lpY/xE=;
	b=KIMIns272C3FwqeTNVpDVTAmXBY9LO+Wj+I8AzZp7v0YTFPEQCa1nxrbtP4LA6iQ0dOA
	 Tbi7h9ebbXSovPEO3DnrYGvdRSvc3ARvORmg/oD5QIIBSlAlLxoRSkDvCWLL4k7mB9U3b
	 udVM2r7ojds46NPxe4a9Zw6Z5bZwkAe/rHu77u0O8flX1y4YlnRUggle1O7iRtai3c1Xb
	 Uq30515ZLkYNnxRksSbYpiO41i8zuYu4PeJth4tSnTlH9dwD3Tk38tXfkZ7YSw2D6Gnw/
	 njoM0l6gcSFhcmwN/JCR3jcx4rslpBdZ8uKRIYk5OAx0f+MqfmPSzK1IJEJo+jsfx5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790514559;
	bh=t+nEnzmfoNqc+W0u3+JeXE+vxYL+eMb8yrdT1lpY/xE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R3UXSye/Iq+7A7so4yiK4nzkvKiEC4DoJ9G7wezeHR3lKI7HsiQnxIQ24qpChO/aD
	 czYt0NI/iTYwpkR5vQXeuwIc//UyQfZ69MQuedDST7nV9wYtV0jMIpTlr1tPWJ6Ecq
	 tUqZuihJvYpwKCwvlGbQIxPnhETFbme0wFvckLDby1gT/RoixB3IBG0IYm+bpJpElH
	 MmayDQ3Qpxm3z/7gOZF5lKOdTGAUpU53Xl4UKxpifrLDvhJftMzHaZ+O7d4tP0W34U
	 L6a9nZVEyjmgtjt5KbSKMTs5hCHcUkmTTVhmkzi4rc8SK2+vHkFYFUH2TSpyrU14eG
	 rXZcySOqsRqGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCD114077C;
	Sun, 27 Sep 2026 13:09:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD612B6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 13:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 380656061D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 13:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNMVIHrDLmC9 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 13:09:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 33EC96061A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790514556;
 b=hTMIZSWjagTS5CGeMPotZimXhcPRjB1QDnOAoZ65J1bmkIbOr9RsGS2QWlbnSP3zLJMy
 AK/p1rnxMgnIBf1MgKfOpDXgFWKd29Mi70FIWHzQLbsy0X22mHV1oa+3ypmL2+Wqh2Uzs
 rTXvlwv9avtxzQ69hV9ZfYcZ+UgrhcKSF+j2Up+3btOMhFM6PLPXYFj1Ggj49FxupXPBq
 z0AP6G9Q0K5ZiWaxUIEigipnW5O1ANuT+WhjV+3eBhxSrvOVkDx/rAkzEkyq0XlY5nk9W
 6D/UcCB3fZ+1mW5G8o1fv8+uTYjiGGBtLBtt6u0ouhXE/g9ksykhE+j8resxG1dIC5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790514556;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ToRRxGi8me3DhBeOSXkJ6oGCkg/xmcf8UHOSxsHghiE=;
 b=W3ukwb4OwRC0KoFHEb/oh2TCkXQoTURLt+TfRq/gTJe327pEXlymbqYdR/jE2oxOmjuB
 LLS01PwN2bv3rcToBKkHKMsnrMvDQwjCwtGbl+wTQn5oBKbePhrWZtXo/eyMqBroycs7E
 NAWSxhlHJSeBSf455/og8H7Nxo25r9lZTiAeUdceEhIeSZl9CqzHOw47ksguI/eXSoSl2
 yl0sXbElF+ebgA60g6TnmwxIgLZz/1366nQ1ocaJ5fDPWFiqgWsWnrj+/9LfiI55X9cej
 9OML7N1K7tHRJh+Ns260zMJY/MLz6QB/WPcaOUu9KhQ7UT2UK5DbfPsuhLJX2RRmmkQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33EC96061A
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 13:09:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 655BD91F85; Sun, 27 Sep 2026 13:08:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 15:05:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 633d368bae51b20081e31d5d8925705e62f806ef
X-Git-Newrev: ea9d29a8afd6026b2aa042526387f084eb00f359
X-Patchwork-Hint: ignore
Message-Id: <20260927130804.655BD91F85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chrony: bump version to 4.9
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea9d29a8afd6026b2aa042526387f084eb00f359
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 4.9 (for details see [1])

[1] https://chrony-project.org/news.html#27_aug_2026_chrony_4_9_released

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 6b07b8d56a..0126d18836 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://chrony-project.org/releases/chrony-4.8-tar-gz-asc.txt
-sha256  33ea8eb2a4daeaa506e8fcafd5d6d89027ed6f2f0609645c6f149b560d301706  chrony-4.8.tar.gz
+# https://chrony-project.org/releases/chrony-4.9-tar-gz-asc.txt
+sha256  4924c6f530105bcd5b9e9e33c48a2ae1bfd889222c8480bc41601110efc864d0  chrony-4.9.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index d1745419a2..a42042744f 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.8
+CHRONY_VERSION = 4.9
 CHRONY_SITE = https://chrony-project.org/releases
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
