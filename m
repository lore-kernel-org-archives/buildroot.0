Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488ACC624CF
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 11:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88581406C6;
	Tue,  1 Sep 2026 11:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eY22LbZyB_DF; Tue,  1 Sep 2026 11:23:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788261814;
	bh=zNAYNJEI9WEFVHqiNduD2yBi0GucXbYgqEIQlLczbfM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=CxGorOfdbkQfykvzkGhZtn7J6chsv7Xfa9k3YslOQynrZUVeypFrU3WscKCesLk/H
	 EOEkfBcXKPPPicJoTZyH2AD5xUGGEQHwAr6iOyX8YcQkyjXs0mTjC65iRjNO3EJaWh
	 n+21AVW9L62MDL3UqB4QITVsR3qeEbsbjUlreglVf3pcB8I/sUkBuxTSxxVmWyDCka
	 AAed1Ei1PpUpkzEfUuPoGHg7EB1EVOUguJ33OwLHoEyZop4kAtHkuVRdMVt7P0Bk9F
	 fD5XyZ6+bgalEBkbODc6smxgOKJCpkxUCNzMgf/cuEMxb6KCgzRubo4MDTqwUfMEAY
	 g3gBgRKfSKO0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D77740612;
	Tue,  1 Sep 2026 11:23:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D3B91D9
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 11:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A94B400A8
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 11:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dH5Yi8MEVZ7f for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 11:23:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25A4F4000B
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 11:23:30 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c2533d83e3bso752567266b.2
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 04:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788261808; x=1788866608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6JHFXqw7zqWKOZTsPE4+4K7lYJo5Xjvy/7cFa8GYR1w=;
 b=HmAl5VpQKSBXaVHulrnYth/2poJ3wfbGzAUPdaEKS69fvbitHpgsbjnDFyhjbRcdcN
 i+53lG7jKO7ZfYYSzRCEenoX81pnfcWYRgqpOqcpBOH9ydOZDPG9RBhpXue24aW7P2sE
 xXWYLCD4/SfvVWhv3ehJcj8UgN1r+u2OtpB4EoQCF8f7vvb/w312H6H7pyxJFbEiJx+8
 jSnlBTFHyCIJKLGw2q2fqV8MrYzWRUWpuMiHmKo10jd9ru2s/oyxMFzcUbZx3mFSIvX6
 1S+rdmyUPBpnqkWyLDIe29IlmbR5WWPk5bcsaFATaj9gK2GYDlebsjdC3AerWo3FCtLF
 qLqA==
X-Gm-Message-State: AFuF++lhPA9uWcUwZhb89U9dI6zpBNowjiWR2ff8T7pudNXxYtGQUOzE
 EVDkYjMJSb+xXALamLa/1oT0AnEgp6dYCpS1ENI0WKBRiRdTNz6iM9xV9dpN3w==
X-Gm-Gg: AR+sD10BV3vft7+ZfdmRIKyfjIWtjYbO9XYPHDGbVpBB4EDfSqFU0MhkIAMmQ0J4X72
 I56/z5razZu3WDkhbsgzG5Ss5Dk/xpKn5LWWw/YsZi5yYctysSv/VRy0EEXoE4ZeBEMxgkjU798
 qh4hLdbYWZUoATHUCR4xGjr59arSqEThIv6J5MKeH1xHpw+okyqLssrzs6SRLcytihsoGzlSYuT
 8ziv9aQSCO+ZI7RkC4CMJcLGrGh4t+OvFlRjdew0VlTSdhy6ecFnqIYqTs5JuWkuC6HjUVaItz7
 dtwzsC0yerdUtk1AEL+EGDsO04LcLrAW2r4YMxtKAVd9Zb4DNkbp19Be5fbph59oITiAvny35Ex
 AFyTYWnoQq2AL60PxNi9E91rXx+lO7KhyQQuUuT+M6gi3LDSXDeFdp1/x9RK1CfBAh5NGFNP3Nf
 NINNZwkGSPCklQfM02zVIEVnm09K+oC2A8PHWIWHc6JmotzFRssgySLxfDFcEgYK678LIJ/iUiW
 O5Uyeo+PGZnjWLud5CcS9dubQgiiPrDzKWGdP5g058=
X-Received: by 2002:a17:907:3c93:b0:c25:30ec:bec3 with SMTP id
 a640c23a62f3a-c25b3be4d0emr460387266b.8.1788261808114; 
 Tue, 01 Sep 2026 04:23:28 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c255f1fb4c3sm575754166b.48.2026.09.01.04.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 04:23:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  1 Sep 2026 13:23:23 +0200
Message-Id: <20260901112323.2671803-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libmicrohttpd: ignore CVE-2025-59777
 and CVE-2025-62689
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Both CVEs describe a NULL pointer dereference affecting libmicrohttpd
1.0.2 and earlier. They were fixed upstream in commit
ff13abc1c1d7d2b30d69d5c0bd4a237e1801c50b, released in version 1.0.3, so
the current LIBMICROHTTPD_VERSION is not affected.

pkg-stats nevertheless keeps reporting both, because the NVD entries
encode the affected range as

  cpe:2.3:a:gnu:libmicrohttpd:*:*:*:*:*:*:*:*, versionEndExcluding 2025-09-16

i.e. the date of the fix commit instead of a version number. Since
support/scripts/cve.py compares versions using LooseVersion, every 1.0.x
version evaluates as smaller than "2025-09-16" and is thus reported as
affected, no matter how far the package gets bumped.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libmicrohttpd/libmicrohttpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 8756adb4c6..69b45a8c05 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -10,6 +10,13 @@ LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
 LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_DEPENDENCIES = host-pkgconf
+
+# Both fixed in commit ff13abc1c1d7d2b30d69d5c0bd4a237e1801c50b, released in
+# version 1.0.3. The NVD entries encode the affected range as
+# "< 2025-09-16", i.e. the date of the fix instead of a version number, so
+# every 1.0.x version compares as affected.
+LIBMICROHTTPD_IGNORE_CVES += CVE-2025-59777 CVE-2025-62689
+
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
