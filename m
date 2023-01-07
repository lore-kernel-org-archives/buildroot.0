Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C898C54EBD
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 01:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8875A402F5;
	Sat,  7 Jan 2023 01:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8875A402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77eQjbktmtuU; Sat,  7 Jan 2023 01:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D38E04026A;
	Sat,  7 Jan 2023 01:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D38E04026A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5244E1BF59B
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 01:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DD244026A
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 01:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DD244026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86eATHVFJFIs for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 01:04:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9194140022
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9194140022
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 01:04:46 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id m15so1904712ilj.8
 for <buildroot@buildroot.org>; Fri, 06 Jan 2023 17:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N65mU3OyEx3Vs2w/1/SxgUkq/DjUQ0dv+cMUDM78giw=;
 b=OF2Hb9HPGlL7np8Y1CrNSB430eYN1yO3A5+z6ewotYpKO2syH0a2QXH2gT5mC8RfpO
 +vXdQHvtWKAhxx/tD19P253EWXCZ1VBuMukrF7C4yh6PivoUMsRpb65tU2nxcolYbhDN
 EbZNKqHIQmJN8w6eKr/79T3sJ5qUDJN7C58YOLKq/SzSHskfYbQtCkU6TG47fsK5NrEw
 ulRLhuCKurpZM02vCLvtE5n3U9JXRRLvUjmhn8mZ1c9/Va+8VHTtBwGBrspDxZgHQ6kM
 Wi+hx8NsgxwyvD50i/hoY6ziiO2Yo4tLDqGrf9MVGkhC413GVd878VdtaVVcjmOcj0Np
 9Zqg==
X-Gm-Message-State: AFqh2kpPv3LR1ZE0P96hsZ8u8cQ0UAvqpV20bulxlSiMS2ynjyrFnZWM
 J1VX3nicdcGapA5MojLUB5n8cGwNmodUIg==
X-Google-Smtp-Source: AMrXdXtW5Hco6ITBkRFja44EK+vouRyeAkGW8TUR23bJsOTpXQvwwfTkwnaYuRy594MFWbeFJP7nmQ==
X-Received: by 2002:a92:870d:0:b0:307:739a:db47 with SMTP id
 m13-20020a92870d000000b00307739adb47mr40414782ild.27.1673053485477; 
 Fri, 06 Jan 2023 17:04:45 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 e26-20020a0566380cda00b00363c4307bb2sm725938jak.79.2023.01.06.17.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 17:04:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 18:04:36 -0700
Message-Id: <20230107010437.2471513-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107010437.2471513-1-james.hilliard1@gmail.com>
References: <20230107010437.2471513-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N65mU3OyEx3Vs2w/1/SxgUkq/DjUQ0dv+cMUDM78giw=;
 b=kvKG3bvUb6ofKNAz+SfhVjexWrYEJwNyyvByRabGtOBhSmRReNROUBlsqDXNT7hhNe
 7eN9porTdDXgPzVxPoybMcPrZsnmX1ZH5PyUfKD5qMgc4HGQV7Hf7BUNym8k40EJJTxT
 t+7lW8h2QuyJUAOIno1nPLVKvJYsoal7Gct8OHImWfyymSfWOl3qBQlFry6Xh3D25a0W
 B03inyhm4llAecdihRF+N5i0fM7QiI9Zkxj1qB3vzuOXDTX5YXoQgNVfmAET90AenA/+
 dxjgsFI7QfNXTMWRLDeCZgyFrSqM/H0ojhR6pQ1DaTs6diiyVKwe7qrvSF5YYznFajr9
 W38A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kvKG3bvU
Subject: [Buildroot] [PATCH 3/4] package/pkgconf: disable ccache for host
 package
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to disable ccache when building host-pkgconf as the upcoming
ccache update depends on host-pkgconf indirectly due to host-cmake
depending on host-pkgconf which will be required due to host-ccache
migrating from autotools to cmake package infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkgconf/pkgconf.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index 5d65f69c10..e9587fae6b 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -11,6 +11,11 @@ PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 PKGCONF_CPE_ID_VENDOR = pkgconf
 
+# We are a ccache dependency, so we can't use ccache
+HOST_PKGCONF_CONF_ENV = \
+	CC="$(HOSTCC_NOCCACHE)" \
+	CXX="$(HOSTCXX_NOCCACHE)"
+
 PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/bin/pkg-config
 
 define PKGCONF_LINK_PKGCONFIG
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
