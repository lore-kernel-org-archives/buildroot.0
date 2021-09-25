Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FC6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 07:50:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0274C6127B
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 07:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0274C6127B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95C8640371;
	Sat, 25 Sep 2021 07:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lO-yiVHkDksG; Sat, 25 Sep 2021 07:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D13F40369;
	Sat, 25 Sep 2021 07:50:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2F61BF2AA
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 07:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C23B4042F
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 07:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id On9haaVTNo9I for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 07:50:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B4DB40419
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 07:50:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id g16so34334306wrb.3
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 00:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/riH72c6nmqjDLr5c1xsMZaTYV4qW7VsWV9EN9R8Dak=;
 b=czCCZMKuIbQHUkAbAB9OGg400+bKU5fkPw8UBNBE0al5gBKe+GRXSOP1Plo/XtN9X1
 BPOZlW4IWNt+oUIwJC75jq40eNEkh1n0+lCPohYv8CgyK6sTbZRpWSZxxttOPdtftz/h
 L1/Q4Vk6hLGijCYPUSCZ1kA4YbCy2VsC+fpLpMGOBIEYAjagh2mNbvmxc4D8tglMFUt4
 FzvHWfs7Kx9FMU7LfS2v1V/khphQA4AIqSaDvZPRWrsQ4oco7ozrzLxesx0bRkOQXNC8
 JSEq/gSnzCy8F8IQvqbUX7dACF7BejfurV+c8Kl+0cA+JdMfABHIHkOU/Dz9BRkxxPxD
 lIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/riH72c6nmqjDLr5c1xsMZaTYV4qW7VsWV9EN9R8Dak=;
 b=66G8na3y14REHkaOcnLO9dX+q7bhaetANXPgZKLYCAhMTz9brCn0XPAf2ZP64Ypr7Y
 41uZ2TZre+ZVeNoUzAMsDM8UJ1bUGS06iTsiLO8d0hUJG646X61ltT3dS2wLKaOiXpEx
 89/6y7wLG+VC8veoHmBSN2+UVwJnT/8qViv7L924XDgcNFoauUzwsDuwtB/Po99Oo/kt
 H4ThQC+RSWyg8tDZPyxw/oU0ljY9oQy8oyAqBCpL8AqaWyEMcPyx1/FVXTy8YgIM4YIp
 qCU7Z4gvjlyUEwLnpUI6dgH8AsNjSESBukaW09oKZOeGxdvj3CIV1aCQpC2UbKSTt/dr
 rtdQ==
X-Gm-Message-State: AOAM531ssrXl7BvavMp/sD9Wvq0beucrWAXXmB10c9ZhSy8R6oySaAYG
 BPUI9zUfrLvl6LLVcTUxfsNoJcbJqFA=
X-Google-Smtp-Source: ABdhPJxNI+owYZg2/n+T4+QLE11v/+vZtq5RQS9Fw/8yerrZJom9yzP2dDnaPc7nYclLtDHa6oCzgQ==
X-Received: by 2002:a5d:648b:: with SMTP id o11mr15651223wri.315.1632556210984; 
 Sat, 25 Sep 2021 00:50:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id q7sm10965006wrc.55.2021.09.25.00.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 00:50:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 09:49:40 +0200
Message-Id: <20210925074940.3212124-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210925074940.3212124-1-fontaine.fabrice@gmail.com>
References: <20210925074940.3212124-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 2/2] package/libvirt: add host-lvm2 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-lvm2 is needed to avoid the following build failure raised since
the addition of the package in commit
ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

Program pvcreate found: NO

../output-1/build/libvirt-7.7.0/meson.build:1888:6: ERROR: Program 'pvcreate' not found

Fixes:
 - http://autobuild.buildroot.org/results/13c12086a0ce06c348d5971b56b5f4f27fa0f317

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 0f6c7cef7f..3118de4d58 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -180,7 +180,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LIBVIRT_CONF_OPTS += -Dstorage_lvm=enabled
-LIBVIRT_DEPENDENCIES += lvm2
+LIBVIRT_DEPENDENCIES += host-lvm2 lvm2
 else
 LIBVIRT_CONF_OPTS += -Dstorage_lvm=disabled
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
