Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBE4E67489
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 22:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A7646060A;
	Thu, 31 Oct 2024 22:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4LuGQCJW6lI; Thu, 31 Oct 2024 22:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5882860685
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5882860685;
	Thu, 31 Oct 2024 22:16:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1788E5E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1211240142
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDAQlXBg3O7B for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 22:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B47B400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B47B400B9
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B47B400B9
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:16:12 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83aad99d6bfso50747139f.0
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 15:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730412971; x=1731017771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f62rz32H76UG0j0E7regv58BL4+46AN8TKFawbIaPns=;
 b=sVy2tR5HxA2+Rclm9ju2bpxGnwZaLEcrwhDR03hPdaa/d+ASkh+eq9vmpuFo+Nft0G
 sXK0zNThLoJiRXry8KS4C4A1c85yy6BrAGdPDYGWedyVuhnsNvjwuRosyhnI7yw6akk/
 rbgsLci9qh3tAD4OtNiY8Ir9lvwf1Cx0mGwTMQTPUAX7q0/EWJBa2JrR75kM0IA5+Q3v
 njV687uWtqJgwjAUmOr9IOkgNWxjyx/BVNDDWRx78xOhP4ZTdFnjzvN7HW0SMtCHAGSl
 2rHh2/r58kT+M9St4pwliU+0vhdJX5XUsmJurUFsMcBM9M1yZIOZllqdmFJTYjvvnYYU
 TTCg==
X-Gm-Message-State: AOJu0YwsoukA544O3PYqqYCpRlobI7l2GcD4pM20FxupaZQ71HhrWjsl
 iuOTsErIgU2W69raPu+QWOTcexrdYqssPKHdEJBAESEzo+DbiIE/7fgRbQ==
X-Google-Smtp-Source: AGHT+IELkvdfm1rU4xUdF09C7UHxVanwauwl0YqQYIDdUYWodcSdyikYt33jBKn6fO7g5lLskouFZA==
X-Received: by 2002:a05:6602:2d87:b0:832:13ce:1fa3 with SMTP id
 ca18e2360f4ac-83b64faa3f4mr564532939f.8.1730412970597; 
 Thu, 31 Oct 2024 15:16:10 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04977ce7sm458214173.119.2024.10.31.15.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 15:16:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 16:15:35 -0600
Message-Id: <20241031221535.338325-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730412971; x=1731017771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f62rz32H76UG0j0E7regv58BL4+46AN8TKFawbIaPns=;
 b=McpDL2vbHpYG72+eXS/9a+IAHxc3j71DIQxjPgOqkX/aTHTW9g03mU1Q8lYm9TDVW7
 ySACE6WMhKSo8chOiDQEuKdLRFyHhOI5zUzO6Zn3gLMbEUX1WjWhH/kelgnEKnmInTlg
 PxVyiRmFYDSIeg5E1Ni+Yt+41Iys/BPZS+xiZJoFhqyIRTQ1/oYmGxywPERcs6NnIV6P
 Uk7x+Cmlzzcm6smKhbPTZScblJrlJ9iadUlTGvo2uq4uauUKyivIA9uAzfHxTwwooBmV
 6PcwYu7W1S/PI+n9scN02XUmltA2Pd5MBDJg4llFuQtFpfXatjcnEF94j43ztcrlX5nQ
 lRCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=McpDL2vb
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: fix webp
 DependencyException
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As of baa3db0c34e826cc1c6469fd8ecbfbc5c2ef2e2c webp mux/demux are no
longer optional for webp support in python-pillow.

Fixes:
DependencyException:
The headers or library files could not be found for webp,
which was requested by the option flag --enable-webp

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pillow/python-pillow.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index e87c817c68..ed2668f03c 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -58,16 +58,11 @@ else
 PYTHON_PILLOW_BUILD_OPTS += -Ctiff=disable
 endif
 
-ifeq ($(BR2_PACKAGE_WEBP),y)
+ifeq ($(BR2_PACKAGE_WEBP)$(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yyy)
 PYTHON_PILLOW_DEPENDENCIES += webp
 PYTHON_PILLOW_BUILD_OPTS += -Cwebp=enable
-ifeq ($(BR2_PACKAGE_WEBP_DEMUX)$(BR2_PACKAGE_WEBP_MUX),yy)
-PYTHON_PILLOW_BUILD_OPTS += -Cwebpmux=enable
 else
-PYTHON_PILLOW_BUILD_OPTS += -Cwebpmux=disable
-endif
-else
-PYTHON_PILLOW_BUILD_OPTS += -Cwebp=disable -Cwebpmux=disable
+PYTHON_PILLOW_BUILD_OPTS += -Cwebp=disable
 endif
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
