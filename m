Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A62FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 17:38:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6175160E9B
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 17:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6175160E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28611831A9;
	Sat,  9 Oct 2021 17:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5k6wimWsPP2; Sat,  9 Oct 2021 17:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75CA88321B;
	Sat,  9 Oct 2021 17:38:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 077AA1BF5F8
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 17:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB7BD4025B
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 17:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqzYHXPzfQdj for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 17:38:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94324400A8
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 17:38:04 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o20so40107393wro.3
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ok7TjeT7bmohQ0fo0dxXAWAEw0JRotz3lXQ0b4+V5xA=;
 b=aVnDNB+7+UrHYoK4K0sIk/2rsKXCPUK07Vl8ORBW7jSWz6UJFkgh9J0gYI4KqQphPq
 voLNyMfL2EZWIG9O8fOrLRrPO4OcZsavKTKZXFV9zhQLW/ho/o/Umfbyk5XW3Ao7upZH
 sz7riIM9cv8jf2nvKoAOwnXskVrMPlvUUo0Pl+hP+I8MirPBLrp89C75LKVJpsELyaic
 W3Cv+gkuGXMTLr2OxXke+vt3smWwfXVtAUpzH6+QM8zF16+/SCpE/p5aXA6fkQsbsYSs
 MGKCaQsezmB67EQqkWNdBVRL2r/R9qR7RflQv5sauxQKk1n7v0zWO0ZPVqo18SgmhKbT
 R3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ok7TjeT7bmohQ0fo0dxXAWAEw0JRotz3lXQ0b4+V5xA=;
 b=uGTWFIGSUVt18q/FgqrB/q42iGV7b002MUjc8W2VFgAUy52lkwXuXZIjO22VZCoiaJ
 CNPAV0mD+UTAnXfzrdYBAYm+OC0mNeko64gxT0zxQ3zsSyogbkBqq6HnwusNXGiLAofp
 scuIbLAO+tloh9/4BPteC7qcpln0sFP+FU+KUSwpeZ6QvDTbV152sWvO6gsmXAobN4T4
 zM8zV+YWyVRjfmS/4Y/Sg6GucIRPbpMpHV3efKxEuyoidwRXLEU3t2o2BgV1N3v5sOHV
 o17l/RA2Ne1uLQ5K2MBURkDWX1miCCp2ywzfRlb209fs9Vq8rxo0jPXK+k3FKgyZG9fN
 QOQg==
X-Gm-Message-State: AOAM531S58+rmRHz0xLB+NVj+WIM0K+bGc4S123TgvJdXwZAOg6uYtl7
 HrTGjU7JoljyziiugBnM/Oe5g0hThzo=
X-Google-Smtp-Source: ABdhPJxsRmYqhcEiApV5Q+lSYLpTwmweAbApH8CmPc5FlgTSDWUcJDjlzlzZDVIZS/JYh3lKV6HrGA==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr12340468wry.382.1633801082566; 
 Sat, 09 Oct 2021 10:38:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id z17sm2704480wml.24.2021.10.09.10.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 10:37:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 19:37:06 +0200
Message-Id: <20211009173706.681928-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.4.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.mail-archive.com/haproxy@formilux.org/msg41239.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 3ad5e4ebe8..2e39fb4aa5 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.4.tar.gz.sha256
-sha256  116b7329cebee5dab8ba47ad70feeabd0c91680d9ef68c28e41c34869920d1fe  haproxy-2.4.4.tar.gz
+# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.7.tar.gz.sha256
+sha256  52af97f72f22ffd8a7a995fafc696291d37818feda50a23caef7dc0622421845  haproxy-2.4.7.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index d41ce50dc6..145a8a214c 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).4
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).7
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
