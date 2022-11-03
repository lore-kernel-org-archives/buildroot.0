Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBDCC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E71C040519;
	Thu,  3 Nov 2022 21:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E71C040519
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kE_jlcG2IHO2; Thu,  3 Nov 2022 21:29:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C394040BC0;
	Thu,  3 Nov 2022 21:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C394040BC0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 491C61BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23F6241876
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23F6241876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nrF8HCDZsyUZ for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:17:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E516041872
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E516041872
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:17:24 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id i5so1285101ilc.12
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8miulSSy5UfgqT4q9eOFKn185QCXuYBqZRpyQCD1PcU=;
 b=nBks5RLV5os/LG74IA3XvYApZ9wawkVvGZ2CKPVpyLUtZayyd0Z73mA0dqzj7Ej1YZ
 jXny9aWbS0nB5NeiHxzJaQJ20upzsoLbUQU6LtFRjkjTSwT+T5hThqIlcS+VL4ap8ZE/
 iq/Ws6cqUyc7FksDK6sEGaXTWbFqV6SqBWWqBSM+AeQ3vPvMZFH9DGrGiek4s3MZAHYB
 wRsmpP5SWUuowtHjmyvHJbxlmbm+HT2rmB+Y4xTeWhfpNn6TGS55bftA0jJhIAtUgfcs
 LQhCDaDicpQXf7YDdBqny+Lvw4x/g/q8UiSlNFGVLJ+Wgt10Et0WX7QV20U8u5ahqvHX
 pG5A==
X-Gm-Message-State: ACrzQf2/qeb/cAtt5Qd5qbrfQuwSdDpb3BAOa78tZ1FJcB2GBfUERvF1
 fuSKxbbjxUKhq1JW6tyQ+9tqqgv6RGNyO9XP
X-Google-Smtp-Source: AMsMyM7HEbE5Eb8dufjnLQXA7+L9g341QgZeCfpyYpAMnu+aj+5Prbksi+JB6CIpXUCUdVJEK5kFeg==
X-Received: by 2002:a05:6e02:e43:b0:2f5:739f:7d4d with SMTP id
 l3-20020a056e020e4300b002f5739f7d4dmr19550343ilk.100.1667510243785; 
 Thu, 03 Nov 2022 14:17:23 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 n26-20020a6b591a000000b006c0aa1ff1a8sm748950iob.6.2022.11.03.14.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:17:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:17:21 -0600
Message-Id: <20221103211721.50841-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8miulSSy5UfgqT4q9eOFKn185QCXuYBqZRpyQCD1PcU=;
 b=HDT3nJt4/MsB2s8M5A4VSlRj209Fs1d7U/meXzuQzsfY5ej9n+e9JzGvtogfKpjBDz
 vpKVqGk29za2Wl3lT95F+M6xAji+5wDwotA5zafHmRGQmKFsl4UUTNv5NErQ6JxhKASR
 0amSfVSJPoVjUfxUR9zOZ4tWpDpnCriMdZsnesO5E5u1oUZtZto8D8yKjQUik0vxKorn
 yCpU2qDwtWPTH3hFMLUyw+frwtKlELoxlnF24bUGUjJBotMnD+WRAji+NotDB8qkTH1g
 7v31gtdKzBQUC884hr8LTLDeLX+fdUSgk3fmZ78daRpsnn6/L1BlmQRiiHStnlths/59
 BT0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HDT3nJt4
Subject: [Buildroot] [PATCH 1/1] package/python-yatl: bump to version
 20220907.1
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yatl/python-yatl.hash | 4 ++--
 package/python-yatl/python-yatl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yatl/python-yatl.hash b/package/python-yatl/python-yatl.hash
index 8ce192bf95..61391f6370 100644
--- a/package/python-yatl/python-yatl.hash
+++ b/package/python-yatl/python-yatl.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/yatl/json
-md5  551136eba4c5551c01b051341b190641  yatl-20211217.1.tar.gz
-sha256  d22bf7abe40d9bdd16bd15824d2df65e65e405df6ecb8601fdc7c233bf6b3004  yatl-20211217.1.tar.gz
+md5  f02b367e1c56af94eafd5bd1019c03be  yatl-20220907.1.tar.gz
+sha256  67d43ad79e1f58d8552718018470856a2ad210bdfeec42e978b28b1b21560d00  yatl-20220907.1.tar.gz
diff --git a/package/python-yatl/python-yatl.mk b/package/python-yatl/python-yatl.mk
index 12a8039891..0c33971b89 100644
--- a/package/python-yatl/python-yatl.mk
+++ b/package/python-yatl/python-yatl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YATL_VERSION = 20211217.1
+PYTHON_YATL_VERSION = 20220907.1
 PYTHON_YATL_SOURCE = yatl-$(PYTHON_YATL_VERSION).tar.gz
-PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/03/05/0be8164e8151fd8c96caeb2560f955dc2dc1a969f0868f48c046cd863fe6
+PYTHON_YATL_SITE = https://files.pythonhosted.org/packages/09/68/0c9d0a1192fdad5f3d38db096106c5adabb9b26c9ae107897997f56d1788
 PYTHON_YATL_SETUP_TYPE = setuptools
 PYTHON_YATL_LICENSE = BSD-3-Clause
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
