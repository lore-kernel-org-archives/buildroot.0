Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07D0CEE32D
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 16:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43C16401AE;
	Wed,  9 Oct 2024 16:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwppoaKx3jHk; Wed,  9 Oct 2024 16:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D21F140DEB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D21F140DEB;
	Wed,  9 Oct 2024 16:17:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44FEE1BF3F6
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99E4C60906
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDXYcIA2tJ3C for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 16:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A975C60904
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A975C60904
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A975C60904
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 16:17:33 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-83541f580b6so34249539f.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 09:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728490652; x=1729095452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QxuFpNpVoJ9n9cmuM6MyAAMWttbO2YCG3EMwHxhRsNc=;
 b=eIlb/MKvRmb+QtDAwD6dN89QqJ/Tr0H/8WQnHF6DR0cGfSu6zphkIMIyqxACpM/q6+
 giTWXYxSNjghNDrzJ5MurRP9Ui6KAKLKWhny7SBjzhlob44b5vG0eyPZ0UExxPQvXOXE
 JP8WgWAeUdqmzJ7JKt8rdB+AuTuqAQiiWL4BeV2+XpTpr5USzJqeEI3krQzS1Ry9WtxH
 DD5TF56Dk5YUnz0PEzQpcXdDyJYE4IjM48fEqxuN1kxVA6fpZFJXZAJ+cYZMrxKqXQas
 4TlqyK/jvYPdV2pX+qNFJ5NW3oM728AQYuQTHn2Fpp4+hcxMZGVFO1Ro5OkyUxRoGqYn
 papg==
X-Gm-Message-State: AOJu0YwJUpzirvb6EI7vpfYLlbbbTpYTHBQ8ibgXKC8RydB4idxzdzzc
 tTKKvE1RwSwGQmpEhctms0w5RnwkaPWISstr92Bmb/qM5rd3RiWc33wlKMZU
X-Google-Smtp-Source: AGHT+IE0f2OZtFmdNQ8EosBQP5GiRkLoXDa9GPXKWdlT0V5kc2PPVlvLQ8bACLf/mDYVu2RhlZGvvw==
X-Received: by 2002:a05:6602:6216:b0:835:4856:648f with SMTP id
 ca18e2360f4ac-83548566758mr18155839f.13.1728490652235; 
 Wed, 09 Oct 2024 09:17:32 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-835484aa1c2sm2110139f.25.2024.10.09.09.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:17:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 10:17:29 -0600
Message-Id: <20241009161729.3812839-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728490652; x=1729095452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QxuFpNpVoJ9n9cmuM6MyAAMWttbO2YCG3EMwHxhRsNc=;
 b=m+rO88Ww2VFY5ULldoUx9CjL6e2bqozIG7KKzF3fHDkMGh3ouAoKveiXOzcKg4byhN
 tEuzr9lvf5e7vvZIYRx7ouaBWIUFHltcIariQE9DWSHElLqVZuPPCV2i3D9HliwRJnoG
 dS68iifL/Ti7U9fH5Q/cLQEAlb+uOaTqwuYlQhqNWKn2K2NKFpnQ97xwjRzpSdwORC/A
 gfCGBMWs/Fdu6KyDD74NHruhbS1nVp3B69tzMi4vaRGvlrCzP5Q2rJ2vGGsF/hDa4qzm
 o2qI4BLq0mx04W+twjrgHGp4IsY2REw76bJkJcAdj+wubg9IDseIr072rihBWhidytX2
 A0qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m+rO88Ww
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio-reflection: bump to
 version 1.66.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-grpcio-reflection/python-grpcio-reflection.hash    | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index 756884db1c..6fce5c954f 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  1e431e1e665891fe5bf985f1772ad05d  grpcio_reflection-1.66.1.tar.gz
-sha256  dbc39d2ccce82bf13046b145b97bc9542b3b26419a848ae64a5b72634ded14ca  grpcio_reflection-1.66.1.tar.gz
+md5  549455c15bdfce71667ec0d918465236  grpcio_reflection-1.66.2.tar.gz
+sha256  add827e2deb56e96803c82ace1d4e77fa0c8ec3747d6398e9951f739d71067d4  grpcio_reflection-1.66.2.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index d51316c250..b336ebd945 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.66.1
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.66.2
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/f1/1c/8930a313a4cd60198921cedd4f6c2c88c282280780eb41995ddd980d6de9
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/58/3f/85a801dda6357b01060ec743aa3831da77d222230f86f872b77cc7af002f
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
