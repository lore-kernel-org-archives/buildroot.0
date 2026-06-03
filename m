Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA6CCD6E4A
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 07:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1E741F5D;
	Wed,  3 Jun 2026 07:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tgrh8gEPy7f; Wed,  3 Jun 2026 07:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E2E41FCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780473105;
	bh=ZZyk8aEJQih034UjYvowBKJcZpLhvLhATpoRXRN/3sc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=P+uEKMy7Q6jKp5Isvmt1kLdCTZYsOf6mWSK29WNwer+2w7Ut8kk4kxIlYWmCl51dM
	 epmfJq3SgDpyX7Jz2ATw25lFcuO7FSgUoMf7l//kU8yqWfWcE3yrAGq7IEGYRnkAeD
	 oyl+8K8MY8qCuRAjOp37E7ctpnlaWwa/ek2IGjsd+bUiXzNyLzYh5+ifZmLR7wRPDc
	 QyNlT98B7kztlsmRM4jlWew0uc+sHkpvGCykBgPeIFJ6duZIRJc+uxkaaOkpZZlr9E
	 zH4lCrYtRKpXoLT1NvxHVcri/XCjTdqmxS+nv4pB3fs6Tq8Ev7ZIb3hrppyhXSpSRM
	 UAmrLO/9hLdsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E2E41FCA;
	Wed,  3 Jun 2026 07:51:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DB46E192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1A4461147
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjX053w45xc2 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 07:51:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 685F561145
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 685F561145
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 685F561145
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:51:42 +0000 (UTC)
X-CSE-ConnectionGUID: qbLi/pe1QuWCryFf9Sv6UA==
X-CSE-MsgGUID: Ry9zxEQoQtexvz20DtcQOA==
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 03 Jun 2026 09:51:39 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 09:51:39 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Wed, 3 Jun 2026 09:51:37 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 03 Jun 2026 09:51:37 +0200
X-CSE-ConnectionGUID: eZZO7XQ3SAm0DCC/xH/a6Q==
X-CSE-MsgGUID: V6q98efkSD+2Zsv8/fKIwA==
X-IronPort-AV: E=Sophos;i="6.24,184,1774306800"; d="scan'208";a="435095634"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 3 Jun 2026 09:51:37 +0200
Message-ID: <cb306363cbe59e1e5cdf9d50921e06a23590cd48.1780473097.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX601.corporate.adroot.infra.ftgroup
 (10.115.26.29) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1780473102; x=1812009102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g28lBa6taXeaTOn8zLqadK7EHS3DewYWsek3303ToEk=;
 b=dfoHyYffdlRTfpUkyPns9KJldu+BTZp4yXWoJtDzJwRgWwg73AQXJpV3
 C3bdDq2JLyVwLep3uZToOVBis21LOL2CbzEou9ZwwiHUC0N9ihjIrj5LW
 njEc4wpdp6ONLl1LzaWsftHbV17QZSVZxlqjcRIzm626ioyyKd7uJp48i
 ionBcSsuhnOlglgDTPKoC5jKlEvwo4zCHEOnsQEe5g573qA7Zgm0p4dfu
 EsT6nCva19W6Yb0AT8Lf2DtfptH0D2e1Ip3qe0CCA3HaY7qWavSsbalNE
 n4Kqg22ugtKwIun//3AfM4qRWTuD2KG74vvNMk4UW1CazKlraFGxPI1TO
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=dfoHyYff
Subject: [Buildroot] [PATCH] support/docker: make the image reproducible
 again
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
Cc: yann.morin@orange.com, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The Debian 12 Bookworm snapshot we use, 20250203, uses the new deb822
format [0] for source list files; it carries a source list file that
points to the current repository, not to the snapshot.

Even though we do inject an old-style source list that points to the
snaphot repository, the packages in the current repository are more
recent than the one in the snapshot, so when we install our packages,
they get retrieved mostly from the current repository rather than from
the snapshot. The image is not reproducible.

Switch to using the new deb822-style source list file.

Note: we do not need to carry the "Latest just before" trick: the
snapshot repository will use the most recent actual snapshot before the
requested dated, so we can just use the date of the image we use (stuck
at midnight because we don't have better).

Since the snapshot repository can be really slow, while at the same time
the remote http server not dropping connections, it can take a very long
while to build the image; add a timeout so that stale connections are
detected and re-attemped early-ish (the timeout applies to both the
connect and the actual download, so it should be large enough to
accomodate slowish network connections).

Fixes: c95d5b8e1eb9 (support/docker: move to current bookworm (Debian
12) snapshot)

[0] https://manpages.debian.org/trixie/apt/sources.list.5.en.html#DEB822-STYLE_FORMAT

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@smile.fr>
---
 support/docker/Dockerfile       | 11 +++++++----
 support/docker/apt-sources.list |  4 ----
 support/docker/debian.sources   | 13 +++++++++++++
 3 files changed, 20 insertions(+), 8 deletions(-)
 delete mode 100644 support/docker/apt-sources.list
 create mode 100644 support/docker/debian.sources

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index e7677ac6a9..687eee8110 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -24,7 +24,7 @@ ARG TAR_VERSION="1.35"
 ENV DEBIAN_FRONTEND=noninteractive
 
 # This repository can be a bit slow at times. Don't panic...
-COPY apt-sources.list /etc/apt/sources.list
+COPY debian.sources /etc/apt/sources.list.d/debian.sources
 
 # Install 32bit variant on x86_64 image.
 RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
@@ -32,15 +32,18 @@ RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
 fi
 
 # The container has no package lists, so need to update first
-RUN apt-get -o APT::Retries=3 update -y
+RUN apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
+        update -y
 
 RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
-    apt-get -o APT::Retries=3 install -y --no-install-recommends \
+    apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
+        install -y --no-install-recommends \
         g++-multilib \
         libc6:i386; \
 fi
 
-RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
+RUN apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
+        install -y --no-install-recommends \
         bc \
         build-essential \
         bzr \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
deleted file mode 100644
index d6fbf85270..0000000000
--- a/support/docker/apt-sources.list
+++ /dev/null
@@ -1,4 +0,0 @@
-# Latest just before 20250218211000Z:
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20250218T144938Z/ bookworm-security main
-deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm-updates main
diff --git a/support/docker/debian.sources b/support/docker/debian.sources
new file mode 100644
index 0000000000..36e1eeb3e7
--- /dev/null
+++ b/support/docker/debian.sources
@@ -0,0 +1,13 @@
+Types: deb
+URIs: http://snapshot.debian.org/archive/debian/20250203T000000Z
+Suites: bookworm bookworm-updates
+Components: main
+Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
+Check-Valid-Until: no
+
+Types: deb
+URIs: http://snapshot.debian.org/archive/debian-security/20250203T000000Z
+Suites: bookworm-security
+Components: main
+Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
+Check-Valid-Until: no
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
