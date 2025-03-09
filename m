Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45207C28B2E
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 22:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCE1360671;
	Sun,  9 Mar 2025 22:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEW8UNROyDV0; Sun,  9 Mar 2025 22:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CECED6065C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECED6065C;
	Sun,  9 Mar 2025 22:06:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C4481E3
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 22:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AB6E8144C
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 22:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqSgTcYTdN47 for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 22:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 62A5881316
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A5881316
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62A5881316
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 22:06:57 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-abf675756b8so50136066b.0
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 15:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741558014; x=1742162814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=imoutRZdjxzJ3h6enij5C0RlSCbFNdrQpglGvDyU/4I=;
 b=uI+Dx3O7OApcvpjLG/U4k1LmdpVnaJf7TNTxNiYRcmoWEmmlsk1S5nqLhPugloiVzw
 GP4JJZaB1vNcqvZ4faAJ6sehUpaA9IuqR8O0hKzHtrXrfA2LND668TjZh1kWf0dJQYkp
 8/eE0VcbH7ep2yW4+Nbyx0qpQE3K/zip7MMbkH7YML0p2wF4Qz7cfbzjj4C1gJYL5O/z
 875viNOsp/XtvOmSCbwJc9p1QiW2jx1lC/TYg7nfvzo9vV1li5lexmHa8TPDf11x8MYX
 uZuYLdbLMLgNSqNLyhEcqDTqL8eZjrdaDLYwtHebGJr/4gKkFG/1jtgq9joGFhlfUJq3
 Yt3A==
X-Gm-Message-State: AOJu0Yxt8J+30riJtRiND1ETowusXtEMRE/VoBrGevuAtun4jtAWFqPF
 zalQ1NdwfJ0Zu+qwXWXvzxLRnqRIsAakiZVKq4Hcfu5HlnsPan/LEjAoYe/9
X-Gm-Gg: ASbGnctVx/8E40ilQA891Uvd3VuiNUCPimhSgqyjW5c+OuVd2DOjEQJ7hqZ5MlsHqvq
 NMapTWBO+4G3KElokvGh5IMmW9X8WWpMeLBUt4DGzEh0rThQ5vql0iEJDBNoeALpwPc+kt56XY6
 xs4nK1vA3gfTCPHVTK+yKhLc7w1va0i3Gslir1XCn2MQiJBJAOTwHLaFyMUxcmLfspzcfdqYrzV
 QIm7iN2xDOR9FwQCglOTfw8Oqo46RTlvkBE83dnvzSlGYt0wgXomhk8a8gICCS2Chtjdcalv4q6
 S0KogU1QTSguT/gAVfhrUz6TPYNf2MXK7HjY7Q==
X-Google-Smtp-Source: AGHT+IHgxjMknJ33thTbbsVOaH6LOS21zewORqmmAKfUxCpeRB0YQw+p5eFAOAD3tBcCdjcg6uGnfw==
X-Received: by 2002:a17:907:86a5:b0:ac2:6d18:ff36 with SMTP id
 a640c23a62f3a-ac271594e2amr288868166b.9.1741558014268; 
 Sun, 09 Mar 2025 15:06:54 -0700 (PDT)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac24a843884sm563497266b.102.2025.03.09.15.06.53
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 15:06:53 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Mar 2025 00:06:40 +0200
Message-ID: <20250309220640.213083-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741558014; x=1742162814; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=imoutRZdjxzJ3h6enij5C0RlSCbFNdrQpglGvDyU/4I=;
 b=i98X4hI/pRq9UJiagu2cIrfr7ZLMI3S+T1xFcaRZr0qxbMXJTvw4IpTccnSvdr5M7z
 LO6VVTQBasr7p039Wqc3T6sMdbWGWgTMbUTD0n1F6udt1d69/8m9dmcbEcQHoqffRMXu
 ypvtrSt8wkzWKSpzndD7QBj0ab4TavzHnRZR/RTOU3yT0ELvsK8jfXghPfSUzjvo0XGK
 AwQcUKBIkn9v6dzRyeaeW9aT3AtbHdLl+crkCCiPAK/3nwr5WYX2TxfMnW/9rJptA8dD
 oyot689OznLiE3QM6y7yChmuUODtcCr8Qj0VGyQdfEhBTS3rY3IRnw9l+mO1Fqny1ct1
 tBPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i98X4hI/
Subject: [Buildroot] [PATCH] package/util-linux: add uuidd user and group
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

At rootfs creation time, fakeroot fails as follows:

printf 'host/bin/systemctl --root=build/buildroot-fs/ext2/target preset-all\n' >> build/buildroot-fs/ext2/fakeroot
(blabla)
FAKEROOTDONTTRYCHOWN=1 host/bin/fakeroot -- build/buildroot-fs/ext2/fakeroot
rootdir=build/buildroot-fs/ext2/target
table='build/buildroot-fs/full_devices_table.txt'
ignored spec: h /var/log/journal/%m - - - - +C
ignored spec: x /var/tmp/systemd-private-%b-*
ignored spec: X /var/tmp/systemd-private-%b-*/tmp
ignored spec: x  /var/lib/systemd/coredump/.#core*.%b*
ignored spec: z /var/log/journal/%m 2755 root systemd-journal - -
ignored spec: z /var/log/journal/%m/system.journal 0640 root systemd-journal - -
<stdin>:37: Failed to resolve user 'uuidd': No such process
make[1]: *** [fs/ext2/ext2.mk:66: images/rootfs.ext2] Error 65
make: *** [Makefile:83: _all] Error 2

The error comes from systemctl, which cannot find the uuidd user in
the target rootfs, needed for this:

/lib/systemd/system/uuidd.service:
[Service]
ExecStart=/usr/sbin/uuidd --socket-activation --cont-clock
Restart=no
User=uuidd
Group=uuidd

Add the uuid user and group in support/scripts/mkusers syntax.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 package/util-linux/util-linux.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7a143290ebfa..ed30c0b107d3 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -60,6 +60,12 @@ HOST_UTIL_LINUX_CONF_OPTS = \
 	--with-systemdsystemunitdir=no \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_UUIDD),y)
+define UTIL_LINUX_USERS
+	uuidd -1 uuidd -1 * - - - uuidd user
+endef
+endif
+
 ifneq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES)$(BR2_PACKAGE_UTIL_LINUX_CRAMFS)$(BR2_PACKAGE_UTIL_LINUX_FSCK)$(BR2_PACKAGE_UTIL_LINUX_LOSETUP),)
 UTIL_LINUX_SELINUX_MODULES = fstools
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
