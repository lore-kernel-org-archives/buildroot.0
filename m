Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598F4C4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 15:41:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1AB260F4C
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 15:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1AB260F4C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2217402C6;
	Sat, 21 Aug 2021 15:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6HdEwL1C4AI; Sat, 21 Aug 2021 15:41:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CCFF402C8;
	Sat, 21 Aug 2021 15:41:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3C201BF4DA
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 15:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFA47605C8
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 15:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYZnawa5heRg for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 15:41:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46C06605C4
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 15:41:29 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r7so18808129wrs.0
 for <buildroot@buildroot.org>; Sat, 21 Aug 2021 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4NnFc/uc11VFEm8Dx5uMTwENPU/WR0Be+BBsaJO5R8E=;
 b=tsw3Xes3F+PZS+PZ8eyPj1/HQzPo/TOzDwMlFGQmYS2tuhcGQ0p63Ll0ft525H0UzM
 YIrM20p8oraltp8IS2JYw8DNrkSiSV5IR1uzWI+Tt32JeltdtkT87R2TrLEtGbN2vRw7
 ue03oYErjudKmELAPttH0RZ40BbdTnbHVAE8mqxvENIO2HGU2BxPVZoGtAtbrs3TCPZO
 GIqaQeFh/fEotiuqWIiFgSuPfVSCtn49JIVv2waYElgLWvuzx4u82x1iQzgUR0dIYQpx
 jXMFvX/aWz7xffBv22ZKQfox3a963CCfzl5vyh46tHyKyt58Ev3Sym2gLCato5V8jszu
 tSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4NnFc/uc11VFEm8Dx5uMTwENPU/WR0Be+BBsaJO5R8E=;
 b=bllqn4sI2DCTaK2Kln7/b+02PV1EiT6B+om1R7DWEb+GRDyFde7ZEq70UarLznYONj
 vgUEsFrd0dBGrI7ezzJaqQ5G7KHeEtJvyO5H58H2aVGc8Ikt1tq7bcRJFAi8nAFhFSNl
 tAXBrtpWfuuO6itO6gq/P30j+NJ1N3v/GQEYntirfp4+tLEC3hkxCXmb7SQhNJbFF8VA
 Xyy8YpJzpQPMNyjqkUnIiCp4Fg2NzsQVbPm839ci7TzquApTLSzCzZbvEDbQ7I1wwpXz
 FyrKH1CCzES2mJJgWrerVcZa25Kw0fK9E96LUwOSPWJNin8OfosArsI+9trsPy62+Rjq
 wPuQ==
X-Gm-Message-State: AOAM530FpV86lvxuBOAF9OORAZiH4JfVIc4VkDxaMTvjoN/FOg0E67PL
 8C7OZ+BvzOczRPFZbx3lZ+eOAs26/nb3pQ==
X-Google-Smtp-Source: ABdhPJwZMLVDD7CaA7pCxYoCKI3WAJThwpIsrswyq417ADKppRSzuIjtlBWLmOfpeyUJbrPjfegE7A==
X-Received: by 2002:a5d:4442:: with SMTP id x2mr4462665wrr.60.1629560487130;
 Sat, 21 Aug 2021 08:41:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id u16sm9391893wmc.41.2021.08.21.08.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 08:41:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Aug 2021 17:41:23 +0200
Message-Id: <20210821154123.1433985-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/snort3: link with -latomic if needed
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure raised since bump to version 3.1.6
in commit e66f2fd310374779d415fa683813cc5f5ccf6be9 and
https://github.com/snort3/snort3/commit/3e518d86040e74c328bcc0d5bbd49c1da6b7a3ec:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/9.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: service_inspectors/dce_rpc/CMakeFiles/dce_rpc.dir/dce_smb2_file.cc.o: undefined reference to symbol '__atomic_load_8@@LIBATOMIC_1.0'

Fixes:
 - http://autobuild.buildroot.org/results/df34a69175e61bc7b180d89c738747e19aaf13bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/snort3/snort3.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index aabc89e165..7495ab9b0f 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -54,4 +54,9 @@ else
 SNORT3_CONF_OPTS += -DHAVE_LZMA=OFF
 endif
 
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SNORT3_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
