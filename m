Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B4CC433FE
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 16:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2780060C0A;
	Sun, 29 May 2022 16:56:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 364Wln3qKCCi; Sun, 29 May 2022 16:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C06360BC8;
	Sun, 29 May 2022 16:56:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C93A1BF3DC
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 16:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78F464032B
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 16:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUzsPiqkmj5Z for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 16:56:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 327164018A
 for <buildroot@buildroot.org>; Sun, 29 May 2022 16:56:33 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id rq11so16946124ejc.4
 for <buildroot@buildroot.org>; Sun, 29 May 2022 09:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wQ+uyjpMvR5TqHp/l2vwfM02TK7XUhafsnasThJvZnY=;
 b=0R/Mc/vBWRWsY1karYknfSSOWfu/kLzrGYYridcubERhGAIyjRUKpbwukeewY+oVjz
 o+J0Ep/fCcsYCw5YVaB6/vDzcm3xBpdAIldnXLKn20MqwlXhFe7SwU3p+mTqnfaTODd8
 1KJTzFtgugFF/F0xdJFOOZOIsslG5otFwcYD2FxEETpiEwYu77H5ZD3HsqFLeOm8vVc9
 NwBDUeG/vIowBJ6TBf7AwxnYGy+qtYyFf8izTShRBJ6r1NVcdOdfOe5BdTG13gcyAKCt
 swaolUBya8BQQCxpPNM9m09aho5f3Iy/H7BVSu07v8BIdEhlDhghVgq5SlPXiiKKbTap
 5BWw==
X-Gm-Message-State: AOAM533jkoqaZOhxsBN/6mvZ4jsP6DDQ3qdhTHTl5qDspAODaNbTcr5a
 9iPoUrHdMkiNgL/Vh5N4bgnJr6RvI0Q=
X-Google-Smtp-Source: ABdhPJwZ7Wi56fbO17UfGRwR/JhTCAupVpc+K6xARLAz5l6rWtxXBcjmgz19ltz0EdkUULR2M8U+1A==
X-Received: by 2002:a17:906:a5b:b0:6f4:55f6:78af with SMTP id
 x27-20020a1709060a5b00b006f455f678afmr45876880ejf.238.1653843391173; 
 Sun, 29 May 2022 09:56:31 -0700 (PDT)
Received: from localhost.localdomain (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 d2-20020a17090648c200b006ff59151e34sm1246360ejt.39.2022.05.29.09.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 09:56:30 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 18:56:16 +0200
Message-Id: <20220529165616.767186-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: Fix build on big endian
 aarch64 targets
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
Cc: Cornelia Huck <cohuck@redhat.com>, Cyril Bur <cyrilbur@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building with BR2_cortex_a76 in big endian mode, the build of
the kvm-unit-tests is currently failing since the "--arch" option
of the configure script is not set right. We also have to look at
BR2_aarch64_be in this case to get this initialized properly.

Fixes: f7228dadd371 ("package/kvm-unit-tests: add more arm support")
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 A failing build log can be seen here, for example:
 http://autobuild.buildroot.net/results/760f43a2780b78c753e6b5d631cb744db896f575/build-end.log

 package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index fd07ca85c3..dd8f153710 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -10,7 +10,7 @@ KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive
 KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
-ifeq ($(BR2_aarch64),y)
+ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 KVM_UNIT_TESTS_ARCH = aarch64
 else ifeq ($(BR2_arm),y)
 KVM_UNIT_TESTS_ARCH = arm
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
