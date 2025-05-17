Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C201C3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 17:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62DB460836;
	Sat, 17 May 2025 17:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_gIAwtiYbu7; Sat, 17 May 2025 17:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 981EC60883
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 981EC60883;
	Sat, 17 May 2025 17:40:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4188B201
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D9D40350
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJO0GV0pLr-U for <buildroot@buildroot.org>;
 Sat, 17 May 2025 17:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2036403E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2036403E8
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2036403E8
 for <buildroot@buildroot.org>; Sat, 17 May 2025 17:40:27 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3d9327d0720so22979295ab.3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747503626; x=1748108426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FfuirtN7g/8ayeIJU+hjubO663HiD4ZZZPWVAJQKncA=;
 b=JerVUOOCWoU6W8TVuxSK+OQCncuWxXhOz06bxAPbk/hD9l9PudE9+k+XKxghrxlH+b
 nYBeo8Jg1qAaBJsa2uNfUGefN01ggMvuErPDGl/xXfKdFoIRu9GXGqT/Vl85XBiRZmoR
 1LdgKp9uX8wxJ0FXytuq39NwD4/Dfzjn/QFm63xR0s5B9+wIgPt8WPyTymBk2BQpozs/
 2YtEQhUcbJyA7QOGPa+jzq8uFRC3J/rsB0HhzPnmSPyOzf7orHz+qESMVp63AjnzToMm
 RTDTBh6lK26j2+UNxRDRQ2nFKG+LfzDUw5lskLY5pr9HaQaoMSBXqRRz/iLA6EQZZjiR
 sJ6A==
X-Gm-Message-State: AOJu0Yzunu66Ig1fkjzpset/CN9+ZDfNga9Ndn66BO43Lw3q2uWRoFBH
 +VX1Kuvwn6dP69mopHEnlUOAM8rzVlbIpy6eCTmbkbbVVbI1sTmzgmlUSqwwGuOg
X-Gm-Gg: ASbGncsQIKm0Gwn1jg5YzrELEX8iR7xJ3+n6/P6P/utLAza97UM5antgyPReFlVnJkR
 ZBlBVBl6mWfV2D1ouWzKHQWefIm/C67UlmAadvIFSn1joVHhMRVcCMhIkUrvvVFNXq3ykG2d9fK
 Mg19bfQnrlDVm46/2fslr/H9kpX3HAiuqPGjDECX1lXgSnsrZFNKMVGd0RMiL9pbdLszippv8nO
 lURDmUEuoGAn+hiKhbf+pinAQN0p2rvWJcN4IgasAPJujr9WQMZiiIAttmsHONpdIvGdkVwQpKp
 BZXHqM1KlBcfB4BbjpJoO32/xcxD1PNNp36TODAkCQUDR1g9zR/AhTopJnGa4EWSAOGkYitv4ol
 z2Mitij/zIlb0syFhoj7+Gx9K1NyOag==
X-Google-Smtp-Source: AGHT+IE4fyfB2vvAcY9p5G8RzEguGqT9zCqCeRemYrFtBIqD7n4VxEtB6b6rztp9mjCBk1UnmLyC1A==
X-Received: by 2002:a05:6e02:351d:b0:3db:7265:622f with SMTP id
 e9e14a558f8ab-3db8433235amr92055785ab.21.1747503625978; 
 Sat, 17 May 2025 10:40:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3db8443a37dsm10754535ab.53.2025.05.17.10.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 10:40:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 May 2025 11:40:19 -0600
Message-Id: <20250517174019.3732498-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747503626; x=1748108426; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FfuirtN7g/8ayeIJU+hjubO663HiD4ZZZPWVAJQKncA=;
 b=lGPfcsifRKdidIMjXxhEdpqO06OK+H0JSVH5/Wx/fG+YRrBuJ8uiUBik6H+o/xLy63
 6wSsl4H4Vr+Zn776hNEW7zH+sq/b+y6RoMTpLPJkBJA8xiROg4IWACYo+nDD0WEyOtjj
 cf90w7psq7PkaZUTEjJLVGJieK02GGjoMTcrat2mtjGMAA+msC0CaC3dV1ZYUrPt0jyu
 j7CyrEYPJBrz3HehdRtTOptX6UqxU3JvY8ufiObj83ANOA5ZQEj8P7lkJ8GhJgksFHC/
 mbigNVL7jKyRvZaaA/i0/nICZkG6iHQ2lD8RNcODbJ4lTuaA7geMjZ3f1dEQdHLyq4/k
 u2uQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lGPfcsif
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix systemd-boot
 installation
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

When the meson build directory was changed to buildroot-build in
4e95062f820a64ecd2402115ee552dbcf2874f02 we forgot to update the
install path for the systemd-boot efi binary.

Fixes:
/usr/bin/install: cannot stat '/home/buildroot/buildroot/output/build/systemd-256.7/build/src/boot/efi/systemd-bootx64.efi': No such file or directory

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 337d52b1f2..71fe0de550 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -646,7 +646,7 @@ SYSTEMD_CONF_OPTS += -Dbootloader=enabled
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
 define SYSTEMD_INSTALL_BOOT_FILES
-	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
+	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_EFI_ARCH).efi \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_EFI_ARCH).efi
 	$(INSTALL) -D -m 0644 $(SYSTEMD_PKGDIR)/boot-files/loader.conf \
 		$(BINARIES_DIR)/efi-part/loader/loader.conf
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
