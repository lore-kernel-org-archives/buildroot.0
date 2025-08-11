Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F3CCA0ECD
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A2EB413F1;
	Mon, 11 Aug 2025 15:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGiHgfXDBCH6; Mon, 11 Aug 2025 15:33:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7DF413F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E7DF413F8;
	Mon, 11 Aug 2025 15:33:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 320C0154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23FD840D7E;
 Mon, 11 Aug 2025 15:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_SzxYzVUxVZ; Mon, 11 Aug 2025 15:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6DF0640DCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DF0640DCD
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DF0640DCD
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:33:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45994a72356so35873125e9.0
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754926379; x=1755531179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ChPCrb7JLJJELRwEgIeXOcaMeoeKdbw+JprgwzMb8LU=;
 b=WiNM+JFPPNf4fNTL5WJCGyLhWaXzbASSc+XodJQldY6h34gDn2GtgNMI+6yC8glfy7
 0Al9VXNYfIEn94y9ndsxPyUMuGMbtxHpRdbEQMBerQwIGJHA/E0WrHgcUVvbe6y4PZYC
 /4eTiAkFBxNYKwA5TLfTbgvAv6yIX9RJjbpcUvGqQLJHtpgawOxMgu6ANrj1iw49DM44
 CgbJLnDfs0H8cbkmhlDvu8TZkTzNS9hvHZVNh6ZuAz0t3vwnLW/ELIIwg3JtSyhMeeyB
 pW2P+usjR8bI1lgIdjI+F2v8n34nnCfvH8qF03Jv+C/yb8prt4GqP4Wq9Wf83hCtbbpa
 mNdg==
X-Gm-Message-State: AOJu0Yyq3MTsOl0c1aXwoXWGNIjnl6Z8tk48hPZ2VVBTV/rfrrl9VVtO
 ky2timrFjid6z0Oooqy0B+K3JVwaLjMf2+Y9sXk43M0WYobhXiGoZNTci99vbg==
X-Gm-Gg: ASbGnct5iD/40MP6yvzKwDEk73wzb9jdEJRNXPL9aukZCuTQ1r9JONZ8hFHY9HePbJk
 5fKrKpizYMQq/Qxg/LsjJlQZcrioaYO8lcnBughnkLtzhIysTU5ckL386c2SRvPJQfYyajcD94W
 fl1iMzrVdCx7qOYOGL2mGCDKe5xPMOv5UzGGUNMrQz0DS7SLN45cQPswre7y869swzPjiHG/3YY
 GnUsNOOEco7tyeQIWHz5DzoNc4Zt1IxtVk4qtIHWI0p5kKmv9NoxxFhkEH03GJ2VM+bJWOZRJ+W
 OsuM2QyhCu6DGDxjBq+JiiU+aD3GRPl3QzptJXCUMm80peGEJbfxad/VzsIHYzGCeuyB3p4UehE
 Bd1N8brskQeasBFXdGe6VRNcJOSrtSPQZ
X-Google-Smtp-Source: AGHT+IGgKCo7zogKlTUCT40QkUIiIY4Et3DSUqb5ztCy/4Pkavq77pGbKN76LM/BAHapoPBNHUZ0xg==
X-Received: by 2002:a05:600c:530f:b0:459:dbc2:201e with SMTP id
 5b1f17b1804b1-45a10db8119mr80305e9.9.1754926379131; 
 Mon, 11 Aug 2025 08:32:59 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e586eef8sm256371695e9.21.2025.08.11.08.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 08:32:58 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Florian Larysch <fl@n621.de>, Julien Olivain <ju.o@free.fr>
Date: Mon, 11 Aug 2025 17:32:57 +0200
Message-ID: <20250811153257.3746260-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754926379; x=1755531179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ChPCrb7JLJJELRwEgIeXOcaMeoeKdbw+JprgwzMb8LU=;
 b=mZ+KwilyTB8xhhI393XYxoYFhnMzi3lNtAuQaXbfwjxEl0SRiWJsT68XRgxnelGnIv
 B7nKUd2gCDW+EI4yEouyoZuP+j5Opz0WqEXojXtrH7HS6FR99WVhp50wv0WeHNSwvQxx
 tnHMH+i64fyaQmVK4g0gtfKOrtr0PJG1VhnC/Us5s/Ch3dE5iAqrdL9t2TRVLQdyMvTc
 c67mQNsrORQbeNlyU01yrrqIvN/C96Vs9A/WF94tXWIQqXw0xfPJHAFDmHOC/zqnU1S8
 Dq8pK2toMOFIBXsDqpdiUTK3jVFtUsxkXA6eyq4CJLfsiYzxBwSHLet9QSaxnRgv+g7/
 P0oQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mZ+Kwily
Subject: [Buildroot] [PATCH] package/bash: fix build with gcc 15
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 6d09b25d08fe (package/bash: fix build with host GCC 15) did
apply a workaround for when the host gcc is gcc-15 (or later), but
missed the fact that the target compiler also exhibits build issues.

For the same reasons as explained in 6d09b25d08fe, don't try and fix
those issues, but just paper over the problem by using an older C
standard.

Fixes: b7882d024ae484c52473955fbbcbf3b5f0717c2f

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Florian Larysch <fl@n621.de>
Cc: Julien Olivain <ju.o@free.fr>
---
 package/bash/bash.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 2747802592..1e356e8631 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -26,6 +26,10 @@ BASH_CONF_ENV = \
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_printf_a_format=yes
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
+BASH_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
 BASH_CONF_ENV += CFLAGS_FOR_BUILD="$(HOST_CFLAGS) -std=gnu17"
 endif
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
