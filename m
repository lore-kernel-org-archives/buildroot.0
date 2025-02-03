Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED30C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 09:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA75B81F72;
	Mon,  3 Feb 2025 09:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7e16kwBe-TZZ; Mon,  3 Feb 2025 09:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E33BC81F0D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E33BC81F0D;
	Mon,  3 Feb 2025 09:34:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B73EA1A2
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C16681DE9
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqG9G2VpIXLW for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 09:34:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A042B817B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A042B817B3
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A042B817B3
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 09:34:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso27831555e9.3
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 01:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738575250; x=1739180050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mx8Qk4S81/BaQ7bB4V5pfltnYjHhCc/BKcvWzghZzTs=;
 b=njpa1N8VQqb6VkvRUR805NlnkV3JdfY/Mx6KhfOx9umLgBeOpLW/9x+VJJKtBKZykp
 QWIke1mJRaXzuPfo+CyqDXwj9dCCcAoLOAVzGyMnepAZjBF4f/5IQvXnow8zZD4Dr6Ae
 Jws+oxWG3+Usf7xgPrOpXTT8eThrWnNM9qJ5+y16uT5b3japAj8FKoRbxInR4D/FwgRr
 P4yaWhv+79h2r6Q0aKh+w9+MMPpZRHfKhuCszxigq+9wIQozk4qsFjVBGEpp57cVMTB4
 fH1q0AYzPXRVrdyUjcH+f/u61p26vYXcxqqvuxXVqdmaV7rB9fsgtMt7nWVzbEXYIvb0
 expA==
X-Gm-Message-State: AOJu0YxG8GbYD4nZdJEIB4Fe7uQMuPI3Wj3XmymWwveZnLVIhIiIlrUU
 jS93Z0tchVrPNdHvFFjMQGcsgNz2coVAA9o4VmXxmL9GuwJ5HLZ8iYO6EOWJLyc=
X-Gm-Gg: ASbGncv8qHyzTnek3pQY+4MtrFqGLjed5FfmUlJqjPbQLOkrdRmpIXrTVCSj751gKzU
 hc3d2Z3VzTll5KbolaN0BFuDmdY/c350CzTTc6RL0oOy30L1Hr0suCqS1uNki460esOBJD6nILm
 91jKA0lVwMxGrR6hM/Rj3inYr2wxEFJb/iUp2dGGFmk2ogh1w5MKsNMju8Rq9URHklaAtouZKFx
 wxPDrMn17EcdN/HALz+KXus29IHkE/EIFv2MglReJMQ4SGwir6omubXEs3DUlqClMk97xhQS2KW
 FTqsdz78CcF+bvbTKdHYhLUEEbxUlabE3MECRr17v6KpOMSn1a4N
X-Google-Smtp-Source: AGHT+IHDqqkVUuCj40X3V0lY9vS2Ja3n3+XokyIlo+oJKgv/m5oS7vdSLwTUYPbQxKhxDsDuK9i1zw==
X-Received: by 2002:adf:ee8b:0:b0:38c:4a5f:bf82 with SMTP id
 ffacd0b85a97d-38c520bf3b8mr13488204f8f.50.1738575250425; 
 Mon, 03 Feb 2025 01:34:10 -0800 (PST)
Received: from landeda.. (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c12193asm12147327f8f.49.2025.02.03.01.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 01:34:10 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  3 Feb 2025 10:34:08 +0100
Message-ID: <d4b47bd24bbd978c95ff78d9f84d44ebe0214dfa.1738575233.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1738575233.git.yann.morin.1998@free.fr>
References: <cover.1738575233.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738575250; x=1739180050; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mx8Qk4S81/BaQ7bB4V5pfltnYjHhCc/BKcvWzghZzTs=;
 b=g2Qwak4WXwIX7AmM6fYP4uAt37jdzDy0wLrVndzXC9lG7QET0aNrtQdhb3TCd2NTbh
 A1M1XE2L5M91PLo3ddheTT9DoJaf0zS8JONpS8yaVrE+lfKtH0SYTRvX8nvyhgt3jHmN
 Y0xGSoVjC6NhZiu84a4AsDztKSL6pXc4RdRjUcRM73Aw1cv0LSq9ZzO0nRRPLm47B3sU
 JmfPhPV4zqqSjctbkHMkwcb4G+z4jinM4ZuQQMuDYbKC+N2nuLEbzEoZSW0pKWIWqzts
 AIrZ0gwaKcBMgKV6tb2Xf26cvctpKGeuPrqiOcF0BJiJUn0J2XislJrwwen0vF+Laaej
 gucg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g2Qwak4W
Subject: [Buildroot] [PATCH 3/3] package/libsigrok: install udev rules
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

Some devices that libsigrok can talk to, need a firmware to be uploaded.
libsigrok comes with a set of rules to allow non-root users to upload
those firmware blobs.

Depending on how the system is configured, different set of rules are
needed [0] (yes, it's documented on the fx2lafw page, not on the
libsigrok one [1]). Basically:

  - 60-libsigrok.rules is always used;
  - 61-libsigrok-uaccess.rules is used when systemd-logind is used;
  - 61-libsigrok-plugdev.rules is used when systemd-logind is not used.

For systems without udev, it is the responsibility of the user to
implement proper access management if they need non-root to upload
firmware files.

[0] https://sigrok.org/wiki/Fx2lafw#Install_the_udev_rules_file
[1] https://sigrok.org/wiki/Libsigrok

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsigrok/libsigrok.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
index 639ee4dc25..22524dd4f6 100644
--- a/package/libsigrok/libsigrok.mk
+++ b/package/libsigrok/libsigrok.mk
@@ -65,4 +65,20 @@ else
 LIBSIGROK_CONF_OPTS += --disable-cxx
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+LIBSIGROK_UDEV_RULES = \
+	60-libsigrok.rules \
+	$(if $(BR2_PACKAGE_SYSTEMD_LOGIND), \
+		61-libsigrok-uaccess.rules, \
+		61-libsigrok-plugdev.rules \
+	)
+define LIBSIGROK_INSTALL_UDEV_RULES
+	$(foreach rule, $(LIBSIGROK_UDEV_RULES), \
+		$(INSTALL) -D -m 0644 $(@D)/contrib/$(rule) \
+			$(TARGET_DIR)/usr/lib/udev/rules.d/$(rule)$(sep) \
+	)
+endef
+LIBSIGROK_POST_INSTALL_TARGET_HOOKS += LIBSIGROK_INSTALL_UDEV_RULES
+endif
+
 $(eval $(autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
