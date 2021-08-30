Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98856C4320A
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 15:31:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67B7B60E98
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 15:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67B7B60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B729040274;
	Mon, 30 Aug 2021 15:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GOdMkFRvS8Hx; Mon, 30 Aug 2021 15:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C533402AF;
	Mon, 30 Aug 2021 15:31:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC2B1BF3E3
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 15:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2920E80F69
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 15:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IORnk_tRiPip for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 15:31:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C4B280F6A
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 15:31:15 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bq28so32014581lfb.7
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=nURt7HU7H47yi5fvb3cOSs4wBUTw0j8aRQA+82gJ0ws=;
 b=KOdROT6O4IgGRj2z7jcRNR8pD0P/uPNRcbIaFsgL15+h7ZO1EgaYdt2YGryZBEEyss
 cUaZCFUe2/5d452CoH8/jP3yQFk4xmfuqoPL9JNf5K4JiPO6jE9rJGjdDFIR2tB+pSob
 u/SJdd/gmcghB1+jfuOw/JgoRBA9l9ahm28nj80g+x7OgCOhbaDvUgOIBgOKeR080orI
 FbbnlEnZg3ZYLZuXZ5U8/MPJEWJy85MTHYNKukscKCUAjalJvjw/+zZ01vhPOQclgL4R
 OZquE8kXFDKUx0o2VWNVvLotaKeaVS5Ac/zbLHpZU0WTqxXJS2G8Azxr1CHa0SXnnV7l
 Juug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=nURt7HU7H47yi5fvb3cOSs4wBUTw0j8aRQA+82gJ0ws=;
 b=m03m2m1WDXFwhbUdkaq/qUvQVMehp3tWntXMZG2b+3ugH21k48s5o5EAKAIyHJOCnN
 w/xqbd2zXXkDAVlXW2MnAFZzlALRgTrTlm35dn4lRdLFCALAsu8BRlbVhr1hxfOd5moT
 8xwbO8FFFhX1p3Us6hOBTkRoiJzpnUbTwKMFC1kKsC3JYLvpLayBMWcfkOK7mBlqU6bu
 82R8cLFE+ZnJOuhF+V1r11l2Bse/wWjRcJUuPLbTk8TFRBeNo4zJwAskKPCmdWUHHfwy
 f5XUsqGHl1i7QTzhTOK1Vwd2DpBzMk2XWButf13uXre44FfozKFbHkDNDoPFks3IC6mJ
 P6Cw==
X-Gm-Message-State: AOAM533d++z06JYZtF0y96zocI0uGLk83fWSQDsu6iLZWOYjK6kfOpfM
 ygIM9SUPvkkFmVF7AAOo+ipYs1d3DwMaiQ==
X-Google-Smtp-Source: ABdhPJwfIgAQkj5kUuJMgYSzeaIOYkyNgMJYzoVYSjh/DmZKAZnrGUpSOWZylhw42GnKvkTu+Bhh1w==
X-Received: by 2002:a05:6512:118d:: with SMTP id
 g13mr4939438lfr.206.1630337472942; 
 Mon, 30 Aug 2021 08:31:12 -0700 (PDT)
Received: from wbg.labs.westermo.se (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id k20sm1871343ljc.2.2021.08.30.08.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 08:31:12 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Aug 2021 17:30:55 +0200
Message-Id: <20210830153056.3176678-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830153056.3176678-1-troglobit@gmail.com>
References: <20210830153056.3176678-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Subject: [Buildroot] [PATCH v2 2/3] package/smcroute: add sysv init script
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Same start order as mrouted, start after networking is up.

Custom command line options, like startup delay, or disable multicast
routing by default, can be added to the optional /etc/default/smcroute
env. file.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/smcroute/S41smcroute | 48 ++++++++++++++++++++++++++++++++++++
 package/smcroute/smcroute.mk |  5 ++++
 2 files changed, 53 insertions(+)
 create mode 100755 package/smcroute/S41smcroute

diff --git a/package/smcroute/S41smcroute b/package/smcroute/S41smcroute
new file mode 100755
index 0000000000..bdc0f87645
--- /dev/null
+++ b/package/smcroute/S41smcroute
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+NAME="smcroute"
+DAEMON="smcrouted"
+PIDFILE="/var/run/$NAME.pid"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$NAME" ] && . "/etc/default/$NAME"
+
+cmd()
+{
+    start-stop-daemon -q -p "$PIDFILE" "$@"
+    status=$?
+    if [ $status -eq 0 ]; then
+	echo "OK"
+    else
+	echo "FAIL"
+    fi
+    return $status
+}
+
+case "$1" in
+    start)
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	cmd -S -x "/usr/sbin/$DAEMON" -- $SMCROUTED_ARGS
+	;;
+
+    stop)
+	printf 'Stopping %s: ' "$DAEMON"
+	cmd -K
+	;;
+
+    restart)
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+
+    reload)
+	printf 'Reloading %s: ' "$DAEMON"
+	cmd -K -s HUP
+	;;
+
+    *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index e4ee81db6f..9cce0acbbc 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -19,4 +19,9 @@ else
 SMCROUTE_CONF_OPTS += --without-libcap
 endif
 
+define SMCROUTE_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/smcroute/S41smcroute \
+		$(TARGET_DIR)/etc/init.d/S41smcroute
+endef
+
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
