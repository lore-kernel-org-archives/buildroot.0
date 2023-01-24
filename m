Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91457C54EED
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 18:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F4864038D;
	Tue, 24 Jan 2023 18:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F4864038D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mBpl6jvGYcC; Tue, 24 Jan 2023 18:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A6524015A;
	Tue, 24 Jan 2023 18:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A6524015A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4951BF3B8
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 18:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34CC882200
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 18:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34CC882200
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Guf-5LlY838H for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 18:42:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF92F821F3
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF92F821F3
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 18:42:56 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id kt14so41566040ejc.3
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 10:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0BlycAF6mO2AnsrDTcHvXERYlNMzFJNLthnAMAla/t0=;
 b=TlGxqZDkCcy5rVzEEn3QJOTvugNKBTTJDGpu5l4a/1ChUQYxoBBcTVxHTyhv5AsTxh
 /LUL/s04mbbPWwh8jfq0jX2Ot2ouBXM4vLXmg4/XdY/yX9zWzJQkf8fGJ1ohMmGdFKMy
 JFfzZEY+EyMr0K8CshJgSof31dYqZa3ae8T/OsVq19fU7EGSPRqqhq8dwYes0IwwhP3J
 6WVDi2MV5n0DsfbLz7pjDhFQprXT8ayE7LG+z0362Mib5LUm7kUyRuoRh8sh6CuaiUAx
 lmTfe3FEDOSSVvU1fe+G/MOXAbttEKSG5bH2Plja+T89bZKrwgChSwSAJcxbBbXBFEZJ
 mBMw==
X-Gm-Message-State: AFqh2kpC6uzTN67t0LjBhK8XMtFD0a58md0e9YUk7Qz7xCJ270eKk7jn
 3p6Ql0HzvkXJtjrveZNOGewtSijMdGc=
X-Google-Smtp-Source: AMrXdXtZR/VouBVcms8XxhOnWVenA44n3E/J8Xj0AW4qtyf+eF+r/uknXPvXme2s8rNGDdWL+C38hg==
X-Received: by 2002:a17:907:1621:b0:870:34c:97df with SMTP id
 hb33-20020a170907162100b00870034c97dfmr48839625ejc.4.1674585774367; 
 Tue, 24 Jan 2023 10:42:54 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 tl8-20020a170907c30800b00872448da227sm1242669ejc.41.2023.01.24.10.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:42:53 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 19:42:44 +0100
Message-Id: <20230124184243.7351-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0BlycAF6mO2AnsrDTcHvXERYlNMzFJNLthnAMAla/t0=;
 b=HfYWKbPzVByUZ0LblmrJZOIf3SBIaXmxZ3/Qzubj/Y9Xqu6hWiIYmeQSGuhrfclncw
 kjNuqp6GHrGR7fOCKFZqCI8rgdbY0DplXqPlz7Pkutk+DHCXoF/SGwG838xV4v0kCoEU
 JYk7wYid3/jFA2exbk6fSuHwYvD+V6ft7zv0Xe2flDGSfRp7tz5z733DjmR18J5jMk7Q
 88+Rw7SFyL8RqYGA0hPrjT9myvP5q1tNWBLXU619eDon5qcHhRLEpAwCXwDHItVjTmPK
 molXxHyjNXUxn3+JT4CJeFcx3tuQU3+NyAGE2vGlqGwNMmzi/T9RBJT3cd4KSSPON2BT
 QSeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HfYWKbPz
Subject: [Buildroot] [PATCH] package/mobile-broadband-provider-info: bump
 version to 20221107
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 .../mobile-broadband-provider-info.hash                       | 4 ++--
 .../mobile-broadband-provider-info.mk                         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
index b0c0db1b84..c965f5c783 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/mobile-broadband-provider-info/20190618/mobile-broadband-provider-info-20190618.sha256sum
-sha256  c22d64a565d1975b9eecb6ed2eeaef18634bc6f385c8137d05e845d8fb3cce5b  mobile-broadband-provider-info-20190618.tar.xz
+# https://download.gnome.org/sources/mobile-broadband-provider-info/20221107/mobile-broadband-provider-info-20221107.sha256sum
+sha256  d93392566c347a96eed95da8c66a5da0dd94f4115cfb3a305ff2682c64cfd810  mobile-broadband-provider-info-20221107.tar.xz
 # Locally computed
 sha256  3d510b215a33087b9ceb9592da21575ea1f9f98bd4d983a38e65fe851a552174  COPYING
diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index ca6a8387c5..2744844951 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20190618
+MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20221107
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = https://download.gnome.org/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
