Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF28C64EC4
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 08:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E30C66112F;
	Wed,  8 Mar 2023 08:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E30C66112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFg_l9-0_iv2; Wed,  8 Mar 2023 08:54:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1796961139;
	Wed,  8 Mar 2023 08:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1796961139
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF8581BF844
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9D5A409A2
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9D5A409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFcRvHSM-ywL for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 08:54:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB505415F6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB505415F6
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 08:54:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h14so14596832wru.4
 for <buildroot@buildroot.org>; Wed, 08 Mar 2023 00:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678265639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pfz+GgS/S2WiB6SohC0dvX98eYcutkFOAscJxzQdxD8=;
 b=2rAMgTbTF6+Rm1H7867njrNu/g3q0INCbwH4CkXfLZgW3cIibV8TuPyX55kgwyUVqT
 CP9ZEPOURqbrPwfzn2BF3JeW7j2Qk9WvWG1KN9JEk6E1VlAFNbX/qw9UChxL+UxVPfak
 8zi1kFdGvPgaEM54jcOAqbVEkZkg93gw2uUhUevQ71csYOwsy0lY33wX4nqyQ7bamLXn
 0ZnNYnGhbvT0mIbJcoAXu6eQHRlh31juyvG9EHTj0pIF4qqzPUqMRj6eBlOW6lXzOfD/
 umNjezkwKBN4BiGbfCEwgDNwJNcoN9BjwZ0N1keELRedAAKydPdcHOeQhQbZJFyiYoGF
 XhJA==
X-Gm-Message-State: AO0yUKUG69y3g806r7KEbhSCyQ+CWfn4uJFSreyqTeDIBSN/WT/ogz81
 khpZ9ZMBatYXW7IdpFO6q3IiAwF1gGobXbbNOdU=
X-Google-Smtp-Source: AK7set+SQbYkr45FVWzsJmv8GwfuWgK84LH9ty2OXNPGaQw8r3Lnxszl6Cry3OZ093fBrxqkfMLmXw==
X-Received: by 2002:a5d:4ecb:0:b0:2c7:17e0:54f5 with SMTP id
 s11-20020a5d4ecb000000b002c717e054f5mr10073117wrv.13.1678265639661; 
 Wed, 08 Mar 2023 00:53:59 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:3078:ab00:ee8d:4e07])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a5d508d000000b002c54536c662sm14879471wrt.34.2023.03.08.00.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:53:59 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 09:53:52 +0100
Message-Id: <20230308085354.127183-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308085354.127183-1-sebastian.weyer@smile.fr>
References: <20230308085354.127183-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1678265639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pfz+GgS/S2WiB6SohC0dvX98eYcutkFOAscJxzQdxD8=;
 b=NGtv4S5A7IebrtEuuJNjHSPeikPFH9/oncJn2CaHlYh9o1oycjIOhGsXMLsKDwc2JD
 iO+OX8PIzoPJOZVaMWDBduD3/uaK7EdFKoDwLcj4Bv0TYk2uALxccPsg7BOfAG4nlU2f
 bZxJJp+O3kWTzzZ3t5fkjc5IGAYCRfe352aI8NfFIyE1f8QwoIx1TUpTUOx4bglMm8Gz
 lT9qAgDgA1ntfr4Y265E7Fg2RliAIBNk4o9aXxg547MUy4GrJVIzRp4r/6QECMDLr7J4
 h5hOzfxLhWXLIehIiWO4914IeHasJEBvhA1LidWMMkVMxNx3p22KfZyuYLxHRqZGOvcO
 L7cw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=NGtv4S5A
Subject: [Buildroot] [PATCH v5 2/3] package/nushell: Add default configs
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Automatically place default files for the nushell environment and
config in the appropriate folder to avoid the prompt at startup, asking
if you want to create them.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
These default configs are optional and might not even be necessary, they
only prevent the prompt at the first startup of the shell
---
 package/nushell/nushell.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index 836f414d0a..0a596c39fa 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -10,6 +10,15 @@ NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
 NUSHELL_DEPENDENCIES = openssl host-pkgconf ncurses
 
+define NUSHELL_CREATE_DEFCONFIG
+	$(INSTALL) -m 0644 -D $(@D)/crates/nu-utils/src/sample_config/default_config.nu \
+		$(TARGET_DIR)/root/.config/nushell/config.nu
+	$(INSTALL) -m 0644 -D $(@D)/crates/nu-utils/src/sample_config/default_env.nu \
+		$(TARGET_DIR)/root/.config/nushell/env.nu
+endef
+
+NUSHELL_POST_INSTALL_TARGET_HOOKS += NUSHELL_CREATE_DEFCONFIG
+
 # Add /bin/nu to /etc/shells as in package/bash/bash.mk
 define NUSHELL_ADD_NU_TO_SHELLS
 	grep -qsE '^/bin/nu$$' $(TARGET_DIR)/etc/shells \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
