Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855C4CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BE5F40888;
	Sat, 10 Oct 2026 09:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuJeUS5zOpcp; Sat, 10 Oct 2026 09:28:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 70BD540AC2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624505;
	b=bN3Ev6D3Sszxr0wiA9LdBpxIWbIXRBeow4ljHGYXdwxH3yxh3emfFh5HEMpch5wnV2Qf
	 HgYA3+ZkIdBd2VSiHRQgzPH6gP+0xf4mxwDZ8N8WE2RzxQl7qcS1euumRofrFvRw/kl8z
	 cYIGjVigE5JAHx3TkADISn8GTx2LbHutdqeX5pgtQLnaE1H1y5pa7eB0QTAPXL1yLLYKs
	 C7QtJCo4dbKAFVp+wFUvWcvHihrlzwuXzC3K05orkdFSwe7neDOw7uwF5oPKWVZY9tqNo
	 74RxwyrPX/9VLY1c+Y0ufM7dFBSoLD+wUBUGn70vYFY2xe+aJLApSmTVc9KJDr7Cm7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624505;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1bIhwbbxLWpxuNnQxBxrZS+uLn1Vgji+TANYqNzTYHU=;
	b=Q+ee/1bOjka7FE0Ck7/kKsTokAX03CjRJOJZsd6L+7Ibf34DTzDqQDw7IV6vYxoV6Lqa
	 ACfFTJrK2Elr+UUUqBR1i1jAZwavY3Q10Z6iltWyxpF7sHZX55fkLEsNhUohf5MabTIUo
	 fWTRNaxUVfwy1T4hQ5Pt0ITnRPW1OHAPvfAFXpjPV5qrkDa5gTrGE96Q2BWeYHczbzpn9
	 IEgHWgyZJ/vqLMEJltv1E1eUHIV+9yDUNIyKup3QQqgWWWTKn/MA5aqe0hd9SqXpYWZ1a
	 AEBxF1B42zP5U2nLlND74HM2nnlwqbe5581ATyWhFQxuftzgzaWyR8eqlma+NBA2axg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624505;
	bh=1bIhwbbxLWpxuNnQxBxrZS+uLn1Vgji+TANYqNzTYHU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L+U/XL2/kmWUAk4M3tKUhy4xyL+KjGWo6AcylErzf+VyUs0eCMrsWwQ/nCeToijIM
	 JL7fxCo5o77IHpQigJr7JfEMSrFKIqPsZfRCNtebMGzu4l1Q+WjdpMBPxKsbQwfi0Z
	 5zC5w0ilXP/snV9TLLGZVn98LoG+WM9RGVk+MEMWujpTKzpAy6vq4EbELkoYQ9Jl4B
	 xVfB9J4zGHFvO4/vN89DxeYZr1vacATGVpACzEwggWo6+WSYRbpR9ZiMrtgCapNU4u
	 PhxoBm5PcIeph6rNa99ZsyOGunEhFE3BWALc1CtW2D9aqhG7prvaN/ulIl5WTdbzVK
	 woboq8K788JBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BD540AC2;
	Sat, 10 Oct 2026 09:28:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55432DDF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C1B98111D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBMcpqMjaZnB for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E4B4781184
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=Bvfjheq/0VD79zVwi8zpXUe97+AUc/yKryOibSD2v6t6jX4s9qk4jlltwlDfbeoec9Tr
 gZFqL2waOPGZo9J5MnDLxC/dSbUqmLJbVA7QvF0bOOLH5rWtOf4+t8Ju5NdhyZ93mpr4G
 UEbIHWWPalYfwUa4RPkn+1arc9HF70UZ9YQZFjI99JJnp0CMLxCe2h/e11KegBZIKR+LY
 v63HXiAM/Vb1+EA0T5tHjgDKVAy7GPUINryFGuFGHH/LAb3PbPWjs3mPR6oCBTzhcNQ3p
 SXvs59zc8y0r0XZ+B6HIozvDtEab27zovYfnPQv0nF32+mpYEr1+KHsqA5ZZLRaLi+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DicU2mn4DpcyD920DmtGolCj3x07H07Bu6eMYM9Ca40=;
 b=SdQuTOmo55GI//ovnZefSLSVjSZ9lt9C6ilXvIcFEM+rDoTKzxYYWnSD/iS3FwCwdLm8
 x2hyUdxEnZD23gL1XDdrtYX/NALL2pNN0jmiaRQ5iBnhHC9GYYFgSKbV+C617mqxdp+QT
 6d4ZyjZ2A4Le5xBJtP4bQPSQGrTIpOseMWSWqwhNxJts9vc0qjG+YizxYwkB1grjRzvX2
 S1Bf0i6bh6NcpLLTZzJ6Z3ZXfwJhoirjfFd67vxk/VrmdySX63upfrVAnvD87JIE8/S2W
 K77Cq1XWJJa4GgTyOEqhbQpPD3RuY17spivvFqKtREX38ejF3lYokGgJooG1nE3jQ1g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4B4781184
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE0A58F1BD; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:56:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 67b105edf150116f9bd735b5efa624fcd0b53648
X-Git-Newrev: ccc8e19434a94a20f0c86690638f05f9cb8d5c26
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.CE0A58F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dhcpcd: fix
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
Content-Type: multipart/mixed; boundary="===============0025178001940344323=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0025178001940344323==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ccc8e19434a94a20f0c86690638f05f9cb8d5c26
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
[raphael: resolve conflict in .checkpackageignore]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .checkpackageignore      |  1 -
 package/dhcpcd/S41dhcpcd | 46 +++++++++++++++++++++++-----------------------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 55359458ca..0ecdc6cc3c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -327,7 +327,6 @@ package/dcron/S90dcron lib_sysv.Variables
 package/dhcp/S80dhcp-relay Shellcheck lib_sysv.Variables
 package/dhcp/S80dhcp-server Shellcheck lib_sysv.Variables
 package/dhcp/dhclient-script Shellcheck lib_shellscript.TrailingSpace
-package/dhcpcd/S41dhcpcd lib_sysv.Indent lib_sysv.Variables
 package/dht/0001-cmake.patch lib_patch.Upstream
 package/dillo/0001-usr-local-include.patch lib_patch.Upstream
 package/dillo/0002-Fix-openssl-detection.patch lib_patch.Upstream
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

--===============0025178001940344323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0025178001940344323==--
