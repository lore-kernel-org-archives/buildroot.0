Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281F9C19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 22:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD906414C1;
	Wed, 27 Jul 2022 22:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD906414C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8XuUPZPK7WZ2; Wed, 27 Jul 2022 22:12:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6091C414C2;
	Wed, 27 Jul 2022 22:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6091C414C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A98771BF47F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83FAF409DB
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83FAF409DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBOlQPHaeZjp for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 22:12:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C82C409DA
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C82C409DA
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 22:12:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v17so7296246wrr.10
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PEoR99TL+kt/jmuWBSJ7afkQqTJ743knAoHN7ZLrWNA=;
 b=wYStZaj6snyCcNsUh6mWklXQ1bEwgI+5S/xv35ujggyXMGCmQXufaR0iMTsVBxxJP3
 4yshON2mMxPG+VXcHNHonYuDP8uoX407/y2enH/2sHzKTU19d9GE2I8iIODuCEJxyYvl
 Qa8CjyoSxtsSZiHWjfACJHFabqf9TF2Xkza6UT4Wlr8Jxq5L2ahocr1nFzxBPez+kvIg
 gVMAD8Ux9LpTF4HIpfrExfQ4sScMmBxnCRK8DMBjWeeNPistGu82cpDIfYBbUxGrsyVY
 djklajia858BWuHMuAz+1ZT9MH21ECaDtanwv6FOkDaYGNim+FMl0ZTTmt1PgwAM9HU2
 SIiA==
X-Gm-Message-State: AJIora/fck3CE3Oi0ueW5d/9h9n+07qDM0rwSq8eSKU5oHBz086YyywE
 nV8AXRQ6iGBCx19JLJf6uHkKh6EzB0cScA==
X-Google-Smtp-Source: AGRyM1uQY2VHtM6XTxDlZLHHGK41zHVsiHepihYXHG7pGezCQun2qyHtyIbzrSx3j9Ok42DPAqI7bg==
X-Received: by 2002:a5d:620b:0:b0:21e:5252:311c with SMTP id
 y11-20020a5d620b000000b0021e5252311cmr15312445wru.604.1658959939706; 
 Wed, 27 Jul 2022 15:12:19 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1c2643000000b003a30af0ec83sm3413037wmm.25.2022.07.27.15.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 15:12:19 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 00:12:17 +0200
Message-Id: <20220727221217.1072588-2-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220727221217.1072588-1-arnout@mind.be>
References: <20220727221217.1072588-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PEoR99TL+kt/jmuWBSJ7afkQqTJ743knAoHN7ZLrWNA=;
 b=U+auHu5siJAYY21Az9o5rjR2JAFY1DrrQlzyYQjl/Ey2WLhit4J+xebVYS5Q7+8NU8
 AiqE6eHZz3qJ1JRFkbVj6RbcPDnxO9yYrxNBc89tnk6MVknlEnarv7uRZvxRQ+6UNTbY
 lVTDTMuBhjKd94TGxBsqocFMlNzlPpUwBhv+A8TolO3+9rXBgnqBAER7OuPD/4OFN9Vq
 qnivCx+k1D01uE3auwLlkZCdeiQyVtkd8Eh/gLwDsZw2SXdc21dftZ1TveOYGl9F9lYB
 /GEqIfvBIUZYiSTcMEog2L6SVcfrZNZg3BlUD4UxFkaziyniGepNU7lY8nqGjM8S1Zjo
 Qflw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U+auHu5s
Subject: [Buildroot] [PATCH 2/2] docs/manual: add integration section for
 systemd with dbus
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a section to the "Integration topics" chapter about how we integrate
systemd. Add a first subsection about how dbus and dbus-broker work with
systemd.

This is just the start of the integration information about systemd.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/integration-systemd.txt | 27 +++++++++++++++++++++++++++
 docs/manual/integration.txt         |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 docs/manual/integration-systemd.txt

diff --git a/docs/manual/integration-systemd.txt b/docs/manual/integration-systemd.txt
new file mode 100644
index 0000000000..44248b43ff
--- /dev/null
+++ b/docs/manual/integration-systemd.txt
@@ -0,0 +1,27 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[integration-systemd]]
+=== Systemd
+
+This chapter describes the decisions taken in Buildroot's integration of
+systemd, and how various use cases can be implemented.
+
+==== DBus daemon
+
+Systemd requires a DBus daemon. There are two options for it: traditional dbus
+(+BR2_PACKAGE_DBUS+) and bus1 dbus-broker (+BR2_PACKAGE_DBUS_BROKER+). At
+least one of them must be chosen. If both are included in the configuration,
+dbus-broker will be used as system bus, but the traditional dbus-daemon is
+still installed as well and can be used as session bus. Also its tools (e.g.
++dbus-send+) can be used (systemd itself has +busctl+ as an alternative). In
+addition, the traditional dbus package is the only one that provides +libdbus+,
+which is used by many packages as dbus integration library.
+
+Both in the dbus and in the dbus-broker case, the daemon runs as user +dbus+.
+The DBus configuration files are also identical for both.
+
+To make sure that only one of the two daemons is started as system bus, the
+systemd activation files of the dbus package (+dbus.socket+ and the
++dbus.service+ symlink in +multi-user.target.wants+) are removed when
+dbus-broker is selected.
diff --git a/docs/manual/integration.txt b/docs/manual/integration.txt
index bdfbfa59de..be56bf6567 100644
--- a/docs/manual/integration.txt
+++ b/docs/manual/integration.txt
@@ -9,4 +9,6 @@ level. Buildroot is highly configurable, almost everything discussed
 here can be changed or overridden by xref:rootfs-custom[rootfs overlay
 or custom skeleton] configuration.
 
+include::integration-systemd.txt[]
+
 include::integration-selinux-support.txt[]
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
