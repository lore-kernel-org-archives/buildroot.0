Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BB9C43334
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3CE881430;
	Wed,  6 Jul 2022 21:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3CE881430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxvrnhNgKCSS; Wed,  6 Jul 2022 21:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C83F3813E6;
	Wed,  6 Jul 2022 21:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C83F3813E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69EA61BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 439F8403E2
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 439F8403E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrL200qgGjfu for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:06:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 787C140134
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 787C140134
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:06:29 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so13249744pjm.2
 for <buildroot@buildroot.org>; Wed, 06 Jul 2022 14:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WIEBbxgda69MF2azHejZjN0euyageoKkidKR7vMG6M0=;
 b=EfaOvIYGzxTy0lumMLDUN26+Xn9k7NNvKGox9XHMZMUo0pE4QcEOKmrJnXA5Gallyc
 aOJvpo1Zd9RejgcrABwC7QxByt2eje1/AGbIo7eUBQKG+RjQIDbE/92Bi6MNEDhkc5xX
 lRY7C0tmWNFkoyRX3WW4fECU/zMrrtvnAFuqSgGU5/gAJgdxtzLoGb4mWgLTP6Pw+vfj
 ZBgLl7ioAAgSSl5z5rgJ0n4tA+OiqhfGrA5cx8xUbHYjskJtCQ6gZOIlFAAc14MIIisF
 qElNmLi4dnqfxNjTvkLer9F1IU6h+MnbxNFwz+/X77aZ2htWXVnd4wvQ2AZTbsr4Gaqt
 3tog==
X-Gm-Message-State: AJIora8mrSNa70OtYfOUK3jcLR5gJzxCl0HkgTNq+UVbwUrnZPppQme0
 adFr4zEO0tXrY3v/s9cRgux+Ld72RlY=
X-Google-Smtp-Source: AGRyM1uh4DiYsQQ9rp3iFTObwBD4/u/TIEYA9/DmK4JRCh+c+7LXV6LiokOpGKLmZG/iaFB/fWDWAQ==
X-Received: by 2002:a17:90b:292:b0:1ef:a490:3480 with SMTP id
 az18-20020a17090b029200b001efa4903480mr678864pjb.219.1657141588455; 
 Wed, 06 Jul 2022 14:06:28 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 ay23-20020a056a00301700b0051baeb06c0bsm19275123pfb.168.2022.07.06.14.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 14:06:27 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Jul 2022 14:06:21 -0700
Message-Id: <20220706210621.284257-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WIEBbxgda69MF2azHejZjN0euyageoKkidKR7vMG6M0=;
 b=kHjyojp2IDYZfg8nhTw9GNB0gYW8cMkePFw7rG/ZEuDOqF0a6gAKGmehsI1pGpL8EW
 25Xv4mNu0dCaFDyYJomkMKxkZwLrAhtJ6bgs33uIqY5rf6qMYk8KRC2/SRy+PnSk6P3x
 B0GRZvRQNutWzosJ/MfpiNwd1sYw5AcakfGps1eBxvHoksplbGDpcLh+VASCzaafVgW0
 GFmIyLT14/bu0A8TdY3IiOG1DcWLFz9ZyGi+zP4LLWDkkFH/llurRObpsncRlqXNIMSM
 9UJ0EjvO9l7KGmV8bdELubHPUSHhGErdmu2+zXEp/dorYP4CjK5xUv6f0ibWLWHl2PYv
 B8kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kHjyojp2
Subject: [Buildroot] [RFC] linux: Make CONFIG_LOCALVERSION_AUTO work with
 OVERRIDE_SRCDIR
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, mmayer@broadcom.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux is able to generate an automic version based upon the git tree
that is being used which is very useful for making sure that the kernel
being used is truly the one that we intend to be using.

When using LINUX_OVERRIDE_SRCDIR however, since we do not rsync the .git
folder, all of the necessary information for scripts/setlocalversion to
compute the exact version and git commit id is lost.

Add a post rsync hook that copies it over in order to allow 'git
rev-parse' to work and produce an usable version.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 linux/linux.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 322ccabbd9f7..a19a215187fd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -131,6 +131,14 @@ define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
 endef
 endif
 
+ifneq ($(LINUX_OVERRIDE_SRCDIR),)
+define LINUX_LOCALVERSION_AUTO_FIXUP
+	if [ -d $(SRCDIR)/.git ]; then \
+		rsync -au --chmod=u=rwX,go=rX $(call qstrip,$(SRCDIR)/.git)/ $(@D); \
+	fi;
+endef
+endif
+
 # If host-uboot-tools is selected by the user, assume it is needed to
 # create a custom image
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
@@ -145,6 +153,8 @@ LINUX_POST_EXTRACT_HOOKS += LINUX_XTENSA_OVERLAY_EXTRACT
 LINUX_EXTRA_DOWNLOADS += $(ARCH_XTENSA_OVERLAY_URL)
 endif
 
+LINUX_POST_RSYNC_HOOKS += LINUX_LOCALVERSION_AUTO_FIXUP
+
 # We don't want to run depmod after installing the kernel. It's done in a
 # target-finalize hook, to encompass modules installed by packages.
 # Disable building host tools with -Werror: newer gcc versions can be
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
