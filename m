Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EA9C30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 14:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A254008E;
	Wed,  3 Jul 2024 14:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqtqju_hNxYo; Wed,  3 Jul 2024 14:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 263584156F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 263584156F;
	Wed,  3 Jul 2024 14:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49F2D1BF21A
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35B7B845AE
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dkl8VgiDPQ1P for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 14:23:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF0FB845AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF0FB845AD
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF0FB845AD
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 14:23:25 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-584ee8da49aso1320079a12.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 07:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720016604; x=1720621404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VGoyz0uOf8ibJFrgvXkFKYJcVvPHQ8ivSlnoi0QSrn8=;
 b=dUxF+vFZxKh5kit39NdQjOZLSpwx6U02egiraldbJ3br/mA/yEjnBYHysKWPXlPgBB
 9HhAyHLo6S7v5ctyc6qg5nf9kO8bTSCJYLy5MXpZlfwBHrSn3vTdw2BnMOmpIQ4hx+E/
 U+XURhoJqX9963kF4TXjQ/oho9U3hoxoWcxvWhq9PxS11mrlsA/lC44A3oNC6m0yRhT6
 TngGKhWvwJzZrifUnDw+QielLpiyZLBnUblU5Uti+f4LL2e4rS3xR9KnpNJMEZ1MhqfJ
 ao2l/Yq4TagybBAYa7YH/5L6yYyxcrjKkt+fmFw1/pZefZXDLkJRYYbGGGB+QI+1ucdI
 xWnw==
X-Gm-Message-State: AOJu0YxMxWivdZZ/+RQ/O+BzDSDBHMcFWxzdgm0fkiMXK7yjZdCqOxKj
 NVy0Trf060iy33EIjobXuvV7k1LFKjAByLxGp8/mqHM8z0ClNkdNpZAQfnYoeGbnwAFvTLWL+Xe
 oIug=
X-Google-Smtp-Source: AGHT+IFhWlldbVPBBeIsqtjNjhWOWzE7sU5nxIES9iI3WH+TNaKDCPfB/uaAaARgCGGl1NOqlFOH7g==
X-Received: by 2002:a05:6402:1906:b0:58c:77b4:404b with SMTP id
 4fb4d7f45d1cf-58ce573b23dmr1363550a12.15.1720016603737; 
 Wed, 03 Jul 2024 07:23:23 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1a37:2bf3:7cf8:1941])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861381868csm7021866a12.55.2024.07.03.07.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:23:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 16:23:08 +0200
Message-ID: <20240703142308.2752594-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720016604; x=1720621404;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VGoyz0uOf8ibJFrgvXkFKYJcVvPHQ8ivSlnoi0QSrn8=;
 b=PE9hmufGtHS7UEIAxaNDxU26f8GA0hOwaQwXP48yYLPf1laXcUrxiE0EfbeXgptCJF
 x4lHm7BuBekMkNeXza5/oGhIZ5HCqZT8v9tx71LuviGPcrohwt0N4TRYG9x3iFitfZ/9
 mMq8dSVmsS0qpGdKt+U/ewQrNOCubG8FrNsXo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PE9hmufG
Subject: [Buildroot] [PATCH 1/1] package/libssh2: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libssh2 fails to build with output:

    Applying 0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch using patch:
    patching file src/kex.c
    Hunk #1 succeeded at 3037 (offset 5 lines).
    Hunk #2 succeeded at 3062 (offset 5 lines).
    Hunk #3 succeeded at 3315 (offset 5 lines).
    Hunk #4 succeeded at 3406 (offset 5 lines).
    Hunk #5 succeeded at 3440 (offset 5 lines).
    Hunk #6 succeeded at 3476 (offset 5 lines).
    Hunk #7 succeeded at 3489 (offset 5 lines).
    Hunk #8 succeeded at 3523 (offset 5 lines).
    Hunk #9 succeeded at 3569 (offset 5 lines).
    Hunk #10 succeeded at 3591 (offset 5 lines).
    Hunk #11 succeeded at 3633 (offset 5 lines).
    Hunk #12 succeeded at 3654 (offset 5 lines).
    Hunk #13 succeeded at 3687 (offset 5 lines).
    Hunk #14 succeeded at 3709 (offset 5 lines).
    Hunk #15 succeeded at 3892 (offset 5 lines).
    Hunk #16 succeeded at 3918 (offset 5 lines).
    Hunk #17 succeeded at 3967 (offset 5 lines).
    patching file src/libssh2_priv.h
    Hunk #1 succeeded at 699 (offset -37 lines).
    Hunk #2 succeeded at 873 (offset -38 lines).
    Hunk #3 succeeded at 914 (offset -38 lines).
    Hunk #4 succeeded at 1149 (offset -38 lines).
    patching file src/packet.c
    Hunk #1 succeeded at 605 (offset -19 lines).
    Hunk #2 succeeded at 656 (offset -19 lines).
    Hunk #3 succeeded at 1404 (offset -23 lines).
    Hunk #4 succeeded at 1474 (offset -23 lines).
    patching file src/packet.h
    Hunk #1 FAILED at 72.
    1 out of 1 hunk FAILED -- saving rejects to file src/packet.h.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...d-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch b/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
index 2ccedee19e93..2abed8432054 100644
--- a/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
+++ b/package/libssh2/0002-src-add-strict-KEX-to-fix-CVE-2023-48795-Terrapin-Attack.patch
@@ -15,6 +15,8 @@ Closes #1291
 
 Upstream: https://github.com/libssh2/libssh2/commit/d34d9258b8420b19ec3f97b4cc5bf7aa7d98e35a
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/kex.c          | 63 +++++++++++++++++++++++------------
  src/libssh2_priv.h | 18 +++++++---
@@ -387,14 +389,14 @@ diff --git a/src/packet.h b/src/packet.h
 index 1d90b8af12..955351e5f6 100644
 --- a/src/packet.h
 +++ b/src/packet.h
-@@ -72,6 +72,6 @@ int _libssh2_packet_burn(LIBSSH2_SESSION * session,
+@@ -71,6 +71,6 @@ int _libssh2_packet_burn(LIBSSH2_SESSION * session,
  int _libssh2_packet_write(LIBSSH2_SESSION * session, unsigned char *data,
                            unsigned long data_len);
  int _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
 -                        size_t datalen, int macstate);
 +                        size_t datalen, int macstate, uint32_t seq);
  
- #endif /* LIBSSH2_PACKET_H */
+ #endif /* __LIBSSH2_PACKET_H */
 diff --git a/src/session.c b/src/session.c
 index 35e7929fe7..9d89ade8ec 100644
 --- a/src/session.c
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
