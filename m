Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F38C04FF9
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 21:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AE3D41C56;
	Fri, 12 Apr 2024 21:44:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0Z2gfCf3HU3; Fri, 12 Apr 2024 21:44:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B60F41C97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B60F41C97;
	Fri, 12 Apr 2024 21:44:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2712E1BF37B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2CEE41C50
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnvtnrqACM35 for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 21:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4614D41493
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4614D41493
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4614D41493
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 21:43:37 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4181e10b3b5so1407575e9.3
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 14:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712958215; x=1713563015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ybhZLRueAkiiRn43hFkL5XrJK1pIgPim+RBC8NcL/+o=;
 b=FMFdyjNpghVh/4wnH2dOMAKtz+j1oX+JLLnLqFyMGn4B1esi6rsgnVUCwBay/0rmnM
 /anowseBhVKAo6Uemzi1gRUEZJQRFtKX4CbjEm/xkqLpnxPhViGti5ancc9p05qP/HDp
 sAMdrUNSrkPZCVStzNtwlg9GzAk0GLbfdGNydKKxVLS9MqOn726XoBCrhIE2KJ7TneB9
 TPO8AMvle6Nja7Zum2ZFPEEgi/JsWnhuoSmdGL7gSYgwVuYq5dc9ZKD2HNCxk1rSWVcg
 /L8HxkaUslLcEsVqXZ2co6qIpOkd82FIEsG2DmUiAvNcT5uIF46WYFTfGG2CFKDp3XlS
 n7gg==
X-Gm-Message-State: AOJu0YynpkTXCI+Qoz7Hvu+zFGPi2XSDPMOITT1DIodicOmd+NvfEvN4
 u269/vBn8B9HK1yWWHURge+gvsp3eW3nTiDcSXtVYoSRCzzmYy0KgqBjZ/hY5H1ywygHaatFy+R
 cp1Y=
X-Google-Smtp-Source: AGHT+IF5U6/ev2bkLqRjmqVlBy3wMmfaMkDS4q9HLUa+cKbw5yJ+3Mb/XxyYwYRBMh/KRlMPEaYqcQ==
X-Received: by 2002:a05:600c:3b98:b0:417:e563:4aa4 with SMTP id
 n24-20020a05600c3b9800b00417e5634aa4mr3334914wms.5.1712958215381; 
 Fri, 12 Apr 2024 14:43:35 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk
 (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b004163ee3922csm10034597wms.38.2024.04.12.14.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 14:43:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 23:43:10 +0200
Message-Id: <e73a9bd517211d64f4c0c167a57b2e578665131d.1712957992.git.ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712958215; x=1713563015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybhZLRueAkiiRn43hFkL5XrJK1pIgPim+RBC8NcL/+o=;
 b=Kfo1GW9BLhTwh5BjN3fXIPKwgnGIurrKVDdeLCWfSL5aEA7ndf52x+YL2a6ycUqKzw
 Qtq5TEEobrTDDYSLkAMU2UNubZxcyFZQfku9QRv7Njrl0J+mOYPBBPBIjliJrqE9TvMo
 9dMak1k40gWcpK5U+16aF/F61RRSMFhCvRv1VhX9Eest5udfZns7N9ihTjFGh2I1001G
 nC/RYNp3u+8FU+iAjpZEFaSgrmiZuhbd3HjSAy7Ed4rJP8EUV+XTJOhe2PUDkOV3RORn
 h1XFULbm8Fhz8TgVocLw2/rgpyNXLkKvjmfQgi2rRH0jd3+dp95EqiDHAJ6aBotRBw3N
 nnHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Kfo1GW9B
Subject: [Buildroot] [PATCH 6/6] package/gnupg2: Add host package
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
From: Ben Hutchings via buildroot <buildroot@buildroot.org>
Reply-To: Ben Hutchings <ben.hutchings@mind.be>
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 package/Config.in.host        |  1 +
 package/gnupg2/Config.in.host | 13 +++++++++++++
 package/gnupg2/gnupg2.mk      | 11 +++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/gnupg2/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index f03ca16b7b..635a7ebc13 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -43,6 +43,7 @@ menu "Host utilities"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
 	source "package/gnupg/Config.in.host"
+	source "package/gnupg2/Config.in.host"
 	source "package/go/Config.in.host"
 	source "package/go-bootstrap-stage1/Config.in.host"
 	source "package/go-bootstrap-stage2/Config.in.host"
diff --git a/package/gnupg2/Config.in.host b/package/gnupg2/Config.in.host
new file mode 100644
index 0000000000..c636cbee8b
--- /dev/null
+++ b/package/gnupg2/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_GNUPG2
+	bool "host gnupg2"
+	depends on !BR2_PACKAGE_HOST_GNUPG
+	help
+	  GnuPG is the GNU project's complete and free implementation
+	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
+	  to encrypt and sign your data and communication, features a
+	  versatile key management system as well as access modules
+	  for all kinds of public key directories. GnuPG, also known
+	  as GPG, is a command line tool with features for easy
+	  integration with other applications.
+
+	  http://gnupg.org/
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 986da4790c..b7aa50f801 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -14,6 +14,8 @@ GNUPG2_CPE_ID_PRODUCT = gnupg
 GNUPG2_SELINUX_MODULES = gpg
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
+HOST_GNUPG2_DEPENDENCIES = host-zlib host-libgpg-error host-libgcrypt host-libassuan \
+	host-libksba host-libnpth host-pkgconf
 
 GNUPG2_CONF_OPTS = \
 	--disable-rpath \
@@ -23,9 +25,17 @@ GNUPG2_CONF_OPTS = \
 	--with-ksba-prefix=$(STAGING_DIR)/usr \
 	--with-npth-prefix=$(STAGING_DIR)/usr
 
+HOST_GNUPG2_CONF_OPTS = \
+	--with-gpg-error-prefix=$(HOST_DIR) \
+	--with-libgcrypt-prefix=$(HOST_DIR) \
+	--with-libassuan-prefix=$(HOST_DIR) \
+	--with-ksba-prefix=$(HOST_DIR) \
+	--with-npth-prefix=$(HOST_DIR)
+
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
 # avoid using the one on host, if present.
 GNUPG2_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+HOST_GNUPG2_CONF_ENV += GPGRT_CONFIG=$(HOST_DIR)/bin/gpgrt-config
 
 ifneq ($(BR2_PACKAGE_GNUPG2_GPGV),y)
 define GNUPG2_REMOVE_GPGV
@@ -71,3 +81,4 @@ GNUPG2_CONF_OPTS += --disable-sqlite
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
