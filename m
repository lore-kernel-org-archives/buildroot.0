Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BAAC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 11:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D1B1421D0;
	Fri,  5 Jan 2024 11:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D1B1421D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ozSf9Q9WUws1; Fri,  5 Jan 2024 11:02:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E205F421CA;
	Fri,  5 Jan 2024 11:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E205F421CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8661BF378
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 11:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6260B43678
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 11:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6260B43678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gg8XTMrw20y for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 11:02:09 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2A454364E
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 11:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A454364E
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3368b9bbeb4so1265831f8f.2
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 03:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704452526; x=1705057326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kS1hYT45Odmm+ItuUJ2WdbX8zbB80By0eunhC/fq22I=;
 b=Mx9YVBSH7WiG03PtnySj0hYEmoektoEnus2xOz/Prwiqqg9Qlur8sWy9JriWabgnN5
 nPAQGoMKwMMKJNfblDhS6wpXBNyBsg5vdtN0N5qvga/rSybbE4EFkXqxSYm4euz31mjz
 lxgE3UAvNSzdjbzk2Bj01IGdVN8l6sW3eEZpslF3/4zvF/5PiZuj96jSHzIUh4+k+ki5
 X8y59w3QMMTPBLOzSSeshBcWNVL7MUVvR+r0pLEMc+xAR7VNKboTX8UyxPvLVsVlY1ZS
 FbfhJ/7f2O1ed05V+nyRTWqvWP6IpDW4W+QPFJ4Ei4M56k7cGXjVFGLRV7e3AoC5+GhT
 vYCg==
X-Gm-Message-State: AOJu0YwNuMcVLWpNy12oT+jS9knDJ7ziL0yOhCyjCSHTqXkxJ/oiDaL7
 PV627v/GkNzG4oAJvK178xeEJEj93PY=
X-Google-Smtp-Source: AGHT+IGb1/YU9n2m+Xv49D5g3UVa+QhMOgOrKCKn3RjKQ3tL9t6RA8/kPMaTL7tZtAzmeEs1dRyn9A==
X-Received: by 2002:adf:ec47:0:b0:337:3e32:e70c with SMTP id
 w7-20020adfec47000000b003373e32e70cmr658968wrn.14.1704452525655; 
 Fri, 05 Jan 2024 03:02:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g18-20020adfa492000000b003365f5e87f4sm1182275wrb.95.2024.01.05.03.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 03:02:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 12:02:01 +0100
Message-ID: <20240105110201.491781-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704452526; x=1705057326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kS1hYT45Odmm+ItuUJ2WdbX8zbB80By0eunhC/fq22I=;
 b=ZTM/MAyiTmFvdLnVIzp9ehbtYy99BYG6ZnNv1BfQx+UbyD+cimh7CyMgjq2J2lWnY2
 Ts3HDgvFRQF91pZNkzyy8R00xiE9TtJ/6jRLmRGcKxjHc/30CUKnynNEB0A2CnPKzpdc
 zYoqlpOYWjgHNTcOVOd5lpAsKYydXnmyw47oqPpn0PmDAoxTppEJ225vIutASkjb5pmD
 565Co5rJP5YxdN9KtdUZpcm5hXDV/OVY3TfYVn5c9V1bRbWY2rHy3y2CPwQtzfH8Bhve
 q2TD/5fpUSEWeE1WnYxORWFfBn/zLV1G/PagRirC6VKEwUEwBJTXvw8Eux+v46ZB5+aB
 oLAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZTM/MAyi
Subject: [Buildroot] [PATCH 1/1] package/lsof: fix build without wchar or
 locale
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

Fix the following build failure without wchar or locale raised since
bump to version 4.99.3 in commit
1edafc4b483e82b045d3a0cc9cbbd000d6183ac7 and
https://github.com/lsof-org/lsof/commit/898fe0eceec98ca71198de7d9c18e7ce6144ee13:

In file included from common.h:42,
                 from misc.c:31:
../machine.h:415:26: fatal error: wctype.h: No such file or directory
  415 | #    define WIDECHARINCL <wctype.h>
      |                          ^

Fixes:
 - http://autobuild.buildroot.org/results/aa98b10e8eff5cc4fd03b4a64224cdfb6a0324a5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lsof/lsof.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index bb6eacb696..1831080b17 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -16,14 +16,14 @@ endif
 
 ifeq ($(BR2_USE_WCHAR),)
 define LSOF_CONFIGURE_WCHAR_FIXUPS
-	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
+	$(SED) 's,^#[[:space:]]*define HASWIDECHAR.*,#undef HASWIDECHAR,' \
 		$(@D)/machine.h
 endef
 endif
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 define LSOF_CONFIGURE_LOCALE_FIXUPS
-	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' \
+	$(SED) 's,^#[[:space:]]*define HASSETLOCALE.*,#undef HASSETLOCALE,' \
 		$(@D)/machine.h
 endef
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
