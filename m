Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E44C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 21:05:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA86E61186
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 21:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA86E61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C2A440017;
	Tue, 21 Sep 2021 21:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6gVSsXNr7CT7; Tue, 21 Sep 2021 21:05:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7166400E9;
	Tue, 21 Sep 2021 21:05:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA36B1BF255
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 21:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97F57403CA
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 21:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9jdqogzqtif for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 21:04:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFB9A40248
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:04:48 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id u27so1374932edi.9
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 14:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XBby7nhX93koYThq5l9hDo/FPyArDD8Eeivf1cq5bU=;
 b=aDOlwwjaKeCf4XN2Z8Cp1eEhxAQnPgdGJGxn5O3tthVNWm75xZmWWfAAC0cqJnpLV0
 mshCOFlx3y4M6cESoWhjpfgSUrNLJi335fw4Gz0wGuacuNf8D9bErbqo4XSeWeqo74pm
 YZvE2j0oxEEeT7U3L8P7U2MMfHLdUoI11xUKsrDGh0p1bSbnI29mSIdEUsq0fnmiRJrB
 GgvTFxYGDbaiQHNqoyz/OAbnV1z+3AAHpzLbSS0PedbXruBvQ0SS3hXVH3mbEjML0lGe
 JWLYbCtuebNSwKQxWXmfKIdpUgY0oWuw+VAWe3gLQuS15MMxxvu2GkBhs13kIsR9Jj7y
 YV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XBby7nhX93koYThq5l9hDo/FPyArDD8Eeivf1cq5bU=;
 b=yMLa3hmuluZukEcd4ORRoT6aK8Xhi/rptwQjM+5JzfE7k/sLjo6kmx5fOUUPVdnnTh
 K6umA7T95MgqfShsugil64zNmYwjC0qpoVMzupmk6qY1DCafCl4WMH8phgH5j1W3VzrL
 6SX7Qa9EePyklZMwIpvjG0qX2tKYHGBzwJw0t4RwiKyFgBJ+8QuaCqoZUQ5PwLrDF1tZ
 xLDYw/fiehGIcUxWNCJG/jq8i0ETsk4U7W7BnkIaaff1ZBuBf2OiOpVr+NLVmYN3UJbB
 ddI39iVdr4l4d2A9KXWkpC3hYfH9DG+TUGjruMHH+XoIkujy6ViJIx885S2bR+/FhI7T
 qdCw==
X-Gm-Message-State: AOAM530eJaPXFQ61zzHY2l0l9nR4ZYs65amU0FStQESi1P3g1Gx7rMlL
 EWKIeRJ82fRDwl2jXHvjvW5Y/DoubMI=
X-Google-Smtp-Source: ABdhPJygSiMBBceSOIpFHf//qFLywoA1Ir4qb9MK9kxj8avILguziWW+JuThdj42jcBPmY91FspF3Q==
X-Received: by 2002:a17:906:e299:: with SMTP id
 gg25mr37575047ejb.339.1632258287065; 
 Tue, 21 Sep 2021 14:04:47 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id h8sm29606ejj.22.2021.09.21.14.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 14:04:46 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 23:04:38 +0200
Message-Id: <20210921210438.41808-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921210438.41808-1-petr.vorel@gmail.com>
References: <20210921210438.41808-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v3 2/2] utils/scanpypi: remove python2
 compatibility imports
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

ee8b680816 ("utils/scanpypi: use python3 explicitly") started to use python3,
thus compatibility can be removed:

from __future__ import print_function
from __future__ import absolute_import

Tested with python3 -m py_compile.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2->v3:
* The same as v2

 utils/scanpypi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 9dede4e119..1f3326cf4d 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -6,8 +6,6 @@ Utility for building Buildroot packages for existing PyPI packages
 Any package built by scanpypi should be manually checked for
 errors.
 """
-from __future__ import print_function
-from __future__ import absolute_import
 import argparse
 import json
 import sys
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
