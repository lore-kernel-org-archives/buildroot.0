Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AD8CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55F94803B6;
	Mon, 17 Nov 2025 21:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HULPdeYo1AP3; Mon, 17 Nov 2025 21:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72BEE83E66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72BEE83E66;
	Mon, 17 Nov 2025 21:14:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D52E51BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6E9A83E5E
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OO9VQ6QkCLXf for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE75883E4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE75883E4A
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE75883E4A
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:14:22 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-43377ee4825so24383215ab.2
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 13:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763414061; x=1764018861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QK7qOYQai7he2rSQyt1dhofkUN7O538xaqufoJ5CSXE=;
 b=cS6MbDhLVcOWEFYrZtNDNqhr+kqzLlCWbGClQPHqkiTFFFVBdLjzjYx5Ag+bgWk3R+
 ecHOQFxEMIQiFbqiX/DTqnkdVFwOZ870aHtx+Iz9iU3mBrbwQpDPV2bJL+QVgoEovH3f
 zWFAKGcJl/QkmFRRqrxQ+WIiBQy5R7T11cybagV5onAKQ4BFG0otX40pCN49RmKVhN/s
 +5fR9TGjz/Kep0boaysr2JbQWaNWj0j7BCD6nlIqP30B6bJYwlwg9Gt72AU58IYakZJi
 ohL+poLa0o89wbW5Z030HDbsAYoQF9vMxrezMXM09T3wu2CMJlcCuhFg4AVmfARhFFSC
 Bs5A==
X-Gm-Message-State: AOJu0YxFhdHcGw4AhJHRzfi84WiHsCs6+SsUS8/0X2yY5SRcQCosi/Xd
 t57OlCGvI+8KRWfQvFgLslRdAWYy3LKyvgxUurEpX/bEU511b3vP33RbzKk5DiBU9HM=
X-Gm-Gg: ASbGncuv5N4922MwyvkKw4s4/aMLqK2lbTEh7E4hNn3dlht5lhvdOh26/pJeG/ylPrj
 miiYAcxWesJlPyd52+KGPmKIpMkPLVE7NCjfUGa09ot2OqHGkY3/cQj5Wm72lb7uFcKIXs4qd0u
 ea2Dme2EFxJdlipG27M89k/WH8saVKcfG+/kMdlNZ9aFob9pfGFI4JPXNpruPxG+Ps+hSfXkCKX
 C9rvlV9AHdkBPNGH7ihyMA1H143krRmQq/MJpmaAVrkgjPz2kEwObe4iYhBLaUWk7VP+lJtlcAk
 iuXk9RgNEEnbYvcbJGquoQdBIpVg9UZQSmzxxETWUXvaxBP7kXvQ7l5vMe9sSK8nJelyhURJNTB
 ef4XKvJmS23OIKqTlBcZl3fu/6MoYolkj90G0l0UsX4VRwN4me5+V3jXxUDsaLVtWwUwoo6555g
 qA6Lt458uy21nmLSPfx/m0tNU+UcHLspvNMHf7Irttvjfqa3/ahsX+rtARpj1/
X-Google-Smtp-Source: AGHT+IH+JdXgUUHlKI+YT+40b3Q/9666IFnvFemB+RzsrUXuerqh/0sq72auf9eOIbnz/hYAbdM6fg==
X-Received: by 2002:a92:c26f:0:b0:433:2091:8a86 with SMTP id
 e9e14a558f8ab-4348c8637a6mr170646275ab.6.1763414061357; 
 Mon, 17 Nov 2025 13:14:21 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-218-112-180.hlrn.qwest.net.
 [71.218.112.180]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-434833c5357sm75265425ab.2.2025.11.17.13.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 13:14:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 17 Nov 2025 14:14:10 -0700
Message-ID: <20251117211412.2491717-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763414061; x=1764018861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QK7qOYQai7he2rSQyt1dhofkUN7O538xaqufoJ5CSXE=;
 b=k9B3YejQsi3LCodQFFxB5TVyDI7D8uiUML2ZyeNwtkHmTARS5FVqKQ7lZge8pchcN2
 OKpxLnRDCM6iHvGcUxytJ7pNYSk61ywjwv969iGoAJcaXlJzaH3LAAwFOGFWIdBr0nfl
 GfkTfDPBnMsV+EeMn0Z6BErNq8FRKo6JCyh++ljPh21WhAJnGiOzC+wt9cM07xJZjrLX
 UI+6E3K++s48CGJU1tlU0X3EB2Yg3HwYQRlO+p6pCkwfLa9wIhl4ujZ9GJqjJaxgjHQv
 OykYIM1jN3L/DsJVM+NvZJITQxsds50nbwGKA5U0aTEs9Us54iGqPdI7HX8sXKCRXib+
 peMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k9B3YejQ
Subject: [Buildroot] [PATCH v4 1/3] package/pkg-golang.mk: use golang
 toolchain default GOPROXY
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

This change sets the default GOPROXY value to match Go's built-in
default of "https://proxy.golang.org,direct" which provides several
benefits:

- Avoid package breakages due to missing module sources
- Better alignment with upstream Go toolchain defaults
- Faster downloads via the proxy compared to direct Git clones
- Maintains reproducible builds through Go's module checksum validation

The default value from the toolchain can be read with "go env GOPROXY"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index ffd50adecc..26da7be71b 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY="https://proxy.golang.org,direct" \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
