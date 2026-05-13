Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE9CCD4F21
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 14:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9F854161A;
	Wed, 13 May 2026 14:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2gWPj9ALd7D; Wed, 13 May 2026 14:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B7E84160F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778682194;
	bh=RcSzAsdrvLCpLvmAj/+5L67lRyxq6pa5vv0YVIOWShY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cwDplYElsoYtyO9jHQ5gv/8C2oiCN/veiDAKB0cd4T9v6DDU3goIRWyjDKvd/7n8V
	 ib7o+HxO2UzPX+OWG7tDfsCL4aNEt5eB6Dk6MSj3khGKYU4RSm5qTDMEJi6J0cVgXt
	 WwwKFrKziIZ1tvt6m4VDf0w1KtIlz3bOogRnccXzi/AV+rDYIP6PbXVpXX6/fFxUDi
	 VmzaqNhxG6u9XQ2knp0iBVCSqE1edneABrFs+2tFNJWMVUxmmcFqD7hXdUHU48diLj
	 NjS4+2fgC42Lijb44TL6VK8DE+YMFXmxoXE3ixkPIP9ivLirfC9cOKV9DxtfuI9SPn
	 sOMnvYegaSodA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7E84160F;
	Wed, 13 May 2026 14:23:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B20015F
 for <buildroot@buildroot.org>; Wed, 13 May 2026 14:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3153F61219
 for <buildroot@buildroot.org>; Wed, 13 May 2026 14:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWQNM_K8ZFPp for <buildroot@buildroot.org>;
 Wed, 13 May 2026 14:23:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E90261218
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E90261218
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E90261218
 for <buildroot@buildroot.org>; Wed, 13 May 2026 14:23:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43eb05b1875so4110141f8f.3
 for <buildroot@buildroot.org>; Wed, 13 May 2026 07:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778682190; x=1779286990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zj//YmaTB8B/X/x0ZD5zdvf2YsgXYaUsoecc+8OTFMM=;
 b=Xr1IgdQFpjj3iL4K+0l7t281JLJGxvoz0o95DOCcAFPnqyS1ayGX92EdUt84i028+u
 lcqcR/ns8FfZFATVckVEt09CSWIYqVlSikZadkE7PaCMDr+N61utJAIjr/KWZ826TrUv
 UarwlmEKqFed5NEODnFJ8e4QBm3qvaVpjSxCavnD8/8rxr6tfMK8S0qX0sideRz/60C0
 M2ijQf435xYly83Ot0sdb9SZTc4v13WbiJnTM2Jl8XYNc1BiZVC4KWGVTOMASyGdQ66k
 rUeWQ3JIirWSfSYhXAMpEKqKjWUHEA1mFN36ubvCnGx3cHMdZ/kKjbgcclZdPcUh7vk/
 Y3XA==
X-Gm-Message-State: AOJu0YxfsldrLNqLFf0UtxQc7Vz8XweK86elyGzOyqEEaxcKAoybHi5W
 c+hxyLEVhqa7JiOSHAr3DOJam8tS6K/A+3WDhgo4AwyJo6mx9qpsZ1HGq6MzszvRXR+GuWmxO9E
 0iswoQd4=
X-Gm-Gg: Acq92OGMekH/OPKFogOvQc3ueTLOIoPkfETz7KEkn9/UzLlwRhLZV3UCEIjZWLys3OT
 dh3JQN+R7jIl64SIpLIw0/9DAAA2EC6XqJRvxrWJZ+n0wrMlkBVjQvE9pQSNHOdBI4WDuhZH7Gc
 DnEmOfD1Y1e0yAzkB5a56g4YCjPT3nsPymOYGlQwKkopVSGR3Ae6pLOVC/0iNXL9tU2upzhVtx4
 hdeq9eUxGU/lhVKU1edeIMNHDuLetkghAubHWmBhlgr/FeE0H3pmcu/ZwSgUSpUASIguzS54PRL
 Q62HF0v8GhsOpsd7hhY/UNdIuoPa2T5EqN23h3CbGVjZ/5WWgnRYau5OJqgfZ07Ag99RcJ8qble
 okV9Lb7RwNfc81ePZ8IotsF+7YanQ8Hu3h/6IaevLSnoRQF5Ufbp08tqDJNj1J6kkDfKkO/vPde
 RmhgB7iDsC9b0klSXnhQ+vKqpY0IJNTjjZG/hmx4sifBeit8e46hzTzzMx5uqrCoYFEjwVaBjw0
 1vCmNrMrV9XkMiRk1zF9piS1g==
X-Received: by 2002:a05:6000:144c:b0:43d:7946:bae5 with SMTP id
 ffacd0b85a97d-45c59cd3249mr5186010f8f.42.1778682189683; 
 Wed, 13 May 2026 07:23:09 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454913049ecsm39808926f8f.19.2026.05.13.07.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 07:23:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed, 13 May 2026 16:23:07 +0200
Message-ID: <20260513142307.902102-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778682190; x=1779286990; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zj//YmaTB8B/X/x0ZD5zdvf2YsgXYaUsoecc+8OTFMM=;
 b=JiYX8QRKWaKqLFJjlpzqysWVgUzBRQVTo69KZ90RTI4Sx/2Xow23rZfeRQDwss5TgD
 thTi7ROm1eqkpP4X/fUYT2UjCwFPOXrvbetVmnflQwqLBi/9/g27rDhzlqYCXJBSSPXx
 0BbMXBw88zQWU7/bsW1kvsQ4r4UK67cgyIZq0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=JiYX8QRK
Subject: [Buildroot] [PATCH] package/python-sdbus-modemmanager: fix
 sdbus-modemmanager intall path
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the last version bump in commit [1] python-sdbus-modemmanager
install step miss-behave following the switch to poetry (as reported
by [2]).

The sdbus-modemmanager python module is intalled in a second
"modemmanager" subdirectory:

  $(TARGET_DIR)/lib/python3.14/site-packages/sdbus_block/modemmanager/modemmanager/

This break existing python script using:

  from sdbus_block.modemmanager import MMBearer

Fix tool.poetry install step by removing one "modemmanager".

[1] 7c30b1e522988ffe5d4b300b2447f912b83558ad
[2] https://github.com/zhanglongqi/python-sdbus-modemmanager/issues/24

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/13904075359

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...l-fix-sdbus-modemmanager-intall-path.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch

diff --git a/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch b/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch
new file mode 100644
index 0000000000..40638c652e
--- /dev/null
+++ b/package/python-sdbus-modemmanager/0001-pyproject.toml-fix-sdbus-modemmanager-intall-path.patch
@@ -0,0 +1,50 @@
+From 7a99efa663bf9602099f0658aecbec6b5dce778a Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 9 May 2026 00:29:59 +0200
+Subject: [PATCH] pyproject.toml: fix sdbus-modemmanager intall path
+
+Since the switch to poetry in 1.0.3 [1] python-sdbus-modemmanager
+install step miss-behave (as reported by [2]).
+
+The sdbus-modemmanager python module is intalled in a second
+"modemmanager" subdirectory:
+
+  /lib/python3.14/site-packages/sdbus_block/modemmanager/modemmanager/
+
+This break existing python script using:
+
+  from sdbus_block.modemmanager import MMBearer
+
+Fix tool.poetry install step by removing one "modemmanager".
+
+[1] 0d8ae7217841ab1bc12282076f766f94415573f5
+[2] https://github.com/zhanglongqi/python-sdbus-modemmanager/issues/24
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/13904075359
+
+Upstream: https://github.com/zhanglongqi/python-sdbus-modemmanager/pull/25
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 5e57df6..bf97a5d 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -27,8 +27,8 @@ classifiers = [
+ 
+ [tool.poetry]
+ packages = [
+-    { include = "modemmanager", from="sdbus_async", to="sdbus_async/modemmanager" },
+-    { include = "modemmanager", from="sdbus_block", to="sdbus_block/modemmanager" },
++    { include = "modemmanager", from="sdbus_async", to="sdbus_async" },
++    { include = "modemmanager", from="sdbus_block", to="sdbus_block" },
+ ]
+ 
+ [build-system]
+-- 
+2.54.0
+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
