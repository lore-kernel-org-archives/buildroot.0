Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7069C433EF
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 10:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D82E607D3;
	Sat, 27 Nov 2021 10:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lo8zswMPp9um; Sat, 27 Nov 2021 10:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF235607C0;
	Sat, 27 Nov 2021 10:03:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 604DD1BF33F
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 10:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE62408F2
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 10:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLYHQF9rMcfs for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 10:02:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E228408D7
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 10:02:30 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id p23so14472463iod.7
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 02:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mh/C2vXV3ruO0T3pzC8HHE8+aChjnTkmjmmtHZ4pS9s=;
 b=YvvTzddjX8ulVpLq7IRm5w6nDL5H6qaJtXbcUHSxMDeBMDULVW49uW22lfZgIOU+qY
 wUkrSdv+LXiZiByM2fCFjlWJQN8n739uWnF09KZZ0u810yht5ONUm/dTgkS4pva2QQeD
 mLWJnQTH0om2KYmdfRqZww5DbxrHnZJJIl8RVHix7XH/+VU47LqtCWO0aI0UTvNdf3Fq
 DONRaVY4kr0HOGYy1AqjmyxkAArHZPUPHr2qRkJatPiW7jXwylX1kGVi0SEiuGHFHJHR
 L6Cz4Ca9RdDZmN7JgT5D8MxEfzjNFexQEFfIGrVBX030/3tvVA+ZVgZP7QJXTXsdV78+
 EI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mh/C2vXV3ruO0T3pzC8HHE8+aChjnTkmjmmtHZ4pS9s=;
 b=eVCj+HbFLZ8VT07nCWSogZdCjDTM7SasoG1Vob6dncBduqtEFtYungz7KaPiWPiDuu
 ys6A96M3eeUAOURFyF2sutsLr4bMFIxtQO0lTv5vjO8cJBc2SUAIqtaNEssqdpNYzlTp
 Fy07aI+DPKqO/VPJxJkzFPTi/CcR58VelBKjx4mtEgTypuhl9nIk9jYltXEDQfOnS6bp
 4xa9RhcpLSvuaflOaoBH8cNxBWHwSDvf+fGqCJMClYAlFtb/SMlz2ixpGkclqNR+vMvW
 YJRi4BRb5XgGflJZFYynTYaCY48SS2/STM20wEERJVPH31F/tq+whTN9EH6j0yY7Vy5x
 smmQ==
X-Gm-Message-State: AOAM5320hkrO6vWa4tiY5cUHZGSdyUT2t1Zx+/eWMhMcg8qwcIPGzQaJ
 zt+6rJvnN8o/xXp5AgvZVhKbJBXItaA=
X-Google-Smtp-Source: ABdhPJxYl0bdk3jF/SExCu7Dmi/JtlsSajAIk1FgHk3Od8x626UYqavw/dj5xN1jfdUZ7zJMbLnhfw==
X-Received: by 2002:a6b:b7c8:: with SMTP id
 h191mr36769648iof.155.1638007349686; 
 Sat, 27 Nov 2021 02:02:29 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id f16sm5105710iov.33.2021.11.27.02.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 02:02:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 03:02:19 -0700
Message-Id: <20211127100219.2121658-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211127100219.2121658-1-james.hilliard1@gmail.com>
References: <20211127100219.2121658-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/python-requests: add missing host
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The following are runtime dependencies for host-python-requests:
host-python-certifi
host-python-charset-normalizer
host-python-idna
host-python-urllib3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-requests/python-requests.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 474d2033ac..74cc91ef01 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -13,6 +13,11 @@ PYTHON_REQUESTS_LICENSE_FILES = LICENSE
 PYTHON_REQUESTS_CPE_ID_VENDOR = python
 PYTHON_REQUESTS_CPE_ID_PRODUCT = requests
 HOST_PYTHON_REQUESTS_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_REQUESTS_DEPENDENCIES = \
+	host-python-certifi \
+	host-python-charset-normalizer \
+	host-python-idna \
+	host-python-urllib3
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
