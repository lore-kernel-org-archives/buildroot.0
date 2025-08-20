Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DB2CA0EDC
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 16:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED4C841166;
	Wed, 20 Aug 2025 16:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhwiIyy2tLsi; Wed, 20 Aug 2025 16:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0638241151
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0638241151;
	Wed, 20 Aug 2025 16:55:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 930407AD
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84B6A81A34
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2rTz0XqthAh for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 16:55:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D3A98199D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D3A98199D
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D3A98199D
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 16:55:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b9e41101d4so88920f8f.2
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 09:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755708906; x=1756313706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dXbRzxQ+jdnk7er3jnY1AUaTi8bl9ZyTJqZFPP0Lj+k=;
 b=HcdUV7jwYhMnHNN3XvzevpwxwWo60Fuo+Y3jY2m2sNv7LnWdQWvkQbzz6HuHvvNpk/
 /+BPzgQbyrD2945luCprO2TZ6y6yznvgRFo3r8ZNrMCKx51fWCB1xgVSIvYUowqJCsUn
 FbgwCxa+NjTvYY+aY6TfKUs0xapKTuwZchhiXFNQHhd2YsQLLs3sbWwnwFCKl/wTCX14
 q3TK6HL7O8aVxFwNIMB7UJsW+SA08/VaIwsImc205KQmtK+gnuXi+bjjHI8NBn30pEv4
 8krTaKCCuZispgnHYtyEf4ER0A4SZgB8WYDocvenqimKmfAnWLRbNIaDxXR3Cmi0/4SY
 zIbg==
X-Gm-Message-State: AOJu0Yy/On6+0X8GX8uvfsy35NtmwPVR07Go4PhZgUsA12t5QFaB6DHM
 I9nrZkruK/Xzf7x5rS6JDF2OYW4nyV524Xephqytg8EBX0K74Q6KcdKoCcmbpU1G
X-Gm-Gg: ASbGncsKcgIao4mIeG/e7L3YN5oi4lBnnHhqM74Pd8Sv+RP/incqRS4IlDY6LfELhcW
 sWL+XRfWXqWEomf17qGNEUNwU3V/zEa3pKn/OZitv+Vk9ULD+tt/K6Ggup8ERGEZ6Y9z+YgRSGm
 eW5oRy3VOHA49KzJd6EYzQo4i5059cS2PC7zz49rkncDxfXmhT0qVKDLeL9fvDgfMa6nbp3TBI0
 acWG+3r0yD6528ATLkw03D3I/VpQaNkkEl1pvIQPPPK/nT9b3UH4NgZkMXhDmDoysGcBwxcDXEy
 k9G4bzWbfVoKfK+cogM1ZtvqtJGus8tnfoObUutjgms6dezKooPILeoRQSGxlFyDGY2qFy5XNwt
 wYqMY/cyRP15T9OB1Q0Q/LBXZ9bt5erGAu51/VwUya/0Zsa6a8O4MxUYe
X-Google-Smtp-Source: AGHT+IECyeCXIZVV4crCEXgF+aXXAvm6m1ITzFQe/c6mPx4Xi0zFNnV6ayUU/KPsxjkttCtkVMTNEw==
X-Received: by 2002:a05:6000:4312:b0:3b7:8154:aa36 with SMTP id
 ffacd0b85a97d-3c32bf5d4ddmr2671989f8f.7.1755708906186; 
 Wed, 20 Aug 2025 09:55:06 -0700 (PDT)
Received: from localhost.localdomain ([212.22.141.99])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c396bf0f0asm2841312f8f.28.2025.08.20.09.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 09:55:05 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 20 Aug 2025 18:55:02 +0200
Message-Id: <20250820165502.1984588-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755708906; x=1756313706; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dXbRzxQ+jdnk7er3jnY1AUaTi8bl9ZyTJqZFPP0Lj+k=;
 b=lynyFN/lxFFV7pwutthaXYx6DEoBjMMWr5VjuC2+aYmVajMnpUDTomIdVCkXbT5zbt
 C76UkXTDcNb+vE6XUEvzrgNox4o+ezOGGTxuMEhOpsW+JzoEZjdxQZBWhTNdM7OBSJun
 0nOinJi8nNyhEW/SvpRfaaavZee3Y/zwmBTQtnytV8veA6YGEjrojJpbvQIc5sxrVhi5
 9B6KZZpWVXNpJhame/O4NcNlqs6zOfXjTXOQRaS2+dNMhhgFbkNbILUzfIX9XCyKh+WV
 Js0GTSYMMq5i05Pa+YNuNMDtfHjUC3Vx+3tu8gMjMYyguEv8hLQG2Hin+A3epFSnIhkF
 ijRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lynyFN/l
Subject: [Buildroot] [PATCH v3] package/jq: security bump to version 1.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/jqlang/jq/releases/tag/jq-1.8.1

COPYING:
Add LICENSE notice of NetBSD's strptime() to COPYING
https://github.com/jqlang/jq/commit/78045d8aa9d155ec0f82ab102aa752300c2349f1

Fixes the following security issues:

- CVE-2025-49014: Fix heap use after free in f_strftime, f_strflocaltime.

  https://www.cve.org/CVERecord?id=CVE-2025-49014

- GHSA-f946-j5j2-4w5m: Fix stack overflow in node_min_byte_len of oniguruma.

  https://github.com/jqlang/jq/security/advisories/GHSA-f946-j5j2-4w5m

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
v1->v2:
* Updated COPYING hash (Thomas P)
v2->v3:
* Adding new license (Julien Olivain)
* Adding security issues links (Julien Olivain)

 package/jq/jq.hash | 4 ++--
 package/jq/jq.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index 344f73d463..4596134620 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c  jq-1.8.0.tar.gz
-sha256  ea9e53f5974239869c51ace8bb6849c9751dee7c9d592180957987a1a133caff  COPYING
+sha256  2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0  jq-1.8.1.tar.gz
+sha256  ad2b4a266b2268939c1446979759706077421cf906a203aa188c6f396e8cfd74  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index f3f4704f37..c1b47ce829 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.8.0
+JQ_VERSION = 1.8.1
 JQ_SITE = https://github.com/jqlang/jq/releases/download/jq-$(JQ_VERSION)
-JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation)
+JQ_LICENSE = JQ_LICENSE = MIT (code), ICU (decNumber), CC-BY-3.0 (documentation),
+	BSD-2-Clause (strptime)
 JQ_LICENSE_FILES = COPYING
 JQ_CPE_ID_VALID = YES
 JQ_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
