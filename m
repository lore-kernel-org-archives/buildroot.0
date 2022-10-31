Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C5DFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 17:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56C9140880;
	Mon, 31 Oct 2022 17:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C9140880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agnnwZ2f3i25; Mon, 31 Oct 2022 17:47:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25DE340257;
	Mon, 31 Oct 2022 17:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25DE340257
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 499951BF327
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3245340590
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3245340590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 51Du_zbln7th for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 17:46:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C4ED4055D
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C4ED4055D
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 17:46:48 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id z24so17634658ljn.4
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D9JgWwZsvbWUw7jo6fobupcNVjckHk/ikBOAeWhnFKw=;
 b=sSAWLRdUkqeD3o//mqnmV5aHeShgxQMI6GWGVBAUyVZH/8pFiRxlLb3hj8CnnfVC/q
 pnE0yBHmK5pKdG2lOetx2LxLHOMStwCQ7oPHrbLhAJzc+Lt0rZoP9DcBDNGmtK/Cb1Xp
 AWOTX5cy3apHVUYF0WV9XVp1tPELkWdqCqO+fx0kgSlLlrhJ1Ptv5SmidKl8tkVVE1xw
 FM0qPzn6wh3tavvMQ2i6DDA4Avs0142oBySWld43T4jgaYx2jdilhjAGGiwxfFzeVqf8
 RYJqmfiGvcqd/TTyfQLnoOBFIG+OkzEdFWVaSGf/UZ0IJUMMXn2IJcdXGRUaqwVSXgcz
 2Fvg==
X-Gm-Message-State: ACrzQf1OGV4z0qWxTOZDpleG0k8a8ZzVOfHFKKCbD9z3gGKg4fz0TpGI
 45Gq0tMJ1Te6ESgZVhTJkLPvj1729VU=
X-Google-Smtp-Source: AMsMyM458mepJjbqtyNgMyH+C1ElIy+IKnlRdgwrAZ0Ot1axpE8L1xLN0X7f47480qaWnMAHzdkyAw==
X-Received: by 2002:a2e:a782:0:b0:277:118b:8ef5 with SMTP id
 c2-20020a2ea782000000b00277118b8ef5mr5573537ljf.181.1667238405787; 
 Mon, 31 Oct 2022 10:46:45 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21f:cc00::af3])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05651205cf00b004a9b9ccfbe6sm1362239lfo.51.2022.10.31.10.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 10:46:45 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 18:46:32 +0100
Message-Id: <20221031174632.377586-4-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031174632.377586-1-troglobit@gmail.com>
References: <20221031174632.377586-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=D9JgWwZsvbWUw7jo6fobupcNVjckHk/ikBOAeWhnFKw=;
 b=QeCqe6vx7YLCmkZtQM5XXeUyFdQt3VdwiSnZRdqp2f6/NyY3byyjB06YE7DdxLavoC
 fHBsl2XYbLPollVaYQsogLBsSEdHJXSsFRqgqaOKiCXjhK/yx+6YvbsCeA34NWAcNDXN
 tfDMdr9+ZcQjhNEbC+QdqYehYCUaW+Dg0x6LETt6tA95DaUJu9iLIVwjadjJsDdYcxP1
 SmJKoA6JSjDzJ8WXvJ3SAk+N2eA9bopFIYxpoHoqbm0b+cA0WbKGF6tlSQoZZk8CNvTq
 MB4Nu+2wC5psKx1vwaUMYYTSbqzJrDbT1Djq+XWoidN3GdCtUdUCqCU7cC6os0DsNewG
 GaLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QeCqe6vx
Subject: [Buildroot] [PATCH 3/3] package/ssdp-responder: fix warnings from
 check-package and shellcheck
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/ssdp-responder/S50ssdpd | 47 +++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 20 deletions(-)
 mode change 100755 => 100644 package/ssdp-responder/S50ssdpd

diff --git a/package/ssdp-responder/S50ssdpd b/package/ssdp-responder/S50ssdpd
old mode 100755
new mode 100644
index e33992be91..6874fdbb70
--- a/package/ssdp-responder/S50ssdpd
+++ b/package/ssdp-responder/S50ssdpd
@@ -1,25 +1,32 @@
 #!/bin/sh
 
-NAME=ssdpd
-PIDFILE=/var/run/$NAME.pid
-DAEMON=/usr/sbin/$NAME
-CFGFILE=/etc/default/$NAME
+DAEMON=ssdpd
+PIDFILE=/var/run/$DAEMON.pid
+CFGFILE=/etc/default/$DAEMON
 
 DAEMON_ARGS=""
 
 # Read configuration variable file if it is present
-[ -f $CFGFILE ] && . $CFGFILE
+# shellcheck source=/dev/null
+[ -r "$CFGFILE" ] && . "$CFGFILE"
+
+cmd()
+{
+	start-stop-daemon -q -p "$PIDFILE" -x "$DAEMON" "$@"
+	status=$?
+	[ $status -eq 0 ] && echo "OK" || echo "FAIL"
+
+	return $status
+}
 
 start() {
-	printf 'Starting %s: ' "$NAME"
-	start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Starting %s: ' "$DAEMON"
+	cmd -S -- "$DAEMON_ARGS"
 }
 
 stop() {
-	printf 'Stopping %s: ' "$NAME"
-	start-stop-daemon -K -q -p $PIDFILE -x $DAEMON
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Stopping %s: ' "$DAEMON"
+	cmd -K
 }
 
 restart() {
@@ -28,15 +35,15 @@ restart() {
 }
 
 case "$1" in
-    start|stop|restart)
-	"$1"
-	;;
-    reload)
-	restart
-	;;
-    *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
+	start|stop|restart)
+		"$1"
+		;;
+	reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
 
 exit $?
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
