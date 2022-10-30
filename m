Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B00DC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 12:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7C2681257;
	Sun, 30 Oct 2022 12:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7C2681257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ddx5vJZ62FCO; Sun, 30 Oct 2022 12:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F13C980FAE;
	Sun, 30 Oct 2022 12:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F13C980FAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4672D1BF48B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 12:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F91D60750
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 12:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F91D60750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5NwfAQ6XdXt for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 12:54:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B19E7608D8
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B19E7608D8
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 12:54:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a14so12477421wru.5
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 05:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DkYHXp3cr0bKX91rr21QMgW4dwceNpECgnCIYPdTtX8=;
 b=tStGulWSrXhoeBODha1lCeyOuhIaLVVNS00uL8LCshAT2rIzEnwz/BZgTlGuI4P16t
 AblqSykF+wxaY+d/mUpLMx9pM6jX1QdQpnKWOFJmM04wZPbwZ8B1C5ERaAvanCCqgWdi
 dgt9fqnAA2FrjwlJ13ZE1Ss4Aro1YyDS4cnnyY/t+BVthN7OZJ434lAjsODTt4bsNdds
 ff8B0e1/Ak0MWSrWfLRWy9sQLkLX+NIz9LQAxTtCA0Nd2cuD/t+Uv/sN5bR5abpoKCSo
 l208oGYJuAEIQGrmns3vgMyd1a2/mxcdeby3kvR5yewTq0RQwubwpDx2nr5Cf9oi2tZa
 6HnQ==
X-Gm-Message-State: ACrzQf3VJgeXmuZ9QRsr+UWnBFQPxbUb32Zr5YdNEdgKOi2DT5kjVxAd
 3SUDVrt4zRu50IVypgdR01eeN21MRB0=
X-Google-Smtp-Source: AMsMyM5PB6S10Mnqfvs98hQkuZB7II6e/fa1BhbtSQJk2DoEdZ6uQOhsODqQAJ0SNbNAsz6NhFgz5A==
X-Received: by 2002:a5d:4711:0:b0:236:48b6:cb89 with SMTP id
 y17-20020a5d4711000000b0023648b6cb89mr5050383wrq.246.1667134442424; 
 Sun, 30 Oct 2022 05:54:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 cy2-20020a056000400200b0022afedf3c87sm4115061wrb.105.2022.10.30.05.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 05:54:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 13:53:58 +0100
Message-Id: <20221030125358.387628-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DkYHXp3cr0bKX91rr21QMgW4dwceNpECgnCIYPdTtX8=;
 b=kfOag9bdnKCjWQhjykl+YX6QBhsjxJ48ozHq3lhEzvWR4svg1ibvr+uD5CF5LmBZl+
 aAsN5XcgezavsOrALleHA270e/NgVleryJ9rL66Y/f6/1N6dWiasuDaR1s4yXS5txrN7
 dtTfD0st4kEKh3FeUdm8SsZ0r1+7fFM77JTgim9RizX+ttl9rmfdDx3bDC7JoP+neu4A
 vklyBwdKPJvKMzG4t+qNJV4c4OG6mcxMEfPFxksPAM8z2As2LWUc385C0lCWSjWdpcTg
 RnyJnwIM6pzwx+8q5dKoRovtaiJ/VpgqbBGA9nTFS0+vIBdo0qIEr34NHo6V3+WZpeu5
 4cyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kfOag9bd
Subject: [Buildroot] [PATCH 1/1] package/kmemd: needs headers >= 5.14
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Tobias Waldekranz <tobias@waldekranz.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

kmemd unconditionally uses BPF_PSEUDO_MAP_IDX_VALUE which is only
available since kernel 5.14 and
https://github.com/torvalds/linux/commit/387544bfa291a22383d60b40f887360e2b931ec6
resulting in the following build failure since the addition of the
package in commit b3f915c6561bcb2f7952faca3bedf1766f299538:

kmem.c:36:17: error: 'BPF_PSEUDO_MAP_IDX_VALUE' undeclared here (not in a function); did you mean 'BPF_PSEUDO_MAP_VALUE'?
   36 |                 BPF_PSEUDO_MAP_IDX_VALUE, 0, _idx       \
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/dcd7e6321d64746b8b867fa3f32095d1180a40fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kmemd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmemd/Config.in b/package/kmemd/Config.in
index 902e636947..cd92757508 100644
--- a/package/kmemd/Config.in
+++ b/package/kmemd/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KMEMD
 	depends on BR2_USE_WCHAR # libbpf
 	depends on !BR2_STATIC_LIBS # libbpf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libbpf
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 # libbpf
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # libbpf
 	select BR2_PACKAGE_LIBBPF
 	help
@@ -12,7 +12,7 @@ config BR2_PACKAGE_KMEMD
 
 	  https://github.com/wkz/kmemd
 
-comment "kmemd needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
+comment "kmemd needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 5.14"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
