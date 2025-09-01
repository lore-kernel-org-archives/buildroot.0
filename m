Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBAACA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 08:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EE9F41462;
	Mon,  1 Sep 2025 08:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DI4it5WA2mXa; Mon,  1 Sep 2025 08:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D94684040C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D94684040C;
	Mon,  1 Sep 2025 08:22:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DC5B169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EF0583DD8
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwGNjb571YO2 for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 08:22:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=victor.krawiec@arturia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9F0383DB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9F0383DB6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9F0383DB6
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 08:22:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45b8b1a104cso8098875e9.2
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 01:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756714961; x=1757319761;
 h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nQDX7k3PDsiHA5wKxPp6nTh+fjdP2szNeL6UwA4lvaY=;
 b=ON48TCkkowJ94nyN8d9oiKUQgZUA0iavo1osvDej+fy8tcFOdSpHHHJxG+UUzT7za+
 NKdfqSyqaOEzB5nk0L15WkxCar6IZhdrFXVDvaGTvUbG2gDnRld81nW4OuH0OY5eIasX
 Sn2bqa3FHB/EL5LIusuXNKqEQDPt1BmQy/0RC4HyW9Xh5A6xJsYSoWrps/KN4srHcAyT
 qaL23L+EgSq5rb2KahWU9sCwq51nxrMNFmZiMzB4edniN1Nf3xNgCO0MtXG3iJq+Zl5S
 gZbn8YcZBSNbLX33k2ZEnbFwabiTRDCRYl4nKw9CM1kA/+sgwI1l8mS/dW/PzowmqTE2
 q7ng==
X-Gm-Message-State: AOJu0YyxGbYaOkXK/aBuB6JtVmRdtG5L1YCHguGdjLmvbpJbYEu5J8Rd
 Ll4zQOXP4HFIyEDbrcZjXRjFs4xAM1uGVdApc8bGAAw0DDqkQ3FCiaV2hGXtaMQVw56/qRPXG4k
 ImYWPPYu22sgJsO9imbcQMM5TEsxJLaqXpHYzTyDmN89aa3yHhJ8VXgQDvwJab8KKv9dWtcjD/7
 wX+qzhOJqzBRjQTxEUbRVfT1HNYP4A8IDH6ofCHvH6YVCYs7UpdFNc
X-Gm-Gg: ASbGncsRwypKOO1Hp80PYoUBtN9RcRumsotfv/7CLLySHk6uGt2O4fNrKXEqca90NDz
 1LujzpY0NxAlWowLI6BgicKcI2lToV8F8zAw+Ugq8NHus8NonaoTmQyBFUTbtTHaO/hFhV8Fuk0
 PKoY4GjaHtvkDuaQKcVpLO0hlXZvk/gM9xbWdGxQnkm8DoUoba76LzTp+hpMFPjf6cTSuHCoWwh
 guwckOitPax3ctRRstZI7dvQ9SpTy3qhVgVF4ny60iU87ZxUKI4+NDO9Fbu6D/rYtQSG0SuvjKp
 BVwG4IYOVXd+4+q0srARvcfsbpRPAThKB0nGbDU48KA/jIm3BrPFHPClN5aJrB5vkSwldVa37Zo
 L48rlGQEgVq8Fw97CM0KOa+sWXFfxQ1OTGE0fmfFc9/J5Nu3XNvSdsSY7BIzPU3JKU9dG2us=
X-Google-Smtp-Source: AGHT+IElDQLs27gc1g2pnL2EncG+1aWEMagcAqsFGW3LuaqWd2QODs/6jD39MiiqTJ1WbNHqdfSwCQ==
X-Received: by 2002:a05:600c:c162:b0:45b:8352:4475 with SMTP id
 5b1f17b1804b1-45b85598a56mr53499475e9.36.1756714961383; 
 Mon, 01 Sep 2025 01:22:41 -0700 (PDT)
Received: from vkrawiec.arturia.team (226.142.197.77.rev.sfr.net.
 [77.197.142.226]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b83f86c8dsm62103715e9.7.2025.09.01.01.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 01:22:40 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Victor Krawiec <victor.krawiec@arturia.com>
Date: Mon,  1 Sep 2025 10:22:10 +0200
Message-ID: <20250901082210.17331-1-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812092846.24342-1-victor.krawiec@arturia.com>
References: <20250812092846.24342-1-victor.krawiec@arturia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arturia.com; s=arturia; t=1756714961; x=1757319761; darn=buildroot.org;
 h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=nQDX7k3PDsiHA5wKxPp6nTh+fjdP2szNeL6UwA4lvaY=;
 b=FdRXfNtbrwG5oBaB6GT9t59z4hSYEN6dSy99hkhKmduaV6IEmWf/AK+gIPPBvwLg9o
 4SSpeid5Q9Oxvv5lkfY9WdPEX9EpPwhB/yVWKZAkwCS7ouBBYwWcfFE18nYGlyqnjSrB
 UM5dhp5MlIBZdy1EOIYgrNnKacnZiojv8/A0ukXdngFnjVnjxlE4VT0KGxURxF+mj1qI
 x07ccL/3OwVDOKZqyozLsnU9uZ4EywbCO5XkBIpNMhDQ4vISU8xyOfJQchahgrgNYp7d
 /MQzZbKgT8t+QDaQFfIZODphKDliUxex3zg9CNx+wCG83JidgqJqixEtuK04U1goOJbX
 IVvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arturia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=arturia.com header.i=@arturia.com header.a=rsa-sha256
 header.s=arturia header.b=FdRXfNtb
Subject: [Buildroot] [PATCH v3] package/llvm-project/lld: fix broken symlink
 in SDK
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

The symlink bin/lld -> $(GNU_TARGET_NAME)/bin/lld is broken inside a SDK containing host-lld package
The symlink still points to the location of lld inside the build's host folder instead of the location of lld inside the SDK
In consequence GCC is not able to find lld linker
Changing the symlink to be relative during host-lld installation fixes the problem

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>

---
Changes v2 -> v3:
  - Change commit Author to match SoB line

Changes v1 -> v2:
  - Change SoB line to use full name

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 package/llvm-project/lld/lld.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llvm-project/lld/lld.mk b/package/llvm-project/lld/lld.mk
index c9a2d3796b..e7233e74ae 100644
--- a/package/llvm-project/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -20,8 +20,8 @@ HOST_LLD_CONF_OPTS += -DLLVM_COMMON_CMAKE_UTILS=$(HOST_DIR)/lib/cmake/llvm
 # GCC looks for tools in a different path from LLD's default installation path
 define HOST_LLD_CREATE_SYMLINKS
 	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
-	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
-	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
+	ln -sfr $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
+	ln -sfr $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
 endef
 
 HOST_LLD_POST_INSTALL_HOOKS += HOST_LLD_CREATE_SYMLINKS
-- 
2.43.0


-- 
*t.+33 438 020 555 *





_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
