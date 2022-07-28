Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C530BC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 11:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 414FB83E9F;
	Thu, 28 Jul 2022 11:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 414FB83E9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZZnxJmiw2Mg; Thu, 28 Jul 2022 11:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6108982F80;
	Thu, 28 Jul 2022 11:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6108982F80
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 083C21BF359
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 11:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D023382F80
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 11:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D023382F80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBZv0AONKVGV for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 11:34:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E07F82EA2
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E07F82EA2
 for <buildroot@busybox.net>; Thu, 28 Jul 2022 11:34:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q18so1805802wrx.8
 for <buildroot@busybox.net>; Thu, 28 Jul 2022 04:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMlIzp8zlaYyc0G1NeDs3tjp0tH5sL9G6QoziPjCijU=;
 b=fRu3JXB+z9X0fLBOdgJtQ+ZyEuPV+jJWUpuwK8cqkq9sxXe3cE3GCttMxX4MLlQUyM
 /V+hQPIbNsyrHJmRwFt+4qEU3w5amaJdUon+WJr9TVRncnCpENMcXXQNfWjKRJbQLgFx
 wTA1/2e8LPVsnuDfBdVNa3sW/dyQYmVoCOntGgiYcKw1bQg2nBjImrTdZV8LnevirVS5
 absvxEqDHelWOSU6G1ezWU8Ejh1AuM+SWXODUfrF4ZA0fuU7SlGtmH/Gu+rVFsOpJcVe
 3kq4GMclp0X4ysaeYzohr9YAB1LmtWKQkuJ562C6sTOQL/L6AUvH+NRUO2QiV9CPiHP2
 /5VQ==
X-Gm-Message-State: AJIora8oJ2jTTV6yr94uRnUi3Z6zn4hylNw8idSv5oIyKnqtvv9yIQKU
 MVzRGgnE4AtWftxSwy8kPrwddwVoOM+sHw==
X-Google-Smtp-Source: AGRyM1tGW4vWpBo5lrZn4hlh6FAOuyYCUqh3lQA5V6WJus+lfAN+IgljX8kHfD8BPHY0H9Jk8wSeFg==
X-Received: by 2002:a5d:64e3:0:b0:21e:9438:83ba with SMTP id
 g3-20020a5d64e3000000b0021e943883bamr10625759wri.198.1659008090178; 
 Thu, 28 Jul 2022 04:34:50 -0700 (PDT)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056000180600b0021edb2d07bbsm728591wrh.33.2022.07.28.04.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 04:34:48 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Thu, 28 Jul 2022 13:34:22 +0200
Message-Id: <20220728113422.6739-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMlIzp8zlaYyc0G1NeDs3tjp0tH5sL9G6QoziPjCijU=;
 b=VxgmVzGujTk++Ng0TNNa8SAOAy5T57Oaot7aIqfkZoZYfeycv8scwLxSqCBz61YtTT
 oxDr20t/Pjf2CP0QCwmUiqOZpBz9AUJB0prZhPZhGzstoEK9oI9+gp4XKafKkOP97+LW
 1Z0sbpcDYAr5Xe0umCsybYVV8jTmS+IjoD2eYi4f8VXDfGb73RTQpOhZyc2RewadwTXr
 QQljsg7fEtg1lbo34mtQCSyDSfFDvglKFcvVpr7wA8C7k+mLCpqzAAedymXJ4icXh99o
 +FVK7TRVwpBXbPB74mj3pYqqMqccBrmWzLW+P2e+vY7PIfeGikLraRw3OiBnCghKZSCi
 ZK/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VxgmVzGu
Subject: [Buildroot] [PATCH] package/ntpsec: add systemd unit file
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
Use -d to daemonize, use -g to allow a "big leap".
Prior synchronization, system date is usually set to 01/01/1970.
By default, ntpsec does not allow that big of a leap,
and we never obtain synchronization without -g.
Ideally, you want some sort of mechanism to only use
-g on first (ever) boot.
---
 package/ntpsec/ntpd.service | 10 ++++++++++
 package/ntpsec/ntpsec.mk    |  5 +++++
 2 files changed, 15 insertions(+)
 create mode 100644 package/ntpsec/ntpd.service

diff --git a/package/ntpsec/ntpd.service b/package/ntpsec/ntpd.service
new file mode 100644
index 0000000..3987085
--- /dev/null
+++ b/package/ntpsec/ntpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=NTPSec
+After=network.target
+Conflicts=systemd-timesyncd.service
+
+[Service]
+ExecStart=/usr/sbin/ntpd -d -g
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/ntpsec/ntpsec.mk b/package/ntpsec/ntpsec.mk
index a0d0662..a0fc49b 100644
--- a/package/ntpsec/ntpsec.mk
+++ b/package/ntpsec/ntpsec.mk
@@ -62,6 +62,11 @@ define NTPSEC_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/ntpsec/S49ntpd $(TARGET_DIR)/etc/init.d/S49ntpd
 endef
 
+define NTPSEC_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/ntpsec/ntpd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/ntpd.service
+endef
+
 define NTPSEC_USERS
 	ntp -1 ntp -1 * - - - ntpd user
 endef
-- 
1.8.3.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
