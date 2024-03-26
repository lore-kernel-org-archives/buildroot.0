Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3103C54E67
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 14:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1864407B9;
	Tue, 26 Mar 2024 14:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aJ0COlBA4T35; Tue, 26 Mar 2024 14:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 645DE407F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 645DE407F7;
	Tue, 26 Mar 2024 14:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA8C1BF4E2
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0503B81F08
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 14:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPD_Jzp6AEP1 for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 14:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com;
 envelope-from=bleemayer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A534781EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A534781EAD
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A534781EAD
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 14:36:31 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-29dee60302fso4502899a91.1
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 07:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711463790; x=1712068590;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/V1qfbJ2Plh/Jrb3NE7rDoXl+Yixw9csrmYHM1s8/8k=;
 b=OjbBHdkZh/XGdh0mmdH+2XGgCtKl4OlUY8taEI/4dL2E+v5ZH4sjUrEsiEe6aTZnLR
 kJc6xM2W4sMuMpqc+uuLfWeg80im03X/7PoN4Fol43ASriPDtpcng0Dgtnog+R2tusJs
 75vKKZNTBpUDe+VelhLGWeLk7qsiTpsxm1a9Q/+Qbmz1GYd9ykU2ZgA8VB/VrZdGUAC4
 dwAxgOIkHoceVcL7MGwdCSXoR+US2BMzyzPlxFwvd5yNt9lc6oZNmi/WYSpcUW2QadAI
 kwwnhxkHWgcX1PpHXWVF7G1EdTNjCtRiZ9myF/HDpGmQSreHa4BHJpAUNEI92GL7Drvl
 RV5g==
X-Gm-Message-State: AOJu0Yx+ohHFawvE2KH3NPkagFS3mcw5M0bmlREm3bv5n/Ja6Rih/E/A
 iIn/2Jy+ZGJvwH2TkdBgj+Um/XbHTiAsilRLYrRvVlDVagYdqEHowQWEm6Mu8vlnNY8jyRqU4/y
 mAtETeRDfHKxsDnkFpugmUjAE0oAb5BYRYc3ISg==
X-Google-Smtp-Source: AGHT+IHO2UObKnJRB/x7Zq2jZjqgiWFn+NZsPaf9r8E122tgXf1AmEAViXD6PXqEnl5ueTON8/Ka0diwjz8jB5DNnx8=
X-Received: by 2002:a17:90a:53a1:b0:29d:f52c:5d40 with SMTP id
 y30-20020a17090a53a100b0029df52c5d40mr2714150pjh.15.1711463790302; Tue, 26
 Mar 2024 07:36:30 -0700 (PDT)
MIME-Version: 1.0
From: Brian Mayer <bleemayer@gmail.com>
Date: Tue, 26 Mar 2024 11:36:18 -0300
Message-ID: <CAB3eKoBtu8-9ch_k9k=-tHocLE8SjYanSotPOM1HOTUsU-eGOQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711463790; x=1712068590; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/V1qfbJ2Plh/Jrb3NE7rDoXl+Yixw9csrmYHM1s8/8k=;
 b=M2disDPGN+NjJ30xE2foAoK5p1jfQ9ab2Vl3UESIk/pclJA1/GKT83OPCw9K3aLATN
 GWZ5FM0nU52kgp16OZCLqreIRy0cpBrHeIGnmi+Qt/PSnRHnzQxaWyDYZA8qzE7TmRz4
 BZpABaOy9JT2D/F4x5oCs8k3LknQXL7v7rC0UuuU89NIR4clhI7NDKcEnMysyx8ku2+/
 rUMWIz0ZkfGztf9xON2IoHDlZhnlSw/Ep4NFPj5Do1A99rv1/4uDa4YmP+zf6qUX3zzQ
 mhQuuTMkJI4vKpSO5NuzsoyklPez7MycTxq5uSnHWYIW2D5Kcn/SRBFAjnZb70dshpKX
 z8Cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=M2disDPG
Subject: [Buildroot] [PATCH v2] package/sbase: new package
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

sbase is a collection of unix tools that are inherently portable across
UNIX and UNIX-like systems.

Signed-off-by: brian <brian@myr.sh>
---
 package/Config.in        |  1 +
 package/sbase/Config.in  | 11 +++++++++++
 package/sbase/sbase.hash |  1 +
 package/sbase/sbase.mk   | 22 ++++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/sbase/Config.in
 create mode 100644 package/sbase/sbase.hash
 create mode 100644 package/sbase/sbase.mk

diff --git a/package/Config.in b/package/Config.in
index 1a62bfb1be..177b8a89ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2549,6 +2549,7 @@ endif
        source "package/s6-dns/Config.in"
        source "package/s6-networking/Config.in"
        source "package/samba4/Config.in"
+       source "package/sbase/Config.in"
        source "package/sconeserver/Config.in"
        source "package/ser2net/Config.in"
        source "package/shadowsocks-libev/Config.in"
diff --git a/package/sbase/Config.in b/package/sbase/Config.in
new file mode 100644
index 0000000000..b6ef049b11
--- /dev/null
+++ b/package/sbase/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SBASE
+        bool "sbase"
+        help
+          sbase is a collection of unix tools that are inherently
portable across
+         UNIX and UNIX-like systems.
+
+         The complement of sbase is ubase[1] which is Linux-specific
and provides
+         all the non-portable tools. Together they are intended to form a base
+         system similar to busybox but much smaller and suckless.
+
+          https://git.suckless.org/sbase/
diff --git a/package/sbase/sbase.hash b/package/sbase/sbase.hash
new file mode 100644
index 0000000000..d13f3bd110
--- /dev/null
+++ b/package/sbase/sbase.hash
@@ -0,0 +1 @@
+sha256  af10b9995526b6367e6e11453f4762e4c67d2835ecba7257716b5024440e6f51
 sbase-13898fa7a91155a60c4c0bd61d4b7693a2ff3f09-br1.tar.gz
diff --git a/package/sbase/sbase.mk b/package/sbase/sbase.mk
new file mode 100644
index 0000000000..373ec4965b
--- /dev/null
+++ b/package/sbase/sbase.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# sbase
+#
+################################################################################
+
+SBASE_VERSION = 13898fa7a91155a60c4c0bd61d4b7693a2ff3f09
+SBASE_SITE = git://git.suckless.org/sbase
+SBASE_SITE_METHOD = git
+SBASE_LICENSE = MIT
+SBASE_LICENSE_FILES = LICENSE README
+SBASE_CPE_ID_VENDOR = sbase
+
+define SBASE_BUILD_CMDS
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define SBASE_INSTALL_TARGET_CMDS
+       $(MAKE) PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+$(eval $(generic-package))
--
2.44.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
