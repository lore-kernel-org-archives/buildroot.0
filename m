Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2D8C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 20:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEA6881E7D;
	Tue, 28 Nov 2023 20:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA6881E7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lwXwvsCL3GPS; Tue, 28 Nov 2023 20:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE0C81E8F;
	Tue, 28 Nov 2023 20:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE0C81E8F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D42C41BF371
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB1754055E
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB1754055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vl_BD4qOep7y for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 20:14:45 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 511484048E
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 20:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 511484048E
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso48228905e9.0
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 12:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701202483; x=1701807283;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V3aA3Ek6Gk39ljetwDnKoLhMHSxN7/Fuesv0U+qwqtU=;
 b=T0L+5HdwNZJIWxVCMUp8p3ie8yixXwTSmgRcIeiRT3hfj9Zog5BBw0SGRa+U2xY1V7
 yGRBbLFRveTFDbsLoQQK7BNd3PtklOngsutGae2DGd78X6rUGHYPMRSSo8JwBSKecZEe
 8o5tq7zVeOI/yn08WpXHTGrZyY+7Cxs0kVCzoxY5XE5EkVeSyVEdcZ5od+On2eWK0ruk
 TZwF6BaoRfZ7n6usx8mLWzbpFjxl4k4D2eHM8p/GM1giPHtM3tDfRGKBGSBCV7NmmOEc
 jkTO2KAr7lnjDpwzJkKIpJcdAx50O0djNnZlCY+ozNIMMLSRGGS8PBw9ksUZ+j2j3/ZA
 gvWA==
X-Gm-Message-State: AOJu0Yze/9YFZkMExVtQvtofVmOczJdso1o7FYGA4isos/BuWUpZiqWQ
 tNivlIs8kvQPpUXFEoZ5GY9jCURd0wM=
X-Google-Smtp-Source: AGHT+IF92GxuXTeJQxB2kuq27AyUJxYOZuEq3ePlltQTaSP9dUu0g09DB0+W8QnSFKDsAwJaE7cTrg==
X-Received: by 2002:a05:600c:3595:b0:40b:36e6:7940 with SMTP id
 p21-20020a05600c359500b0040b36e67940mr12343042wmq.35.1701202482840; 
 Tue, 28 Nov 2023 12:14:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003fefaf299b6sm18681124wmq.38.2023.11.28.12.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 12:14:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 21:14:33 +0100
Message-ID: <20231128201433.407879-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701202483; x=1701807283; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V3aA3Ek6Gk39ljetwDnKoLhMHSxN7/Fuesv0U+qwqtU=;
 b=ETL5kqIN4T2LMaPi/5zAPT5kbNQSH7SqqWCvTxE3jEk4MIE+4D4z+mGYEd409/gu4j
 96+5+ZYStgeyHygYwPS22CEA+cn9mmNcMB2hX9imrH1hylNCxWZg/VnC8KUP/2fypx/E
 tnpb8es+LLTQj6PrROdFpxKS8rRzeoy/wTFkKkdEiF2AJubtcifhXdL6ajijtpGfEyDV
 Hi7TO7qsm5s58y9H7NWUsnhPoLlANOHTiK3YSMfKqKSIU1RP56zEHbmSfUos61EueqW9
 191/Rm4fdKNVZEGe6yLTOFio1Tk3eH2R0CnPmcHvLIe9/yzd4FjjSAY6fIIJmcMltTNh
 TYwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ETL5kqIN
Subject: [Buildroot] [PATCH 1/1] package/memcached: security bump to version
 1.6.22
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-46852: In Memcached before 1.6.22, a buffer overflow exists
when processing multiget requests in proxy mode, if there are many
spaces after the "get" substring.

Fix CVE-2023-46853: In Memcached before 1.6.22, an off-by-one error
exists when processing proxy requests in proxy mode, if \n is used
instead of \r\n.

https://github.com/memcached/memcached/wiki/ReleaseNotes1622

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index c223a14bac..bd2072df0b 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.21.tar.gz.sha1
-sha1  6d899680b4ba4b76b6c92120143cf87630ee984a  memcached-1.6.21.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.22.tar.gz.sha1
+sha1  7a691f390d59616dbebfc9e2e4942d499c39a338  memcached-1.6.22.tar.gz
 
 # Locally computed
-sha256  c788980efc417dd5d93c442b1c8b8769fb2018896c29de3887d22a2f143da2ee  memcached-1.6.21.tar.gz
+sha256  34783a90a4ccf74c4107085fd92b688749d23b276cfdad9f04e4f725a05d1ca7  memcached-1.6.22.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index a1a5eac049..05ae69eb32 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.21
+MEMCACHED_VERSION = 1.6.22
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
