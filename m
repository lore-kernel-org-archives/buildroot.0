Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4DFC369A5
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B7980E20;
	Wed,  9 Apr 2025 20:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRHfegr281tJ; Wed,  9 Apr 2025 20:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 508CE83FA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 508CE83FA4;
	Wed,  9 Apr 2025 20:04:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02E20201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61662403D7
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3D8Sa3p45jwY for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D21340E57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D21340E57
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D21340E57
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso4487533f8f.2
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229033; x=1744833833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OIgGve9gDJt8brlkMpL0RXOPAI9XeijM+ULSuEv+ywE=;
 b=dXN/AyxEOrGUD8n3srdNAe5tAGCpftGJ09EbIP5hY3lihf5cJpKHQjxX62cZ3/iXaM
 arOeG1DX6AnL0yn4NJPVBnTpNYoWeso3tNBpfPyWLWz7e1ZdQCdPvi22jvypnkFbPdNG
 kfDDbGyU5ddYsB0Tb+qQ/ds/HnrQij95YCMGrXVejT5AqWhMi48pqizwu+rE5KOMcNDb
 6FJFFcegdJbqlkkWUfqIixkUHSU5KkGnGjtYyC4Alxqx50/5slUkU38ih2bP+YPfjteC
 L7jT9GSAsZ5q+H84Esj96bblYm5Ul375r8ycD+6IlCvJbzjopQ2ZgLwhwGoQL6EhRLRg
 ytrw==
X-Gm-Message-State: AOJu0YzMOppSRxFFccmgKzUdhMMMaQZsIJaXJpiPEeEEzqrXDiE+17Hu
 sGMeDw8zy9kiQU3wDDAwIdcK79ix6T7QmndxW8oOZkPDGUz1ZjL/ILD2fg==
X-Gm-Gg: ASbGncvfw86vQqP9zhlmdesyVCmekaMwij0vo4DGE7OnhmrO+Hb8Kjv5zlwEPrvXG4g
 Ew7wWOPQiLQ6Lk/NRGMV3rIPiy2iGtWdVHpg/mSbBaOwkglhjg9u7ci2QU7+OZcT5O7OD8/q1Rz
 1/Y6Y1YsapH0aRl6nV9zAJsp6cTEYwsWSm0j990+tktRI7eviipOsevXvlvA+Xionugn1LqT/CD
 tOxuoEOleDAZhibiZZOQwz00NNCDmsCvduDtQlBLylvJso1jmmgC3IX5D/cCMcYdzer0WJ6gnXL
 bOJVYGCYJ7Mt+LCXzxFKo6Or4ZCbzoJxZbfwYAUSFt4n1mkoSQwAoBKeSCBvNg==
X-Google-Smtp-Source: AGHT+IHo4lLLRkODc13Bchv0do18aKz0EZUTSyNTA6OUiv5rvJgv/gJuJQljMkVHfj+ovGMpJ2Uzow==
X-Received: by 2002:a5d:598e:0:b0:391:47d8:de3d with SMTP id
 ffacd0b85a97d-39d8f46ae59mr70905f8f.16.1744229033356; 
 Wed, 09 Apr 2025 13:03:53 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:53 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 22:03:34 +0200
Message-ID: <0569948d6c6da448d01c4513c7d53a29306e512c.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229033; x=1744833833; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIgGve9gDJt8brlkMpL0RXOPAI9XeijM+ULSuEv+ywE=;
 b=bAHLPbW2ALBSihvcWTssBSHqgFrP83Wtn0flaa3TuiGRIiJbq6zcL84KxhSeGT8oHi
 n6bgXl8W316nqKPrLBflDWfLx7XZVw0OmfUI+cTjYKG6eydgAbCAA6CfJt8guJl5RoLT
 q9//ixjk3pAx0CRgqHdicK8YsMC9bUpVAjbJJbgPOESD6ZOj9svWBRAb8TvUFXUtCXAk
 UrF90E+x5Lx0y4unU8S86BUzWN6pwVI+SEEZJ+xWHpw7UaKjD3f4MHm8wLXrbxrJ1Bpm
 I808j1dwRpf2CAFE3xvHHyA8LXLyDjMRh4AqB4Bf/ybuA0ofdT6MvhlNNaUATpB43V3a
 JlJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bAHLPbW2
Subject: [Buildroot] [PATCH 19/29 v2] package/boost: headers-only libs are
 always installed
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The headers-only libraries are an entry like the others for the boost
build system, and are reported in the list of libraries when it is
queried:

    $ ./bootstrap.sh --show-libraries
    [--SNIP--]
    The Boost libraries requiring separate building and installation are:
        [...]
        - headers
        [...]

However, they are always "built" and installed, and can't be disabled,
even using the --without-headers flag.

In a followup change, we'll make sure that the sets of libs provided by
Boost on one hand, and known to Buildroot on the other, are identical,
so we'll want to have 'headers' be present in the list known to
Buildroot.

Add an Kconfig symbol to represent that library. To inform the user that
the headers library is installed, we expose it with a prompt; we however
make sure the symbol can't be disabled when Boost is enabled. Since it
is a "special' library, we list if first, not in alphabetical order.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 7 +++++++
 package/boost/boost.mk  | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index f37efd129b..784c40278b 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_BOOST
 	# let's depend on threads.
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_BOOST_HEADERS
 	help
 	  A general purpose C++ library
 
@@ -16,6 +17,12 @@ config BR2_PACKAGE_BOOST
 
 if BR2_PACKAGE_BOOST
 
+# Headers-only libraries are always installed by Boost's buildsystem
+config BR2_PACKAGE_BOOST_HEADERS
+	bool "boost-headers"
+	help
+	  Headers-only libraries; those are always installed.
+
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 2b952baaac..e849f902f2 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -25,6 +25,7 @@ BOOST_ALL_LIBS = \
 	filesystem \
 	graph \
 	graph_parallel \
+	headers \
 	iostreams \
 	json \
 	locale \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
