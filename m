Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F098CCCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 05:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE4A360641;
	Tue, 21 Oct 2025 05:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3Tinla9MbeL; Tue, 21 Oct 2025 05:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBB236064E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB236064E;
	Tue, 21 Oct 2025 05:59:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E9A43F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC1F480552
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bl8T3__skFJ0 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 05:59:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 140EB80550
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 140EB80550
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 140EB80550
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:59:40 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-93e8d7d177aso94333139f.0
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761026380; x=1761631180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QK7qOYQai7he2rSQyt1dhofkUN7O538xaqufoJ5CSXE=;
 b=lF08Q3V7fWOFb2ZK0uwoWekqkYRMNmr+G9aLjiw0+Quj3Xvg+B7HqIRYNVklM93TL5
 rZcTPJbwA+Xveq/paJ8nUZ+SxISk7qlnCyqAMMFPOIY9LTwh/AbHqcnWjZya1W8eHfh3
 8slqrBHsiIq2wZOVVXT7rbv3WcrzBzHsHXJpSdv0sIOFyYWZEBunLV2b228FScZ1d9EX
 Xn7k6n6JDd+PSa2A0BgS0WbuLs0gXhtGoZmg77RoDI+ouTX6/8j9eXqR5nUq5SS1+MPd
 tHyB1Fo5bAH05whyS2jb3IyHa2xr1L4dYX8PPfb6m2F4t0JD30q22+k7AACM/A4P56gI
 EHSQ==
X-Gm-Message-State: AOJu0YytBmRTefcQv7/98oDd46KyMcC8w+wSkUyCAgdJfHwaYswTCSKn
 TSoQe33PIic/CnEoLMBAzUzAasECZoT2K8zWmt+BmXTnJxqKYCDLviMXxnnWYNpM6Ug=
X-Gm-Gg: ASbGncvA8z9fWu7W3udGWPiq0bl0sGkfLy6c/0d12BZeKGgBjdlu1u4ONmzR9qTxBCv
 HR/vx5oQax0BozxEwEK+1G5SvPe6hUek7iceRySNxUksyeR1B2YO1B8qv06M06gedt7yluyhhgR
 d0EvZ/nODyOnJi1uQvwlaEvMxLHxVQImjygNJWv1+WmZFbtWDVKmVs/87MxgAyC5D2MwX7JgoyV
 wR7W7IXWVkR5PoB1KCW3IZmVzCwK8InrFYFfcqTAmb97Tf8+qvHmvb2HC7gkZv9sHudfpG+Owdc
 q2xqJsyIXWet5u7x5JaTSpQTXB5XZhfVl41ChDAWOjtxRVaJncEvk9lZIg7uuaVA7fClGAjsi9u
 4MKjkdOv0Fhh5T3xt+6o5xpt4VdR4RRo5AJem7J6DG6JuCWDj/4CRlIR2ipvI9MXqLcuQ8T5HJA
 P03KjcV7pYVW5TeoJtv65m1Ppo2WcQ5GwbfwODoIRTDv94DlwX5GvBcggnsc/oawdI9cwsUIs=
X-Google-Smtp-Source: AGHT+IG6pCvZ/xphxqnrguebNO6VZpIjulquLL/BAhp+YrnDn3gIEMz0J3eMR2NQv5p5kIQdK9NmoQ==
X-Received: by 2002:a05:6602:1611:b0:940:e622:2468 with SMTP id
 ca18e2360f4ac-940e62225e8mr511750539f.14.1761026379649; 
 Mon, 20 Oct 2025 22:59:39 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5a8a973ea52sm3727109173.41.2025.10.20.22.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 22:59:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Oct 2025 23:59:29 -0600
Message-ID: <20251021055931.532861-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761026380; x=1761631180; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QK7qOYQai7he2rSQyt1dhofkUN7O538xaqufoJ5CSXE=;
 b=Gbh303N+sDfXl0tzQVW+VZMvmEq+msAtxCM1kv3AurYmmuiNJboniIVUl/1DncSb0I
 TL1on85Tdnq0MrzUeTQ9D8ENelv33Nt2qpOR1K4AR+/mCSXckm79frpTAGXZHHQexwgq
 ySlKITs3asYkPOIlMKevSKNatsC9AU87L2325ozbN0l3bIRHluh2RH+cZeU5T0IploYf
 HrUWcEpHXHLGliFCYBQsBDsPMFImZ2OGZCHY9+X5KGx6JVIjtPBS2ASIKpAY4Sf4Dw1L
 tU/wUHcjZsxo8Gwr+nFXqPwOX9hIzFXLASZ7/CuBucx8o9FwD0ID6GgOZebn9kPyXX9s
 pm8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Gbh303N+
Subject: [Buildroot] [PATCH v3 1/3] package/pkg-golang.mk: use golang
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
