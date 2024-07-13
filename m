Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58465C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DAFC406C7;
	Sat, 13 Jul 2024 14:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-hhHxaQCUGX; Sat, 13 Jul 2024 14:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F7241558
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F7241558;
	Sat, 13 Jul 2024 14:43:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C94EF1BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0C5A814BB
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jea8d-RDnDCj for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:43:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECDEA81467
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECDEA81467
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECDEA81467
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:43:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-427a0efdb9bso9579555e9.0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720881799; x=1721486599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sRnbdR+1QbJntJ5uGFnk75Kpm7L8GFDuujgDYOf8lcU=;
 b=JDZLxUWWuZOhDT+gbjeWZaJW2GCcFJC9E5FB4Nzd2vo8WTZSU3khez0Ot0Xamw+hHL
 Zpr4rMs/FAoxPDgqGyzNLd4DZQicHT8+BgHuCsHO321H9ao9qkkssjI1V8Ms9D1w7V24
 rRe9UtUkI3cgUWbmICdb1xOhRf6aInaWfyfmqge3hXF+DgQq2GDb3SOg7GP9oHjgAp8N
 ZAwFctINI8coonIuj2ghbozwTCBwjRsImWLQx/EGjZ3ayd3TKs40MCPhi9Jx8XVw9klN
 nufjGiwXul9Kg61iKKK2zHNKYxq9QPdh/TWB5YYbdX91rYqL4zONRhpt/S0KxRwdTU6b
 CrPg==
X-Gm-Message-State: AOJu0Yw7YkCrcBq+l8QFK8m3bwUycX6vGPxLvaL1BEeziiAvfrrmG7Tz
 r+eUOIbHJQsbxNFMDMvudm6uoIcn2u5ZuBuqQDSYTY3vY+p1X6Ciuf+6SWW6mI0FZmrT9ea2doY
 gmLw=
X-Google-Smtp-Source: AGHT+IGIjjZA5DMEwyXjxPNvD0+rLsCKcSMCrdryRqFZnEXMq2mEXONnwjLcwJ24wN0+FCHBkD9GYQ==
X-Received: by 2002:a05:600c:28b:b0:426:6f81:d235 with SMTP id
 5b1f17b1804b1-426707d9c3dmr114178435e9.15.1720881799074; 
 Sat, 13 Jul 2024 07:43:19 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f276b14sm57610835e9.23.2024.07.13.07.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 07:43:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:43:15 +0200
Message-ID: <20240713144316.403640-2-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240713144316.403640-1-arnout@mind.be>
References: <20240713144316.403640-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720881799; x=1721486599; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sRnbdR+1QbJntJ5uGFnk75Kpm7L8GFDuujgDYOf8lcU=;
 b=ImD8sSoNDGpenTw5iR79t72lxk4hUDNZ60b1qF93fqfExG0YqDpTj03dWMm181U0pm
 R62jGlYJfKKKfd1S9p1kzbGqOlSEGobehvJ60xfkntVd/WdIdiwWaPTJieTTkWhfyJct
 kUy6g6V2Z1YenwwZbr2h/i0y0K4BDNiFSewaS/EoDsCLnHYsNSwT61mOtqwXoFeqWiVW
 LVBZJitSDA9FMEscUjVuk9MxqneSXWiEHdnKxB+By6Dmx59yHlkJIefmkIPSOp+BmDKQ
 LT8+Gl02tuMUqWqBtEEgIzTPPanR+Afuc7FNps7SIwD36nr0rDxeOWc+LAB3nSaurbZi
 KXKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ImD8sSoN
Subject: [Buildroot] [PATCH 2/3] utils/docker-run: also mount externals
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building in docker, we may want to include BR2_EXTERNALs that are
not in the current directory. These need to be mounted into the
container as well.

There is unfortunately no easy, generic way to find the list of
externals, except by running `make printvars`, but we'd need to run that
inside the container with all the command-line overrides set in order to
be fully correct. That is pretty hopeless, so as an approximation we
look for `.br2-external.mk` in the current directory.

Clearly this is quite limited because it doesn't support O= or
BR2_EXTERNAL= passed on the command line. This also means that the first
time, it doesn't work at all, because .br2-external.mk doesn't exist
yet. The EXTRA_MOUNTPOINTS feature can be used for that.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
Since this feature is not bulletproof, and EXTRA_MOUNTPOINTS already
covers the use case, it's perhaps not necessary to include this patch.
---
 utils/docker-run | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 3bb7b6a41b..76fb81b074 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -29,6 +29,19 @@ declare -a mountpoints=(
     "$(pwd)"
 )
 
+# If any externals are defined, mount them as well. We assume that the current
+# directory is OUTPUT_DIR - ideally we'd parse O= and BR2_EXTERNAL= from the
+# command line but that's not really feasible in practice.
+if [ -e '.br2-external.mk' ]; then
+    mapfile -t mountpoints_external < <(
+        # We obviously want to quote the make syntax here
+        # shellcheck disable=SC2016
+        make -f .br2-external.mk -E \
+            'default:; @:$(foreach external,$(BR2_EXTERNAL_DIRS),$(info $(external)))'
+    )
+    mountpoints+=("${mountpoints_external[@]}")
+fi
+
 # We use the PODMAN_USERNS environment variable rather than using the
 # --userns command line argument because Fedora system may have the
 # podman-docker package installed, providing the "docker"
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
