Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD17C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 19:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F5A3410FF;
	Wed, 20 Apr 2022 19:59:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VOjHTCULCaMr; Wed, 20 Apr 2022 19:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 431E7410FA;
	Wed, 20 Apr 2022 19:59:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCFDC1BF418
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 19:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA62E41A00
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zG-qhr0P8p9F for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 19:58:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 528B541896
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 19:58:58 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p62so3101830iod.0
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 12:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cPYUX6cFfM3LKgURIRB3ZSoxgk6u8NKlRQKR6ml2lOc=;
 b=b2Lzcu2iQO++nwDzfbrcYZYvWxHYAkK2GYbJHlW6CJA0HJzzzun2eEnyXK9zxhv1aB
 aQxWBrEtfGp+/BUDRd9qLQCpQ2TRDteTsURyRfmQY9M4G+EWYW3hRuLB4GlzeMH79m+q
 PFjvwAtos7GYG5p0S3gDJ5/Mtqimum5U/+2c+hQrLBYu9PGaMxVi1EKl971HJAxCljLc
 OFvWivTvsPjTfygSPcQaCYuzPB4Lv1t4o6AoR154ZtCCOkihS7+f2P0+3u5PoQnzVZZE
 kcDtZt1h/ARq9EFwigmqG45Gjd7vgMqt7X1WIgKMo1ixUek2MPIVWY9vZsLq3uCP+SX3
 okeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cPYUX6cFfM3LKgURIRB3ZSoxgk6u8NKlRQKR6ml2lOc=;
 b=IrYY5+8hX3qbyg0iip5JkZhv2S+JpxOWSKKj5LivvSk288CJj5hlv4dp9g2dW71xhc
 CcLXRrA8PtoSsKVpZWmFivpfWICxMaW8yC7rwGDU0aQUGT8oMFVoozEwYMidtJ77RnVe
 IfzoaOCP+DaXIHaR5I0vesSTXpLloAqEtzSRgJHwjUe3Mpm3Gv4lJ8c9SGbyOmQHsE1v
 3cJZ/oExz/V1HDtHhiOvrWyYHtBPs4/jgq04qgeafnvP7V9ZDP/3ye4WsLoyzRrx20ZJ
 sQKawlisLS99eXzDUl6ozNTsjcskX5pTg7Mhefv9NgBZnnXum4/ayba0dmlyAjAJc4Bt
 xIrg==
X-Gm-Message-State: AOAM5338o2kSCB6MsT+e0CmhW2iSppq9EI7voDnE6qcNC63Ai0EZ4LMS
 /U+n81ii6oRAJguYrOxdaz/q0d2e09IeVA==
X-Google-Smtp-Source: ABdhPJwaQkW+qRRMHAKRn/8me8GQ5xu/TpD6EXv6RtIJxR4QI5uBBlCXfc1ifwUgENtdJTzAabkjaw==
X-Received: by 2002:a05:6638:3790:b0:32a:8874:10b9 with SMTP id
 w16-20020a056638379000b0032a887410b9mr2562506jal.17.1650484736980; 
 Wed, 20 Apr 2022 12:58:56 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 k6-20020a6b4006000000b00649d7111ebasm11899109ioa.0.2022.04.20.12.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 12:58:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 13:58:43 -0600
Message-Id: <20220420195843.896993-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version 4.8.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index e33a8f8109..3600d7759a 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  6e84edecc3a82f90d44ddee2ee2a2630d4994b8471816e226d2b771cda7ac4ca  lxml-4.6.5.tar.gz
+sha256  f63f62fc60e6228a4ca9abae28228f35e1bd3ce675013d1dfb828688d50c6e23  lxml-4.8.0.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 8c2e965af6..90935a7ee1 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.6.5
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e6/e1/34b3ab08553fe9a30e15b2bb9d1803a49d7d907dd9f245638839190042f0
+PYTHON_LXML_VERSION = 4.8.0
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/3b/94/e2b1b3bad91d15526c7e38918795883cee18b93f6785ea8ecf13f8ffa01e
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
