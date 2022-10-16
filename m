Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A406DC433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 11:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 246FB60E7B;
	Sun, 16 Oct 2022 11:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 246FB60E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QL7UKzUCEAzR; Sun, 16 Oct 2022 11:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 537C360E70;
	Sun, 16 Oct 2022 11:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 537C360E70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 313381BF25F
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 11:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CC6A813A6
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 11:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC6A813A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9MAqsUjCQgW8 for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 11:33:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34595813A2
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34595813A2
 for <buildroot@busybox.net>; Sun, 16 Oct 2022 11:33:50 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b12so12459657edd.6
 for <buildroot@busybox.net>; Sun, 16 Oct 2022 04:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yt41nnV4pZQBp1OVFpQXfB+cB9Bw8Qhm95e7jOpnCN4=;
 b=LrpoEHOqvrGqNbUsD9Q8egyosyhrgdemVzzbYgdY/N3a42xDE0E6WaVKEplgStBKQf
 QKUc41sflFwRXcvS7MNH7JxZlpbefNghioo0JIgX6txpqpqzI2KB1Wv6HFNHkgujd3la
 t/gOEuEwdEAYSA1IWLjZwbvMBgj1wZRkJbNvUt55n4lQln46C6EC+aQGQxzZF0TrITIf
 Q7vJHVKoKemuHewrgR6PpAGqwFqNcXvRoU6MrUHEleJyPSAgVeTCdl59FWLt8pdGoq6K
 3+BQFrK0gdVQ3ReKvahdEAgxunklMBfo1P+CZPYtOv15WmHnXW20jca659CYou11vpd1
 iPdw==
X-Gm-Message-State: ACrzQf03FENZxyW9XeQh+DdXi+NwWxhmIVEFklyLqGZrkAwR8bEd5PGw
 OCmMIReg0yF9pHJtCF9KQGQf87oNmNQ=
X-Google-Smtp-Source: AMsMyM40NzSxborn2dKJDBsVtaxFkW1b3SCp+ZdbweFDI3iru8O7CsjovNPez+NLZ+e05eNhnJ1DCQ==
X-Received: by 2002:a05:6402:c7:b0:457:cd5d:d777 with SMTP id
 i7-20020a05640200c700b00457cd5dd777mr5658506edu.245.1665920028304; 
 Sun, 16 Oct 2022 04:33:48 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a1709061ecd00b007305d408b3dsm4435240ejj.78.2022.10.16.04.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 04:33:47 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 16 Oct 2022 13:33:41 +0200
Message-Id: <20221016113341.3759990-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yt41nnV4pZQBp1OVFpQXfB+cB9Bw8Qhm95e7jOpnCN4=;
 b=p6LEhi+WDq7b++RwgTlngm8xshLmEcUZdv0yoemUXipJGheBwPuDedKDqdKw0Ecx8p
 nTjeL8qCQI9rAlZST0GNiAjan+/L/ZilJkq6c9Tp2eraBAEW+QotkJ4ehXW9SxYf3uxu
 HLSDaGJGddv/d38MmTPrZGQQXHqqaX9fZw/oBK7yIJza6RsZpahMGhMTxBo1y0PHLzDr
 WIveFVqu3vNgX7SPySCncInpvvNggjlTYoeF5idoZYiapu4NGNmVdM5tw/YSVo/BUarj
 O/rC6NIjb6SNGJpqTDGlAs5RIt77FTKTE+z8llDD/yB6DYumH97NIbbvwDZ2YcoZVljc
 94RA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=p6LEhi+W
Subject: [Buildroot] [PATCH] package/lualogging: bump to version 1.7.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPYRIGHT:
-Copyright (c) 2004-2021 Kepler Project.
+Copyright (c) 2004-2022 Kepler Project.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lualogging/lualogging.hash | 4 ++--
 package/lualogging/lualogging.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index 1fc8694e8..a9eadab4d 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  d29c9c78e4266d9390069b2a5f7afacfcf9189dea12ce3774a5aa4e3cdbcd89f  lualogging-1.6.0-1.src.rock
-sha256  4d95b123e667a13615f567a829aa39211dd55b0b48c9f247bf3fcc5c0b485da7  lualogging/COPYRIGHT
+sha256  d4a8791e9b24840c4a4c0366399f55b6deb060fc3947f3a9aae9ced0334160c1  lualogging-1.7.0-1.src.rock
+sha256  d900082cb26f8cf4a491ca51c00241f2c2e9cd9ae3531c62234017a360706adb  lualogging/COPYRIGHT
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
index 4d01f546e..78197f6be 100644
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALOGGING_VERSION = 1.6.0-1
+LUALOGGING_VERSION = 1.7.0-1
 LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
