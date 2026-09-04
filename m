Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0A3C79F8B
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CD7481128;
	Sat,  5 Sep 2026 08:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEChSgb1m75c; Sat,  5 Sep 2026 08:12:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E0C448112D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595942;
	b=W+AnWUfEcV4bGZhbi+DO2f8908mLNjiJ4sH2oTRbaWPhU/fQt48tM9Xy0rhjfajnry+i
	 lzfgVBfP67Urmf4sHFzT+aWwXJh/E2xPR5La3xYjBsopJ7Qja3HUjo/O0rnnsLiRZ4EjS
	 pUN+6LF0dXtaFf4M3D1a2vQVxehM7XWvfSNGQiYDskuFsWe3sPpBGkGrdyaFgGjpE/fCb
	 4VhkdxrW7gpC9Nt7ZT+NG8JSTDG34mmFe/FtTM7UZCdyopWyk3r7RpWqH/xf9os8AuwSK
	 dcW71CK8VsxhQA91mXABwXGi7ksaXU4+yiwvPRAZ93cWvydAl+T73/jn5oHN3FXojCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595942;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aRuG5fCvUqTqbi36gfyHl5mQAgaH7QGM832uDpYRyoU=;
	b=kLF8e1FK44/c8ncMnu4iMBliZFKXg5u7w0pOt25+71HxLXBv1FDs9c8zwyTxAlu7L7Yk
	 EGqDS3aC/NMbi8y+XpCXB9Cg6F1uFJ9cl2c6AT+FrL3WkLxA8SlLxq06NLQbdCOoZy0xp
	 s2p5Geqe51H0ZtEu3qIdHzp/EsTH8u4+SItzXW9w9bLAS80g9I+xG0OP/RQYNIY+6Xfzm
	 tq3x1HvtefFkpL7bhamgMwxmdKQs/8/F2hQRaSd1Uc3HKQlOOaFW2Qu6PP9JWsU6mMkOS
	 JPsvPyh34vRtIBSa5tncLaWOtFAwv3z0AwL5UQXBSCtabPgY7P/HLLTH4EsGI6Ip28g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TARMkjoR;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595942;
	bh=aRuG5fCvUqTqbi36gfyHl5mQAgaH7QGM832uDpYRyoU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n3kDj4Pzcz5G8m7y4HkCy/IHv1s/gD52cOcLeqJFcKL9IpRCxLJv+Spn/y4Ex5V2W
	 ur0tlolNW6EIexn0Jt/maxkStcwrHeC3DVedU5feRf+e1f7pnauS3BGBUcPl0xYJjy
	 EyJWVWcCveQLjBwI7DIctALXgfiuc58rkFuDqxSDsJhCLef0hyNiICNFE867GVtq0L
	 9d9els7iGBkaPb+Z3hoD/71UJOfGRoqDYAUgM0bBhntFfP6fBE9riomismJs8uUFKc
	 F2vTiJ+32slekEfB8Rjzejglc5ahBkKe5i9nSnltkxv3NJ54HydgV8+mQ98YX5xshy
	 Ipz5x3ywYKb0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0C448112D;
	Sat,  5 Sep 2026 08:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77652970
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5493781128
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCDxe2LVrO3u for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F3C6B8112D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595939;
 b=QeEYLft0mWy6TMkGzl6wmh4CS+lpaCSOThtnrL1xWpLnB6+rjEv7agoUC7c4c2BARdHX
 8BLHZ6O8X/4DU1X9ZtzIgXtnEyaXKlS2L2XZRHYrpdJfmDLVNU0P3I60hZSzZcYEOevGO
 6d+WXd6lsDelr37ZiDXmw4ASwSHMg9sBOn5XZwL+yRccX0SIngCHE5CkTcBeLBeTOpXT0
 MUoAQXwTtqaEvKo7iVqcACmPWuqfT8tuuWiE823540drLEnyiRGHsqzDSVJyhP9i7kujO
 Ub6ypW6CuIfM4fPS6PoAOy2GHsF7paSGo2Dr0ZaUSpLYp6LN/pLZTjoSGDu7boi30tA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595939;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=VkZgTIY5W/xtrSl2i0b64ZW3DHE5QepK7J1bsiChNTs=;
 b=o0t8C6CylkbrvS9NM4u+h2Fmu7fWK0PL/F99wPAQiViqPh+4qYDx2AvK9Hm31XpCmtE3
 FVXRuNpmmGKTihFDCIE/6kcQogtGH2KLEo66edAKAhN3cnFGbtvQbpUXNW9p+ptJ9dn0C
 OTDSI4oxzHkC4gWNRBe41f0VvCGPkpMPEFapKJVSZbIw53fbtksCbHYqQmczrnAL7jnK8
 lC/pU8We/fZ2bQH5/+R7cpK80ab0/vtq5RYYC5GisG3ONj6x43ideXKC1TDhpyRFcYTqj
 JBuTJQvHKfavMbACKs2SG4eA++nQ5AN+gSVKGoHixxryPl3GBzJG3uf0iUDSil4UMEA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TARMkjoR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TARMkjoR
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3C6B8112D
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:18 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so24119615e9.3
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595936; x=1789200736; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VkZgTIY5W/xtrSl2i0b64ZW3DHE5QepK7J1bsiChNTs=;
 b=TARMkjoRU4NYjkEoS/HeJF+wLhdaw2fa86rpPMlawobACGq6hd8uoHgvN8ZUQppeRm
 cs+bCI75ClUFoD7C6xwsblRrcRMki5OSNgwofcQZacSy3V1g9MJHUVWtYAboXEWWp02x
 9BnMHt75zumz0AW4Vc0Shneb4nivCyHVea9VaHzmPsY3FwDSd+s08zEu3I/CKiYdHdvG
 mPZ3RD/Z26gjKdCYViGCOPYWqdTETmp8S2dSF16yMCNLdffNYcVKgI9MRM9AGwWImtcJ
 wcI0bid69hx4qDHL72X+pERvTA6vdNiELBvq3tQQlbTyU0wVFPAyeeP932caxjRxU7xs
 XYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595936; x=1789200736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VkZgTIY5W/xtrSl2i0b64ZW3DHE5QepK7J1bsiChNTs=;
 b=R5AdTIZuLakomipsbQSB94hToPdJugT6sgbHRM03TyaUK8xx3r1r1YfPJpf+ZYqDLc
 wk0rM1Ov1v0CGqmii9zjyQGJLbmjttEt/pi6iz69ffr+0VSFhUTvYMz3skfEWHpRYG6y
 otFynpEZHzj142p0Yk1mVD23HjIxwp58R/yi56lYOtcNjvO+82l+zgQMVRV99FdeRXPd
 q1sWBE0+2CXSryCdK5miH7QQzr0ePcwyK78mMR3X5AQLzXa9XJ62IZ7lO7S7qPSgEAgW
 ibUeM0pgZhCC5od3lMIgPGkLtmVnUR3IcZK18/dGCyZyofEhdxZ4QZoiZC//WAXnd05P
 5/1g==
X-Gm-Message-State: AFuF++lYuexIZ3KlqskBNnjrfFNlrqMXQUjLYMHJRTZnog8o0ysRl/xY
 Li/XHAGOjcos6iQ6hpR3RAxvg4FI2hhIsesHMSj6xnLXiVPM91BdIcLYvHAgoQ==
X-Gm-Gg: AYBFou3RiXf9E1GSc44bBjLpJEzLHkpNDNlNFX+U+cd5KdBie4PdbCr3l7YBp4ltbA3
 /OPHNYmkJlvXlgSJ3+/OVH0Uxu5H4VOJMT2fZEV1ccpNwVAvYOIDzIRoknNwwSuyO9Dr0Vf19VW
 iv42/XueLXJadtLoMRSnOgksBbtQSG2czTZV/93uAWS9hlVnPCOe6Fid+WDdqX+RMnzsgqEJYGX
 NZP6TzSwr+nDTihBEY8uEnXq957bUPsQzMwl9YVvP1f46Bdd6gbc+qxJYkly0TbReh3awcmV6GN
 c3ekpM9rGot8LkwIJLu2c5hxtYgHGAQsfVCHBrwZcPCdRFoAOHnjbvODnIABr36OWNkyZQkzjf5
 0MwNEd+8InZh/VCMsY8aBBsgCYBOC0+3BygX9nwQsO/hKNKqHBcic5ihOOby96w/jTXkCGc0BwV
 /oJ6h4vGFlyqApNp4cc5yd+OUbiPcDJ3TcS/Nbr5M2UIRhc0HXhBw57jOsz2gXBOTb8BiTi1Ytq
 9pGYfPnE/7ZhIHP03Y=
X-Received: by 2002:a05:600d:113:b0:49c:d618:e341 with SMTP id
 5b1f17b1804b1-49cf827b19cmr63157955e9.14.1788595935907; 
 Sat, 05 Sep 2026 01:12:15 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce591f846sm117476715e9.1.2026.09.05.01.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:14 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:09 +0200
Message-ID: <20260904185910.587850-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lua: bump to version 5.4.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua/5.4.8/lua.hash                                  | 5 -----
 package/lua/{5.4.8 => 5.4.9}/0001-root-path.patch           | 0
 package/lua/{5.4.8 => 5.4.9}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.8 => 5.4.9}/0003-linenoise.patch           | 2 +-
 package/lua/5.4.9/lua.hash                                  | 5 +++++
 package/lua/Config.in                                       | 2 +-
 package/lua/lua.mk                                          | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 package/lua/5.4.8/lua.hash
 rename package/lua/{5.4.8 => 5.4.9}/0001-root-path.patch (100%)
 rename package/lua/{5.4.8 => 5.4.9}/0002-shared-libs-for-lua.patch (100%)
 rename package/lua/{5.4.8 => 5.4.9}/0003-linenoise.patch (97%)
 create mode 100644 package/lua/5.4.9/lua.hash

diff --git a/package/lua/5.4.8/lua.hash b/package/lua/5.4.8/lua.hash
deleted file mode 100644
index 849451152..000000000
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
index a82c8801a..57019f4c1 100644
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
index 000000000..5b8508f1c
--- /dev/null
+++ b/package/lua/5.4.9/lua.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://www.lua.org/ftp/
+sha256  2335b6c582a52654f94612bf10d2f4672805d05329aa6568b1d8cd9e5c6fb8e6  lua-5.4.9.tar.gz
+
+# Locally computed
+sha256  760d00c8b494ec2f170bcdd969e36b038027b0288232c60e15ffa6b0d784e9c7  doc/readme.html
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 888c34b21..7417670d4 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LUA
 	  Lua is a powerful, fast, light-weight, embeddable scripting
 	  language.
 
-	  http://www.lua.org/
+	  https://www.lua.org/
 
 if BR2_PACKAGE_LUA
 
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 269eafe4b..6dbdc9500 100644
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
