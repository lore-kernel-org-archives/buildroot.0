Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BA8C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A75944015D;
	Wed,  1 Nov 2023 22:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A75944015D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c37i6S53jssd; Wed,  1 Nov 2023 22:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A0C340268;
	Wed,  1 Nov 2023 22:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A0C340268
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 923D81BF30B
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67D00810CD
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67D00810CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7SDQ6I-VJiY for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:24:47 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A858284DA1
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A858284DA1
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c509d5ab43so4267031fa.0
 for <buildroot@buildroot.org>; Wed, 01 Nov 2023 15:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698877485; x=1699482285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YCLqKzFG9+XKaeUfOqP51GOzZuVSkyUZXxi6liNGw9A=;
 b=syxVdZNcG6Ye50Tc/gcZUIuVfH54au2CqOIQ/OtzlLlJK32EV9jZbmPhpSLlALvqSM
 x1g8g9ULIDjJAkaEk9KDqFKq0I5Qmtmfi83gyqnETC5fMRdwz8GizhrvurfoF9gIyQVz
 O7ur8rHBmoVktPYF+eKB4Rum38/mmlBSYoY5u7LLd1A8o9G0eEHFCI4nn5Wl4DJ7tC+q
 XLsZsgKSMIZKJfTHJtawNa1WnGsv2RPzIcLHrKXgeG13GsVSnipsWvIAlRZUK/H1JN7a
 YScrA2zhAIjxm0NdrjmMqDZLlxoTMbRnD7qKiFXJ6BNEJhXe0e97/6tiXmI0E+wq4bwk
 7R5A==
X-Gm-Message-State: AOJu0YwRmqVvObtKfSqhFEg/bB8YvHjoNCSUMfXpV5By1oS/CbAf3hJJ
 qlGm3iRD0ANacAwokzW9Ifh13EgvefE=
X-Google-Smtp-Source: AGHT+IFRYiBkW1VyIYbIGD9LJ/aYUWZ7bOWEspV6ukOQzabP7L3+7c3G/RekP2/HuDi/tsY9JEDTew==
X-Received: by 2002:a2e:88c2:0:b0:2c5:1df1:ac1 with SMTP id
 a2-20020a2e88c2000000b002c51df10ac1mr13831345ljk.20.1698877484358; 
 Wed, 01 Nov 2023 15:24:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m1-20020a05600c4f4100b0040684abb623sm934963wmq.24.2023.11.01.15.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 15:24:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 23:24:41 +0100
Message-ID: <20231101222441.10497-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698877485; x=1699482285; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YCLqKzFG9+XKaeUfOqP51GOzZuVSkyUZXxi6liNGw9A=;
 b=UQfg65sUDmnl/uQzBu3QILfN3e8wecdrHw70fiSRN6cemeBiGq9UJrFNAzzSmwcwEF
 F+16OQ3//Q6sIZfCgMgyViJh9dRYiOCxi22vD8ylp7ubU6wxBXEBaCjz0kI7C32O6d7p
 /xkjR9UiF7GQStEXunBuAT/omQu4kOwDFQn0zrwgA9bE0CF32JevEKMmiIWDEZMV1a//
 1YCOzvg8Fyp39zNx3ThKIektGiGwfiDco4PMVtQdIzGQrS2a9I35zijqEVPQ5kUfNhv7
 OKOFimKzx7OkeTyaR4wjHRJCoA8TGvUSq6z48bB0Ed0vYCsZ7r4YFDLJGDY9Jq0gbRKu
 h/zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UQfg65sU
Subject: [Buildroot] [PATCH 1/1] package/opusfile: add OPUSFILE_CPE_ID_VENDOR
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:xiph:opusfile is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/BB1B035B-FCF0-4854-AB18-0FD1181B0CC3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opusfile/opusfile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 63553a81e7..efd38c542c 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -9,6 +9,7 @@ OPUSFILE_SITE = https://downloads.xiph.org/releases/opus
 OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
 OPUSFILE_LICENSE = BSD-3-Clause
 OPUSFILE_LICENSE_FILES = COPYING
+OPUSFILE_CPE_ID_VENDOR = xiph
 OPUSFILE_INSTALL_STAGING = YES
 
 # 0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
