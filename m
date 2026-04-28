Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD46FF8868
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 09:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 189BD40A04;
	Tue, 28 Apr 2026 09:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YF4R1uPnN6G; Tue, 28 Apr 2026 09:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AF2940A09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777369880;
	bh=y1R92WA6YqfaAXjLtLApIcvAwz+QoXoeG2jr3NbrudU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=OmTsQJ3CJaDoIjOR0U5WA4q9rlzgFL0nAwlccKnwi8y3sqRDr6UbnoXTuh9W4ymbE
	 68A6E8nUmXM6swFnZ+no1+Eb3mCnphR7Fv/anF8b85ZcwEXLXAw8l874a0rWdgDsnE
	 p2qVAZyYYwmpKifEGAW3PNvvtMJd5KwDCipczMYd1tx8rzye8gNCLcYNsbhklfIcT+
	 j9DVLTS4HXEb+chr/b8j7X5gDuTzHr4CwgsvWv+RtEHOYMB7dBmVw0wAuo7iD4x8ht
	 jYF/QIhtIqQDH4OdIM+8JUUODRC/IBGe837XhkWizG2/ziOheoZrpAIvU/mnjzwzKR
	 eoRRuw1/sgH7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF2940A09;
	Tue, 28 Apr 2026 09:51:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE111231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 09:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFABF60F7A
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 09:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UXXgjLETgIsI for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 09:51:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A02BE6078F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A02BE6078F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A02BE6078F
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 09:51:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUUw-1vYUaU0boC-00fqnR; Tue, 28
 Apr 2026 11:51:14 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 28 Apr 2026 11:50:56 +0200
Message-ID: <20260428095056.3024331-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:WeA0+ahF55xQQdgSzj23X4GHuRMdQDlqLYZ02woYfCghHixGE77
 okiNvrCN3PbRF7p0ak9+NNg+xKoxKQPdPW1AWbVGp2k3pb2R6C/tZ4zGwEgPRsilqdmbT7X
 U0CL0kpHaiyPTnfFqL2Yfe3UkpIdc7Egn/9iDksAaBuGJNYkKFq1gJLgSBn09T+55bocVdl
 mUjVO74UlIndnM+zERnIw==
UI-OutboundReport: notjunk:1;M01:P0:Rj3pOM0q2qA=;Yuh7OyjNED2GLuCBFkTCH5TWWAn
 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
 oOE5cNemTyMleepV2X6URGqpIZD1WmA7+KGQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777369874; x=1777974674; i=fiona.klute@gmx.de;
 bh=C/3IVpCEjHi4F7D6m9e5B5SCcn47dRb3YUKCfC5H5Do=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CRn7E0596hXLYeFDT4hwzBoUmILjDui9yK2o8yNqbEckTfgTFTpsk/akol/lazV3
 JNKrb4W+Um/o96rgrcFptZa1yyU3QpQoCRQopxXV/PwNgQ5Ssj80KhQR8k2Yw/ESE
 tO6NY1X6K4GWwotDeNiYonRrnkSnIYnMxO1s+LlZqeJCRaS3lAbjC8t+f8APL0RkL
 Ksr68eEEHXGzhpwzJcH4IDbHo1uZTriAhZatggutPuYJWGB5vTA/vNr864eCJm7I2
 RPAYXVx2UAmoBf1vSr3jjjC6DjIHwuPM6hpWD4j04tBm3NQVB4KPxUeOd4yIIBs4t
 qQm0CePDKxpHo2Si9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=CRn7E059
Subject: [Buildroot] [PATCH 1/1] package/initscripts: fix check-package
 warnings & indent
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No functional change. Add package-level .editorconfig so indentation
matches what other init scripts use.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 .checkpackageignore               |  2 --
 package/initscripts/.editorconfig |  3 +++
 package/initscripts/init.d/rcK    | 41 ++++++++++++++++---------------
 package/initscripts/init.d/rcS    | 39 ++++++++++++++---------------
 4 files changed, 43 insertions(+), 42 deletions(-)
 create mode 100644 package/initscripts/.editorconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index f24cc77e3e..9052c88e8a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -441,8 +441,6 @@ package/ifupdown/0001-dont-use-dpkg-architecture.patch lib_patch.Upstream
 package/igd2-for-linux/S99upnpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/imx-mkimage/0001-Add-unused-fake-version.patch lib_patch.Upstream
 package/inadyn/S70inadyn NotExecutable lib_sysv.Indent
-package/initscripts/init.d/rcK Shellcheck lib_shellscript.ConsecutiveEmptyLines lib_shellscript.EmptyLastLine
-package/initscripts/init.d/rcS Shellcheck lib_shellscript.ConsecutiveEmptyLines lib_shellscript.EmptyLastLine
 package/input-event-daemon/S99input-event-daemon lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
 package/intel-gmmlib/0001-Drop-hardening-related-flags.patch lib_patch.Upstream
 package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch lib_patch.Upstream
diff --git a/package/initscripts/.editorconfig b/package/initscripts/.editorconfig
new file mode 100644
index 0000000000..e616e5ae3f
--- /dev/null
+++ b/package/initscripts/.editorconfig
@@ -0,0 +1,3 @@
+[rc?]
+indent_style = tab
+indent_size = tab
diff --git a/package/initscripts/init.d/rcK b/package/initscripts/init.d/rcK
index 59e9c54ff9..521e9eb645 100755
--- a/package/initscripts/init.d/rcK
+++ b/package/initscripts/init.d/rcK
@@ -1,27 +1,28 @@
 #!/bin/sh
-
-
+#
 # Stop all init scripts in /etc/init.d
 # executing them in reversed numerical order.
 #
-for i in $(ls -r /etc/init.d/S??*) ;do
+# we need to reverse the order here, sort -r would be no less fragile
+# shellcheck disable=SC2045
+for i in $(ls -r /etc/init.d/S??*); do
 
-     # Ignore dangling symlinks (if any).
-     [ ! -f "$i" ] && continue
+	# Ignore dangling symlinks (if any).
+	[ ! -f "$i" ] && continue
 
-     case "$i" in
-	*.sh)
-	    # Source shell script for speed.
-	    (
-		trap - INT QUIT TSTP
-		set stop
-		. $i
-	    )
-	    ;;
-	*)
-	    # No sh extension, so fork subprocess.
-	    $i stop
-	    ;;
-    esac
+	case "$i" in
+		*.sh)
+			# Source shell script for speed.
+			(
+				trap - INT QUIT TSTP
+				set stop
+				# shellcheck source=/dev/null
+				. "$i"
+			)
+			;;
+		*)
+			# No sh extension, so fork subprocess.
+			"$i" stop
+			;;
+	esac
 done
-
diff --git a/package/initscripts/init.d/rcS b/package/initscripts/init.d/rcS
index de411534da..67efe3cf7f 100755
--- a/package/initscripts/init.d/rcS
+++ b/package/initscripts/init.d/rcS
@@ -1,27 +1,26 @@
 #!/bin/sh
-
-
+#
 # Start all init scripts in /etc/init.d
 # executing them in numerical order.
 #
-for i in /etc/init.d/S??* ;do
+for i in /etc/init.d/S??*; do
 
-     # Ignore dangling symlinks (if any).
-     [ ! -f "$i" ] && continue
+	# Ignore dangling symlinks (if any).
+	[ ! -f "$i" ] && continue
 
-     case "$i" in
-	*.sh)
-	    # Source shell script for speed.
-	    (
-		trap - INT QUIT TSTP
-		set start
-		. $i
-	    )
-	    ;;
-	*)
-	    # No sh extension, so fork subprocess.
-	    $i start
-	    ;;
-    esac
+	case "$i" in
+		*.sh)
+			# Source shell script for speed.
+			(
+				trap - INT QUIT TSTP
+				set start
+				# shellcheck source=/dev/null
+				. "$i"
+			)
+			;;
+		*)
+			# No sh extension, so fork subprocess.
+			"$i" start
+			;;
+	esac
 done
-
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
