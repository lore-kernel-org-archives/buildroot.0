Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F77EE4994
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C1E8406E7;
	Tue, 30 Dec 2025 17:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWIVLYInFUmp; Tue, 30 Dec 2025 17:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C20640637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767117481;
	bh=HsYlXk/SADbx+HlTAslu8GUt94Odc3rsZEG+5Kl98xo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Da9Xhd6c2YeJvl7GcjCOOhnssH8GTdJfe+Je0xucCo/GZ0CxI7Mrxw3shS7DOtyg2
	 629v7dN5maUXUWMGJuRIb9J7Kb7qFmOqho+vo2/0kbdozoalANJC+eLPKlaKnAuGS3
	 L/fiNvq8t8vk7UFW3ijzf/FtJbHE5NknGbg0txVePzhcZPujVSUcp9xqb9kO1WbkEs
	 s4n41nDANEspPhdvARSacQ6XE1QdC+GKQxOgF1gSuJdNaDb6MZHuq2fLdZ1IOe8mFn
	 af/mTAucoSZYCQchM6XyKJJPsNc0HTwcRRbDMoHQhmnVHz6Pjp0B+BXfYHveG9qzoe
	 r2Ik7cxqyudKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C20640637;
	Tue, 30 Dec 2025 17:58:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5FA277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 008148186E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P61uapPnH1m4 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB8368183D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB8368183D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB8368183D
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:57:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.107.189]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mbir8-1wBdgz2OHW-00ZPTD; Tue, 30
 Dec 2025 18:57:55 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Tue, 30 Dec 2025 18:57:36 +0100
Message-ID: <20251230175738.267463-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:AcCXWV1UDXJySwucO5cUJKhFo65oS+XK59WwxcJONbGTYMPrZcy
 zDd+r2aH17rRChx8vB/EZYt0dNn8edrczzZofmZrSyok18KUEiwUkXeiFXKZDG1bWRpOCVp
 vxl5F/Moay2f0in8rPOVeospw7QqZ83MIDbw0JwfFU2raSW+JpJEwbbjSotmBqLl3ET7VEg
 vd1ELOdLIlpmqIOWNC9BQ==
UI-OutboundReport: notjunk:1;M01:P0:IHek4ZsKPME=;APJyXQ7/X9L5lyJ4TezPLXyyvXw
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767117475; x=1767722275; i=fiona.klute@gmx.de;
 bh=yGpZISi45LjngCIhMnBGYJdXiNoEmOkk96QPDVd7cCU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=XoNwtCvpHKqnwlc2B+zBVyjSBCgcfDiHmQWnU6a+LHBSAqUBFYwicDwqV5NgXsOR
 UQtj2peofaqMYybwtkkBZmseNn9XTwvSmdVEdK3vfzMAGRP/nBebxvVis+vwPoY5A
 zFcCZCIEtQyOzoCIDqRI06YMjGh6GiTX8yhhcmHaC2+XVv/0ZpsPI/Ke/jQmjBewU
 ZJ7Hby1pJjZDmN3lWbp7QXWgdIzwiM9aVdeLRrqihHc5Mvz3I+elYhggaXT7KxfIC
 3VmptK+tJEsVxRK5OIeZz+UTvFVY2qkM5qy3WO47GXdilGVZ+t82JyTsdKlbLtwm2
 LnL4VkBSZry69IYMXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=XoNwtCvp
Subject: [Buildroot] [PATCH 1/3] package/dbus: remove broken "condrestart"
 action & comment from init script
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

The "servicename" environment variable was never set, so the condition
in the "condrestart" case would always evaluate to false. Nobody seems
to have noticed since it was introduced with commit
ceb285976563f6ba2c87a17ff92f1b1490df698a in 2007, so simply remove it.

Likewise, the comment in the stop function that mentions $servicename
is incorrect, there is no safety check to the "killall" call.

With those, remove the /var/lock/subsys/dbus-daemon file that was
created but never used.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I've split this from the second patch for clarity, so the commit log
will show why there's no reference to the removed parts in the
rewritten script. If that's not needed the patches can be squashed.

 package/dbus/S30dbus | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
index 26772755d7..da02609f2d 100644
--- a/package/dbus/S30dbus
+++ b/package/dbus/S30dbus
@@ -12,7 +12,6 @@
 
 # Create needed directories.
 [ -d /run/dbus ] || mkdir -p /run/dbus
-[ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
 [ -d /tmp/dbus ] || mkdir -p /tmp/dbus
 
 RETVAL=0
@@ -24,20 +23,14 @@ start() {
     dbus-daemon --system
     RETVAL=$?
     echo "done"
-    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/dbus-daemon
 }
 
 stop() {
     printf "Stopping system message bus: "
-
-    ## we don't want to kill all the per-user $processname, we want
-    ## to use the pid file *only*; because we use the fake nonexistent 
-    ## program name "$servicename" that should be safe-ish
     killall dbus-daemon
     RETVAL=$?
     echo "done"
     if [ $RETVAL -eq 0 ]; then
-        rm -f /var/lock/subsys/dbus-daemon
         rm -f /run/messagebus.pid
     fi
 }
@@ -54,18 +47,12 @@ case "$1" in
         stop
         start
         ;;
-    condrestart)
-        if [ -f /var/lock/subsys/$servicename ]; then
-            stop
-            start
-        fi
-        ;;
     reload)
         echo "Message bus can't reload its configuration, you have to restart it"
         RETVAL=$?
         ;;
     *)
-        echo "Usage: $0 {start|stop|restart|condrestart|reload}"
+        echo "Usage: $0 {start|stop|restart|reload}"
         ;;
 esac
 exit $RETVAL
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
