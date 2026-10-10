Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E81CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033A281188;
	Sat, 10 Oct 2026 15:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQlU7w5AUUb3; Sat, 10 Oct 2026 15:51:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C69C5811A1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791647467;
	b=oXcl5e1pmoxM76eSUATwxtAYz24IeRkZAY1Oj4gVi7Sv196WWCrERa8yYUDCdth9TK3Q
	 dyH5ojQ4rtunEzE29YhJq74IIGdQ71zResqul/CwycVHEcL5hXvBa7ux4A63chm2wKqJy
	 GNnizeOExAmgFK8yoYxAWGDYo0yeslOw8QnLw7Y7A6qaNt14li4SZ3C/X1yyvQsl20onI
	 DSMyYc2MCZdSO+KJo8Rr7PLP4DAAE7nhCNQm/oQRPksp45SdJ68Qe9wSXfJFv1/rVW3Rx
	 9l/rqVv+QwCkWnCrv8gAxkBRnY6XnfPABOkDrqtuw2Ebm8OYxLgXm7heAhYo+9r3IKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791647467;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EyiIeH2gJzspC9DM2vgx1pVl6xSFjratzW3LgTW6lmY=;
	b=i0zVQ87IvNIYp2fkVbI5+1PDSv/h+23dLWEGo9NoCAvWRQxR3RQzmR0tT5/fL+Dd6zk/
	 mCuSsCdDsQBTNyJm20D1a54f73mz0G1h9pbl4LNxg2/2CyhytMDiHxbdQ27nGBXAyXy8x
	 EWdJ2/Kl2oFY7ZhxjC4CLCIbVJKzltxd465XCDRkhzu3A15H5sLcUyKffKlsPOtSfZ0l/
	 MOmG7y+wfM/oExKNaQmnEUMRFMwBfmugtI6hR554ZBfUg9LoZe2B9Hj9Vu9PLK2744l/a
	 waaRJBEPtZwpCxzZaDSEX6iPE1J+8FQ2WVyKqaYYeokyIl/gptjasEC3JDsgi3uFPOg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZlX9PLwP;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791647467;
	bh=EyiIeH2gJzspC9DM2vgx1pVl6xSFjratzW3LgTW6lmY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pp9e89STqQDiwzWu5X+v/+dnAlfCM1DlW5+9OuMscKBVs0NQIIdpHVX6H78dk4C8O
	 XIx7EfiZNqQl1SiCp5xb/wRMBU1rD8vYMdaay8XffXWn6DlHTo6zAUcMolOliZg9Dm
	 DXfkrYc8/5NSIuB8Ti9M5Rw9YlEiiSlOjZEWV9kWknK+SYCWkWU4EoEeaDO9nNSmTn
	 c4hCxhor1ZyTedK/Xaen2hgDCJNCp3D1ZtAi3wwQ8NGIZ6Lkwb+Y24epUckZACZXrS
	 QvY5FboXaNIlI7vmW5Z5mVTNg/BIUZp95zkt4DvujVH8d4hGiOaNY9nCihF9ZiHLlk
	 b0gHLJkF4P3vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C69C5811A1;
	Sat, 10 Oct 2026 15:51:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F7F0317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E96AC81188
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePN86E-HTBKo for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:51:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 183FA811A1
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791647465;
 b=i4TZGhwxhGVLOsBCwtug/bYH70ed46UaRQK22LoGbZujHQdRYSHDFC+5smm2tiOSdMEe
 Y+cTKeOCqNQto3acyCh6KjD0Ww7MMCFB1OuZGVoeVi9TAlk458NMBdpFHY1QoBqD5X0PZ
 fzi3vXqJ1rkGqndbWZg2+bKaGtXQcDrHBqsOZbwXlT37AAikWSs6L7BfRbK+IaUubru3U
 F6vGZXXHF6BbrOt7hxB5+BoUVsCfXLwk3ku33ozqSmYZGqDYxfMC+/E6RpxASQdCd0Zzh
 NJwvaJEkPOoWI0Gk2d8q8ImarPVoe05mhk2Fmv+JnZt57YGeAyvKuYQp49+hyX4LM7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791647465;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=33+tHVXyWfRpWEJ16O1v7+IrR+QHE3ueT36eqAeEvME=;
 b=TpQw5t0MJ/eeKpJPFye7GRci6/rUrclyeZMrYz6LUd+yu0eeN9AilN/+7PRnjjwFV8go
 eEGjXuRTM9KzsKPndoNuIV+VyZXYJdz+qJr1oQpmRSqOFzl0sAh/oX3MTPoPUWI9LNmmW
 Js7E7xIGjKZHf8WxePdhQXkvhPWx3gRtUqQMKucQvCX9iRlaofb+CKX71qDtc3UCJHZf2
 z/bLKX6POb0WgZeI83KDJ5Bzs9Lj4Ny9fN6iewlWCB1d5AWs1yOcCOzaiHJTPMBhSuYHM
 mM+TKd19uJqiIIemUHMr+D934JckVDd5E0AUl3lQnYBvOiyqmdcBIUuX32rZI8tLHGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZlX9PLwP; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::434"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZlX9PLwP
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 183FA811A1
 for <buildroot@busybox.net>; Sat, 10 Oct 2026 15:51:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so355798f8f.3
 for <buildroot@busybox.net>; Sat, 10 Oct 2026 08:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791647463; x=1792252263; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=33+tHVXyWfRpWEJ16O1v7+IrR+QHE3ueT36eqAeEvME=;
 b=ZlX9PLwPiCOe0rnfONOkg4I271X4AUO/WiNTZpXmZcSklnh3sADXFRM32SuSL+DuI1
 x/pramUuObl15UeMkT4GDy5W7Ed1ibd/XFSX6MN2odasDeL1ubW3l1TI9efcRePE5sav
 FALLshJg119btn2l9aZ8kx1e+6wruILOoZ3PVGFKYWXVqgXHBNLiG2SAhi09gT75EQlZ
 H1WpbDNZzdiWVE4W9Gq54K0mEIcgEz+SJhkZLG+8H7VmOPuW9Le6bZflIBfno2FxCwGi
 5IvZhZpf/Fnri2lH0fQfdQmRHXhbOxERaW8KrWuV6sdZfACWamAfujAfHxSTa7eHz3uG
 sM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791647463; x=1792252263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=33+tHVXyWfRpWEJ16O1v7+IrR+QHE3ueT36eqAeEvME=;
 b=QIDHr3KLL7qQy+as1uuHz8NWpxONIG63SpwHz4fGQiNPkE/Ykg+ejxZuXGtKlEth7I
 csEAsrboT5/1XlkLRBC9b0vm0mUzqHuiw5DGjFMgcBSfsL6tq0BaQtADs+o+EhjWqMe3
 Bd6PtEgZ+ujcEhNFVAWlF+YmxnHHOaTdFL2Hne5ap0wYA3eZeEwbYctbg37HUJ2nQyre
 kzXiGchQmbfNAGkvIdu8R/whYZ0gxQJcR0oDosrn5t0mnkseoNyfo63oiIFQTXh9eiIv
 wPl965v/vf2/QIRSZgGViyUbs4VzUx0ciQTtbE9kVWjUqR1di4lOta0//nYSZ39Yis6V
 8lOw==
X-Gm-Message-State: AFq9FYJgVtTq0bTSb/JMJRBgoURemt1X8BfeIbDb9cHZll6Qz/iJ8WC2
 mgqqzStmCneVRPggVQ7Lxgg8vP2rgZT9tpbMLsECi+4QzL8585/H8tdrVlbR/w==
X-Gm-Gg: AYBFou1ZL5kf48nFxauX5BINDjb1XgmWhlgWBJ+1buQpxvbov0oD518zvd2yXxvqc95
 hfE9J5jqAhM9lR+JGKzjepNDTwh9xxaBaWGHDPYsas8Z4wYjNZN+DIlnFZlb/y2hFjQFDcyG4CD
 t2xzMXFLqrp4NnU4Q6HNN63mGxLFkQN5zU3tsj5wNe6yXt3g05XbqEKfeyjI2O25T4AUhodR0Xf
 073UM9AqNa6fFrr2CmLP636STyjklXGdWCWXVUtFy0k9Rovi6Gtw3GXXAClETfelzeGbwGS7ys/
 IbmKb5i/m55eZUatfT2Kz26yPH8wZ1QD6/XzJ3Vo4fNN3QSNGsGCwB1mgOrcDTzQVj1kSc4880j
 aM3rgmOVTd2JclhEbwi9HWYXwRwjvaeXXie6IzqbPKxdTLH/7ZMTDTBajvS1QBOQhnKLbB/WG1g
 Rmt6pUaqzi172A71adwgKTT+Yybsn73HtyQF8oGWcIc66RGTQyxkZRWlqXXs2nGdeYq4y7YJNUg
 IyJ8eKl/g1PiWM6JFjWBUSivbWgQf0JXDxCwp3L
X-Received: by 2002:a05:600c:628b:b0:4a0:251f:dabd with SMTP id
 5b1f17b1804b1-4a18e48edd5mr85679605e9.16.1791647462405; 
 Sat, 10 Oct 2026 08:51:02 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18eb4485dsm261472285e9.2.2026.10.10.08.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 08:51:02 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Sat, 10 Oct 2026 17:50:58 +0200
Message-ID: <20261010155058.2782-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/prosody: bump to version 0.12.6
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

an usable /etc/resolv.conf is required by luaunbound/unbound
    /usr/lib/prosody/net/unbound.lua:66: lunbound.new(): error configuring 'resolvconf': error reading file

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
