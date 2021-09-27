Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC01C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 05:51:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D8D61165
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 05:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86D8D61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49EFB40449;
	Mon, 27 Sep 2021 05:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lqSsSUnSBzq0; Mon, 27 Sep 2021 05:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C0D6403CA;
	Mon, 27 Sep 2021 05:51:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A14991BF30B
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 05:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90E29818CA
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 05:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cK463fOlGbBR for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 05:51:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E51F818C2
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 05:51:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t8so48970601wri.1
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 22:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyL9AA8U4pzp7MUiC3xOAeRRE1KaEW96LdyHiMyQKA0=;
 b=dSI5tC6qmK0b01dizu3MsnQRupZnCsI2GD//4DJfxp+TY3KvUEvdwwYhA2lH254BWt
 dDjw8RnbhMnNVzmXn7wFrKvmupN/iZuCLArqjrkseJBaJK4skzZdbucQdWeCObN31OeY
 KtMQyQg01nbxDUcaSXBgSKCNMqgCpI/gsJmhTn75PBN1Qftr7nX/vgRgTJ5HvNwcOfF9
 6PoKb5SoR99tguI/Se22326Oq3neJwjK1h250Ye/UHA79dsChAFts1I2+TVWY6XzPtGh
 hKCuDDMhksqcG4Wc6qRfBi0Qga+fivnRtr2KEsmDNboG3lRGGphvsNfTthaHnbHsdXzv
 IE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyL9AA8U4pzp7MUiC3xOAeRRE1KaEW96LdyHiMyQKA0=;
 b=oX2maoBvDMt2Lr38aV87gKwOvOxEZsqJEQt6D8oD2CW1+vwO5SsH7SQPi2rEERYCPm
 JmabDHqtjaGPSNhrYOfXvgYYj9Xy08n1MNnN7jag8DCH1HSkkxWwryBHqCxeFiZzTEUV
 lBjvBJuMeEt95viVRojgtAlnWEP2obxc0F/oo1FrhpGDraC6w6iOb05ANGUfTRaUGZ9Q
 VPA07gUFOFSAQg0quvzbjnEM9b4cxF1hJFcQiBrVYCXL1KeJfNV2G9ZXET2lNWxSPHxt
 JvUuqONf0F33KBCSZNrpd9KnGRegriFJm6nDmjqSxbTbloBiVqVvhqwsoAB/0cetVeRH
 PzgA==
X-Gm-Message-State: AOAM530SsRg4FFiyPLVNHh/oRx1nVxKW7OTH5vBSuX28qNaQ/m+gpiF1
 AI9gfOLyF55YFdqW2nOfYO3CBZgGSCI=
X-Google-Smtp-Source: ABdhPJxGDqIXZEsTT8KcA9Z7n4j8IhC4b7rIlHXfWhPaLDlDuBhKOJzZevSVEQUlxb1fQb26RKvx0w==
X-Received: by 2002:adf:f890:: with SMTP id u16mr25213775wrp.388.1632721881466; 
 Sun, 26 Sep 2021 22:51:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id c9sm14124915wmb.41.2021.09.26.22.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 22:51:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 07:50:54 +0200
Message-Id: <20210927055054.1068719-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gdbm: needs fork
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

gdbm needs fork since
https://git.savannah.gnu.org/cgit/gdbm.git/commit/?id=9016182fe92dcdfa9103acd144ab01f30463ac72
which will result in the following build failure since bump to version
1.21 in commit 60add404db424e2652673a7b6a3ba2bc80380b42:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: ./libgdbmapp.a(gdbmshell.o): in function `shell_handler':
gdbmshell.c:(.text+0x3dc): undefined reference to `fork'

Fixes:
 - http://autobuild.buildroot.org/results/effc22ac47350bdbc19074dd724eab16f53913b8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdbm/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdbm/Config.in b/package/gdbm/Config.in
index 6c668722d9..debe5660d7 100644
--- a/package/gdbm/Config.in
+++ b/package/gdbm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GDBM
 	bool "gdbm"
+	depends on BR2_USE_MMU # fork()
 	help
 	  GNU dbm is a set of database routines that use extensible
 	  hashing. It works similar to the standard UNIX dbm routines.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
