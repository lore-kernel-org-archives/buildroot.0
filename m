Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DFCC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:47:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 614D860E90
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 614D860E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 395DD6064A;
	Sun, 29 Aug 2021 02:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knOJsvWM-v6E; Sun, 29 Aug 2021 02:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E2DC60648;
	Sun, 29 Aug 2021 02:47:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5DA5A1BF37E
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D3046064A
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnBQzVuZa3Ag for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 02:46:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 247896061B
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 02:46:44 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id y18so14773325ioc.1
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 19:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HQfW9jqFwiSf/TywCXdXl7fU78ZCX0psIy5487bwBe8=;
 b=pUh0FN0rY6SFnpy+TpwfB0aHSl/5dvpIpzmgZG+3ATQ6elXHpSaixDEJ6nUmH+mk7G
 pnOAUAzmfGk+VbOjKdz1lXZa1bD27Z7qq65PpzX/DOJcfjOCmQjuKvZX7zLPkCeA+AFt
 2KuSX4Ar6ZlnQRVXXEaBi2cpzxWPZfhezOn5TVXRhhsetp42FSW67BHIdfEeEPR13WCr
 M9OsqIrve1YA2w+u22XHobDXqsKpidfWAPy0Yu5tp08Uy9jkLlgXHxyWRM7P6x9ELtcV
 Ku+1ZN/8hGoA0bhaAQjsbyhCealGtPDeGhpWWd8mwm75vtrV3/dVqOBhxRsOWUnRwFzL
 6M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HQfW9jqFwiSf/TywCXdXl7fU78ZCX0psIy5487bwBe8=;
 b=NfHlbqx6pLW7Nao+kcbhE6cNoafcVWONfYgSWYWIlG7T9qNtXwe7E1UOVwFUBlaE6V
 qtaO1rGRQfLQd52vQP2HAY8XbyNp8HMBkKQOphjaYyOcLHZPZ+topPMMCV4WxLPpJ9so
 ieWQg4WfJN91CAorUB4aIO87XBchhUhHRYPsSvdsP5jMZsQa8O2RYGoTqCu3fJopSoJ0
 kblhAT5BQQDyLHtwpCrcSP+BIxPVgOlDXVH/+QfqFRPlAAuX+ee5bxOrXFVR7XL+cnDj
 QmCYQbIz8bXW+8xkT0X9TqDTEAiLpcoqtMXW7YoV/r4eRiCTkWHnrtNa+eRtxNlNf8tw
 MNzA==
X-Gm-Message-State: AOAM531vrySqwlUDFrN8vA7RIL9t7t3QrBfQ5kIlBfL9QTyQo8dA4LBl
 uDEJJgRAkF7oNS/SR82Oj8LgbyvKOXc=
X-Google-Smtp-Source: ABdhPJzM1MYqm9B4Qv/DaCVbSv9DIZ+sOp1/M65oATAdw4viSrpawzeKlRWz/87mC8slULtIkzta8g==
X-Received: by 2002:a5d:9284:: with SMTP id s4mr13358669iom.131.1630205203119; 
 Sat, 28 Aug 2021 19:46:43 -0700 (PDT)
Received: from james-x399.localdomain (97-118-237-25.hlrn.qwest.net.
 [97.118.237.25])
 by smtp.gmail.com with ESMTPSA id g23sm5741951ioc.8.2021.08.28.19.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 19:46:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 20:46:28 -0600
Message-Id: <20210829024632.682029-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829024632.682029-1-james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/8] package/swupdate: enable/disable systemd
 support automatically
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This needs to be set properly so that services work correctly.

Enable disable automatically based on BR2_PACKAGE_SYSTEMD state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index fd0fb763c9..c9bd486127 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -139,6 +139,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SWUPDATE_DEPENDENCIES += systemd
+define SWUPDATE_SET_SYSTEMD
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSTEMD)
+endef
+else
+define SWUPDATE_SET_SYSTEMD
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SYSTEMD)
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUBOOTENV),y)
@@ -192,6 +199,7 @@ SWUPDATE_MAKE_OPTS = \
 
 define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_SET_LUA_VERSION)
+	$(SWUPDATE_SET_SYSTEMD)
 endef
 
 define SWUPDATE_BUILD_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
