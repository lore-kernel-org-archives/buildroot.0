Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B73C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 17:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C27E660623;
	Sat,  5 Sep 2026 17:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlY5e1QaIUc1; Sat,  5 Sep 2026 17:07:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A8D496062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788628034;
	b=cEXKI0LrVRpC+76fPhMv4xm5hZ/GGZRwZnyEykgGJARgUgtFos3ogP+1MeoN42VxIMO2
	 1eCTQEqaB3tUgYmNatMqYFBbHW4k2SRMrXj2J4f/o5RM8/l+/QtxFITNYcaXaFEgee++s
	 Zug9Sw5UAV97TUz3CEuioI9PnduTI4RLRZ673XCGRAiKhpIn544zrUn9bGyVuYC0FNgKi
	 jXYwjEwHTLACWgXAT7EgK70K0EQAZyU6geJL8rT4zEwM+a0vKCuMe9QhNUIod2qq2Uooc
	 WzzhJVF6pGqFrm73xnSNtGZ+VzjNL1+j8RmHEHQGl7Ok0y+BPnUZS9EL8DeG07FT36A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788628034;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HHKYaDdTmAz1hs4Qc4hZzfFt+K719p1Gh2p8P2aHVVM=;
	b=Y+RPirOho3LSnnw/JwYPxlQrsPUHQ6a5qQuqmNs5yaUc5LpmHwIvzqj7UvbYy/ZICZVz
	 z5qySrwceZNntHt25TPE3feuiLu6buRpdSKbAQ64O3+NMrKs0wV+ZHdHQvCfjo5180cby
	 MpS7U3cVmG/12rUL3AyU0QiXJg9vtxCMTx+SsH7LruABnUXdPhS1eJ0RHRhuW+XS1OLpU
	 O+k2TTfAsRW0WC5j+rJJvtFDoNb5++7KItpS0tccZ62HMWjeZRF5zCJE82XDt3wGXQxiw
	 UDoAjnyIwOFNHma53DpvEhcIHCBe9TQaYtqP2xs6HmHAZol3Y0Cmn4DNIl1zaQeIedw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788628034;
	bh=HHKYaDdTmAz1hs4Qc4hZzfFt+K719p1Gh2p8P2aHVVM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HRrSUchs7PhYWsZ7U1nrKNyc19ScYKvdmaw0kTw5LHLh/33hP2da2R2W4jUhgd2jO
	 kcd3JKxx186szY9br15aEGb1F5va7fdbocdk2s6khNcJfR5DK8zkHcS9cpLK9cjzwG
	 CHggyKay8HneWD+/l2A5UcQ1i68rfQeHIb+GDdsZ8nmK+kITc+i2vygQgGXC9G2MwO
	 vbs6e/E9JdGOIkdkvoxeAI3IxgaauEtFB1ao5l4CCNNbOO7TMmIflSop2JbwTNhaIV
	 6defzlzWetILUUJcWriuPOay9ZEMfuCX4ena9LP0KPgMlnOnnr3K89NtDBmsIp+/2x
	 UiGUOrKHJv43Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8D496062C;
	Sat,  5 Sep 2026 17:07:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F61F1F2D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 276F76060C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUHhO_-No_qK for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 17:07:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C5BBE60602
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788628024;
 b=gVPlBEr6K9aT2uqhQm0OapDKrs4p/H7CK5nPB+AdKzRatAicBOYiegEMvzhtVzmqty7d
 etgXTd7srJ1snZfZJlztqf+6HklGMbrax6WaG1XvBChMuM6LHXe0h7BmkdxTHZxazER1O
 Dw4fUsb22LewVKoP50QszKlfNc3ZD6QidYOdrYarJURtllbEkriiU2HYhQLDCNfIKhJGi
 JX4dSqTnPguiw3ZkUFP/8k3vlI9eIAAY5+orcnxOhrk/f2nNKyffDeV9ZmqvOYfPv8ESD
 q2xXws/Ro0JIAU//3KX/LmBj7LTbWJjZgCRsfgWM/kOa3ie3xYCwyof6noaXpOch0nA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788628024;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vPzQ8OrVSJbsSYXFlKbWtpRHgJrTXwyL1UAPu1crDoo=;
 b=mI+neTmuMzqEfKFbUhnx8isZeBauWQ7a0W35vU7flBWELN8LIJD1yJHYwSoZDHTpf7LM
 M4A30xFvnWEP3JJgL6tl7WWRWEsN+J9fQpSwY0uP9zewwBAxHAU/praL7C0XrLfL8y5hj
 E9e0L9PllkhtuOSHBrnsQGMj5B1dVRWNu9igz0KJQWv3oF1VUC8C1qssVz3pA4tm8oKou
 1H8eNWh5f8ApDy1P51yerRBOYaTiAtpNtrFYUH6188R/NcJrow0Ut/a7tptzDrbCjuiBP
 H+z8/mM47JRI+oiJjAJkfnzSjGmYa+AdeopTCvkP2iEg/aBDvAmaMt7sEbUPNeEd5WA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5BBE60602
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 17:07:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B778295260; Sat,  5 Sep 2026 17:06:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 18:26:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b611fbd80d8858f056f62a71fdc16da8cd05e69
X-Git-Newrev: 6fbe63e14cd58bb5cb9e27c42540dcf820c5a495
X-Patchwork-Hint: ignore
Message-Id: <20260905170603.B778295260@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua: bump to version 5.4.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fbe63e14cd58bb5cb9e27c42540dcf820c5a495
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For differences with 5.4.8, see:
https://www.lua.org/work/diffs-lua-5.4.8-lua-5.4.9.html

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>a
[Julien: add link to diff with previous version]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua/5.4.8/lua.hash                                  | 5 -----
 package/lua/{5.4.8 => 5.4.9}/0001-root-path.patch           | 0
 package/lua/{5.4.8 => 5.4.9}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.8 => 5.4.9}/0003-linenoise.patch           | 2 +-
 package/lua/5.4.9/lua.hash                                  | 5 +++++
 package/lua/Config.in                                       | 2 +-
 package/lua/lua.mk                                          | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/lua/5.4.8/lua.hash b/package/lua/5.4.8/lua.hash
deleted file mode 100644
index 8494511529..0000000000
--- a/package/lua/5.4.8/lua.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-sha256  4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae  lua-5.4.8.tar.gz
-
-# Locally computed
-sha256  3773a4900f3539c56aea9d6cd48d71c8751d495c4abc28472706bb9553d1493c  doc/readme.html
diff --git a/package/lua/5.4.8/0001-root-path.patch b/package/lua/5.4.9/0001-root-path.patch
similarity index 100%
rename from package/lua/5.4.8/0001-root-path.patch
rename to package/lua/5.4.9/0001-root-path.patch
diff --git a/package/lua/5.4.8/0002-shared-libs-for-lua.patch b/package/lua/5.4.9/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.8/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.9/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.8/0003-linenoise.patch b/package/lua/5.4.9/0003-linenoise.patch
similarity index 97%
rename from package/lua/5.4.8/0003-linenoise.patch
rename to package/lua/5.4.9/0003-linenoise.patch
index a82c8801ad..57019f4c1b 100644
--- a/package/lua/5.4.8/0003-linenoise.patch
+++ b/package/lua/5.4.9/0003-linenoise.patch
@@ -7,7 +7,7 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -447,6 +447,14 @@
+@@ -448,6 +448,14 @@
  #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
  
diff --git a/package/lua/5.4.9/lua.hash b/package/lua/5.4.9/lua.hash
new file mode 100644
index 0000000000..5b8508f1c5
--- /dev/null
+++ b/package/lua/5.4.9/lua.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://www.lua.org/ftp/
+sha256  2335b6c582a52654f94612bf10d2f4672805d05329aa6568b1d8cd9e5c6fb8e6  lua-5.4.9.tar.gz
+
+# Locally computed
+sha256  760d00c8b494ec2f170bcdd969e36b038027b0288232c60e15ffa6b0d784e9c7  doc/readme.html
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 888c34b21d..7417670d4d 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LUA
 	  Lua is a powerful, fast, light-weight, embeddable scripting
 	  language.
 
-	  http://www.lua.org/
+	  https://www.lua.org/
 
 if BR2_PACKAGE_LUA
 
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 269eafe4bb..6dbdc95002 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.8
+LUA_VERSION = 5.4.9
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
