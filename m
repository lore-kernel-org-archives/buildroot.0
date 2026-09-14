Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB21C88E6E
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFF1780DDC;
	Mon, 14 Sep 2026 15:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlQcH9aNdspM; Mon, 14 Sep 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CB61280DD8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789401245;
	b=rKkDsjwzdwWntP1Ps/PhIblHXEyc+spM6uPJYPGyyDzr9JnXM2rXP3HWuAft278qD0rV
	 gH68j/nqwUV+/mewF/uFsaDVVj2UkGP2wii519ZnGWQf71Qywr5BKKoa3+bJT+dw7gEWF
	 jsv6xT09r5QchIK66sI1B1vECupngtxzdwIt2sNzimSl0m9+GO4bD0n5PoE2gFhlcSpt0
	 uyGbnkJNs0JhO5eKdtuxTd+sObqyRVeiSSMXkJMcUhoBi3iyU87wNX/HSiUr6TV/Gd/XG
	 9rsEalfpxJSlQszqCIcgb1QoxHl/OtQZhplNpq2O8/vsBvhwU/+/G6FFLFRikqb4iLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789401245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hIOd9YqOoHe+myQE8HyYJiofs8xcxnr06mynF+Z7kjw=;
	b=HjIv1fmCtzgkKoLTVQ9CWA3kxHd+o7411gq05reRGhEvCrqUYqe/t6Mj/XEA4M57Jl3T
	 W/bLx1jmxrgpMg6SBkmGBy20AqHZ3oMBfUoBnusTtT/7ae0CZNA6Ff3i/ZyDtoTD0VT6k
	 7JAo0kfwIclyVFTd2IlpAtXzvJcM2OR6+JUdxxUXi6ge2Z4AJon0palvMIBdeUkF5en4B
	 I34iK0PsI1+K6gfOGruUNbKOEA73Ke1VpywVzt3uORTpjeXTfayWDLz+q8TlUUdqMhFXq
	 BnUFX4tqOqxidfdEkyKHcym48GlGfNDeVt1H9GJTYM+7VooqA5lY9zqD0lgFSuCiSPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789401245;
	bh=hIOd9YqOoHe+myQE8HyYJiofs8xcxnr06mynF+Z7kjw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l81gd3fPEaIreAnrzNcNiJB9Fc/ebSk8VS2ezDUA0NnEI1ZSE/1tmA3wdarofQIWV
	 cmxKdM4hML1xavXPpOdugdNXFLipRt9aXxh+c2FgJQcNZk1YozA3S2xOyIwG4EdTz1
	 GmdF+Mv/oABSjLPCZjE8f/huUl6okeRzWF/bfuzUpGJpaqAkyr0qlEf/3fg+Z2SwEN
	 RYo07T5f3TG9XCJ7QhsfpEuLHwG9b6AHQWAOKkN/BMV+TJvDTXlE3whXG/6XciZKP/
	 TqC5TaKQcUXwkjGRm14L6u+cAxKc/BRw05nEhnyFH3977zfMI1wXCRIWzcJwyyVt1O
	 LnJPYhCg0RKtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB61280DD8;
	Mon, 14 Sep 2026 15:54:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DF5E2E5
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74A8940144
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOTtlM_O5WKS for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 15:54:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8D3BC40121
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789401243;
 b=pxH6jY+VVxffVB40e9UMhTflrV30hKOfVSLk63eM5KsLlsCI2t2cXSDuHzBAxiLZ+UUe
 GNDeybliawviKFTn7ogyOmHEvTqFYVlks5RMLAUmoAuPwHpbUwA1C78pvXLpRp+KI/LOj
 qysdYcKNHDA9q1DCJ3mqohXEtU+vRuOENNuKOrwJhHxcCNXpXsTksAqxRzskTLvt0zHcN
 mNmsjRvVF5N8Aj4/7N4OgJmWYNgiZSmcS0lYDrzpZqAE1KfdFNdZ4nVbBKapvtwzs7und
 clbZLireLAmeMnapiWknBIKvcPn4KrNYFMD1r7wXVqiR8uMwDW6HbaertAC/2NYSelA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789401243;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=GwVtlqMuUqeDhTbOK4N7hNEUVAP+zXJdkZKkmZlAnCc=;
 b=gnlqSJdxIY3SnKdmrcbL5xAKTzfVR0yrZ+WAlFnZhxrG/t7uYuXP/wOGDcbF93TMBpip
 2e3WIz4Tu+KUpwYwVhOvq3J/9on7SC6s7sGBPeME7Y8Tkr3Oz+/Jj5Q4Nnqk0gzzqdilD
 rHJaUuYQQCUr/gjkPeFwgb7GU8ZFd8BxMO0VKUALHxApBLVFDtWRpTo7aZDRUdmjh3zjD
 k271gfZy3VdDnd03xWTef8vSAsDeW8io+krX4yFP/t3yj0Z2On9fJllHiqYJH97HlQ2Zg
 vx8yvvgcJ6pOO9RdOSC6ILgckHgSesQLuKcc1tiJQucxK1k2SvnIRjdk9yNQAv4MkuQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=IadWOgb1; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=IadWOgb1
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D3BC40121
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:54:03 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f70553dso383182166b.0
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789401241; x=1790006041; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=GwVtlqMuUqeDhTbOK4N7hNEUVAP+zXJdkZKkmZlAnCc=;
 b=IadWOgb13FqoYIidtpR+z6bOKFcef3BkMGzAJegrfD2+KzlPGzMnXsDv/1Sfj/4ySK
 yV9tSG9F0KRJkHs6vhs+2xFk9+GzkIlwMoUKdRuy7ooN3gakRB1iIii7xKchLv4FSgq3
 KDBS/WlUrtnocSUU00luS31Br03jgbePgdxOxtOIVz5SRYdOpwYkFeOqFpFpXg/Obgnf
 EuYOG/L183pOHQ72tJHRHnVHZBJ3iiaQUJidLoLqDsQGSgnh/A0PdVXIyTltYXJ3GEkE
 deCA1z6QDzqEh8OM1GOveHaGFxhVdh755zvnuZfNbu+/pwaz7tXUS0+0PwymC1Ph8Yyl
 886g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789401241; x=1790006041;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=GwVtlqMuUqeDhTbOK4N7hNEUVAP+zXJdkZKkmZlAnCc=;
 b=VAd7QC66HjzYNHXVKPDcziFL17xQur7I5S7UX82qDEStj8nCWlhOMFpuPPRFoyqCIc
 A+qxt4n9X4A3TUyRoFjj5i4Q3FUR+U5hVbHGZ3+8ZaaZhk4k/rx3qPCrDdpMASIEEk6c
 cDwAgbE750HQfNwm604Yudj7C9RZ0+Gz0osiHhQJH2CChTKGBUv7eR8TzB+88+D5UjV/
 F2hySAcjjUTf++azHeAV58fIGfoL0URSzkB67+nO+/q5mphN3uWRnbZ+sJrNBZQlgYHg
 gSFd3NdCEsRBfofrj3JLMPr2K13HSGBue18w4/pJMDPWxQa4/UFFYGq7jBIgqpWyqWpF
 HOeg==
X-Gm-Message-State: AFuF++kt5vx4FYDCXh6LMx49aiuE0jkWwn7bq00JbwGTywlHUwSvOEiR
 WQ8FO1qe2ztgMQCDBNTwhuBhIMkRA+q7n9EcgnyPmkqDhAsjGVrDeA+di+OLJA==
X-Gm-Gg: AYBFou0UexdTUTLtlwpLfab+M0NajymmkA7ZELt8eck4vLEHtgIO4fmrHlSenNB1eSX
 FMD/9Fsifv/YDPNOIBpglic4U4h8Ah6tcx+4mPOQxTveHmQKXTRzwEMw8TB1R+8moxOyv1yeaVf
 ZG60Z1xlVuHsAOrmV6jBo3qN7Ai4dpcmt3L3ly82hKQI0lVSDdcsY4GdMN0GFcxH0FisshLwVn5
 nrLFrKB7BttXPECI6Q1SmprSjCHOxaXcsvKedycYxGhgosm2qtVz7Qex6gfzki6Q80IxOMTDHZ8
 Qm73ttV1qAHHliLTF8dWk5ompZyDsO8vOuJknrFP5TeviLvawlgJZMHeCcJiiWMKrj3Bat48ccW
 Nm4S4GUa6n5uMNSqnLWF4cP1rT9X3KxNYgJkEEts8cqqiFyhhfovHn76A/rEWpdkV5iHc+lgq8g
 MGqEd7GYymPxxl+PnpZ8Dn1Lr8jYfW0ATveBxqOj4jdjHL9kqhhqqAznMah31lYLI+xN5auzV6N
 +AICgTCu9SeIMHPzJL6OXbMYBU=
X-Received: by 2002:a17:906:c142:b0:c25:4b9c:5ed1 with SMTP id
 a640c23a62f3a-c29b8635cc4mr204622666b.12.1789401241264; 
 Mon, 14 Sep 2026 08:54:01 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c296611f417sm450611166b.53.2026.09.14.08.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2026 08:54:00 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 14 Sep 2026 17:53:52 +0200
Message-ID: <20260914155352.1331991-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914155352.1331991-1-troglobit@gmail.com>
References: <20260914155352.1331991-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 2/2] package/lldpd: rework start script
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
---
 package/lldpd/S60lldpd | 80 ++++++++++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 22 deletions(-)

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
