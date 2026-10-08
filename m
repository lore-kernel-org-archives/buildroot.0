Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DF2CA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10ABA405E9;
	Sat, 10 Oct 2026 09:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUGY8XMGrijM; Sat, 10 Oct 2026 09:22:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 38B0240850
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624153;
	b=fJgcgcpchZvPP1fcKN3lClzxVYsl3dz1KTnMi0e/LxzrDDmbSm0ZEdHOxjeIhrGM3TrC
	 zU1OCLDfKknZhw+YkCNJeqAs8nhhO24brf81APa2NSU8EQyYaYpLYsnpKzHkcGgm5Md3o
	 V9DXJRMKnoUAIx4wr/xhdIgDwCNexynAc+sU8awEE1KpUdZCuR6rq/dBkznoYx/gL4PgT
	 EX7/th/4cVzjdbRZabcUrcBCYkG5zIfRISURksMA4gytQqISDHlorDoMwnu3dTsOzoLRh
	 OpfKukDd5O7C+e9YEX71Xk/dRwOd4a6HbbfnyTK3iwmTx/YQp3sqkODK5HbCazW1R5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624153;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=XhwwGjWjifflhgtUnPDi9AbfvQYCwmyM6UfMM8BNJlM=;
	b=MZJC/jUYFAficbeb0husuIFgPlbE8CQDAThA813lBE+mAp4kYpxfLmDEHu6SpBiuH+hX
	 0z0czHExKCWEF9AQbDbp7FISgfs240vpW8lYR5ufeQXDykoPhvYlte4ZDprCq1KeiT44Z
	 ityK6HlKCqKsnQcJMoN9BIUjLNwl5pTreD/Vr7l39sDIuWhygOPHh84wfEb/ESkRBzb39
	 M8oPblmrjqj103Y+TRL299MHgGgRtUCMTqhH5BtXoZUjYvGLmCmfdP7rJIJXPdYLTl4Mz
	 iQJ9v8l6yydZzqTdhRmixy3DQ1sTHK8HJo5g1TEyq0DtbJTEXfSiaobuGejTnNTHVDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624153;
	bh=XhwwGjWjifflhgtUnPDi9AbfvQYCwmyM6UfMM8BNJlM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pxth3XlJoYXxtglv8ou+7Of6m9/cAgNWYmsTAi2JQ7qPjITuOB2cflsIZ4nWVKkY5
	 azJRRWhgoswsABlPQ0JR+j5+0geHB6jFmcU4pq2Wn5mS5u/J6K9SRaZXfpILN5G7FR
	 tC4HatshzfksQkUP1TLxQdUlw9WdoOamsriVjMWRb6shltnUFzMObxO4Q1y/W0xqAi
	 mUiARGUN4EuOyPz0quEEBE6czuPi3Y+7h8+ul8mC8Z9CQ0WyW9g9yg+k3H3r2PX3uC
	 TrUOlT5i01aVa1r9WY894hBFRj1KQoS4FRsOEabSCQ6oxWGRulIb+k0uW9gltoeUy1
	 MWWbutjt4D5gQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B0240850;
	Sat, 10 Oct 2026 09:22:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 172A0DDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0933B6066D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTKWdHdwIZnr for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2587F608C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624088;
 b=Yl30L5gkzLhyooFdm43FxVB13Cl0iAZmWv+M/F5pOHwUfRnivKAp/KKGgtiLKikWLYeW
 yB8ExR3/L3fgYg1lUFKXm0a8guVQ1+AFaOQsg43MBPKL2zT27YfPwit/m4jqqZIhNb68b
 hygVJ02svBi+RHtdkTAGPCSk3IPJOKZahwYQFggCExr00ffXaBSX20wuwiMmDZzFCuoBl
 +sIDfpL0NXhnIRvzvuWjhJsuJ+CbD9DhSm6jSNOH6/MuqV7dD/OQHWKZ0O+ZxXFV4vUbC
 vptxAx36e/5PHy3tp2CX1WWc3p9C5m0q/ORwfNb+zR1HvqYZSHqPD1zznwei/Zbj/0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624088;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lulP4PwBFKqmUtMYBaFguPicMgkTDZYiiqZorh33Zx0=;
 b=sqV364vDB0v/hZ80NSgvxms4HmvvLcb5cNKxeR+rs1Ogmgy8crZhOyA8EcVjtgqMVswi
 cv+qlw5lzGNPHOhh1Ih8juGFMiVHpfnuYL8mK95OWsXBu6x7ZhgruvnZx79EsYXMBR+AP
 CcGfWJOJ/IMA0kf5YF70/0hNnbpdxLwpc6YuB76XTsO1Q+A0XC8rbzIq7JGc4wmrgy50Z
 wdovtOuXXFKPT1kqqZAYcz6FK99yeL9cgsDqvdXyMEtg6MreJRkaed3n6C9UtH4PXTWEq
 +kdWxtfTn2rQhHBQ1iOSAFOWvQW9QkRTM9TnahrY9MctIDMt+4MhajfoN/WQfoBQh4w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2587F608C4
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F7C08F065; Sat, 10 Oct 2026 09:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:33:22 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 9f02742040e00fb2ce785c5712207767c47b8067
X-Git-Newrev: b42d59e25f59ac01a21beb5eed59d26d3f7288ef
X-Patchwork-Hint: ignore
Message-Id: <20261010092010.0F7C08F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/dhcpcd: fix
 check-package warnings in S41dhcpcd
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
Content-Type: multipart/mixed; boundary="===============2264537256663511556=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2264537256663511556==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b42d59e25f59ac01a21beb5eed59d26d3f7288ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Update S41dhcpcd:

- use plain "dhcpcd" for DAEMON (instead of "/sbin/dhcpcd"), adjust
  PIDFILE accordingly and while at it use quotation marks for variable
  definitions
- fix indent (tabs vs. spaces)

Fixes:

  $ ./utils/check-package package/dhcpcd/*
  package/dhcpcd/S41dhcpcd:6: Do not include path in DAEMON (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:8: Incorrect PIDFILE value  (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:13: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:17: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:21: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:25: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)
  package/dhcpcd/S41dhcpcd:30: should be indented with tabs (https://nightly.buildroot.org/#adding-packages-start-script)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 42c3ecb29356fef0df652f8e4b231d225a3e5162)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore      |  1 -
 package/dhcpcd/S41dhcpcd | 46 +++++++++++++++++++++++-----------------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b6bbda1728..298cd65838 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -274,7 +274,6 @@ package/dcron/S90dcron lib_sysv.Variables
 package/dhcp/S80dhcp-relay Shellcheck lib_sysv.Variables
 package/dhcp/S80dhcp-server Shellcheck lib_sysv.Variables
 package/dhcp/dhclient-script Shellcheck lib_shellscript.TrailingSpace
-package/dhcpcd/S41dhcpcd lib_sysv.Indent lib_sysv.Variables
 package/dmalloc/0001-configure-fix-build-on-mips.patch lib_patch.Upstream
 package/dmalloc/0003-configure-allow-overriding-some-tests.patch lib_patch.Upstream
 package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch lib_patch.Upstream
diff --git a/package/dhcpcd/S41dhcpcd b/package/dhcpcd/S41dhcpcd
index 55794f4075..e52e935da2 100644
--- a/package/dhcpcd/S41dhcpcd
+++ b/package/dhcpcd/S41dhcpcd
@@ -3,31 +3,31 @@
 # Start/stop dhcpcd
 #
 
-DAEMON=/sbin/dhcpcd
-CONFIG=/etc/dhcpcd.conf
-PIDFILE=/var/run/dhcpcd/pid
+DAEMON="dhcpcd"
+CONFIG="/etc/dhcpcd.conf"
+PIDFILE="/var/run/$DAEMON/pid"
 
 [ -f $CONFIG ] || exit 0
 
 case "$1" in
-  start)
-	echo "Starting dhcpcd..."
-	start-stop-daemon -S -x "$DAEMON" -p "$PIDFILE" -- -f "$CONFIG"
-	;;
-  stop)
-	echo "Stopping dhcpcd..."
-	start-stop-daemon -K -x "$DAEMON" -p "$PIDFILE" -o
-	;;
-  reload|force-reload)
-	echo "Reloading dhcpcd configuration..."
-	"$DAEMON" -s reload
-	;;
-  restart)
-	"$0" stop
-	sleep 1 # Prevent race condition: ensure dhcpcd stops before start.
-	"$0" start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload|force-reload}"
-	exit 1
+	start)
+		echo "Starting dhcpcd..."
+		start-stop-daemon -S -x "/sbin/$DAEMON" -p "$PIDFILE" -- -f "$CONFIG"
+		;;
+	stop)
+		echo "Stopping dhcpcd..."
+		start-stop-daemon -K -x "/sbin/$DAEMON" -p "$PIDFILE" -o
+		;;
+	reload|force-reload)
+		echo "Reloading dhcpcd configuration..."
+		"$DAEMON" -s reload
+		;;
+	restart)
+		"$0" stop
+		sleep 1 # Prevent race condition: ensure dhcpcd stops before start.
+		"$0" start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload|force-reload}"
+		exit 1
 esac

--===============2264537256663511556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2264537256663511556==--
