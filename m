Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4F0C6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:45:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D30B61208
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 21:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D30B61208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457C040323;
	Wed, 21 Jul 2021 21:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNTlI-L2IEft; Wed, 21 Jul 2021 21:45:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7270E4030C;
	Wed, 21 Jul 2021 21:45:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 380BD1C1187
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 349334010D
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 21:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVF8UtsmDoj6 for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 21:45:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AC2B400F3
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 21:45:23 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id o8so2124148plg.11
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 14:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YsJYlmmID2RMZfG/IFk7OruXBN1Id6uepmM2CCKu2ls=;
 b=dwdTuss+jAouJPOtm9L41ypCMV4opZvn8vFYo+r8e4cyxHynNr+9pfn6hKVWBacReW
 6BsBbhB2E6nZRv0DVIXkaWugX5n40RuWrjULIqIDzOILaO2TqhrvpyMfUkumIWcHPJ91
 l5XwBMTVMDV57uIaiirhI8dFAtufOtjcwuMVA9pagYvnHi8cq6YpzDkJHQtE4uMVGC25
 mBMLhfDCpn4GnPHeX5gGPeN79uh9cC2Fb3TR8piZKwSIC/OMLnJwqgy6y8adeOYn9kQ/
 WgLcUyHA2Go+NtUCMtoo5pzRH1MraO5aPoPAEGtJxV3FMtad1YsfPHbTvidI0zzwe+Lh
 cWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YsJYlmmID2RMZfG/IFk7OruXBN1Id6uepmM2CCKu2ls=;
 b=IYRC/ztHWi4uxxcomHxiUQu/AfyHBv0hbxMduBkV1rFMm7kvWmNZFggFpJvSI291ao
 mvar+meSwg55k7/3Jzhbt1vT62/e4B/PqoK1iQW7fItZFnH9qjISbrXQr1Q5B0oHdoBJ
 T21ILqCqhYGdVnLDlPLtzHk//KoCIsW93CYEYWurmEIlF0Wbz4doSU1AOfbmw6Scf/7f
 80EO/NvXiRnb0yNQ14bDqJspxNzWj4EQeVLwgemKsfmp8PhlbO1RStOSYB90np7UJzE3
 Br/mjNRTpJvlYFMVg7Ln1jZqGD1hKAPW4WZBcUlK5uncQIi3+kP89riTwaMb1/pLGfUh
 rTtw==
X-Gm-Message-State: AOAM532KYETeGQg5QN5GsBurQ+gwYpcuorc9LlUx0G+g0dRpZyeGRSHc
 HNaE2iaVa3be+zA+EWQDSPbW7TiLmB4=
X-Google-Smtp-Source: ABdhPJz81VvkSfaDzuNEcjLJda1iXlSYll/ZvJamYEfvGOJo6TdZWoyVUrXSRd/o+jaSTDc6Yx5EOA==
X-Received: by 2002:a17:903:2451:b029:12b:3feb:a3ce with SMTP id
 l17-20020a1709032451b029012b3feba3cemr29178703pls.83.1626903922490; 
 Wed, 21 Jul 2021 14:45:22 -0700 (PDT)
Received: from adam.duskett ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id t37sm28266330pfg.14.2021.07.21.14.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 14:45:22 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 14:45:16 -0700
Message-Id: <20210721214518.227254-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721214518.227254-1-aduskett@gmail.com>
References: <20210721214518.227254-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4] package/polkit/S50polkit: new file
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Adam Duskett <aduskett@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The Polkit source does not come with non-systemd init script. Add one that is
modeled after package/busybox/S01syslogd.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/polkit/S50polkit | 51 ++++++++++++++++++++++++++++++++++++++++
 package/polkit/polkit.mk |  5 ++++
 2 files changed, 56 insertions(+)
 create mode 100755 package/polkit/S50polkit

diff --git a/package/polkit/S50polkit b/package/polkit/S50polkit
new file mode 100755
index 0000000000..38cb463b8a
--- /dev/null
+++ b/package/polkit/S50polkit
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+DAEMON="polkitd"
+DAEMON_PATH="/usr/lib/polkit-1/${DAEMON}"
+PIDFILE="/var/run/${DAEMON}.pid"
+POLKITD_ARGS="--no-debug"
+
+# polkitd does not create a pidfile, so pass "-n" in the command line
+# and use "-m" to instruct start-stop-daemon to create one.
+start() {
+  printf 'Starting %s: ' "${DAEMON}"
+  # shellcheck disable=SC2086 # we need the word splitting
+  start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${POLKITD_ARGS}
+  status=$?
+  if [ "$status" -eq 0 ]; then
+    echo "OK"
+  else
+    echo "FAIL"
+  fi
+  return "$status"
+}
+
+stop() {
+  printf 'Stopping %s: ' "${DAEMON}"
+  start-stop-daemon -Kqp "$PIDFILE"
+  status=$?
+  if [ "$status" -eq 0 ]; then
+    rm -f "$PIDFILE"
+    echo "OK"
+  else
+    echo "FAIL"
+  fi
+  return "$status"
+}
+
+restart() {
+  stop
+  sleep 1
+  start
+}
+
+case "$1" in
+  start|stop|restart|reload)
+    "$1";;
+  reload)
+    # Restart, since there is no true "reload" feature.
+    restart;;
+  *)
+    echo "Usage: $0 {start|stop|restart|reload}"
+    exit 1
+esac
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index f48c103a52..d5b3955ddb 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -57,4 +57,9 @@ define POLKIT_INSTALL_INIT_SYSTEMD
 
 endef
 
+define POLKIT_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/polkit/S50polkit \
+		$(TARGET_DIR)/etc/init.d/S50polkit
+endef
+
 $(eval $(autotools-package))
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
