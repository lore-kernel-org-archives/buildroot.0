Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAC8C369C9
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 10:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C5D40D06;
	Fri, 18 Apr 2025 10:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSclPltA3pVN; Fri, 18 Apr 2025 10:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4905D411D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4905D411D8;
	Fri, 18 Apr 2025 10:29:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4B6569
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 10:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3D7B43000
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 10:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_9sE0iMi4lT for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 10:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.45;
 helo=mail-ej1-f45.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB9BF42FBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB9BF42FBC
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB9BF42FBC
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 10:29:27 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so345200866b.0
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 03:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744972165; x=1745576965;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SH7wrH52HrxEpu259//dLp02XHNzEOHHiiVM0adMtCo=;
 b=Wyc37uuJvTfmO3VydWgpR3Nq+sIbRvN7OVllaLrsF9UIBX+WpDnltp9s3D5x2MEaFt
 xO2AsU1yJbbWl1SXra+y5weO0yAXqmo920NW3X/48Hnr0Q3Q18OvttU+MhNKEpODWKMj
 DuWG1bSg+QF34F/hIy97NtBLC27Mh+YUaDbXnhZ8T84uQj3ErmKEEVhq7ujHDmvfCRfI
 SSOomJ9NXuf9G/iTr0KnNgI60f0PTTQh4Gns+fZlx3H6OcTrXbZZEY36/j3rUFUxIxdB
 Jl9DX9RDSHPUuQUk0hL5JJVIZRHo4D2evYrx9YLVra2zvZ1puT+gzPrariqe6Snc5OVX
 iUDA==
X-Gm-Message-State: AOJu0YznO/EHtjfbf1gMtKP1XbMAFZ1BqJiD6vTR0rC9c2E/wJWL5XpY
 6thqpGNwIys5Md1qgr+/SYnkrFfKGr4eC0sG5UHmMkKA9d5+Z9asrWonqA==
X-Gm-Gg: ASbGncuZmQ+zMUIvneAl5ZQRs3j/Uai9zMF5w2nG9+p2+8G/pYzWSbyryFmGW1Ln7VZ
 3oAMV71w3iGrjaH656qPXhhbUGECd+ShlxGua5UXHR9cLCeRjbaImAJyNSQ2BZXL1yffl/MtlAY
 bPJclfXtKl8Fcl4CeRjgB94Y9cz8pz4uk2ciDUyUgUEYV1No9zRXcTe7czuL6ug2R9t2d7fHnYQ
 h+OEDJgp+Jung/0ibA7e7yP9d3yQqQhAi0MxRFNNrTGZFTi9GBUDAHakVHlkDZKy4zG5NCZUetr
 toF+OkJPnIGU081FybPvZYaE4apFTk57wcF/1FvetJKQm3qDMWHdKXN1BQHkgZLuyK3o5OSqQJN
 IJ94nk4fvIMfltGnQYKYFQfu24FFZ+Y2ApQeUpcE=
X-Google-Smtp-Source: AGHT+IFYRF7shpLeQkOxO89RUrBvXBuaaso59c3LM6/LB1io8pcxzzwD5vuH+dmN5jbtVBxfnrYIOg==
X-Received: by 2002:a17:906:f59b:b0:ac7:3028:6d67 with SMTP id
 a640c23a62f3a-acb75172ff9mr168256766b.16.1744972164684; 
 Fri, 18 Apr 2025 03:29:24 -0700 (PDT)
Received: from
 codespaces-b7c665.m1k4x3cq3poebda54cltipn05g.ax.internal.cloudapp.net
 ([20.61.127.49]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-acb6ec0b6f0sm103639966b.6.2025.04.18.03.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 03:29:24 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Fri, 18 Apr 2025 10:29:22 +0000
Message-ID: <20250418102922.13048-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/fluent-bit: fix missing object
 runtime error
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

$ fluent-bit
fluent-bit: error while loading shared libraries: libminiz.so.3: cannot open shared object file: No such file or directory

Commit 527deef "package/fluent-bit: bump to 3.2.10",
dropped the BUILD_SHARED_LIBS=OFF off part, because miniz uses
static linking by default now, but runtime execution shows otherwise,
so revert to fix.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/fluent-bit/fluent-bit.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 013d8d3b37f..768dff7f804 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -68,6 +68,11 @@ else
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=No
 endif
 
+# Force bundled miniz to be linked statically.
+# https://github.com/fluent/fluent-bit/issues/6711
+FLUENT_BIT_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=OFF
+
 # Move the config files from /usr/etc/ to /etc/.
 # https://github.com/fluent/fluent-bit/issues/6619
 FLUENT_BIT_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
