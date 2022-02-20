Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB952C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 15:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F68C813D6;
	Sun, 20 Feb 2022 15:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eACHnseDk7Xn; Sun, 20 Feb 2022 15:19:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C1E813D2;
	Sun, 20 Feb 2022 15:19:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADD5B1BF303
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 15:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA9BA60BAF
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 15:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R0PYDDbxqt2i for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 15:19:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D287160BAA
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 15:19:43 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so11960474wme.1
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 07:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bGhPqWJxTj/MHgfPzFDsizg9Lzjv/xowToY0SUQUVOw=;
 b=juKhvR0yQ4XEJLX8BTuxPXOZuUO8V6n5uak4pE1ufIcU42qO538UclbvOqkvSeyIRH
 einV8bq9M3S/+m/LR2caTDy8spxgpWL5O9B3ViZKxlOwyxY6Y+XV9QngTmtj6pefdRH6
 6Z4b8eR97c8BcXujq41Ub7J2NWCpD0vmB5N3oUCV5wNPGRgGecXEX3sgzNNqXDgF7/Rw
 AyHbkgXbQQ3aZ/Kz8Yts6o/f1QUdXxY13TDVv5D4tSXzW5oLmrCcuVg6wWENlazoEzJq
 M6TSm3m/WKa52aHMLVs61S7YOQhbZ5B7BxOSpRjVMCB4SdM+IAtDSYmlR1NRmvygVKKq
 88Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bGhPqWJxTj/MHgfPzFDsizg9Lzjv/xowToY0SUQUVOw=;
 b=eheQanUlbB8+rGBCjcER4MH6YIYPx9ZuVOKRt7SoDyAjdcHUEBEz4N1wCe0QzykDHi
 gIeUD9uSjphC1VpoXz51UnPd+sXJ4jjvapK/2pNBRa2ybrhKi/KQTcFwwP+0C5G/ibfd
 5Wwqk0iU6SXBwNfbbmS6NuJYSog4XvlHBtn19iCi4FAO7cTwMu/N0BzzhOvsBg0vV5fI
 Me436sHakb8GbHZiDM3qnA3evI5KcAaicIl/6nGOui5hywR2izkNWsjjEi2v56pA+P7y
 oAAT5FGIZHoL65NZheHJAVg8rTd1RDIkVYO44DXgwS6WnGumynbWFrH5/pBecQZJdmIE
 0ySQ==
X-Gm-Message-State: AOAM533JeJZITRd2NoES/Y8iuG4cdiSDQL/GDIitnbhBTfS8eE9UySZx
 Oxzjw2/wgiMAZh9tCcnJk/OdlTgYzco=
X-Google-Smtp-Source: ABdhPJzgKtpS6QxGG7OEVJioDzl1A1WH043QjXb1iytDuESk3OM6I5wL7iUkkX2QvMt47sWQnR/bCg==
X-Received: by 2002:a05:600c:6022:b0:37b:c9a4:49b7 with SMTP id
 az34-20020a05600c602200b0037bc9a449b7mr18639775wmb.110.1645370381791; 
 Sun, 20 Feb 2022 07:19:41 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d14sm38694404wri.93.2022.02.20.07.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 07:19:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 16:19:44 +0100
Message-Id: <20220220151944.653455-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/connman: fix build with libexecinfo
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
Cc: Martin Bark <martin@barkynet.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised on uclibc and musl since the
addition of libexecinfo package in commit
eea8ba446c10701a273432552108d80fb2224ef4:

/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/10.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: src/backtrace.o: in function `print_backtrace':
backtrace.c:(.text+0x37): undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/74da4f4deab5f0ae9405d063ad52a5d4904a964d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/connman/connman.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 61851bd2dc..1b6fd611f5 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -109,4 +109,9 @@ else
 CONNMAN_CONF_OPTS += --disable-client
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+CONNMAN_DEPENDENCIES += libexecinfo
+CONNMAN_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
