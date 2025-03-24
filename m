Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15B8C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 09:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17B4410F6;
	Mon, 24 Mar 2025 09:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxhCIpoUikTv; Mon, 24 Mar 2025 09:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D100C410F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D100C410F4;
	Mon, 24 Mar 2025 09:44:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8736AC0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CC8881801
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_YgfpfdKBU9 for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 09:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54A2080DE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A2080DE6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54A2080DE6
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:44:30 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac339f58631so54910966b.3
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 02:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742809467; x=1743414267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7R+RLljDHXC9Eh1DyOTpMRr5EVXEFlHyH+bvV+1IJzs=;
 b=oaDEVIc3f3A36bAynutGsTHZDcvTnEmYZqPrmAma+rhReULrqpYczqZPJ9Kye/ea9c
 KM/yJokPwfu2FQELLUFTjxOWIZhXCz0JgRWRJnPbK8Q741Y0qmneF0wubi4qjNLwBQI+
 2WEvw6MiVlpmumlhnVPDPgmhmG2Cyxnq9zLenOkfWiTbd+kv3/lHSEYkEPE0YAnMqThZ
 WnI91by7Vc1XXAUoSHj6EjqmdCRB+3jiOqJUimbbtHq3gT2Va/a3NvmY+icDEyr6nYqT
 WxbhvvQ8FGng6K/WZHn0WMWk4jr+YHsZzKVtfcOrndej2iB7BZiHk+MXSyugmAhb5UVn
 ajYg==
X-Gm-Message-State: AOJu0YyVGCk5Rmz6s5F67O4Dj+QQj+RO5yyQ9xYOCJzwop9/pdj5HcYj
 EGWrjv0pw8F/WNdAKOwquYdgdSnPZLXvz7sTb27w4/8AnkraPyrbZdwU0Vz6ezaGXSFiDaa5GaP
 j
X-Gm-Gg: ASbGnctECXA2PdaxwXInas/qseLbFlBkflpOtES6q79BBgFYFUOhVVa0eauWmfK70l5
 qfg3SFzWvmz0PG1IPyKgS1XjCsQESeZBWcMkSLHyPQrfnSpA9ADxm/9yIcqxM7My4Uw16li5jcr
 zjlHNsTEsU0PfB6V+xbuSQvN87ewspaB7hDeslqt8XvcP8MleWLx+xxy0kHa9hsvcCSnrMPVtdw
 vHhW6/G2L7IwFWdyeejbNovuY0fmMNyO04Id3uC1ZupgBhwcH0fU/wgJVz18DASaurjzKSkCaum
 x3CMSnRzeAFPoLNUzod/G+wZoSrLGiR7ydw5h7afkVQ0p2DgBhsZnH2e2nol5HrNwBR+Ig06OiK
 rKRkFuT79BmAWXnG0FsNMHMDC5ayHxN4ojbiIjTgR7QCi/ganfbPcgRLkP37oRpUfUBKZjpXiCg
 Y+Ths3gHzMyA==
X-Google-Smtp-Source: AGHT+IFnhlUoESgLcHFANNX+lQEwpSs1DaQD1SIvpalOvxF2UZyyzu7vnquuCOEUJ8akH857ylRLFg==
X-Received: by 2002:a17:907:c7cc:b0:abf:7a26:c472 with SMTP id
 a640c23a62f3a-ac401bb3d9amr382871266b.4.1742809467314; 
 Mon, 24 Mar 2025 02:44:27 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef869fd6sm653841666b.19.2025.03.24.02.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 02:44:26 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 24 Mar 2025 10:44:20 +0100
Message-ID: <20250324094424.428727-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742809467; x=1743414267;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7R+RLljDHXC9Eh1DyOTpMRr5EVXEFlHyH+bvV+1IJzs=;
 b=ZZwKrobfPKaHOQbkzyaMXQuky0M4yY6TYxo8URXq6mAYKlY+3UudniBo1yf9WJJ8AC
 DjtIIOLtD8LAtqKWOHWmY/XzMXBlH9JOoDS4fGX+QQSUyLq2noNKxON6iVrRnug/CuCB
 snBRP1M/FyAKD+6YM4JtTfhrLtqCcJ7oKK+oc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZZwKrobf
Subject: [Buildroot] [PATCH 1/5] package/ivi-homescreen: bump to version
 a038ce00031ed5a9a89b4d8dd7dbde5e3d7ade6e
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/ivi-homescreen/ivi-homescreen.hash | 2 +-
 package/ivi-homescreen/ivi-homescreen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ivi-homescreen/ivi-homescreen.hash b/package/ivi-homescreen/ivi-homescreen.hash
index 60b9281abc..484ecfb128 100644
--- a/package/ivi-homescreen/ivi-homescreen.hash
+++ b/package/ivi-homescreen/ivi-homescreen.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  733a95a9b50875e8b45b0b69118656edba3ba88ecc65e3c0d76ea5df9761c433  ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a-git4.tar.gz
+sha256  aba31437dd90eca1fc5723619c269394e475b3000309eda86efcfd252452a85e  ivi-homescreen-a038ce00031ed5a9a89b4d8dd7dbde5e3d7ade6e-git4.tar.gz
 
 # Apache-2.0
 sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
diff --git a/package/ivi-homescreen/ivi-homescreen.mk b/package/ivi-homescreen/ivi-homescreen.mk
index 4293b2bc35..525fb4e11b 100644
--- a/package/ivi-homescreen/ivi-homescreen.mk
+++ b/package/ivi-homescreen/ivi-homescreen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IVI_HOMESCREEN_VERSION = 5ab78a19e95c88cc5d6b173ab1260a211e78cf0a
+IVI_HOMESCREEN_VERSION = a038ce00031ed5a9a89b4d8dd7dbde5e3d7ade6e
 IVI_HOMESCREEN_SITE = https://github.com/toyota-connected/ivi-homescreen.git
 IVI_HOMESCREEN_SITE_METHOD = git
 IVI_HOMESCREEN_LICENSE = Apache-2.0, BSD-3-Clause, BSD-Style, BSL-1.0, MIT
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
