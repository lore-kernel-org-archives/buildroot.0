Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CFAC52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FE8C60A63;
	Wed,  7 Aug 2024 14:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJZmfx-MyOAZ; Wed,  7 Aug 2024 14:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2792C60A66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2792C60A66;
	Wed,  7 Aug 2024 14:35:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 115F31BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01C0C608CB
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GfYGMixENImH for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3C156088E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3C156088E
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3C156088E
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:51 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2f040733086so22051231fa.1
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041289; x=1723646089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9AEJmt4Tk46WGUyt6jybYt61rjunp9XIuo7KTKazkrY=;
 b=sZebGQIgZn7yBURgGkBFQ7kFb6N3Z0T+GCsxSFfSBX8lnImwO8P/Fp3enxFVxGN76j
 tnzYloMEGOYvuI3WHSM/DmsLZ9ayzrJo7cUubRJiwt3oMUjn7W1+ds2MVP5+D+JFaq6B
 fUfs2k/0+QRB5TGpSvSBo2+K2gcgZvwSFlplpqNxsdn13BgxWyX/PbOpqhCTHr9U82Jt
 tc1RDhdd/Y7ayYe8YMn5+cwqo5LbZwfyRjEipJAD3am4ROKwOy0qzBdLP8EV3InFq+4f
 IjYaQ8NNMN5xFdUdzTQneOmP9WXXJCsFWK8o4DPW/VSFoMjjxur5dmh+C22+2rwvn57Z
 VG4g==
X-Gm-Message-State: AOJu0YxgglgdCU3E8KLQGg5lsgcrAQ6HiMqb0EP8Rm8q1ESF46TnZiy+
 q8cHemy3vIyHaBIdg2Vy391Q3NcEtjBo5IfQjHpJBJHnF3zZ3LaE/0pzFw==
X-Google-Smtp-Source: AGHT+IFnrvUrc/TFfY/eV2+k575Bi2pGDnuzKk8mm/4XyZSm0brwZSoWhP060uEH26uwxOUyhMS8UQ==
X-Received: by 2002:a2e:6a1a:0:b0:2ef:295b:4946 with SMTP id
 38308e7fff4ca-2f15aa87067mr126303741fa.4.1723041288872; 
 Wed, 07 Aug 2024 07:34:48 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:48 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:18 +0200
Message-Id: <20240807143318.439619-19-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041289; x=1723646089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9AEJmt4Tk46WGUyt6jybYt61rjunp9XIuo7KTKazkrY=;
 b=dFSlNFMtLJho/A/0ez2jOlclFKFJRxbUu/Kd1xANMtmqesSfLAZy54v9P8Y0tQJmU1
 MPoahnENFNM7mQAeGC7p0ZzyBJysoD6EH8+KeFKult7SqCPubIcTQDOhgi06iupyEABX
 iYyHvCx8ebBsOGQYNylMZRihU33yzstEJy9p//ViMXC/vM3ZTXIkp/A6hQtBWywl0/n7
 HAStWab7K23Psyreu2wucJYaRzRqGlMqPLe42TDzzRRfWmqYvbwdw+qND9nTEwBDyMMp
 w2RKQI2PAoLWycXb5gWIz0G3maR2E31p1LGe8VpXyL2aKao0FVptc2PgWMg/0NKau1H6
 rhFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dFSlNFMt
Subject: [Buildroot] [PATCH 18/18] package/ejabberd: bump version to 24.07
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

and update the two patches accordingly. Ejabberd now uses rebar3 by
default, so use the --with-rebar configure option to set the correct
rebar binary to use. Take the opportunity to fix warnings reported by
utils/check-package.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 ...not-download-or-compile-dependencies.patch | 23 +++---
 package/ejabberd/0002-fix-ejabberdctl.patch   | 19 +++--
 package/ejabberd/S50ejabberd                  | 72 ++++++++++---------
 package/ejabberd/check-erlang-lib             | 39 +++++-----
 package/ejabberd/ejabberd.hash                |  4 +-
 package/ejabberd/ejabberd.mk                  |  5 +-
 6 files changed, 82 insertions(+), 80 deletions(-)

diff --git a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
index abcc8975b2..69f25304b5 100644
--- a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
+++ b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
@@ -1,37 +1,36 @@
-From bf3571da4a68a6a857ab7ad8256f8276b3687a38 Mon Sep 17 00:00:00 2001
-From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Fri, 13 May 2022 14:22:37 +0200
+From bfcc72e5bb96fc9fc1f3558191a1a3f40c7f159a Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Fri, 2 Aug 2024 17:32:37 +0200
 Subject: [PATCH] Makefile.in: do not download or compile dependencies
 
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
-[Bernd: updated for version 23.04]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+Upstream: N/A, not upstreamable
 ---
  Makefile.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index ab0e9d967..6e54168a7 100644
+index 5adf241d5..74aad3156 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -155,7 +155,7 @@ else
- endif
- endif
+@@ -201,7 +201,7 @@ endif
+ #' main targets
+ #
  
 -all: scripts deps src
 +all: scripts src
  
  deps: $(DEPSDIR)/.got
  
-@@ -169,7 +169,7 @@ $(DEPSDIR)/.built: $(DEPSDIR)/.got
+@@ -215,7 +215,7 @@ $(DEPSDIR)/.got:
  $(DEPSDIR)/.built: $(DEPSDIR)/.got
  	$(REBAR) compile && :> $(DEPSDIR)/.built
  
 -src: $(DEPSDIR)/.built
 +src:
  	$(REBAR) $(SKIPDEPS) compile
+ 	$(EXPLICIT_ELIXIR_COMPILE)
  
- update:
 -- 
 2.34.1
 
diff --git a/package/ejabberd/0002-fix-ejabberdctl.patch b/package/ejabberd/0002-fix-ejabberdctl.patch
index ae28f3a632..89504d11c5 100644
--- a/package/ejabberd/0002-fix-ejabberdctl.patch
+++ b/package/ejabberd/0002-fix-ejabberdctl.patch
@@ -1,30 +1,29 @@
-From 4283f675f21d3923e200092cec6418014a03ad52 Mon Sep 17 00:00:00 2001
-From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Thu, 26 Dec 2019 17:06:34 +0100
+From d403c0bca48f2678c70763c3faca41c9adc76658 Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Fri, 2 Aug 2024 17:39:07 +0200
 Subject: [PATCH] fix ejabberdctl
 
 Change default values so ejabberdctl run commands as ejabberd user.
 
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
-[Bernd: updated for version 23.04]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+Upstream: N/A (specific to buildroot)
 ---
  ejabberdctl.template | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ejabberdctl.template b/ejabberdctl.template
-index a940c3df7..5166e5a27 100755
+index 83ec7e1bd..513c48c25 100755
 --- a/ejabberdctl.template
 +++ b/ejabberdctl.template
-@@ -17,7 +17,7 @@ SCRIPT_DIR=$(cd "${0%/*}" && pwd)
+@@ -17,7 +17,7 @@ ERTS_VSN="{{erts_vsn}}"
  ERL="{{erl}}"
- IEX="{{bindir}}/iex"
  EPMD="{{epmd}}"
+ IEX="{{iexpath}}"
 -INSTALLUSER="{{installuser}}"
 +INSTALLUSER=ejabberd
  
  # check the proper system user is used
  case $(id -un) in
 -- 
-2.20.1
+2.34.1
 
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
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index 15e879be19..e6d9b2560e 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,4 +1,4 @@
-# From https://static.process-one.net/ejabberd/downloads/23.04/ejabberd-23.04.tar.gz.sum
-sha256  6ff1d41a1ff6261a0c846193647d8ec143e82142859bf1cfdc62299022ceb2ad  ejabberd-23.04.tar.gz
+# From https://static.process-one.net/ejabberd/downloads/24.07/ejabberd-24.07.tar.gz.sum
+sha256  c0fb746acba81a5db41de97c03968c1f681a13b1b6c1a895b7182e33820c18d9  ejabberd-24.07.tar.gz
 # Locally computed
 sha256  469bb8cfa3ef22c102875ff31932450c075e6908ff3f7d36893485c0c30898eb  COPYING
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 58b544fb84..df9fc1c1d0 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 23.04
+EJABBERD_VERSION = 24.07
 EJABBERD_SITE = https://static.process-one.net/ejabberd/downloads/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
@@ -36,7 +36,8 @@ EJABBERD_CONF_ENV = \
 
 EJABBERD_CONF_OPTS = \
 	--enable-system-deps \
-	--disable-erlang-version-check
+	--disable-erlang-version-check \
+	--with-rebar="$(HOST_DIR)/bin/rebar"
 
 define EJABBERD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) all install -C $(@D)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
