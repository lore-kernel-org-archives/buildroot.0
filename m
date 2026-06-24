Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A36CDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 10:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A52B40C28;
	Wed, 24 Jun 2026 10:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkA4fwL-Vbvz; Wed, 24 Jun 2026 10:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4781040C1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782296026;
	bh=8QGqvIGXbTNo9Lmu/1TpMAR4+DvpQxajV2bLP0MK+qM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=rz/D0lQw5TZuQI/PnGTio89pwD2v/x83DfAhTbyVdJDAd2+bxjcrA53nD1RAwU1dK
	 p3ejYLWapKZGhKzgclgi+4JKBO5M4fkPOrWy9dHSJsjdQUTZzBSYgi3K69AIPquLiG
	 AGSwdIgAbf+5GbUQ203pN+aIq1EDKn0TJcqgcZ5P5LUdIGhOYkB+4ujFsQWIhAjKr5
	 JfxJrXmVP5AHX6GcCCzh1s9B08LwjikVP3xkgABBnL0srR57+h8+j8tYXtd0ZtaXci
	 EhjjdmsAAdFimu1WpQPmtQ0wqk+zEQzSc+AFt7rJh6xuB8UGW29gB0mRxZ340nmidb
	 BVyacoAgI9Xjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4781040C1D;
	Wed, 24 Jun 2026 10:13:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F2CB367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9095860BC3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VAh4tO4NB6hF for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 10:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0960E60BC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0960E60BC0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0960E60BC0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso10099485e9.0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782296022; x=1782900822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cxevCFiXeIATTJw6Pu33FwHUxAS9efl6E6HaQFHfjkc=;
 b=pn9Fm5+OhElAILvOnYH6RbJ+osUuY97HobvuoierMexQBez8RK5cge3tsarNpQTrMY
 gxr8BejY+Lkg1KKFp5f5sZ6g5PC/a2y6UEcgxIzsrHOyIYpgK3+WMiaqprdVLBF4pkuK
 uxn6TtWT9+OKAxVeJcduuA5z3DJpxF7MILYS38TqV6lqc+14NojONKledVjYLOruj7Lz
 +VsyzNVsbb1lnnhJmb00w+/CeQK7Y7N6OYN9K4ZWiljmdcab/++dqlOzzUMT2VcJPBjr
 XdqZLgtav1JSKw4/taFuHxS8HTEWYZYHp+NQkwihSMI5SB4NAvVx7Rr83D9LMoawbk4k
 eg4A==
X-Gm-Message-State: AOJu0Yzxsu51mNg4wh1Sa/eJYkXEf2J98ZFjCvsgym0/KOkVQNgGPdY6
 4Uxuz5VU2Vx3fqj0bKXIqjz4tT8CPkPM6aoIO/WLrrS9VykczCx39Bho4KQZ0PLUClRrJN77RN1
 h/P8O
X-Gm-Gg: AfdE7cnjM6yKBeqMFx4F78rFnIhM5Ae0unMhZlGvbfKWPF7bq9nC8S3pnaKFGl6s5Lg
 zUz39tpjZeoMg7/7r0vdlPdhtGVFPSA67kSu8Qq2n9jjMDAlrMLaDhm7nt6/gWO/LDkAGOvuIkl
 iZYboSAcYuPhoNQoj8RC9JeNk4uajJCrN+QwPGRrzqym0MY0WxGrE2OBRIW6KGi0VhFulQVNMAc
 adXq413hKgPWpV1yFuCYcHm0YCxR0nBb5UGO/jtQ+lCjhIkLrmrmESKLjoNSz4k4aMRuRBfxFMA
 W2PUOGoL7oNW0FRWqHvx5RgGjpEAxN30tP/IhqwaiaBC6+wXN/RV6CPC8dT3DZlxWfzorP1VRX7
 wO2o+B8Vduj1xW5eOoXpijkVKzLpsgyz7qic/4jsX/r9CUz5uashHeDX3i606vS/sPYL2W1EuKn
 XW9NAMwtD4bME4YFE=
X-Received: by 2002:a05:600c:c8c:b0:492:3291:9011 with SMTP id
 5b1f17b1804b1-4925b389fdemr106223285e9.30.1782296021720; 
 Wed, 24 Jun 2026 03:13:41 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9a22sm5441002f8f.19.2026.06.24.03.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 03:13:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 12:13:33 +0200
Message-ID: <20260624101340.80670-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-1-thomas.perale@mind.be>
References: <20260624101340.80670-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782296022; x=1782900822; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cxevCFiXeIATTJw6Pu33FwHUxAS9efl6E6HaQFHfjkc=;
 b=Mr2tl1v4pfD0A8HK2G9xlJRgQ9Aml1Od9gOVadT+oHZhyMV+F6EETzYqFsLiOEn4qR
 fL+v9wFRuO+oOeqwSyn6y4YgtBDigifJpdn3greAOtmbuSpsHHHPvJyE2q9UWwBQTeqD
 wtPVjGXBt+lNbejvr/tyAaf+YqYfxsUBVFpiorUETN6GtklSGS6WmdunsytU4ZdyuEid
 CX4AaEstjGJR5BUGILPUx5cWB39abEwWtDJjbPu3Xj6+bfNFxKEpbKtWjQG/iaDqHls2
 /2g0tWMpD9ysVSR8e6oDSKhMNef4wfjo0U2aoISrA8cRURlW+XgiNamcaiREIpEeQgeZ
 bP8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Mr2tl1v4
Subject: [Buildroot] [PATCH 2/9] utils/generate-cyclonedx: make urllib.error
 import explicit
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] introduced a code block that reference
'urllib.error.URLError'. There is not explicit import to 'urllib.error'.
While this is not an issue in practice, linter complains that the import
is not explicit.

[1] 17c9deb115 utils/generate-cyclonedx: hint at missing Buildroot host package on a specific error

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index df12ee84c0..e337770599 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -16,6 +16,7 @@ from pathlib import Path
 from typing import Iterator
 import urllib.parse
 import urllib.request
+import urllib.error
 import subprocess
 import sys
 import re
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
