Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6FFE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 09:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48BE7608CB;
	Wed, 11 Dec 2024 09:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGj4Oxytn-gD; Wed, 11 Dec 2024 09:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 627A0608F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 627A0608F2;
	Wed, 11 Dec 2024 09:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42434ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 236CF80C77
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id alxBa1xfaxxT for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 09:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 63BCD80CA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63BCD80CA2
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63BCD80CA2
 for <buildroot@busybox.net>; Wed, 11 Dec 2024 09:46:55 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so5226581f8f.0
 for <buildroot@busybox.net>; Wed, 11 Dec 2024 01:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733910413; x=1734515213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zK963fKkM9z+zQH/neplonarnlfbLanoToQlChPICXM=;
 b=eFpMFIYBBkUUgDA34o8i5kasdv4/RIHpiNsmbzZILEnDehCcQlqy6M5Xr+LObfRUZY
 HeOVKl84Ltw3T++xUszbFo0ZQB7hLyK1HHEmHu8fioW+BctQH52ZpaBGdgz3kamvtm3G
 qLU+Ykxr1rXBeKVtCqJmVvpq/1q8R3Nn/UvQFmLypbmuK0e3cMR73f5vC3sDYZlo/Arp
 +g4dK7AqevBCIag+u392sdfOk5tE2B7qta43x31aEiyMe4Hf7mF87FSoHxaKU7UJAInT
 VHVJmRPt4uzv7Aqf1ztohQ+XIYWO0TsX9nkHvwyjaBjSugBkXFkDQsFfpxMLZh2vWO1U
 ErNw==
X-Gm-Message-State: AOJu0YzTvZsyh71U8VrQRUq/zND1bWeqiY8c5g19jExbycfWEK7Tk3et
 023eaWevX9CQ+7WVfggpQeekYabLrKKyunxV8EjS9MXNgTVbeiAJ1eOL1n6UkJVGV7kZ8C1A69Z
 Qlw==
X-Gm-Gg: ASbGnctqjkK3jb3Eztervt+R7d2U6XIQyeOuyTADvx2wr3YTIywEb+EGNAgAqW8LvYg
 pZOal2Vx07eQbrVcROThJ9w6fM8cv3E4nLw3r3ckCNp84ni/d6GrV62bvzVsdZYq++nYDui4uKI
 B6/wHXF+9l+ivx1eG2pubA4SiE6eikKnLYa5PkC6bHzzGgMO0OrPKEbRlRxIV19t13KgzVSaloP
 G145l46YmNZvRltteCrrWwAQ9lK0GyoVxeJdENi9x9NZth6eWvr8SvoJXT5KoWRXcgsTODaSOIK
 5uIMhXzPGalr
X-Google-Smtp-Source: AGHT+IEKYQPCDG+Zq5UzoqmCV5NqNkHg0rxuTMIHexJBZSbHi8aIcd/jBf01QYsBIfGAUjUpm2sr3g==
X-Received: by 2002:a5d:6d09:0:b0:386:4a24:1916 with SMTP id
 ffacd0b85a97d-3864ced371fmr1400717f8f.55.1733910413298; 
 Wed, 11 Dec 2024 01:46:53 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514d35sm892518f8f.74.2024.12.11.01.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 01:46:52 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 11 Dec 2024 10:46:39 +0100
Message-ID: <20241211094639.968420-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211094639.968420-1-francois.perrad@gadz.org>
References: <20241211094639.968420-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1733910413; x=1734515213; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zK963fKkM9z+zQH/neplonarnlfbLanoToQlChPICXM=;
 b=d6eUS0M2fhK9cIMLG1qmyKbr9lrF4MDzf+JS2KBkN0czr8O4Yz5Wt6itiro7EQ/BIN
 2ofUKhEktw5XEI6U8AhLV6QeJg8n8evK0Tk7tFu0pS9xXCUPHuu7byD8NOT9EoI4G0J5
 1cp06IclV8KWwMpdCulFLGabgf7W7S2KHeKjQtIEy8KmRHMd2rYwTwcV7Dtwrr2N8FUq
 WP1oUWsC65nX9+R7nZosgpcBSagOt0X87k4l3nBo/H4yaNM1ibUAb0HkzvauuCRmVkrW
 xiOlN3yOl6zhlC2v4bfeEOAuK+vuFArTrN9DkhXj0oiCksXz2unqAaJchwsvguPIPnXI
 /n+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=d6eUS0M2
Subject: [Buildroot] [PATCH 3/3] package/luadbi-sqlite3: bump to version
 0.7.3
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luadbi-sqlite3/luadbi-sqlite3.hash | 2 +-
 package/luadbi-sqlite3/luadbi-sqlite3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.hash b/package/luadbi-sqlite3/luadbi-sqlite3.hash
index 4096fbb26..96f083dcb 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.hash
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  c5b043db43941a3c6e43d3e3699236846ed6d03a6c4cb12fa1a497f965138d9f  luadbi-sqlite3-0.7.2-1.src.rock
+sha256  ab4b0b47614aa26c143da0e164476779bfdd406d263e0c4184a97d59f0430cdf  luadbi-sqlite3-0.7.3-1.src.rock
 sha256  988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.mk b/package/luadbi-sqlite3/luadbi-sqlite3.mk
index 4ae2b5cf3..ea0167160 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.mk
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUADBI_SQLITE3_VERSION = 0.7.2-1
+LUADBI_SQLITE3_VERSION = 0.7.3-1
 LUADBI_SQLITE3_SUBDIR = luadbi
 LUADBI_SQLITE3_LICENSE = MIT
 LUADBI_SQLITE3_LICENSE_FILES = $(LUADBI_SQLITE3_SUBDIR)/COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
