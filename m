Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B500CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 13:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB5174069D;
	Mon,  5 Oct 2026 13:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3UcfS_QZls9; Mon,  5 Oct 2026 13:45:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7E69C40685
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791207919;
	b=mZPWCCYQ66VcToD7VelYg83edQkLiQ5mTMbvwtZJ2fa3tqnu+GaSBqyF40xjqKe+a2L3
	 ozneP13w/mZ/fylwxtvBPUDkBDZ8Hiq7xleorFy9omur1utHZ1pYyibdNOlWygWiADrRR
	 eMeBIv4xFzoQr7Ls3q5HKybxw8yGY/L2Pkqjc08mWsUed0JpDNZZJmHewXYaVSA6VihPV
	 BYUJ3FAfuU8Jo81lavYgKel+B1Vyg4+QJ3SwyCdQ8hvpaCWVcuak/qzbiMV88ie8VK6GD
	 68ovVewd2oe8n/1reKXWWmb8GDBhUBhBkJhp2FcOhD65MMmQZ9wumiL6wqiWlLHEwqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791207919;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=w1DM80f+LXI5KCcClDhttTVsyDMgqdQNNCfRQU/dilg=;
	b=DIUe7krweAH07VMP1SJZhp+Kx45gmM+LRb8xgLfCIEjEtVEc8lvEYzpuPTcgOeBd8EDo
	 7RJRv3ICS8exeUunAp8TWNxkKr+vUk2hG3KO4pYwdTf47HmftwToevrwePk7fRLpexZq2
	 ae/lLQ2PuOeyPK91ny5x8VTyDMmem42IwigCE8gOMylNf4fSxMcmFfu0/I2jzPbqy1m5J
	 6CHs97to8p71OST9vsOEdnmTK9yyYsnt245O/kSZm2u86aj9tA6bAatanwUZzKip/c++l
	 0caFaEpnyfaUO4nXYRmiUt+yuRWxjlXEc/VUBRvGh3kYvdb6fPvPhRk4VVGBFT495YA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791207919;
	bh=w1DM80f+LXI5KCcClDhttTVsyDMgqdQNNCfRQU/dilg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CKjzLI7YiNCRLT3yBr8A/vhdqsv83KHCBicFT0J13BTNiLwTJ3yfzZ/HJOhGOXkWb
	 ung/rak2pyHvEwQg55KnFHJT8qvSBFis8pwxQhjp/iqO7HYKqCOL9bPVMGE5wiRzXy
	 mrt0UMDcjQXPfwjm7ggD4dPR3I5R9gpYIPCDj4m7v10V+B4DXLXL9j5YpDj3RVCr/n
	 KnyxGNHbhYllUZvcG72YrtR0V93dk2mmItjEd1En82QP2SjtEFlB5Bl2WpekjdLQWQ
	 KIzdO2Mls7IFZiOSJDqkkLacmoGguSm4Qb7EuwSzMLLA5YzTDdO/rVNja7EddQuOZk
	 CdXFxajd9DYlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E69C40685;
	Mon,  5 Oct 2026 13:45:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C34812E0
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 13:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B49A380BCF
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 13:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qD4VxwEn2zzk for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 13:41:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 633BB80BE8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791207668;
 b=o8sH05ArL+q8EG7FSOtXcFpgz1TUytReY+u3TZPWWVE3IZc8DMcDo08hkQzVWZrW4roy
 2Hkz3cd5hSWP+CEgkAy+zj+zgKllcXAOnTiepEVkUHnzRhAED+rZ9FGn5f/XHrWy7mR3T
 67CwfiwJbvV9RkyDIr4quVBah8if8uM8q4YzqpKd4UK//Vu6gdFuTXNLARzzyddYXQDxB
 bPG/ReyWaLocTbnDk0DAlfpkRHB0P4+HitjX/W32sgBRtLhsTu92NK7VfJyf+sH4i9Tao
 vaSUL+Y0qmxlJeLsGRMJbWDSk5/TzCXanEH8+yspFY7CDzTIIA5gnFajmAA5oT0e/hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791207668;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=q9YZ3gu6KVMts6X514VLBGVByMWxpk8KXTlv+uJmaE8=;
 b=osa4H7TR9GSZ95n7qQS+U7YORnIaD1aCfx1T2xl+8b1+4ubcAUrwNX0ifGP1ArwjLlN9
 Kf/dUxGOFY9v0r2gfuRp1n88ulrmR3ovCvqA9MhKFt0XQNRhogsE5/4u8R2wbeuWd+Ts8
 YcBaKm1U5Yy9Kj2VXXeEgdGQsJVXtBKdmalIa89IAKXPQ+A+LDz6rlwtfFn2flcB/KBiX
 +khL1f9YhnxeQlT+ZYdS11JciFae6F12/S6uznxOoL0/YcfRvbhKAvWclTcvqNaWyyVrw
 hmE2QybGJXxQ7IthnYf+dWub5kzQkYcHvNl66z3l2N+ijojEijXaoDl1jINt+LFAOgg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MLwuCYPt; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MLwuCYPt
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 633BB80BE8
 for <buildroot@busybox.net>; Mon,  5 Oct 2026 13:41:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48b0ef9c76eso1631024f8f.0
 for <buildroot@busybox.net>; Mon, 05 Oct 2026 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791207666; x=1791812466; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=q9YZ3gu6KVMts6X514VLBGVByMWxpk8KXTlv+uJmaE8=;
 b=MLwuCYPtAGQ5DN/t0jQADLn6qpSi8OEUGv/r9g5Sz4SplBv1gJYmiL4EQ39RMNyWyg
 WbKirXl+AVbMmH0oZDiHRYEzVuPgADmeHrxJD2EQBIyULlrEqsMwY56jb1eLjWx78/Y+
 5sj7gnYreOxE5iUVMAzGYeYljYknmYyE0xC8lfInClM3WT5YZRRt3B9qOlwspj7GpbZq
 Wrjt6MR7BD4ioaEe6tSuBk3iU0UzVCpsACoCFJGn4nzg3SHmgKkc9SGlJmXUtQWih6d6
 LBOY1Mqu0DH8pVShrOdBbD+y7Tn6Cxts6lLBmMOiklKJuhS4Ck01UyBvYqsPSmMCPkOL
 V19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791207666; x=1791812466;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=q9YZ3gu6KVMts6X514VLBGVByMWxpk8KXTlv+uJmaE8=;
 b=FhGBYgavSAToea8gLSiqgLqzMkKouVGg0PZhK08ZBGmMqe6QZt4joyf982HR47Nw7K
 9RGHZI4el37oAmXay9diD/FUTEdzL4VXHbMEosrqcZP7qLhYQ7Ryai8NVKufMzQ6HN7q
 GJ2g3XHo8XdByKuD14QMRkAzyoPFsufb5yjvLyMWbeb5RHicH1hHd+kAq5WtK630CC2G
 /ZNmRfCtZNfWaOk27juHNMNHRkjvI3zvO99obz71a1QGMcRfHk7n8sbwWL4YpWdjXcnU
 0AmAHKPyMZiJ+xZ+cWxp8x0/itYvVFJvBHdxo90SN34lXRzb2L6Yq0kwLBhpqVgtt/lQ
 NPgQ==
X-Gm-Message-State: AFq9FYKpkb2aD7a/st4slYLoaBW6LyoYz91nKMq6u7K9c5k2c+aWsR1h
 60ZULLT6vpx0lcYI1gOcQkspoAWfpoO9QcoOJvnkrUdHFmbCOMnNFqd8rFKPlg==
X-Gm-Gg: AYBFou0NVLMx+2gInZ/j6pZFEY9DfszHt/rPdgaKfYAIufwf5DP0/v2gv0LQ2fbbU4S
 jF6wi80nQK22HZzR8T/dOF/WLaIaaUfp99XcwQK5Wb1bd46xNPhvObzfszjf5Zmlt9OdWvjrFTo
 /ctqPAblTdrc68blg7AFGqBwDjRXe1wJiUdwnlMQmQZ9UKZe1nRm9v0DZ+WHdaRao/XZHG4cqUf
 lIZsjKvgQPbv4bifk/LwE0GtcHCswKqOO3fiWho3H5Y0nRwW1+CNteG0d8PW1RZdy0V/GuAc/r7
 ZWLZqxeuVThIlmulPc699P4U/2Wyg7x5k+/JTGy+M3edqjrY6iJcANJFwGBKF+Gc/wd8zGf1xJ2
 fnPN1vYBT52kUTgK5foSVMs6rxA+Pb466OZnbMAWykV7Z8cnriP6zQTAN+K0TBn/L0ohI3VQ9gT
 Dn/zfLkGtIRknEj4mVzri0pRHfhrIa9fBRXTnqnu4ZkW46C2K1ou1r5DUpFY3/MY/n8llH3P//N
 wTJ6HQpjtTMJEk4
X-Received: by 2002:a05:6000:144d:b0:486:f42f:6860 with SMTP id
 ffacd0b85a97d-48c4801c807mr14290983f8f.56.1791207665888; 
 Mon, 05 Oct 2026 06:41:05 -0700 (PDT)
Received: from vm-2404.. ([37.66.186.51]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6229ee60sm3554044f8f.34.2026.10.05.06.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 06:41:05 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  5 Oct 2026 15:40:56 +0200
Message-ID: <20261005134056.94384-2-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005134056.94384-1-francois.perrad.86@gmail.com>
References: <20261005134056.94384-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/prosody: bump to version 0.12.6
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

Lua 5.4 is recommended for this branch,
Lua 5.1 (& LuaJIT) is deprecated.
see https://prosody.im/doc/release/0.12.0#lua-version-support

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/prosody/0001-enable-syslog.patch      |  4 +-
 package/prosody/0002-add-pidfile.patch        |  6 +--
 package/prosody/Config.in                     |  8 +--
 package/prosody/S50prosody                    |  3 +-
 package/prosody/prosody.hash                  | 11 ++--
 package/prosody/prosody.mk                    | 12 ++---
 support/testing/tests/package/test_prosody.py | 51 ++++++++-----------
 .../rootfs-overlay/etc/resolv.conf            |  0
 8 files changed, 41 insertions(+), 54 deletions(-)
 create mode 100644 support/testing/tests/package/test_prosody/rootfs-overlay/etc/resolv.conf

diff --git a/package/prosody/0001-enable-syslog.patch b/package/prosody/0001-enable-syslog.patch
index 5f09fa903..2ef969381 100644
--- a/package/prosody/0001-enable-syslog.patch
+++ b/package/prosody/0001-enable-syslog.patch
@@ -11,13 +11,13 @@ diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
 index a0fc6c9e..af3cc0e4 100644
 --- a/prosody.cfg.lua.dist
 +++ b/prosody.cfg.lua.dist
-@@ -166,7 +166,7 @@ archive_expires_after = "1w" -- Remove archived messages after 1 week
+@@ -185,7 +185,7 @@ archive_expires_after = "1w" -- Remove archived messages after 1 week
  log = {
  	info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
  	error = "prosody.err";
 -	-- "*syslog"; -- Uncomment this for logging to syslog
 +	"*syslog"; -- Uncomment this for logging to syslog
- 	-- "*console"; -- Log to the console, useful for debugging with daemonize=false
+ 	-- "*console"; -- Log to the console, useful for debugging when running in the foreground
  }
  
 -- 
diff --git a/package/prosody/0002-add-pidfile.patch b/package/prosody/0002-add-pidfile.patch
index 0653ed723..691985ad5 100644
--- a/package/prosody/0002-add-pidfile.patch
+++ b/package/prosody/0002-add-pidfile.patch
@@ -11,9 +11,9 @@ diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
 index af3cc0e4..675db12f 100644
 --- a/prosody.cfg.lua.dist
 +++ b/prosody.cfg.lua.dist
-@@ -187,6 +187,9 @@ log = {
- -- HTTPS currently only supports a single certificate, specify it here:
- --https_certificate = "certs/localhost.crt"
+@@ -205,6 +205,9 @@ log = {
+ -- Location of directory to find certificates in (relative to main config file):
+ certificates = "certs"
  
 +-- This must match the PIDFILE used in S50prosody
 +pidfile = "/var/run/prosody/prosody.pid"
diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index d93350702..63f459b26 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -2,15 +2,15 @@ config BR2_PACKAGE_PROSODY
 	bool "prosody"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	depends on !BR2_PACKAGE_LUA_5_4
+	depends on BR2_PACKAGE_LUA_5_4
 	depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
-	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1 # runtime
 	select BR2_PACKAGE_LUAEXPAT # runtime
 	select BR2_PACKAGE_LUASEC # runtime
 	select BR2_PACKAGE_LUASOCKET # runtime
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBIDN
 	select BR2_PACKAGE_LUAFILESYSTEM # runtime
+	select BR2_PACKAGE_LUAUNBOUND # runtime
 	help
 	  Prosody is a modern XMPP communication server. It aims to be
 	  easy to set up and configure, and efficient with system
@@ -22,5 +22,5 @@ comment "prosody needs the lua interpreter, dynamic library"
 	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 
-comment "prosody needs a Lua <= 5.3"
-	depends on BR2_PACKAGE_LUA_5_4
+comment "prosody needs a Lua 5.4"
+	depends on !BR2_PACKAGE_LUA_5_4
diff --git a/package/prosody/S50prosody b/package/prosody/S50prosody
index 6fd33671f..c0beb06c2 100644
--- a/package/prosody/S50prosody
+++ b/package/prosody/S50prosody
@@ -13,7 +13,8 @@ case "$1" in
     printf "Starting $NAME: "
     mkdir -p $PIDDIR
     chown $NAME:$NAME $PIDDIR
-    start-stop-daemon -S -q -o -x /usr/bin/prosody -c $NAME
+    chown $NAME:$NAME /var/lib/$NAME
+    start-stop-daemon -S -b -q -o -x /usr/bin/prosody -c $NAME
     [ $? = 0 ] && echo "OK" || echo "FAIL"
     ;;
   stop)
diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 1fd1abafe..b7551eddc 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,7 @@
-# Locally computed:
-md5  93665d86c47e99c9c525610ac53400fb  prosody-0.11.14.tar.gz
-sha1  abbd0ad42e2b30051f4d3f198c54a52b4e9f39d0  prosody-0.11.14.tar.gz
-sha256  ec0c7447ec07ed336b6912d06a2f533439cb16d60d8d3bffa8ce46269ee52c87  prosody-0.11.14.tar.gz
-sha512  128e12427ae0b5080fd3cc2380974c04570b16f0f79de7b39ef85cec6e8f579bee2d1150ce70ca731222c487dba646cbcd48bdb4a102a14395644eb5f19f1c88  prosody-0.11.14.tar.gz
+# Locally calculated after checking pgp signature
+# https://prosody.im/downloads/source/prosody-0.12.6.tar.gz.asc
+# using key 32A9EDDE3609931EB98CEAC315907E8E7BDD6BFE
+sha256  e06db3cfa8811d0b9fa7713a3b430189f62a1f90e6a4940771b1e16ce64e8e44  prosody-0.12.6.tar.gz
 
 # Hash for license file:
-sha256  bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
+sha256  abf5e6a32ab542ccba5861eaaf7aed9a86b8306abfe2c329646d54e43176dc0c  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index b5d89ebba..a01e0f997 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.14
+PROSODY_VERSION = 0.12.6
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
 PROSODY_CPE_ID_VENDOR = prosody
-PROSODY_DEPENDENCIES = host-luainterpreter luainterpreter libidn openssl
+PROSODY_DEPENDENCIES = host-lua lua libidn openssl
 
 PROSODY_CFLAGS = $(TARGET_CFLAGS) -fPIC -std=c99 \
 	$(if BR2_TOOLCHAIN_USES_MUSL,-DWITHOUT_MALLINFO)
@@ -18,6 +18,7 @@ PROSODY_CONF_OPTS = \
 	--with-lua-bin=$(HOST_DIR)/bin \
 	--with-lua=$(STAGING_DIR)/usr \
 	--lua-version=$(LUAINTERPRETER_ABIVER) \
+	--idn-library=idn \
 	--c-compiler=$(TARGET_CC) \
 	--cflags="$(PROSODY_CFLAGS)" \
 	--linker=$(TARGET_CC) \
@@ -25,10 +26,6 @@ PROSODY_CONF_OPTS = \
 	--sysconfdir=/etc/prosody \
 	--prefix=/usr
 
-ifeq ($(BR2_PACKAGE_LUAJIT),y)
-PROSODY_CONF_OPTS += --runwith=luajit
-endif
-
 define PROSODY_CONFIGURE_CMDS
 	cd $(@D) && \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -54,7 +51,8 @@ endef
 
 # make install installs a Makefile and meta data to generate certs
 define PROSODY_REMOVE_CERT_GENERATOR
-	rm -f $(TARGET_DIR)/etc/prosody/certs/Makefile
+	rm -f $(TARGET_DIR)/etc/prosody/certs/GNUmakefile
+	rm -f $(TARGET_DIR)/etc/prosody/certs/makefile
 	rm -f $(TARGET_DIR)/etc/prosody/certs/*.cnf
 endef
 
diff --git a/support/testing/tests/package/test_prosody.py b/support/testing/tests/package/test_prosody.py
index 8ef8ff95f..65ada66d2 100644
--- a/support/testing/tests/package/test_prosody.py
+++ b/support/testing/tests/package/test_prosody.py
@@ -1,13 +1,24 @@
+import infra.basetest
 from tests.package.test_lua import TestLuaBase
 
 
 class TestProsody(TestLuaBase):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_prosody/rootfs-overlay")
+    config = TestLuaBase.config + \
+        f"""
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_5_4=y
+        BR2_PACKAGE_PROSODY=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        """
+
     def lua_dependencies_test(self):
-        self.module_test('bit')     # luabitop
-        self.module_test('lfs')     # luafilesystem
-        self.module_test('lxp')     # luaexpat
-        self.module_test('socket')  # luasocket
-        self.module_test('ssl')     # luasec
+        self.module_test('lfs')         # luafilesystem
+        self.module_test('lunbound')    # luaunbound
+        self.module_test('lxp')         # luaexpat
+        self.module_test('socket')      # luasocket
+        self.module_test('ssl')         # luasec
 
     def prosody_test(self):
         # prosody was launched as service
@@ -15,34 +26,12 @@ class TestProsody(TestLuaBase):
         output, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
         self.assertIn("Prosody is running", output[0])
-
-
-class TestProsodyLua51(TestProsody):
-    config = TestLuaBase.config + \
-        """
-        BR2_PACKAGE_LUA=y
-        BR2_PACKAGE_LUA_5_1=y
-        BR2_PACKAGE_PROSODY=y
-        """
-
-    def test_run(self):
-        self.login()
-        self.version_test('Lua 5.1')
-        self.g_version_test('Lua 5.1')
-        self.lua_dependencies_test()
-        self.prosody_test()
-
-
-class TestProsodyLuajit(TestProsody):
-    config = TestLuaBase.config + \
-        """
-        BR2_PACKAGE_LUAJIT=y
-        BR2_PACKAGE_PROSODY=y
-        """
+        cmd = "prosodyctl about"
+        self.assertRunOk(cmd)
 
     def test_run(self):
         self.login()
-        self.version_test('LuaJIT 2')
-        self.g_version_test('Lua 5.1')
+        self.version_test('Lua 5.4')
+        self.g_version_test('Lua 5.4')
         self.lua_dependencies_test()
         self.prosody_test()
diff --git a/support/testing/tests/package/test_prosody/rootfs-overlay/etc/resolv.conf b/support/testing/tests/package/test_prosody/rootfs-overlay/etc/resolv.conf
new file mode 100644
index 000000000..e69de29bb
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
