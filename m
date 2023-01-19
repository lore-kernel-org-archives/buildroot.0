Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D1DC00A5A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 13:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB9F581ED7;
	Thu, 19 Jan 2023 13:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB9F581ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUTg6Imh9qky; Thu, 19 Jan 2023 13:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3173181F54;
	Thu, 19 Jan 2023 13:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3173181F54
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6CB1BF2E5
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 13:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAAD560D58
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 13:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAAD560D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KSYFca1I-ply for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 13:29:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CDAA60A81
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CDAA60A81
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 13:29:17 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t5so1882487wrq.1
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 05:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=beVVAXhfwpRIUqEnU5IENgm1H7eE1OisKzU2ywG3iKs=;
 b=3i2RBUUP8JBs2an7WTbrvlR2zk/sXN1IAy/22ZCV+G/eAApWQH3dYNZQC4lg27SZBD
 x6KheshIKcnMkFVT70HXZxT1Dk22Zy0+dptmbE06Yzq+Ji1ww4H70TEk/ayedw5F7/sF
 ElUe2Bq0+7whzy472vB8yzI3GOB0kh5S+pbrs/PIaXDdsi2t1Aefho+6a9ITvHWq5fSH
 4NCno8lsC8Qtj7eNgatoDPSYg0HBB8j4SaFuNkLEyDdBC6zpwEelKndwBsSFeQGawY5e
 nfzMIlsbt+rY2mC+29i9qcCy3PzyyDAU8d6/bixF9yy+8LLoKGZV/3ll5bbWfr74PCfS
 +cZg==
X-Gm-Message-State: AFqh2kp7iUKIm1cfJ8RM26Hg3xMhFkz04Bjyms3ayN0WVn9xZKFNZJQ5
 Jkv7o2/Az/YikUufHEAoAvqEDOwRy/Gn4A==
X-Google-Smtp-Source: AMrXdXvzDnd4Gp3xtYK4mmUywTLO9aZeOk76rT8U988cwICUpLyaECWJ6ppzvSBdcd4TXZQaAKBdZw==
X-Received: by 2002:adf:a494:0:b0:2be:5064:a371 with SMTP id
 g20-20020adfa494000000b002be5064a371mr395767wrb.58.1674134955596; 
 Thu, 19 Jan 2023 05:29:15 -0800 (PST)
Received: from ncarrier.spectracom.local
 (2a02-8428-7321-aa01-1304-3364-4203-42ea.rev.sfr.net.
 [2a02:8428:7321:aa01:1304:3364:4203:42ea])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002bdc19f8e8asm22011320wru.79.2023.01.19.05.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:29:14 -0800 (PST)
From: carrier.nicolas0@gmail.com
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 14:28:53 +0100
Message-Id: <20230119132856.1801425-1-carrier.nicolas0@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=beVVAXhfwpRIUqEnU5IENgm1H7eE1OisKzU2ywG3iKs=;
 b=IvZSt8dQbJsP2+5BvV1tUVoFNcqxkuSf4/PvIYtmAk8DsFGkFxtK+576Px1dGw0d5G
 i+wPO28Qnu5bwpq2C1Tjz4AMmejT9GWCwuf9xoQII8drblfWYjL85u/K7BLW4ra5XxMJ
 izz/4qVTWe3ld4niVeQH+6js2WmNCqJvhLCdBcTQosCvGL2dtdZ8onO7HuFZZ81BDHsu
 /D1jsDeNIbmfWot1WMwDibebnscHRShGcWGUFnumWjWCaC/VXlK3wK0G6ZDrmiho9ko+
 UQml4TL1EmQhURYIBV6drSDosrdPrFh2Wyut8KyY0JT1T7MR2A8mSNACZr7t2zVWsWLz
 ZTuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IvZSt8dQ
Subject: [Buildroot] [PATCH 0/3] new host-composer package patches series
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Nicolas Carrier <carrier.nicolas0@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Nicolas Carrier <carrier.nicolas0@gmail.com>

This patch series introduces a new host package for composer.
This package requires the creation of a host-php package, which in turn, needs
a host-oniguruma package.

Composer is a tool used to deploy and handle dependencies of php web sites and
is used in particular, by the CakePHP framework.

In order to test this patch series up to the creation of a working minimal
system, able to serve a test CakePHP website, a hello-world can be created this
way:


################################################################################
#
# hello-world
#
################################################################################

HELLO_WORLD_DEPENDENCIES += \
	php \
	host-php \
	host-composer

define HELLO_WORLD_INSTALL_TARGET_CMDS
	cd $(@D) && rm -rf hello-world && \
		$(HOST_DIR)/bin/php $(HOST_DIR)/bin/composer create-project \
		--ignore-platform-reqs \
		--no-interaction \
		--no-dev \
		--prefer-dist cakephp/app:4.* hello-world
	mkdir -p $(TARGET_DIR)/srv/www2/
	rsync --exclude resources \
		--exclude composer.json \
		--exclude composer.lock \
		-a $(@D)/hello-world/ \
		$(TARGET_DIR)/srv/www2/hello-world/
# we disable the loading of DebugKit which isn't available and disabling the
# debug instead just won't work with such a minimal application
	sed -i "s/.*'DebugKit');//g" \
		$(TARGET_DIR)/srv/www2/hello-world/src/Application.php
endef

$(eval $(generic-package))


Then select the qemu_x86 default config:
make qemu_x86_defconfig

And the following configurations must be set:

BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HELLO_WORLD=y
BR2_PACKAGE_PHP_SAPI_CGI=y
BR2_PACKAGE_PHP_EXT_PDO=y
BR2_PACKAGE_PHP_EXT_INTL=y
BR2_PACKAGE_PHP_EXT_MBSTRING=y
BR2_PACKAGE_PHP_EXT_FILTER=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"


Then build the image, execute it with:
qemu-system-i386 -M pc -kernel output/images/bzImage \
	-drive file=output/images/rootfs.ext2,if=virtio,format=raw \
	-append "rootwait root=/dev/vda console=tty1 console=ttyS0" \
	-serial stdio -net nic,model=virtio -net user

Once booted in the system, enter 'root' as the password and then:

cd /srv/www2/hello-world/
bin/cake server &
wget -O - http://localhost:8765

wget should be able to dump the landing page of the test web site.

Nicolas Carrier (3):
  package/oniguruma/oniguruma.mk: add a host package
  package/php/php.mk: add host-php
  package/composer: new package

 package/composer/composer.hash |  3 +++
 package/composer/composer.mk   | 31 +++++++++++++++++++++++++++++++
 package/oniguruma/oniguruma.mk |  1 +
 package/php/php.mk             | 19 +++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 package/composer/composer.hash
 create mode 100644 package/composer/composer.mk

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
