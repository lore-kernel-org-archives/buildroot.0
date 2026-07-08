Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2ABC44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB6281135;
	Fri, 10 Jul 2026 13:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHvULmirWnOx; Fri, 10 Jul 2026 13:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 250F581114
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691113;
	bh=cAwRWuJ9CJVELDf+Fm8byURJ7pln9kSX9Ok2gQMrxvo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FvjJlC7OIjyvpEHlSZ0oLFrlJkRisT9jvQ+1N2JoLwtw3gWxZdNs3h9GZF5Tlz+ob
	 0ZxsTqoF82qj7gt4D/c+/RbtYTK8ErLABwohG1GyX6qCgQnaKbhXoxxSsVZfrK1UB8
	 F5IuFrhsrDlqbchTSLOmJ4ooJ7zyWOiQmjgUEAyovQw4Gddh42rKEb8Toj+3+tZFt9
	 ttfx8hBPBZN95LmZLzy/kXNTDd5kJdkMcmS9EQrZY/Y4/WfPlmD0GBT8klkhuZqHN/
	 50tcvQy0e3IViedEHYMvt7zuD5RMWwoLPoFF652NwS7yGi6oKz8d1ohHWflZziLDQp
	 gmoNaCD83RoZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 250F581114;
	Fri, 10 Jul 2026 13:45:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D55B72FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BABB940ACD
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvxkmWTBiR96 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E0A74095B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E0A74095B
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F5528868B; Fri, 10 Jul 2026 13:44:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:31:55 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: c27982162e3d64f3b6ba9609341b9cb33c755f44
X-Git-Newrev: 15aaee1e0b03d15c769663c9624eba16943e21c5
X-Patchwork-Hint: ignore
Message-Id: <20260710134417.6F5528868B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/strongswan: fix
 build w/ wolfssl 5.9.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15aaee1e0b03d15c769663c9624eba16943e21c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The 'mlkem.h' header is no longer present in wolfssl v5.9.2 [1] and the
content was merged in the 'wc_mlkem.h' header.

[1] https://github.com/wolfSSL/wolfssl/commit/7a2cf5b655541013ed8c93ecc9f598146abf2916

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 275faf6d61d04f1e01df12ef4ce0b0f2710a194f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...01-wolfssl-Adapt-to-removed-ML-KEM-header.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch b/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch
new file mode 100644
index 0000000000..a2eba92612
--- /dev/null
+++ b/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch
@@ -0,0 +1,29 @@
+From 98b133c54c5e3f66f46a5bb11c9b09d06fdc8469 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 26 Jun 2026 08:10:16 +0200
+Subject: [PATCH] wolfssl: Adapt to removed ML-KEM header
+
+The mlkem.h header that mainly defined aliases for the old wc_Kyber* API
+has been removed and its contents moved to the wc_mlkem.h header.
+
+Upstream: https://github.com/strongswan/strongswan/commit/98b133c54c5e3f66f46a5bb11c9b09d06fdc8469.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libstrongswan/plugins/wolfssl/wolfssl_kem.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c b/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
+index 042a7e70616..786aecab4cd 100644
+--- a/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
+@@ -25,10 +25,7 @@
+ 
+ #ifdef WOLFSSL_HAVE_MLKEM
+ 
+-#include <wolfssl/wolfcrypt/mlkem.h>
+-#ifdef WOLFSSL_WC_MLKEM
+ #include <wolfssl/wolfcrypt/wc_mlkem.h>
+-#endif
+ 
+ typedef struct private_key_exchange_t private_key_exchange_t;
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
