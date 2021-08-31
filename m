Return-Path: <SRS0=R6N7=NW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6DFC432BE
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 20:25:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70DA460F23
	for <buildroot@archiver.kernel.org>; Tue, 31 Aug 2021 20:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70DA460F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=starry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 314BC400A8;
	Tue, 31 Aug 2021 20:25:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id McQ4T_ubj52r; Tue, 31 Aug 2021 20:25:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 827E1400C1;
	Tue, 31 Aug 2021 20:25:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 345C11BF853
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 20:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2330A80FE8
 for <buildroot@lists.busybox.net>; Tue, 31 Aug 2021 20:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=starry.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vR6fDXomoZG for <buildroot@lists.busybox.net>;
 Tue, 31 Aug 2021 20:25:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 97D8180F20
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 20:25:11 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id t35so688678qtc.6
 for <buildroot@buildroot.org>; Tue, 31 Aug 2021 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starry.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gS0XkN+AyXWU0bGN+hEowVCQfkqvoKA2ZO4az1i7GA=;
 b=nmhNtZjSVCpw2ACGToue73/w7og4xveBvwkkev07gdtJUzC9j2CPgjK3TmF0mcEfxb
 6A04nnIioFNVTfZ66c+Krcx+8EzwvazfSC5Z9m6caG4TeY37i47PJFdibliKmJitcE1K
 MdMmlHddpsUyoLb5N8VG64ijmw9NlWoBEOuIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1gS0XkN+AyXWU0bGN+hEowVCQfkqvoKA2ZO4az1i7GA=;
 b=eXQPgZpEk1R5I3hgH66OqF85/eESDiW43a1zwj3uTCPCaBR2LzcZy1GWS0tsB8sngF
 jA5g9SsUO1LChReAo9+2Crj6a5cmurDigNYxeYQFWfIJiArGWrJppsPZRNAxWF0x782B
 UPnI8RXE6PIeH10xmWyqjT1DBG//+imaEhSVFAh0pO/cH1x1yw5UqRXLVZtQmpL6lfOU
 DbJRJpLJA8AiIKyePPy1ocFxTjD4oUgKRzSBc1LwsDn3co6wVDncaeq+XkVe/valL6Kg
 DFHVRfgsDyMT6HIEhPGD+21zK8cwp3vRuVkbgmmsPPxrJEDABBINyqeY/KAFppw5jbkj
 02sg==
X-Gm-Message-State: AOAM530OywdnBbSCXCz03hw805xKA9JKy9rMRWsENzcdBquXZACvqX9M
 V6F4hvkKraHW5QBWvQtARRHS5WHk8TiGzQ==
X-Google-Smtp-Source: ABdhPJwgME3aWiZhBpkhZ6RA//AW1sCknd2+C9dCI5/oOnEWcCuBrG3GIuaRcg6gPU0CHNjuFxBhXA==
X-Received: by 2002:a05:622a:4d4:: with SMTP id
 q20mr4568565qtx.271.1630441510189; 
 Tue, 31 Aug 2021 13:25:10 -0700 (PDT)
Received: from starry.com (205-201-16-55.starry-inc.net. [205.201.16.55])
 by smtp.gmail.com with ESMTPSA id a185sm14557133qkg.128.2021.08.31.13.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:25:09 -0700 (PDT)
From: Nevo Hed <nhed+buildroot@starry.com>
To: buildroot@buildroot.org
Date: Tue, 31 Aug 2021 16:24:49 -0400
Message-Id: <20210831202450.18238-1-nhed+buildroot@starry.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/1] package/nginx: override endianness
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
Cc: Nevo Hed <nhed+buildroot@starry.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

---
Changes v1 -> v2:
  - Added Upstream-status tag (suggested by Arnout)
  - Updated commit message
    (Typos, missing words, clarified impacted targets)

Nevo Hed (1):
  package/nginx: override endianness

 ...-of-endianness-for-cross-compilation.patch | 118 ++++++++++++++++++
 package/nginx/nginx.mk                        |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 package/nginx/0010-Allow-forcing-of-endianness-for-cross-compilation.patch

-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
