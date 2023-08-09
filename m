Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC99DC001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65B2A417A7;
	Wed,  9 Aug 2023 21:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65B2A417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pG5BN6FOZaFs; Wed,  9 Aug 2023 21:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61AA0418F5;
	Wed,  9 Aug 2023 21:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61AA0418F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63DEC1BF97F
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4935B400D9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4935B400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I4rQ2FIaKbxw for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:24:53 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97EA240647
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97EA240647
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe5eb84d43so1883975e9.3
 for <buildroot@buildroot.org>; Wed, 09 Aug 2023 14:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691616292; x=1692221092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3ROfC80fmoAmNsRGs3ulaJSH0A82SRJO08r7LA0XdBY=;
 b=RdMDEykl0wxAd2umnmmeuKXa93ZYol2CiMHNVXOsKqN50ggemLaGfjCyncVe1B+eZc
 fGGYkwTI6MiY8uBnsMqymeAXPRXUuHtzPd9Pzh3tlU4nJ1HxAvtvdqZF96k6qziqV4on
 qooxfx8FZPia/3Oe3gQ7qXcyxzUwIcOrQ24wn4P1kq/zeR5KKwrsBjwvHxXFuIiZs3Tw
 mByrZLz6i1K2xJQr4OaeRFB7H+kwNaBq02Y1Q4YFp3kUTpuRzlGKnXBA2wL4SMQ++Eyh
 UUzVZGNzXjSzOrS0jMGHDReGBy4HjXXnOHztJH89AF30yBR2fS29pHpEFyKh8OTR+oG4
 Btow==
X-Gm-Message-State: AOJu0YxvpDZdlXisSFOmDgtyIFrU7Z4WW6wUoP+jGIw1/DFgMo1fptx0
 q70ZANQvgHikulUT6e23E4lo/uQKkoI=
X-Google-Smtp-Source: AGHT+IFRbFxqogUnuL+iPUxgBBJRxbU/2xCRB+iJ/uyxjgDjRI7OQJHX+inJrqWN5j35/+AKWdn4Xw==
X-Received: by 2002:a1c:7214:0:b0:3f9:255e:ee3b with SMTP id
 n20-20020a1c7214000000b003f9255eee3bmr289215wmc.30.1691616291706; 
 Wed, 09 Aug 2023 14:24:51 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:7f53:5cb:7a96:c3a1])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a7bc853000000b003fbc0a49b57sm138959wml.6.2023.08.09.14.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 14:24:51 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:24:48 +0200
Message-Id: <c9a96063bdc257e07f5288c68d017c9a7d9ac14c.1691616286.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1691616286.git.yann.morin.1998@free.fr>
References: <cover.1691616286.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691616292; x=1692221092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ROfC80fmoAmNsRGs3ulaJSH0A82SRJO08r7LA0XdBY=;
 b=CPLWoIU02KLKRA2dUVoHf2f0wCr6T+MdU5eqcv/Itbnpo8uNu0XgcxJc2pF1CcHVny
 D8uHUBcx+ML4Ln0JKCGMHNts3ezM3RcrQ8wARnikDBCqE7oZtT8/iNkkfNBvWwIP4sTZ
 XenU2iZDxl4IN7NX72qafvI03esMRe74lK8LPFMjPol6kB6sg3aN8JgYIZUzX3mvC0aO
 zEDdHGeuPK24NkEg8iPGRidkL9qVkMg9cDK32XcLdGYZboGRZn2VesDExuDdQ/MmmhsQ
 tSMdQoDPSpAmA5Yi6dLNQVazFy/S8/My1gDvROEvvlJNpmMxtGhrmQjKqxOe3RXQO0Py
 S41A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CPLWoIU0
Subject: [Buildroot] [PATCH 3/5] utils/docker-run: bind mount .git/objects
 if needed
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
Cc: Nicolas Boichat <drinkcat@google.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Nicolas Boichat <drinkcat@google.com>

If buildroot is checked out as part of a 'repo' manifest, docker-run
doesn't fully bind mount the .git directory, leading to commands such
as `utils/docker-run make check-package` to fail.

Signed-off-by: Nicolas Boichat <drinkcat@google.com>
[yann.morin.1998@free.fr: use newly introduced mountpoints list]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/docker-run | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 7b27a9b05c..ff903b96e9 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -33,6 +33,12 @@ if [ "${GIT_DIR}" ]; then
     # path already (in a wordir), then that's a noop.
     GIT_DIR="$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}")"
     mountpoints+=( "${GIT_DIR}" )
+
+    # 'repo' stores .git/objects separately.
+    if [ -L "${GIT_DIR}/objects" ]; then
+        OBJECTS_DIR="$(cd "${MAIN_DIR}"; readlink -e "${GIT_DIR}/objects")"
+        mountpoints+=( "${OBJECTS_DIR}" )
+    fi
 fi
 
 if [ "${BR2_DL_DIR}" ]; then
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
