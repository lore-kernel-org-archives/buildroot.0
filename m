Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D92C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 23:12:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB87B60C4B
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 23:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB87B60C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7013B83720;
	Tue, 19 Oct 2021 23:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9aKemjEHOIB2; Tue, 19 Oct 2021 23:12:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1001836FE;
	Tue, 19 Oct 2021 23:12:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 590A11BF2C1
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 23:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55390607CA
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 23:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jStXsxrRqLAJ for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 23:12:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EACE6074A
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 23:12:02 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id h27so14379533ila.5
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 16:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q+InWxA3D7dif2HdUm/IN8HmHYAZK0wPJbH7Mfk9hHo=;
 b=H7hzYFvaYTFH1VJ5fedw1y+s4J1vj9WMS4/rSmfsQ3Mx/O9ikuopPC8uZaD8N2qY/5
 8CkoAqm9d0UfFC2QLoGB3g0wL3teiHsoLtoekxQqZhxajCuw7zFc/DK/ZRFdkEoVaUUe
 uj63LIel85JNlFAxNzMN0RoI6c2ygQn0fdkxDxlYikUqHw9Udf/DXwfftM6ar9A9YMjh
 EJgKD1xkzPwgU6/QGxLSx0yW9deGpspDHTS07qtU9ojxQcQ3fYOW4Y3NhxuN/U1u3pxs
 JzbygRUbprvEaJS4SQv36066maYdZuF321kQQxx0Rurz5dgaIdefHd3QZWuK3JIhHTaR
 4g8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q+InWxA3D7dif2HdUm/IN8HmHYAZK0wPJbH7Mfk9hHo=;
 b=8JvSpTDv8nF4k+tHH30m413u/4jcTHHv6/tbgSg2k9Y75PormQqK5qjHrVonHie+Ij
 a8bAf66Ly3hRoQaBrfbMyqM8sqikvQ+lH+CY0Z81oCQA0Y5T/wRn1VJI2YKYvE5zqExz
 UdLCFljVEQQ8kFJQADOV0sZSbmelF9HVVw6fMiQze0XqXUMQFWrvDHjnXjsQQy/phh/x
 Q5mrd/XTKem8gaaTU8PAvmCAVGcTPy5bHm8ha03+ySklqLpKZFofzG6rcsm7Pl4m33Zj
 z1q8RKKH6EEdgOHZu3o5ZCWvR5927RuKgeVFc//uBz1FVLbNKIGpZGiwJMnOktgnzwKl
 qUwg==
X-Gm-Message-State: AOAM530prS5XN5M1S9RQtRA0nUblMGc2PJuFBs3xY6+SWaW2pYSwO/gg
 IhGlk6SIT9zMEzpMfpZ0j+WXhHQAGNA=
X-Google-Smtp-Source: ABdhPJy7r4+h0kC78kj7bzIkXqwYeycIgPriv84KzWtBWbxXw2j7WxSEtSj94B3Jy7/Om1xNUSDz5A==
X-Received: by 2002:a05:6e02:148d:: with SMTP id
 n13mr19921535ilk.278.1634685121423; 
 Tue, 19 Oct 2021 16:12:01 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id j3sm235356ilu.15.2021.10.19.16.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 16:12:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 17:11:52 -0600
Message-Id: <20211019231152.352567-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nodejs: expose capability to
 compile host library
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Linus Kaschulla <linus@cosmos-ink.net>, Martin Bark <martin@barkynet.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Linus Kaschulla <linus@cosmos-ink.net>

To use nodejs on the host (independant of the actual system)
to create some static files to place onto the target rootfs
nodejs can be very helpful.

The provided nodejs package didn't show the possibility to
create a host package. But upon further examination I noticed
that the package does it in fact (in the .mk). It specifies
dependencies for the package with the host prefix and also
invokes $(host-generic-package) as well as $(generic-package)
which is the only one assumed from the config.

With this change other packages can require BR2_PACKAGE_HOST_NODEJS
without any problems or the buildsystem not fully knowing about this.
Seems that someone added the capability (as a step for the cross-
compiled nodejs) and didn't notice that this is a handy package by itself.

When installing global npm packages (with -g), the parameter
`--prefix $(HOST_DIR)` can be used to ensure that nodejs doesn't try
to install it onto the real host filesystem.

I already used this change to create static web files from Angular
and place onto a target that doesn't need nodejs itself.

This patch contains fixes based on feedback from:
- Peter Seiderer <ps.report@gmx.net>
- Yann E. MORIN <yann.morin.1998@free.fr>

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in.host        | 1 +
 package/nodejs/Config.in.host | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 package/nodejs/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 6e5a5c5fc5..7400da5894 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -56,6 +56,7 @@ menu "Host utilities"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
 	source "package/mxsldr/Config.in.host"
+	source "package/nodejs/Config.in.host"
 	source "package/odb/Config.in.host"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
new file mode 100644
index 0000000000..e1b28df5a5
--- /dev/null
+++ b/package/nodejs/Config.in.host
@@ -0,0 +1,2 @@
+config BR2_PACKAGE_HOST_NODEJS
+	bool "host nodejs"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
