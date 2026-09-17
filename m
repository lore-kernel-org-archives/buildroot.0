Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF15C982D7
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 16:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD12810AF;
	Thu, 17 Sep 2026 16:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmIkJFROp0FU; Thu, 17 Sep 2026 16:06:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A3C27810AC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789661168;
	b=iisCOSt6StrgcxAkSt42XuQvb9q6I5+tE8+HRndBBJyKU4FPhuRkSOlZE5LRAhgPXlBO
	 OU0RpeSJ11eZ5ZbGqlclFA8968KXqeHwhwiDyvkrhi13Pw/BCCwct/W9SzUCXRaVTttYS
	 604t4KWf4k7WykD535nPNsCoiElaPVsjlNXY+7T3PzDZcZLoZp7YbLYzOU9vz1EskuLfN
	 46B87CWkQaIiNJa7O07mOHZzp4wMVvuzQweRt3I+W5JMspJX0aX7+cQCBT0m91ia1wDnO
	 rQ7eerUjFOy0+I2IAdz3cero292SHvau3NY4nXG8I3HwwewPB/GsJo0fgHuQSjxB9Cw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789661168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0YIUlgKP1TO66OLl1aEDnzACES0k9TCNP8IP6+btVGg=;
	b=hq+6eaNDDzmPbA6oohmF7v4vUpUJYNU9/WvEiRkSZuZPhqk+Jt6Umhz8jdhqcyL3sJPP
	 qFtStFBh69CEIgDLZDu03n7VXB4NlPGKQf2+AwdG4t2r/y4jafivvSW1gc/lSS1x2f4+1
	 YhffpQPj63beXbKePnBNdi6vJddFFfZrnwMIdhkmMbXRlQpfsW3aqZh1jrIq4XNgFpD8h
	 08ITvWFAkhgbRHNBHip58dczmXCplq+AoyMeUhaRbHKKgyyCijQiqRQxw5RZTZL6lIuNA
	 zDzoUMbIYia32XlV+80amHy/lUFFQEhnfylQx5Iq6h9rgDOVVvnfYkv19Q/wwoc9KjQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YXYGOZhc;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789661168;
	bh=0YIUlgKP1TO66OLl1aEDnzACES0k9TCNP8IP6+btVGg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iULGPmQmgOecvvbJdveAkxhZlYOCkFeMv8gPa5uExfgbaasTIb5aMsy3lAjVpNf23
	 3yHW0jC+R5M75Zsx39fd0Cg2mR2vTbrH5R2BwsNyVFe70Qa5uVmnG6LDmkrh5x7UTR
	 3TfdEgjGMcGV3obuR319wNcFUS5ILqyJuMbPNrvu9uNRsKaEKiruhyd8FTcmjwvpza
	 bgLjC0TQltSc2Sq7ll3aC5LVs80vsLvvCh6gYj/0YrKuJxqIxl1XT/Tj5FpZi3GK0Z
	 zw46Io1TTm+/fqKedDRrXYPu87IUpRKF2MSG5+Q0YZkDQbelX8Il6zpwGWyH8KRCoJ
	 OOuOgTk559JMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3C27810AC;
	Thu, 17 Sep 2026 16:06:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA1FE465
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F6F0810AC
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTx5-HkE-bWb for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 16:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 903FC810A8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789661166;
 b=E9fcXgM1JRtsTIutTVwkWQVJjOgJ36IhQ0QxWAd1L+kSSQgNkBlHB0S8sI7mWEcXOWzs
 sJOQkNvtRU0qtYFOKs7GJv5p6eH6I6IXjuwFT0h9LtUG2MX72YqDsITNuevazfyIGfxuz
 WpAFI4NWH+SyQFhvGl6fPgntv3/GZmEf4Vu0jONDmHuebqqJIemEYlRG5oCrhHNu00HU3
 fk/DP6HZPhhboK5m1smEdiaeG0qlntBpPzjCimK1soYs1Tq1cJff8vQ911NaiDZQSy8Ap
 4gOTwZyFktoXyEQOBAfGLXQb44U7R+vw9+o8CskU90Ua7S84ouOaJgwXaaXrnZTc1iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789661166;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=n+zTMexvmil7NawDD1/A4TWSRVFJ784Vh92yI3IvaQE=;
 b=GUEeJvqOxpeuyZNPgzdR3adjyNDo4JsEoAEPaEoOeH5RERAmyv7y5Qf7d9YTm14LnY9+
 bdSRYxvILK98SSg7GDo2ZUD6nazjghdHt0N+OTx5Zp3EU/FP+tE90OX/9+7fqQBAgzaOL
 kzOxSQQLdkLrMez9U/XkoqwiNraVv/HhHMeUPTvHyrCOtr+HfphlozFdvkKbV7QhFRLaJ
 1qe7R2R+23ed0w6FkouX8G2iEKizAyH4ZuU+tHvNYRqqA0dHQzCwzv11E8qF4wYD519+v
 MHhGc5dG/x7zvdGdlKTBiK0/b2x2Rfd6HNlhCfblqgb3wst9fT8+JyNCENDPniYTo8g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=YXYGOZhc; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=YXYGOZhc
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 903FC810A8
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:06:05 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254fa663c2so138170866b.3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789661163; x=1790265963; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=n+zTMexvmil7NawDD1/A4TWSRVFJ784Vh92yI3IvaQE=;
 b=YXYGOZhcP9tnPnYLaNizgeZpj+6omumHQ0nA4eynMUIsIH9onAo2hMya+5kyBqWeAK
 /YOkc3FEXPAJRLph8GtARkXCcfEFswE5ych+vQ/IOQ5eKYW3AxQnlLiBa4TiYKqicgvD
 wi5tWPAl2WuxkFYcIM+a+KvBbBBBk2ELXgukkIky50FNJF30K3vJUuzpTjVlGN4Rlq+1
 KIcH5e2u1EHa2jNdxbtVCgtfrVm2PDGafbfQxcDfdt3m+R5W8rULNsylMVZe2ot+N2h9
 O/QsAB6YB9YbxIhnzJi6ZgsSlrzDjKYCY+mmd4MoIf/piKQKWtIDj4AL9huOzwv0kgDE
 /lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789661163; x=1790265963;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=n+zTMexvmil7NawDD1/A4TWSRVFJ784Vh92yI3IvaQE=;
 b=VqREUVKOLudhy59WGKzfwDmUbvWsIL9mIMfIwmcZJz9n8A0Zc/ligSvh5vxZg35a9W
 yJRSRd0DL5I31vyx6B2VQ9/TZux/Zf37IuKWXJC39yHH+iepPPksaObuyY8saILfRKPF
 ughhPPs5sKVd7LkeHbUcZSaD99dyXG5vqZcME95HDuHFzINI95G5rTgngqt2hl3+4oOv
 r6+f4tKovw98BvMUkyn7RgN3UPZFAFQaDsnPDFI12OAXpfjcpI9RYuoI243SZQB19ooW
 xT+ldHUB5S+wVlEeGJSdHSK0z3RnFfAzyV9plWv+0rcNE7Ssq4lZFetKgFxPgnybvBzP
 7ruQ==
X-Gm-Message-State: AFuF++niBePj7KQnqsvFKYbA1g2qABbyGVcdMTxo/1yEm/gnjVTtdf7d
 9RVzp7cEewC0STDDxw9QnKnOZaUM9v5x0fG/77Q4KVNV01V4wwZWlgpVWzEWwQ==
X-Gm-Gg: AYBFou1UM7sRJPeW0rrGihUf9bon9wTioOd4nNXQ/LkNqZGofKxRtiybjwk4P7qZrLh
 DX+7EnQ+FVH6e8br2lvYG3BcX8E2Q+ArcWZNuVlCC0OqD5sHOCYOxXQ6+PRrwAobF3Aiz200Lvv
 bda4SfH7qqu2rTx/eXz1rawtmsRjmb/gBca6yoC8/TzKmeyFuKw+wu43dz9BnGj9pgjR1ypSyGV
 a9lZWtR1FIR4N/9bOUvS7gYGiKsKeQYk2jYLriPDKWcu+Q2dTunQavljz2zM+N/zu6ZhF1eXdEv
 yooSXPgNkhalmJRFSgaQRlOSep8TJVkLpJMGZ3bkllaL0m0qWI82F+pwJ3WYs8yDGIWalSU5O2K
 oRlkbBu2GfJz18dLB1+j2V2OFxrb8mQ/Kb5N/KCne7su6kPMCm0bIwdVV3t9t55OyjrDQyxhSTz
 7Vgin8HMk12Xnhy843zFaYSwxw6q5lvHIK6FQ2fQFD0OaJNQEf9kjcAlqw1q+slpiGiOmxQGXyP
 kE6s2ryTHeyeuNyzLSRM7mTN9g=
X-Received: by 2002:a17:907:94c5:b0:c29:5215:b2d8 with SMTP id
 a640c23a62f3a-c29e530ccf6mr678317466b.14.1789661163266; 
 Thu, 17 Sep 2026 09:06:03 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de6903e2sm314189966b.60.2026.09.17.09.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:06:01 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Thu, 17 Sep 2026 18:05:43 +0200
Message-ID: <20260917160543.243218-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914103020.3485030-1-troglobit@gmail.com>
References: <20260914103020.3485030-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH v2 2/2] package/lldpd: rework start script
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

check-package reports six warnings on S60lldpd: indentation with
spaces, no DAEMON variable, and shellcheck complaints.

The script also masks failures, the exit status of
"[ $? = 0 ] && echo OK || echo FAIL" is the one of echo, so start and
stop always return success.  Stopping does not wait for the daemon to
exit either, so a restart can race the instance on its way out.

Rewrite it after package/busybox/S01syslogd, as the manual asks.  lldpd
daemonizes and writes the PID file itself, but does not remove it on
exit, so pass the PID file to both start-stop-daemon and the daemon and
drop the stale file once the process is gone.  Also pick up arguments
from /etc/default/lldpd and add the customary reload alias.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[Julien: remove .checkpackageignore entry to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore    |  1 -
 package/lldpd/S60lldpd | 80 ++++++++++++++++++++++++++++++------------
 2 files changed, 58 insertions(+), 23 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2fc8349f1e..32be4c93aa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -550,7 +550,6 @@ package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch lib_p
 package/lirc-tools/0002-configure-add-disable-doc-option.patch lib_patch.Upstream
 package/lirc-tools/S25lircd lib_sysv.Indent lib_sysv.Variables
 package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch lib_patch.Upstream
-package/lldpd/S60lldpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/lm-sensors/0001-no-host-ldconfig.patch lib_patch.Upstream
 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch lib_patch.Upstream
 package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch lib_patch.Upstream
diff --git a/package/lldpd/S60lldpd b/package/lldpd/S60lldpd
index 3dfa6c1aa1..79605c2f02 100644
--- a/package/lldpd/S60lldpd
+++ b/package/lldpd/S60lldpd
@@ -1,25 +1,61 @@
 #!/bin/sh
-#
-# Controls lldpd.
-#
 
-case $1 in
-    start)
-	printf "Starting lldpd: "
-	start-stop-daemon -S -q -p /var/run/lldpd.pid --exec /usr/sbin/lldpd
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-	;;
-    stop)
-	printf "Stopping lldpd: "
-	start-stop-daemon -K -q -p /var/run/lldpd.pid
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-	;;
-    restart)
-	$0 stop
-	$0 start
-	;;
-    *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
-	;;
+DAEMON="lldpd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+LLDPD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+# lldpd daemonizes and creates the PID file itself, so tell it where to
+# put it, but it does not remove it on exit.
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon --start --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON" \
+		-- -p "$PIDFILE" $LLDPD_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+		return "$status"
+	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/sbin/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
