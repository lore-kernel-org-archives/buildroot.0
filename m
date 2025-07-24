Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84566C83F26
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 12:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26906412C4;
	Thu, 24 Jul 2025 12:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_g4EHIduu0C; Thu, 24 Jul 2025 12:06:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF67412A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FF67412A2;
	Thu, 24 Jul 2025 12:06:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A117DA
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 12:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1730412A2
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 12:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsnBhzrwTzra for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 12:06:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E4D754082C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4D754082C
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4D754082C
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 12:06:42 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so799224f8f.2
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 05:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753358801; x=1753963601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cGHXQC+cXVVZrzcsKN9T9OIf96Ny7pMz3E2sx566OpQ=;
 b=V87ybUNpt57eTCZbUtzBtOA8Dd5t7CKQHGhcuI2O7xplZhk2yYHCBt3GhxjIEsLFtZ
 BS9gR+qG42cJh4gk87Vta+tUo6GPMryjHNawp8X+T4s68mQL6ZqvJA1kZI5t8avo23J/
 EoVfGSWCGLMSphp3oSfaE13Z7+ZOcIFlmYERP9wM8WemmpZNpd4Is5LkdK2cA57t1M1v
 swoiNJXgef1PQsetMrHetvdn7DBnsNYhOrhgO0SVVewbbKymQ9klYIdgZY4c3CFxVzd1
 NVZnXwhCKEtCej3PGU42m2UEIt+iP6kIQtrW9++5SghSyYfdH/ydraoD15euersa7O/h
 R+MA==
X-Gm-Message-State: AOJu0YwXAcjdLyDnSHz8PtzzU4zkOzEYb70XQ5XXPkS7WIx+YbGQA1ob
 rLBKbB0CK47S9ihtCySQYDp4jhmWl5tWycnDWqXxCdqJPwMI5cc/bAsNugSP3FCDiwxVhShETtJ
 0hkS4
X-Gm-Gg: ASbGnctSfqi+yG9kr4Mm1XThozSfV13Lo6w3fUoKabW6lytMJ/4oUayJqVYwF3JNd9/
 1oEBc8ChBLxtcHYux9W8jm8yGWRkxgFIyhyhpN+QJ7mOu5Kac7X/YsuT13hC1ZTXrHqKdC8aiYs
 CPPUeWbNnIvyPlPN0jzUg1SOUCYqBB80J4KTo4F349Zrz5UwkhmBBwQkLtZiE8EELJ0yCa9HVou
 aAJJvZ+7Y2P3IVXPYemvf/N3VwILY6HKD8srC8a7XYyC1hZxTJwNSLHoJi7XsQmisXXb0Ep4j30
 vX8Btg2SSUNcd5l9GVX7e7oc1BuUDw66kaeC7A9t8JGFvLAF0tlrxkZOSk2jC7FAYHGlrZCCutx
 H81PG8z3w/gswwzxe09enunumxhqMJ0Yy++ZruXrzFN3FrEj5WV04RxpZxyNfBxZD6rTtXLqQxB
 9Ij+thJ/01ha154+eVnaSZgyv4y1g=
X-Google-Smtp-Source: AGHT+IG3yt46d48Uz/80Tkkqpo9i85joCQVdEVXaqCCkdB9JH/KYSBEGlttxQZi/k0UokQJ7NUqy4A==
X-Received: by 2002:a05:6000:310d:b0:3a5:541c:b40f with SMTP id
 ffacd0b85a97d-3b768ee0463mr6225000f8f.9.1753358800519; 
 Thu, 24 Jul 2025 05:06:40 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705378ffsm17956925e9.1.2025.07.24.05.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 05:06:40 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu, 24 Jul 2025 14:06:03 +0200
Message-ID: <20250724120604.2992836-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1753358801; x=1753963601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cGHXQC+cXVVZrzcsKN9T9OIf96Ny7pMz3E2sx566OpQ=;
 b=XyBChTfa4qihMDNP0vQc3UxbgKyUdgKJ6Q+NwdKLxVfj8how33aVJQmRnSiVgH7JmJ
 U9SS4gaoW1unmbuFDtdA5f+DJjZ7ejeuUvM1MLoF27/5btwMWK1TigW/SNC/RoEG/9gV
 q7VwHyeLVkUMYY36b7Fb9aLGqpqCRIN+XUra0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=XyBChTfa
Subject: [Buildroot] [PATCH 1/2] utils/update-rust: fix MIT hash
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The LICENSE-MIT file has changed.
Commit 432aef05 fixed it for rust package but forgot
the update-rust script.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
Since we added rust 1.86.0 to the 2025.05.x release,
I think this should be backported too.
---
 utils/update-rust | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/update-rust b/utils/update-rust
index 0f40f2e2b6..7db3feff9c 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -62,7 +62,7 @@ RUST_DIST_URL = "https://static.rust-lang.org/dist"
 
 LICENSES = {
     "APACHE": "62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a",
-    "MIT": "23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3",
+    "MIT": "b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1",
 }
 
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
