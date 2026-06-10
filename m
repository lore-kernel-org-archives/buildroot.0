Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6CDCD8CB2
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 06:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01D8E40BA9;
	Wed, 10 Jun 2026 06:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJTCUxNHm-hX; Wed, 10 Jun 2026 06:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 199F040B48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781074017;
	bh=DWPF0tD7nyTi5Ty0ESsVhvcQgHZ2//5hPxdz7JkZofk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=p/6fHkei69ZGEk1FrwWnh20m+B+dcgP3RKoDMNzriSd1alitjuw3zb6Z3DmvDO1FV
	 WSKeGKJskRrvcUX8i614WQYZLPBUdqiqEmWmW7HW/VAYy0xRa1wUml8sqRo3hSrkGk
	 vwkJhkvFuQS98l+/AFUjODVJDIRso9ZsCo6dVS1zD72YiCBmkUYSjMe4p5UNwtxfVh
	 UQgJwU/gC5N9qPIADeY/1LGk8C/upsJla0bS7MayF/KarBdr1brHZo9kCAD5X9pW1p
	 HMEHUpcr1pNJL0azwUF9aw+bxOtJSAsLQ1IDt+p4SObNN9GI6xzdGjQUd9btvtObSa
	 fm/OiyqusiWfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 199F040B48;
	Wed, 10 Jun 2026 06:46:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6986B196
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 06:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5005B80F11
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 06:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFdh2ztfnuqi for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 06:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E4CE80F0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E4CE80F0A
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E4CE80F0A
 for <buildroot@busybox.net>; Wed, 10 Jun 2026 06:46:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso3343785f8f.0
 for <buildroot@busybox.net>; Tue, 09 Jun 2026 23:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781074013; x=1781678813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ltld6uxoCrI4YWloqajy8HuYJ1VjEbodefIfLLfxG8=;
 b=smX5eOoCGnc13u/ILY0YYh8ixfdJDTuEIucJh4Sz7QiZ7TLJMtHhycoS+2JZdvYUaX
 yxRgC+hAiCTr0hWvfoQ+jXjZGF4Ro5xLW8uEq1VjmdWrRrAP4nKF3XNyKHFEKITJnxFT
 f1xHdj5ebyponuZgHpYQdQBtNJW9nDRjoXezSqi8KWHd2qP1Br6DKRlshnUmkbVUeshz
 r8ZrZisYWfPo0WGGUi0QhJSjeLoPT0FRP1H+g7P80/JiKlEWo0jdeqpLDplz+Sqwi+Xl
 ECXLSckvimuf3aj3fLkSNCSGi1SQYaBLamztjB4q/tn0o6wlxYxUWHCfYxPx59Q8nX9w
 HvFw==
X-Gm-Message-State: AOJu0YywYui/AUOPvjzrgnt46skTMdgpL1PlCQ8YN3L9mGGZK5Rhuj4q
 zum/NsXy2u2Z7MD9o5UzoMOnW4Tmz/xc+UM5Fn3PL8gmyJgbGhFKBA0QmWexYbjsE8xZx9f5YoK
 YDTRoILP/
X-Gm-Gg: Acq92OGC+0IY/IepEUMPtnfkjxoiBcPea+yhCFBT0hvrniDIHainy6lqeZWdriseSbp
 wd0+KfqSjFwIEATJd4rRGocYmd9l398+tmV/RPTaOlYqRxFer2TY0zfcQ7b0NEj3JEIIUSoXt1A
 gHUmpNFRjRPCHa4TZUAKeABSZm4TdNNH6+ZYh/K0oiLVqmJyfLqu7GZEuRf/HnOq9R2ikzmmOYK
 zcDtDBzcX92h/lBdExDMpNIMDtIsIBmsJTtAHvXxwHcweHcxjRCAIFIM+dV9igaja8TdqkPAK7b
 Wi1DgPrtbREq6IgbG5esQPgqded/ahxmTfvZCQY3MdkI1/YkVLgAABa9NuiOHZrNVoFgqodaqDR
 S68cOnx9eSFq4I37LmduKLjYmeUdu9gUnojDtCMQDQID7g9vAqAW2DkXBrVunD2+qsstbdSHjqK
 3QtC+pW78BgBAL/3J3gArxrWPhJshwID8Oo+IuxSA6p0ei9y4w8PezMCw8QYgC
X-Received: by 2002:adf:f089:0:b0:45e:f381:cd7f with SMTP id
 ffacd0b85a97d-460304f09eamr25650744f8f.5.1781074011728; 
 Tue, 09 Jun 2026 23:46:51 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcad5sm75767033f8f.5.2026.06.09.23.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 23:46:51 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Wed, 10 Jun 2026 08:46:42 +0200
Message-ID: <20260610064643.70497-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781074013; x=1781678813; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3ltld6uxoCrI4YWloqajy8HuYJ1VjEbodefIfLLfxG8=;
 b=DJyUCcvQjdaT94kUX0LVC3elhi9qKnfQiPkcavFhKGbVbqxXN10V61kNXn8jcUMO7H
 qwwfOHTdSbCqCE0Ko86dY4VLlx4WUVIlqEprKK7lO46xLCASnqeKBjq64uOa3P7GlX9r
 7xmquz69KGMugLtbV2jyA7tM4srR9cKRG1DRxY9xw/byAI9YlsRN4janZno3G1qYsOiP
 kGiEOQbs6uWdv0koQPHF8+3Wu/ozsy2r8mhIAM0tR9QeY08cauksNrOy75Lht4QGtEEn
 pzUXhQcKmVpfncy1G2PXGCJEr3s1GaWXllypCFJDpDbyKOpAt0Tc+dAa72h/509C8zUJ
 VQSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=DJyUCcvQ
Subject: [Buildroot] [PATCH 1/2] package/lua-argparse: bump to version 0.7.2
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

for changelog, see:
https://github.com/luarocks/argparse/blob/0.7.2/CHANGELOG.md

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-argparse/lua-argparse.hash | 4 ++--
 package/lua-argparse/lua-argparse.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-argparse/lua-argparse.hash b/package/lua-argparse/lua-argparse.hash
index c573ba579..c5c61c091 100644
--- a/package/lua-argparse/lua-argparse.hash
+++ b/package/lua-argparse/lua-argparse.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  ea30d0643586a20aeb6349ca8cb7db63aefc21d9aa007c7b7168a7c564817879  argparse-0.7.1-1.src.rock
-sha256  9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.1/LICENSE
+sha256  c122a25224876e93bd380ceb51af28cd8a72296e098b2eed4f06d85f54f1a0b4  argparse-0.7.2-1.src.rock
+sha256  9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.2/LICENSE
diff --git a/package/lua-argparse/lua-argparse.mk b/package/lua-argparse/lua-argparse.mk
index 77f6550fa..21835edb2 100644
--- a/package/lua-argparse/lua-argparse.mk
+++ b/package/lua-argparse/lua-argparse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ARGPARSE_VERSION = 0.7.1-1
+LUA_ARGPARSE_VERSION = 0.7.2-1
 LUA_ARGPARSE_NAME_UPSTREAM = argparse
 LUA_ARGPARSE_LICENSE = MIT
 LUA_ARGPARSE_LICENSE_FILES = $(LUA_ARGPARSE_SUBDIR)/LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
