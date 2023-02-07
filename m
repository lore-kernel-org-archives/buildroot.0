Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66405C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 04:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE32F404AF;
	Tue,  7 Feb 2023 04:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE32F404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MqC60YgJYLz6; Tue,  7 Feb 2023 04:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E61D140477;
	Tue,  7 Feb 2023 04:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E61D140477
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B34451BF2C8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 04:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CEDC60DFC
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 04:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CEDC60DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D52Ghe_FDhsD for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 04:30:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68A3360DF4
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68A3360DF4
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 04:30:15 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id d2so10096248pjd.5
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 20:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EJi13E9/lANCztkv08e9fjj4QkvsiSpVZ1D+8MLeqyA=;
 b=MTtaOD3pbzjn+PTDp7d/IKO8rco2ZcgjBzHBsBqxjcMw9dkfHDqqV3APYJKy+ihQo2
 Bb2+2PQe05vr9sN8XDJdBU/1+MS6BaRj1QO54KMxKG61qlFTW1EmO7Q15oTOw4xba9mN
 tot+A9Zhc9Vbf1eKGsCc8/sNlozyFBAi/kJ0fa+wW9JoTfStRWhlqYn0okd+Dh6G4Rxy
 bpugNUhfTefLiWvOizI5vK4Qup0OvV+pcm10FLFaRb1WD2rQlLNOrjqdtq40uVz3G8r7
 02PhAr+8Kca+jt6YNnc9c1pWNJ0hw9OfZfVG+ZZyAFC6hTFk3NSDjQNgIY3SJjY+5vCP
 iV8Q==
X-Gm-Message-State: AO0yUKWgPRfCPKbIlSskKPZCr4do0w3iIiokQKzBVSTjnNe1kFGlRDaf
 RzaDNoq1roxb4fggl0Qm2wtV1if8PwZI6Q==
X-Google-Smtp-Source: AK7set+q1BimBE2mxAsjjOshPwLt3DDHF64XvlE1hFvPE7kxF2f9NjMHeH7p5n4QDu1GLkWduhgVTg==
X-Received: by 2002:a17:902:f0cb:b0:198:f574:3663 with SMTP id
 v11-20020a170902f0cb00b00198f5743663mr1233748pla.18.1675744214390; 
 Mon, 06 Feb 2023 20:30:14 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 y15-20020a17090264cf00b001967580f60fsm7695484pli.260.2023.02.06.20.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 20:30:13 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 20:30:08 -0800
Message-Id: <20230207043010.85696-1-christian@paral.in>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/3] package/docker-engine: bump version to
 v23.0.0
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Tian Yuanhao <tianyuanhao3@163.com>, Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

docker-engine does not ship a go.mod file in the tarball: create one to tell the
Go compiler the root import path prefix for the module and the language version.
Note that the language version in go.mod is not required to be equal the version
of the Go compiler.

This update requires a workaround for the non-standard vendor/ structure in the
docker-engine repository, which has an invalid vendor/modules.txt file.

Reference: https://github.com/moby/moby/issues/44618#issuecomment-1343565705

Note that as of v23.0.0 docker-engine expects containerd to be started by
systemd if --containerd= flag is set in dockerd.service, whereas in previous
versions containerd was started by the docker daemon as a sub-process.

There is no sysv unit for containerd, but this is OK: in the Docker sysv init
file S60dockerd, we do not set the --containerd flag. The docker daemon will
start containerd as a sub-process automatically due to the absence of this flag.

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - clarify commit message about containerd.service and sysv compat
 - fix formatting in S60dockerd
 - bundle commit into a series with required containerd changes

v2 -> v3:

 - remove whitespace changes (as per Yann review)
 - use rm -f instead of checking for file existence
 - add the go.mod file in the CONFIGURE step

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash |  2 +-
 package/docker-engine/docker-engine.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index d15b1359cb..670cbd414b 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ee0e2168e27ec87f1b0650e86af5d3e167a07fd2ff8c1ce3bb588f0b4f9a4658  docker-engine-20.10.22.tar.gz
+sha256  94492508260e57eb93399257d53435cd5308ca6330e173ca6e6f3dbf4c6e12f3  docker-engine-23.0.0.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 2a9b72ca78..229e199aa2 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.22
+DOCKER_ENGINE_VERSION = 23.0.0
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
@@ -62,6 +62,14 @@ else
 DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
 endif
 
+# create the go.mod file with language version go1.19
+# remove the conflicting vendor/modules.txt
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define DOCKER_ENGINE_CONFIGURE_CMDS
+	printf "module $(DOCKER_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
+	rm -f $(@D)/vendor/modules.txt
+endef
+
 DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
