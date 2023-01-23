Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E3EC38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 13:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAA7C40966;
	Mon, 23 Jan 2023 13:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAA7C40966
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xrLE-byMW08Y; Mon, 23 Jan 2023 13:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E26AC4064C;
	Mon, 23 Jan 2023 13:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E26AC4064C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB83D1BF359
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 13:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7A9860C14
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 13:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A9860C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0KPpJcu_0T9C for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 13:34:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2E8160C11
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2E8160C11
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 13:34:41 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id y11so14502901edd.6
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 05:34:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zdCfGmfPpXuZvPc1ZCSZ5btD2ZH6Jx/kE5DOTpodJGQ=;
 b=W0g9KTQz/ZAgYxHh/QxkVBEjTcbuTL2KqEyk/nxMsxSFyKoz7TjPf7ZPYkDSkP229R
 1SvSGzw3g021ILvvuGhG9Ig2Wgoi3e6T+k5DAZj8C7FqucrDwRpwK0vj+BDEqpKOKVok
 d/xsZjo78YbDth9EvvKkAYlm4rv7Ek3iCun09lhAGad7pMNWJI4NLvz1xAGVEBatvi2r
 BrBrdD+fjr6TJ0fLeqCaaUXkHTaN/8/igJyBBcwhK/U5cVPCV1MNBJ97ECe4iCJ6zshu
 JMcXAmyvfBl3FfP+WFye6NLHADuYkdBYLiShAHnbNWLIHBhXTspfeISuRlTqZQ5DulEP
 +Rew==
X-Gm-Message-State: AFqh2kqBXwbg9q1rvU1mb27/Be7C++jcNDFfzphElusFgxsZqZ6ZLPsd
 JPggp2wntEd/MADrH850Vkm7CGeTXCo9XA==
X-Google-Smtp-Source: AMrXdXtQhSlKeJfgmiRlBR7dpEMoQbO6GVJ+s2G2dX3QigRwUKAcy4tTgqbmgcQrqcFrUtzp7f4MkA==
X-Received: by 2002:a05:6402:2937:b0:470:4d71:6d43 with SMTP id
 ee55-20020a056402293700b004704d716d43mr24310656edb.25.1674480879668; 
 Mon, 23 Jan 2023 05:34:39 -0800 (PST)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 b2-20020a0564021f0200b0048c85c5ad30sm21372953edb.83.2023.01.23.05.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:34:39 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Jan 2023 14:35:26 +0100
Message-Id: <20230123133526.3371864-3-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230123133526.3371864-1-marcus.folkesson@gmail.com>
References: <20230123133526.3371864-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdCfGmfPpXuZvPc1ZCSZ5btD2ZH6Jx/kE5DOTpodJGQ=;
 b=U7k/ldNBKVqFmARl+H5vFaJiX5ClHxhkIyz5+qHq/+xHuhwu8uQphZ4CDQFs4hwjVv
 gepZObp9joiEthB3F1dR3FzNgwSpxrdLrA58BOwsRgVZRBzNmDOK84AjrQN2K8pQkPK0
 ovgT87bLRpGW23pGGjLHuLRJmsaOSumrj53bJAB3xXhf872E4qk3SbmwihE1e2mEnlRf
 zSI45F8VDQXGGM+mLz9SNdayypZbM1phIpAj5JMc/3AqzYLMEIyXIgG+Bcst8xX41joq
 QtlIElolCDR4Rh2L0EUfvqOZ+2BNdFrDD0L3JnDQ3Zy1LXIgKsNXxyA1o0jAIO67TrFu
 gDUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U7k/ldNB
Subject: [Buildroot] [PATCH v2 3/3] DEVELOPERS: add libcamera/libcamera-apps
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcamera-apps is orphaned, so take care of it.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8e0dffcd3..b973c37b82 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1890,6 +1890,8 @@ F:	support/testing/tests/package/test_python_pytest.py
 F:	support/testing/tests/package/test_python_pytest_asyncio.py
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
+F:	package/libcamera/
+F:	package/libcamera-apps/
 F:	package/libostree/
 F:	package/libselinux/
 F:	package/libsemanage/
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
