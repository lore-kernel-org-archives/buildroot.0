Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0068AC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 17:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB7B80CED;
	Sun, 16 Feb 2025 17:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVDEdUYgtWUO; Sun, 16 Feb 2025 17:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93EAF80DB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93EAF80DB8;
	Sun, 16 Feb 2025 17:03:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E64C572
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CADE3606C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_f4k-PWVHBX for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 17:03:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A371460643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A371460643
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A371460643
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 17:03:54 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso39347365e9.1
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 09:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739725432; x=1740330232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g11wKpOe5jGsJmgkxzu2dvK/0sKWWXJ3SRTK5+Wp09g=;
 b=crWg49yJ+XSb9MEezq1qegPlqUYAZz+uB9EpDVm2imAce43DCHnOgr+UsuwRb5Dkk1
 GH8s2Gbpcliyp+3jHM5a7JR1ABPqrxZyTDE0sRvijl0iEUUIxla0j+TgGQ3dVW0Gad9M
 BYAV032SxjvsSWZq7q3UOYmyYfLqOst4X0VB21P0LSBrIGKHzESQLseIHhaWjh/v2v+r
 6f6iT2eitKkLWtZjGEis13ySuK7qjBw2vIJOPuBZibBYUpMt30KCjAfFrN+JSzkHj7MK
 hsSSFAHvLfrXY28ExRGOcvzuEHdCTY1XxqBtfzQUGyHI4ZRRSTs+AOq+rvLKk9n1r0zZ
 gAGA==
X-Gm-Message-State: AOJu0YwtUtc6F5ddCskSViH5BIMUQg4rF62Pqu1zUbAYvkNISoxIXzDQ
 ztyl6L1rv4kQ8x9ImZOvTdf86NNDjuXbjLsZP/cPf2UNo8xRddqLTyItOQ==
X-Gm-Gg: ASbGncu/6jnuZb6LqDQtcvWsfZtGMrW7ULgq2yufVeRhzLH0twTqYrcfQxQpO3urHWT
 N0IJ/iIJ/DhRP4RpoLtDBuC111ped7aHmOfMYHhxTFZbQxepIKVykDIMRpL5pbI1Y+ap1ovX82a
 r0DrX1R19LTXLybLkG5cQDmvcTe7MM1PkllxQJz8hIb/Lsa9Lw3p0q/8AsZDM8BeGR5NGBu9dEz
 I/j14jyqumhUP4b8BnZURt/vn/QLCcnNsZIxU9dOJHlousc4wj2UN1hJy3S4yLFnbO3QhdFhBRJ
 jKbuZOrCxn92afQKQmm0ZKLKxg==
X-Google-Smtp-Source: AGHT+IFswKyJdzrUcj5/HO9wWGzxaqx5T1ZN+QTgOrPho+8GatXgtSi+VjF4l4FYFvs72dDsLjZtyg==
X-Received: by 2002:a05:600c:510e:b0:436:1baa:de1c with SMTP id
 5b1f17b1804b1-4396e6c4f57mr71644495e9.13.1739725432282; 
 Sun, 16 Feb 2025 09:03:52 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7bcsm129383245e9.28.2025.02.16.09.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 09:03:51 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 16 Feb 2025 18:03:50 +0100
Message-ID: <20250216170350.397879-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739725432; x=1740330232; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=g11wKpOe5jGsJmgkxzu2dvK/0sKWWXJ3SRTK5+Wp09g=;
 b=X3nbbWslnUcaTi6xy13McTHgKdM+pSnw0BdvB2M8CpinULJwXKhIuhSfayoTpmFsKy
 ErOd0Ql9sm+uRB1enabltK2z4vaWUbWor6Zm/PZvAtAZXNX5qVsJuO/6VB/1NBhkNRN8
 IuNaHXf4sMBI9bftOuCW6wpw+yccyZltoX9+r6ZnqZwcIM2GO7DqNsuvgueN3NtyydDT
 oDIcXeu78RSX9/Q975HYLuF3XytK7uEIJpYLdfK1kYNOiiYlugaj+Sm/zFt6PhjZzhv9
 fVBbCJIDzno/siGnLc4932+9evO501UR1T2Laes8zbuxKn9zk7m7neoSkstiYeiGwFIh
 BGSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X3nbbWsl
Subject: [Buildroot] [PATCH] utils/docker-run: allow explicitly setting of
 docker/podman/...
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

Currently, our docker-run helper will decide on its own whether it
should use docker (preferred) or podman (fallback). s introduced in
9a629f5129d6 (utils/docker-run: allow running with Podman). In case
both are installed, it is not possible to exercise the podman case.

Allow the user to force the one to use, by setting the BR2_DOCKER
environment variable. If that is set and does not exist, exit with
an explicit error message (rather than rely on the failure when
eventually exec-ing the specified command).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Cc: Julien Olivain <ju.o@free.fr>
Cc: Fiona Klute <fiona.klute@gmx.de>
---
 utils/docker-run | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 849df66d54..27c169db72 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -35,7 +35,14 @@ declare -a mountpoints=(
 # compatibility command.
 export PODMAN_USERNS="keep-id"
 
-if command -v docker >/dev/null; then
+if [ "${BR2_DOCKER}" ]; then
+    if command -v "${BR2_DOCKER}" >/dev/null; then
+        DOCKER="${BR2_DOCKER}"
+    else
+        printf 'ERROR: Command "%s" (from env BR2_DOCKER) not found.\n' "${BR2_DOCKER}" >&2
+        exit 1
+    fi
+elif command -v docker >/dev/null; then
     DOCKER="docker"
 elif command -v podman >/dev/null; then
     DOCKER="podman"
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
