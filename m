Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988CDCD37B5
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 19:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E23A41713;
	Sun, 10 May 2026 19:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5uNFHMuB5Wt; Sun, 10 May 2026 19:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D26E41715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778441919;
	bh=hggZjr6ps3pyN0cp8COpslVgllAI7xewmUnLYP/7LsM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ADlzgPNgMOFvE4KuodnTJZuRoJnSvPbNZUnwWZcxP/sFqFGlh2xF0JoducNcrvQQi
	 4MVuTwo8bOIGkwaVR9urwGH8XELIgOPWaBBWOhsDqhXayOWYovcRIlgs81uY+R6WuR
	 ApmJZLuveDeQBLqmcswqiIIcXS2+hHAtJx1DfzIi4HN7PIo0KMlG0t4SlpD7B6VDP2
	 n8Vji8JbphrcdZdt2QkSesvrp/3q90jpf5k4GV5Hgo463UtxX+T+ph01JVt7EAqD1r
	 RVAmLlh+bG97B/cR39f7l+xIfaR2/JEc7xRV3/oN9Un7BascE/8Hh21rNBLT4tcRxN
	 oQHEEwIaaxr0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D26E41715;
	Sun, 10 May 2026 19:38:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF897173
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E1C64173E
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xn9PEGv5PpB for <buildroot@buildroot.org>;
 Sun, 10 May 2026 19:38:37 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8689B41713
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8689B41713
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8689B41713
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:36 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-38eab6cf7d8so28984811fa.1
 for <buildroot@buildroot.org>; Sun, 10 May 2026 12:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778441914; x=1779046714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cYVnatGB0GhcRQudJhydp0sU6QK/KzIg6b2xznOdsmg=;
 b=YAqcJXwI1eIaoPsKiluhC7KCeXu3b7+TkUoLLVAR9ZO/viL7WV9NxP6dW54/tcYQL3
 J5dqRSacqow+AT6EwuwhiNvnYC9Bf7JWF8ZDJlWwDmnbLFS4nSVagU79RHRRWx5TKkkU
 JyEz62J6i+n/DtLri56gKU7uU7rPbCRYNRbptA/SudhPev+z460TwlKGXOjYMw63B63s
 L/SXngQrrALyfzoffCbz6t7h8LpNrOAb2gN1k13wmc3apya7zkgZx+iHdBCu5fAYkXow
 9rAKQV0fY92G7eVemianjUB/fkNIoVyH2cwgANM7Ie28y3RIvHA2WuYsNLNC3IPsAdM0
 AvkA==
X-Gm-Message-State: AOJu0YwjTS5xdrRGSdJxXZ/xAjIKY2B0Bo452u2+NNJ7p4qSysGzFNlx
 ypHxcQL6sgRboQ9g43ztl36xur2lJIRv7zi3dqun+iegpAbIZimfXZ+AVxBdLDBouJGh8FPV9Dt
 VZ0hXDkN/Ww==
X-Gm-Gg: Acq92OH81kY5e77q3Vg1Zhv9KStxwCOUcrQprdDz9evANWfi+93DAPKpxUkbJihlWF2
 ewFyP2JQ0RpxFZz0CpneTYr7jJiq0q+Vgsi47+Nmtoqmnu8XJSx7ADcgWxWb97XUsXNDXYWzr8S
 Z3L/ohuwFbXUcqM6rLpeXqOTA0DG3hz5rUIzXoUt4IAly3XSdhFaxmK8Sfu79t4h65MRc776j0u
 CDpooug57Zbdl3UQXSlIXvtBK0We0fgbu5y/0kYjvec+0NtynjFva2BhRv22dTgC9Im3jyjadol
 Bu4Tn4RacOcfYTyrUFOJ/LZeh79sy7Vz5SBCwQao0A8j0zxzhQkOClUHz6Fww9xHnHej/kDU0Gc
 wVsz/lXp2I6l35PdTSBw6vLZWSfO1HtVi0PJRkvfh4grwL2NTIx0ME8BTU0T1OTF7LwvcTPG2F6
 QmvUHzHpmB+1+RRa2L8pq/sd+YVVOlHpJkfk9CIa5MQ2gxa+23c5/XmTsWEH97eaj/iWHqwY2P
X-Received: by 2002:a05:6512:1322:b0:5a8:6e50:b16a with SMTP id
 2adb3069b0e04-5a887ce7380mr8311229e87.34.1778441914085; 
 Sun, 10 May 2026 12:38:34 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5a8a955e170sm2041861e87.54.2026.05.10.12.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 12:38:32 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: john.ernberg@actia.se,
	John Ernberg <j@j-ernberg.se>
Date: Sun, 10 May 2026 21:38:19 +0200
Message-ID: <20260510193826.2846038-2-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510193826.2846038-1-j@j-ernberg.se>
References: <20260510193826.2846038-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1778441914; x=1779046714;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYVnatGB0GhcRQudJhydp0sU6QK/KzIg6b2xznOdsmg=;
 b=lrEpQmac333KfFtrHJym9whzbphjgIe17/HpjnEgulhr4esZRySAEryBl2dgvUfp4s
 OKCjrvZ3n3+yiRagCmtmRr4FzHl2SWqbAItOXnY0CCl+MBV3WVR4hQHY26GEmZwZ/NJU
 nsfq4CtY82QzaSJrRGWofxnPREtU6tlQbC8muWrVqrcIQaoJ2gxQQz5t+rU54ZBkyNHd
 OJiRzwXFjhl/UoCZ9VR4Hz5ULIZWmTyHubt8HLxQRuGAiGKJ7uFNqhcSuXXzM2oBGarG
 bMNI3ca+ZTS7e6jRNclcfwTuf5ToqnPRES7DrcjaZb4DT9G0kLRiHEWk2Fwe04KdCAjl
 283w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=lrEpQmac
Subject: [Buildroot] [RESEND PATCH 1/8] linux: Only run depmod during the
 finalize hook
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

Commit 82e765640095 ("linux: Allow modprobe for out-of-tre modules") added
support for running depmod as part of the target finalize hook.

However, it also originally set DEPMOD to /dev/null, a hunk that was
removed upon apply. The kernel depmod wrapper script uses `command` to
verify that whatever is passed into DEPMOD is known to the shell.
These days if the DEPMOD tool is set to something incorrect the depmod
script will just warn [1], but there are trees where the depmod script will
stop with a hard error. [2]

Running depmod as part of out-of-tree module installations causes
unnecessary files to be generated and installed.

Since we're already running depmod in the finalize hook, stub this call to
`true` as it's definitely a shell callable, and it will always succeed.
This is what is done for other packaging scripts in the kernel tree. [3]

Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/depmod.sh?id=914b087ff9e0e9a399a4927fa30793064afc0178 [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/depmod.sh?id=934193a654c1f4d0643ddbf4b2529b508cae926e [2]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/package/PKGBUILD?id=8bdd53e066012bed431667393676d1b5e8cce153#n70 [3]
Signed-off-by: John Ernberg <j@j-ernberg.se>
---

RESEND:
 - Forgot to subscribe this e-mail to the list

 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..3c7ebe7e9a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -164,7 +164,7 @@ LINUX_MAKE_FLAGS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	WERROR=0 \
 	REGENERATE_PARSERS=1 \
-	DEPMOD=$(HOST_DIR)/sbin/depmod
+	DEPMOD=true
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 LINUX_MAKE_ENV += \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
