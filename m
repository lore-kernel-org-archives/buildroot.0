Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD261C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 895F04239B;
	Thu, 29 Aug 2024 14:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYHg7NTea5rM; Thu, 29 Aug 2024 14:51:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47068423B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47068423B3;
	Thu, 29 Aug 2024 14:51:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 313191BF98E
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AACD8186A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdiZ959s-n0z for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43AF480F05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43AF480F05
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43AF480F05
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37196229343so524762f8f.0
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943056; x=1725547856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ViOElmtOFVSXuMsqPEds+KDHBNL7fL+3mTF9I5itZAM=;
 b=a+GzUwJMQfTwmbNs5b6U7sT/Hl1OFK8s6tlkNW/He1EABLnMkTLlnXQl3FVARuNclR
 AaSdHFt6K8NiEzAT/DwkZOONR7I4wu1YrmRMzUZ/qMYkbHf/UewrlxhwT+rSpLDvEFYK
 LOeJgZpt6nKwnYDx9T6O8S1JZDqZ0lLmjQzEcEtyyGuz/UMsBXB73sFHRkOioqx7Th9G
 gtX4UDX/nrRZq5h9yXaUBS4zC2/umaLoULIioXuIrlvGARP2wzgotaIYq0I2kmugo58m
 NeZFF08HMoNVd6Ug67E4n+JilDkLo0OAl3IqT90nhbzngPJr5qtUlB6LBA9MqaXj9WLr
 KjFQ==
X-Gm-Message-State: AOJu0Yxw1Q5qEJ6qeLpcnEDVpfWti/lCFYU7C/53M4O4VoFKw2CnPGGo
 UA7i8PtwDAeyLMDpuofBVw9Psd+GE/jIVbmzdCD6xOwCTjqTRoy5ey5DyA==
X-Google-Smtp-Source: AGHT+IFwT+2WTWNHf2H6mos04dynh/4q6yfky5hMS3hhvxuyOisMAutzCe7GFsFnG/8KJGvrd3fliQ==
X-Received: by 2002:adf:db4a:0:b0:374:995e:86a3 with SMTP id
 ffacd0b85a97d-3749b550131mr2136086f8f.9.1724943055755; 
 Thu, 29 Aug 2024 07:50:55 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:55 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:39 +0200
Message-Id: <20240829144940.209964-24-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943056; x=1725547856; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ViOElmtOFVSXuMsqPEds+KDHBNL7fL+3mTF9I5itZAM=;
 b=amJjK/K//F+W8yWjeX5IZI2rEDQ0h3/Fq5kQXFlXP5tgNPH93YwjwnXGOWT5n96EA7
 QzitAjkrtkOd5MUg9z9Fxu0vFHtLAK1Rw3E3C4Ewae3uvNnlEJ5xmvuVHxa59/Lny+Ig
 HVnqgLbgIptHcoBlALwsuwuC40MjePy3XhilIafFF1FBP0DRxoB3uYVG0tXQ+zaIsIhj
 M26EvY0aQ7+jqxch6Bp+4AgCiMTq3N0loUZckvwYYmO2J17zDkR/SD98egcN3kz1XbFu
 YPPL+oMCN5qo1U86bEJDH+vMCMwmKSevH/DmzdRs/WpyPWHg63J1daXQ0fT5QxcV04Jm
 jIfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=amJjK/K/
Subject: [Buildroot] [PATCH v2 23/23] package/ejabberd: fix warnings
 reported by check-package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 .checkpackageignore               |  5 ---
 package/ejabberd/S50ejabberd      | 72 ++++++++++++++++---------------
 package/ejabberd/check-erlang-lib | 39 +++++++++--------
 3 files changed, 57 insertions(+), 59 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4cfc202153..04aab622e9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -466,11 +466,6 @@ package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch lib_
 package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch lib_patch.Upstream
 package/efl/0003-ecore_fb-fix-build-with-tslib.patch lib_patch.Upstream
 package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch lib_patch.Upstream
-package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch lib_patch.Upstream
-package/ejabberd/0002-fix-ejabberdctl.patch lib_patch.Upstream
-package/ejabberd/0003-correct-includes.patch lib_patch.Upstream
-package/ejabberd/S50ejabberd Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/ejabberd/check-erlang-lib Shellcheck
 package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
 package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
 package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch lib_patch.Upstream
diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
index 83513bdc83..5d01034fb2 100644
--- a/package/ejabberd/S50ejabberd
+++ b/package/ejabberd/S50ejabberd
@@ -3,52 +3,54 @@
 # Start/stop ejabberd
 #
 
+DAEMON=ejabberd
 CTL=/usr/sbin/ejabberdctl
 DEFAULT=/etc/ejabberd/ejabberdctl.cfg
 INSTALLUSER=ejabberd
 RUNDIR=/var/run/ejabberd
 
 # Read default configuration file if present.
+# shellcheck source=/dev/null
 [ -r "$DEFAULT" ] && . "$DEFAULT"
 
 # Create RUNDIR.
 mkrundir() {
-    install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$RUNDIR"
+	install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$RUNDIR"
 }
 
 case "$1" in
-    start)
-        mkrundir || exit 1
-        printf "Starting ejabberd... "
-        "$CTL" start
-        # Wait until ejabberd is up and running.
-        if "$CTL" started; then
-            echo "done"
-        else
-            echo "failed"
-        fi
-        ;;
-    stop)
-        printf "Stopping ejabberd... "
-        "$CTL" stop > /dev/null
-        if [ $? -eq 3 ] || "$CTL" stopped; then
-            echo "OK"
-        else
-            echo "failed"
-        fi
-        ;;
-    status)
-        "$CTL" status
-        ;;
-    restart|force-reload)
-        "$0" stop || true
-        "$0" start
-        ;;
-    live)
-        mkrundir || exit 1
-        "$CTL" live
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|status|restart|force-reload|live}"
-        exit 1
+	start)
+		mkrundir || exit 1
+		printf 'Starting %s: ' "$DAEMON"
+		"$CTL" start
+		# Wait until ejabberd is up and running.
+		if "$CTL" started; then
+			echo "done"
+		else
+			echo "failed"
+		fi
+		;;
+	stop)
+		printf 'Stopping %s: ' "$DAEMON"
+		"$CTL" stop > /dev/null
+		if [ $? -eq 3 ] || "$CTL" stopped; then
+			echo "OK"
+		else
+			echo "failed"
+		fi
+		;;
+	status)
+		"$CTL" status
+		;;
+	restart|force-reload)
+		"$0" stop || true
+		"$0" start
+		;;
+	live)
+		mkrundir || exit 1
+		"$CTL" live
+		;;
+	*)
+		echo "Usage: $0 {start|stop|status|restart|force-reload|live}"
+		exit 1
 esac
diff --git a/package/ejabberd/check-erlang-lib b/package/ejabberd/check-erlang-lib
index 63f8bf1926..4e51b54294 100755
--- a/package/ejabberd/check-erlang-lib
+++ b/package/ejabberd/check-erlang-lib
@@ -9,9 +9,9 @@
 # without calling erlang.
 
 usage() {
-    cat <<EOF
+	cat <<EOF
 Usage:
-        $0 library
+		$0 library
 Look for Erlang's library in TARGET_DIR/usr/lib/erlang/lib.
 
 If the library is found, it returns the path to the latest version,
@@ -24,15 +24,15 @@ EOF
 }
 
 die () {
-    echo "$@" >&2
-    exit 1
+	echo "$@" >&2
+	exit 1
 }
 
 if [ $# -ne 1 ]; then
-    usage
-    exit 0
+	usage
+	exit 0
 else
-    library="$1"
+	library="$1"
 fi
 
 target_dir="${TARGET_DIR:-output/target}"
@@ -40,16 +40,17 @@ target_dir="${TARGET_DIR:-output/target}"
 [ -d "$target_dir" ] || die "TARGET_DIR is not a directory. Please \
 specify the TARGET_DIR environment variable."
 
-case "$(ls -1d -- "$target_dir/usr/lib/erlang/lib/$library-"* | wc -l)" in
-    0)
-        echo "not found"
-        ;;
-    1)
-        echo "$target_dir/usr/lib/erlang/lib/$library-"* \
-            | sed -e "s,^$target_dir,,"
-        ;;
-    *)
-        die "Several versions of $library have been found. Please \
-        remove the unused ones."
-        ;;
+case "$(find "$target_dir/usr/lib/erlang/lib" -maxdepth 1 \
+		-name "$library-*" -type d | wc -l)" in
+	0)
+		echo "not found"
+		;;
+	1)
+		echo "$target_dir/usr/lib/erlang/lib/$library-"* \
+			| sed -e "s,^$target_dir,,"
+		;;
+	*)
+		die "Several versions of $library have been found. Please \
+		remove the unused ones."
+		;;
 esac
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
