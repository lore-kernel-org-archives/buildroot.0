Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0D4C67861
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 17:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CD6A41A3A;
	Fri,  5 Apr 2024 17:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGAEibY3BtyT; Fri,  5 Apr 2024 17:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C60F841A46
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C60F841A46;
	Fri,  5 Apr 2024 17:15:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 925441BF406
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 17:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F43D821D8
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 17:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikhXXBqZsVw1 for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 17:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7687882174
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7687882174
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7687882174
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 17:15:12 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7d0377850aaso98174939f.3
 for <buildroot@buildroot.org>; Fri, 05 Apr 2024 10:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712337311; x=1712942111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hKwxjJQd00pxDs2ESW2gbSYpnYVfzWuB/i66bFjEg3I=;
 b=g5T5uUHpUjJWNu8LggBpc8qeBR9QIAkSaT7GLILTzMZrKpt7nYFShHkVQT0p+/cyRm
 UDI4d90yMvGi7aLsXgmd2WboxUMxK1z31ORpoEWumFGZ7MmBQy84YIz+8ClZLNEHvjOc
 3ZmZ05Tvvyk1zJ8nE6CbcdtTyCV1YAMSGq4qBypKGQfkIoZfRxo3eQQI/ohmOg6m73Yw
 DgPOTdzWEvBpxX3PA7qzr4gSBSOJY5XuvFkstHimqNlfonL0EdxxFnEMA2yTMgkDsrzc
 GjEnbv1MbhgL2fxLHLr+zKW0RlymU9krc6OlHGb9q3tQNSAnUnRWnjkUJXaIZ6cQZyK3
 2Dig==
X-Gm-Message-State: AOJu0Yx5yZsxERQ6tulkaqMxTNUrkS74tz8YAkuCb9s9YNV7/IhWOCRh
 vy1ohor4DbMCyIYyWHK0eMrr+DFUcK0RdKFC2cViwT29L5o0F3uPHJHGQ9k3KFA=
X-Google-Smtp-Source: AGHT+IFmsINehAAb1609HdZgy3AungGjei7UZiqAU/6ZfqYco3JyndCOYYWfM9tsojcZNER49pB4kg==
X-Received: by 2002:a6b:7004:0:b0:7d4:b048:61f6 with SMTP id
 l4-20020a6b7004000000b007d4b04861f6mr1985073ioc.18.1712337311561; 
 Fri, 05 Apr 2024 10:15:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 a22-20020a5d9816000000b007cc7bf2969bsm606435iol.27.2024.04.05.10.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 10:15:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Apr 2024 11:15:09 -0600
Message-Id: <20240405171509.1207255-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712337311; x=1712942111; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hKwxjJQd00pxDs2ESW2gbSYpnYVfzWuB/i66bFjEg3I=;
 b=Xg0hFP/zDwHEKI7U1WP2iQAbpN49ewE6NWf3MVNsCe4AZVmvuYu8SmGU6ksSRyQil2
 9R3XXmQy/snBKfBPFj0DNZ3t3cPLDY+KBuviP6G8gUWlmOB/mhXKUIxc6aCpdRU/vqNi
 ERcMbT5kkdbuNNGhbNQhDx6WOKYBdaeC6rBjp4IibE0EIbxIYxu3+8msuV5e+w+LCVtX
 erj5ABpP40AvhnFgFUqyz0Gwol8CYr7K9mMp5cqOGRsRYcd3Gc1GLlUQK6d9KMXERB6l
 lfgGSL9PBfXzlgR/kGeICxPgVAq9ib7KJ9Nh7pWyxP4QzPMFQtzwS6APS5c26fCJLHvD
 nICQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xg0hFP/z
Subject: [Buildroot] [PATCH v3 1/1] package/cloudflared: new package
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
 Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - fix version
Changes v1 -> v2:
  - fix Config.in syntax/section
---
 package/Config.in                    |  1 +
 package/cloudflared/Config.in        |  7 +++++++
 package/cloudflared/cloudflared.hash |  3 +++
 package/cloudflared/cloudflared.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/cloudflared/Config.in
 create mode 100644 package/cloudflared/cloudflared.hash
 create mode 100644 package/cloudflared/cloudflared.mk

diff --git a/package/Config.in b/package/Config.in
index 0d31faf354..5ae5c5334e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2373,6 +2373,7 @@ endif
 	source "package/cfm/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
+	source "package/cloudflared/Config.in"
 	source "package/connman/Config.in"
 	source "package/connman-gtk/Config.in"
 	source "package/conntrack-tools/Config.in"
diff --git a/package/cloudflared/Config.in b/package/cloudflared/Config.in
new file mode 100644
index 0000000000..3a1a715dc7
--- /dev/null
+++ b/package/cloudflared/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CLOUDFLARED
+	bool "cloudflared"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  Cloudflare Tunnel client (formerly Argo Tunnel).
+
+	  https://github.com/cloudflare/cloudflared
diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
new file mode 100644
index 0000000000..f3610edcf4
--- /dev/null
+++ b/package/cloudflared/cloudflared.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6e5fda072d81b2d40208a0d244b44aaf607f26709711e157e23f44f812594e93  cloudflared-2024.3.0.tar.gz
+sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
new file mode 100644
index 0000000000..8edf5f835d
--- /dev/null
+++ b/package/cloudflared/cloudflared.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cloudflared
+#
+################################################################################
+
+CLOUDFLARED_VERSION = 2024.3.0
+CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
+CLOUDFLARED_LICENSE = Apache-2.0
+CLOUDFLARED_LICENSE_FILES = LICENSE
+CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
+CLOUDFLARED_LDFLAGS = -X main.Version=$(CLOUDFLARED_VERSION)
+
+$(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
