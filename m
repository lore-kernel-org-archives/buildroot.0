Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01955C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 21:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A9060744;
	Sun,  3 Mar 2024 21:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMi7xRpkX6wI; Sun,  3 Mar 2024 21:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF66E60AF8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF66E60AF8;
	Sun,  3 Mar 2024 21:58:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77EFD1BF33D
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 21:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6567E60AF8
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 21:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXoUVEtlsh8u for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 21:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46CE560744
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46CE560744
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46CE560744
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 21:58:37 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412e14dac68so3443095e9.3
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 13:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709503115; x=1710107915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uZvrhVPPlYTnlc6pHt/WFcQvRNyu8TNFxZ3mVqmfNXU=;
 b=d1qZ0172A1ITeRv98yNUZe8MOwXjFYh5mHTAiumg8xozosQgQxw+OxFGVAtLGhEN08
 bQ5UrxCajChMlC/Z+uln5WX0NPMb4BqtZT5QLvcYQrx7u0inwcPEXtMn3lMK4NLvz/wf
 jqjFOiAWWv8yN0Ui2xRksbC9QEWwG78+SvMychKj4TsOs7YzTf6woWKz5fg6JknGx66Y
 Tbwr3ztwhwefOhIVfYOCkpwfMxEoEvt1CpHM6Y0hgvHWrh3EpJ97mXuycGI/1zy6sKbh
 vuGDwsK8kzqRhYCIaZmLK3dLcN6AcmxnS/4wLv7yZdF1pyuiJxFe0dKgIH60PRJ8oZJS
 depw==
X-Gm-Message-State: AOJu0YyN/gp7iscaCU1m0+qnZqjfI2Xmongd++Dvgai+Xgm1Gu26Kb2a
 kJRDWResd4Q58xtREqglxCQL7v+04rf/DzFRdZvvKLDKcWHYyfSH8SRrg+Mt
X-Google-Smtp-Source: AGHT+IEWIKvRUjCuSVObEdWb4gL44czIHneKqbCJbSlTzueeYTO3mDUnlpsI3P2qBrzYjr09kWAdJw==
X-Received: by 2002:a05:600c:384c:b0:412:e37d:e793 with SMTP id
 s12-20020a05600c384c00b00412e37de793mr585628wmr.22.1709503115110; 
 Sun, 03 Mar 2024 13:58:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l33-20020a05600c1d2100b00412ca88537dsm8263100wms.0.2024.03.03.13.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 13:58:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 22:58:32 +0100
Message-ID: <20240303215832.6236-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709503115; x=1710107915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uZvrhVPPlYTnlc6pHt/WFcQvRNyu8TNFxZ3mVqmfNXU=;
 b=Rfqy7u+q2vVJXlh/hRBH478Ot21UgRHpgLWHIWyNNhx/905y01+MxU3NHC3ZTE+huE
 MDBfwQLqLn4gClCsY49PUARzf0kmnymJjz0wuZgSXP94ty3ovMI8R82LCzPF6gv+P5HH
 rNEOf2ZX00XSwAHq5GesZF5UE0iCtMrmLk4Pwb5IaZy9Mfi4rs2MpXVRkAU9UScigIAM
 YQ5A8MurabIGjDGLPOwUpRV94aXAA+EkGxhNevLAegUYMhG/iKo6LjvoEpa5VRH+Yv2Q
 pxesxEJN88fHBT88YvkqnjLhdi1XvC3YFw3nzvAhZmWu5OseqUXMLIzQnPzYBVdgdFVB
 aDuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Rfqy7u+q
Subject: [Buildroot] [PATCH 1/1] package/fluent-bit: force libopenssl
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libressl dropped engine support since version 3.8.1 resulting in the
following build failure since bump of libressl to version 3.8.2 in
commit 21eca49ed5110872407b76ab9337d2877c4cda24:

/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/12.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: ../library/librdkafka.a(rdkafka_admin.c.o): in function `rd_kafka_UserScramCredentialUpsertion_new':
/home/autobuild/autobuild/instance-0/output-1/build/fluent-bit-2.2.2/lib/librdkafka-2.3.0/src/rdkafka_admin.c:5909: undefined reference to `RAND_priv_bytes'
/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/12.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: ../library/librdkafka.a(rdkafka_ssl.c.o): in function `rd_kafka_ssl_set_certs':
/home/autobuild/autobuild/instance-0/output-1/build/fluent-bit-2.2.2/lib/librdkafka-2.3.0/src/rdkafka_ssl.c:1384: undefined reference to `ENGINE_load_ssl_client_cert'

Fixes:
 - http://autobuild.buildroot.org/results/dd74eb4e31e0e4d23e7638cff47c6876fda59952

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluent-bit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index dec40c4371..53284ee17d 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_FLUENT_BIT
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBYAML
 	help
 	  Fast and Lightweight Logs and Metrics processor.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
