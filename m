Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23137C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 09:44:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 980FA6023B
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 09:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 980FA6023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BF4B40555;
	Tue, 28 Sep 2021 09:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXiipS-bg2Wv; Tue, 28 Sep 2021 09:44:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD7E9404AD;
	Tue, 28 Sep 2021 09:44:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3841BF29A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 09:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D7E380D5D
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 09:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X9l7NxEijWo8 for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 09:44:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2443680D56
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 09:44:09 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id u18so88650206lfd.12
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 02:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=7chyupT+O0MIk358VvEFiOhwh0hOOTxHOSIRtkWvyFE=;
 b=pIEjfCmwfDM2GvdD0yO4pVA6UlEuKCIso8oIZ0ZFYHkwC6/J2yHLTeHSigJKfM5PW1
 oXzdScPtzS4vI/7MnOjhPuI3U1AAgHtUi0kmGjEmYeg4+AwMkIwfFtUjE3Jwd4zn4Tuy
 sc0uKwFJsRQ7h6DACky7OObQfY2gILlry8ja28E+FO+vfEDF0sWatPVHxVE/rpVhCtvM
 ADXf0yLoygcMCamwDge+s2VSmEMtO+uXCH3BCChURBvoRjLQA8N6baoWsFYdVmt2apob
 Z++cFcwbYcujV65kKa0inLJNoKShScLt0UdoIynQII/tV1jdDqJtoTEZXmUOW/WyBS19
 IJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=7chyupT+O0MIk358VvEFiOhwh0hOOTxHOSIRtkWvyFE=;
 b=YdFG1ZXptUiYMIewUvNRLCXn/iAJvyPGWoZi1ypsyJ159lx3thtG5n5E8pZfUr8WBf
 DjpasMmj1YsiNtJFjzQQWbv6ToKIrzh8pnMazes1+nU1pBBLfbE8kEsgqdsvBhKg6yK5
 zqiLKl4mVs8Cxk7nE7RQoB9/o2KzXS7OwbjwuKi8zBhs47ONfUNr3hlvH0u5JMhQk61Y
 1FHVUs4Gp7sN/SbhEqxs+O3FVEa7L8QZcXLoTjCVUQa3FZGPSe0MrVf4Jm/0556Jk20d
 8IM9/HZojSryzz6O26BLavzuyTxvPSQIWgLXrE74l01PiUBolIvOhiF99sa9ir2lzZGI
 GNlA==
X-Gm-Message-State: AOAM530cqkyPrVPQCDYUTImi2DADrxbw2yUkykRr9hGfxpowMere2Sxo
 WtPZnA26JavBS0punXNc53dHrWXpoJc=
X-Google-Smtp-Source: ABdhPJy5sifIqdEaWoiC/4souglEcgFlKDC1YszF2rCWF5EBwzHvy4W27V8CI0b0uv8VEpUDNasuqQ==
X-Received: by 2002:a2e:5005:: with SMTP id e5mr4639640ljb.471.1632822246713; 
 Tue, 28 Sep 2021 02:44:06 -0700 (PDT)
Received: from wbg.labs.westermo.se (h-158-174-22-41.NA.cust.bahnhof.se.
 [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id s29sm2481192ljd.54.2021.09.28.02.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 02:44:06 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 11:43:23 +0200
Message-Id: <20210928094323.2566981-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928094323.2566981-1-troglobit@gmail.com>
References: <20210928094323.2566981-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Subject: [Buildroot] [PATCH 2/2] package/smcroute: cross check PID with
 process name in stop action
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/smcroute/S41smcroute | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/smcroute/S41smcroute b/package/smcroute/S41smcroute
index bdc0f87645..3bef3bcd85 100755
--- a/package/smcroute/S41smcroute
+++ b/package/smcroute/S41smcroute
@@ -4,12 +4,11 @@ NAME="smcroute"
 DAEMON="smcrouted"
 PIDFILE="/var/run/$NAME.pid"
 
-# shellcheck source=/dev/null
 [ -r "/etc/default/$NAME" ] && . "/etc/default/$NAME"
 
 cmd()
 {
-    start-stop-daemon -q -p "$PIDFILE" "$@"
+    start-stop-daemon -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" "$@"
     status=$?
     if [ $status -eq 0 ]; then
 	echo "OK"
@@ -22,8 +21,7 @@ cmd()
 case "$1" in
     start)
 	printf 'Starting %s: ' "$DAEMON"
-	# shellcheck disable=SC2086 # we need the word splitting
-	cmd -S -x "/usr/sbin/$DAEMON" -- $SMCROUTED_ARGS
+	cmd -S -- $SMCROUTED_ARGS
 	;;
 
     stop)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
