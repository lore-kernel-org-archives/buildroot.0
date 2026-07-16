Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E977DC4450A
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 13:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB31A40557;
	Thu, 16 Jul 2026 13:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eu0PZub-0rFz; Thu, 16 Jul 2026 13:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 498FD407FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784208650;
	bh=sOmTdvf6GmC6k3I4WxlsTKHSwDNuIaT+w1LBaHzME2Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KPOosu19y2ft3PfExsPkw+g60I3tz4LtzFDxNgumHbisRj9ATDXpdhL5IVto0v4Y4
	 zzdtoBhMUl4XrsyQGMq2UlkD4EUC+ejB9OJNK6V++nnYXSF55SeV7m/D9OYtzf46pr
	 m5bue2zmId+p0JRJeEKEup7+TfsfmSoICInRenEFs6DiDcTNTlLzpZxqTaBA2jqNIY
	 +I2uTvPPFA5MqbPmMwFIR0xx369mmZagMp3PFjCjKy0X7Ukkhbde79c6SKXNtXnWqm
	 TbrTyPMDMXmcvmqjtvp1JKobM2sfUFDtC7Vv7sn+JYiWiDRcIwLsvTmmY2i1UrQqCy
	 v3bZhcrDtKqHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 498FD407FD;
	Thu, 16 Jul 2026 13:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7247636E
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 13:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63A9A80E75
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 13:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhqxnxPRpOwW for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 13:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=aford173@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF91380E6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF91380E6E
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF91380E6E
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 13:30:46 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-51c16ac21acso22623771cf.0
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 06:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784208645; x=1784813445;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OES7/i299xDOKi03WkzvvaaBLeCyj5G1MlBuZyK/Lzw=;
 b=mZIuCakRgzlJFzAPEy8CILahmioha59zeXiBhMvZ1DhHGfsuXHIMqdhNj1m5sbmXsn
 XXv1bVZoJSMa9VMR6V5azMIaRjykl1B6H46aMBoLlqZu7tNckjKRAnOSQ5RNimRjNM8Q
 j4e2ASH0egtdw8hOmvand18vV33RA34o9Eqi/iJWt+i2oCZ/xz27hxSPM/Fie0VZBYNj
 WnZmv08CWUlD+sJYt5YggETwy6F9W830HALwEksle26K9IjJmqQAXOHT9jIAbqWbd+30
 1PmMbcJnhMQE9RY1kFcQW1FSiCiJ+Yjjqv9MkI41vn9NomI/r+253Lve4RaF193gAah4
 dw3w==
X-Gm-Message-State: AOJu0Yw2Ufre2HtQEBfJASFEcM8M6R8c3F1JfeAOYWlAwvozE6JtjuIo
 Zje6ExlKbptUhbKJ6USBcoDsCC8KaQw7i5noqLsRK+aGtXQ7XSoCrjS7MgcVIx8KIMc=
X-Gm-Gg: AfdE7ck4LTMkON4aDGuKvYouYzp54JstHLjxqMC1gUdej3PDaIKGNSEIfpvXg7wMg4e
 i5TjV76tR4I2QnCJF7J1hanXAAibBiSmbyGb44hfMAZmUviw8psvpjPi/1i1K5LOsk1mH9SxF9L
 BP1cE/lhlW7V3opBgoPAvmGc5d8KNpOaFWRZN7ZMb2Ryx7lRum3ev2cbqN3mcEQAN5D2mE7IsG5
 wiZ9MeU+1Udpi+92vyn0NIbOrS3RuzHoU0+8hpKqVVtq+MZGnMg2dbQdY7dk+Yj85721fZp2nSI
 t7zWS6Ntq7KEQ8bWImQncCC//is8fvOCxyslQHiXiut55Mh5wGtBPUs+IhkKoi3x6GOZ3BB6Yb0
 Tnb4+5XbrpSBR9PNEw3HN3UoVyBNe3dpjYk7H2UiVEwdDq24FBMi56aix/uO6atHDOGsTcHHPg9
 h5DCu3YZ/kAbCAJcfR1+7L1Wj8JRAf6H6gUf/78N/v1NGeTbJvne64jt0=
X-Received: by 2002:a05:622a:420b:b0:51c:7b12:1207 with SMTP id
 d75a77b69052e-51cbf304042mr217089031cf.85.1784208645250; 
 Thu, 16 Jul 2026 06:30:45 -0700 (PDT)
Received: from aford-System-Version.lan (c-73-94-212-116.hsd1.mn.comcast.net.
 [73.94.212.116]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51caab6d574sm158025281cf.3.2026.07.16.06.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2026 06:30:43 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adam Ford <aford173@gmail.com>
Date: Thu, 16 Jul 2026 08:30:41 -0500
Message-ID: <20260716133041.2147516-1-aford173@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784208645; x=1784813445; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OES7/i299xDOKi03WkzvvaaBLeCyj5G1MlBuZyK/Lzw=;
 b=sHLprD73R36+YMXAliTvkLM9l+EpryW1orV6/K+tPu2K3+yFL0ZOFp90ZwNQnRwgWm
 41GHYqmtnWrq4NDvoWQW1Xj01jh7Tdyt00zrAqCpcH9pH60qp1bT12k9ZlxccR2yKzI5
 r0DotX4qG+jUNWkWiMOawYEu+djP5YoqOVZWXwb5x5Jlf19rLamZ+Z5tFCTl0VDiV5/X
 vyFf2940XL+9XQkG40WvO4hmAuz5GECMm11b2D5mUBk4uixNI0qH9AVd7QPfIeKewobE
 97a9v/wu+pUmTJvKWTdC6TbeJCbcKw/W/jV0Sd/toTVU/EoSSQEfgjzLsLHNO5FaSlLo
 aJJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sHLprD73
Subject: [Buildroot] [PATCH] package/x11r7/xwayland: add mesa3d ordering
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Xwayland's glamor/DRI configure check looks for Mesa's dri.pc in staging.
Without an explicit ordering dependency, a highly parallel build can run
Xwayland's configure before mesa3d is installed, failing with:

    ERROR: Dependency "dri" not found

Add mesa3d to XWAYLAND_DEPENDENCIES when it is enabled.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 2b8513602c..bce9a572ab 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -30,6 +30,14 @@ XWAYLAND_CONF_OPTS = \
 	-Ddtrace=false \
 	-Ddocs=false
 
+# Xwayland's glamor/DRI configure check needs Mesa's dri.pc in staging.
+# Without an explicit ordering dependency, a highly parallel build can run
+# Xwayland's configure before mesa3d is installed, failing with:
+#   ERROR: Dependency "dri" not found
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+XWAYLAND_DEPENDENCIES += mesa3d
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_LIBEPOXY),yy)
 XWAYLAND_CONF_OPTS += -Dglamor=true
 XWAYLAND_DEPENDENCIES += libepoxy
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
