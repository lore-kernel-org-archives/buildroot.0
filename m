Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23493CD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 17:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0A3A40F6E;
	Sun, 24 May 2026 17:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9jZp9usbq9G; Sun, 24 May 2026 17:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0917A40FFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779644810;
	bh=ItUlHJEyPvYMxiUfWnXWr2m6TVRSb3IpqtOmuoKg2sE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B9DSWJiADFpuVcrnEpWmE3KL+GNnxa9FLbBGbNxsWdKJ1fXiPk76ejZhLGR1xvUdX
	 iMA4t5PRdxxopyhgMwXZVMJiAtzZh7gOc8dJI/yF/zUyf2827bR2T367gcLxYVM38a
	 E8mH3MlgY43a//eCeHnKbqL0HfRj5zokCDeAZ9rKVUsvIFNTgHkDxWGFqNIwPsS7Co
	 giXMRajgWzLbJhBNlkeKru2fiHHLqkHHf2nzTRANTQeKGbvKGqb7GiSqB8Zht+tHYC
	 la7GqZyBZsCAsmpc4Xs6UIh3MkdIJvlYX9s0SaIMjtUxO5Dm8bu9MUYBTDlH5edJUE
	 QZUu+P3+W4sfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0917A40FFD;
	Sun, 24 May 2026 17:46:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B75569
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 310874046C
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQpTKlGi_wnr for <buildroot@buildroot.org>;
 Sun, 24 May 2026 17:46:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C4F04043E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C4F04043E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C4F04043E
 for <buildroot@buildroot.org>; Sun, 24 May 2026 17:46:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1beef.dip0.t-ipconnect.de [84.161.190.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3CA06A4C0E4C;
 Sun, 24 May 2026 19:46:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58586)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRCuT-000000006cD-1soC;
 Sun, 24 May 2026 17:46:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Stefan Ott <stefan@ott.net>
Date: Sun, 24 May 2026 19:46:45 +0200
Message-ID: <20260524174645.3772462-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779644806;
 bh=lCeNi83K9NdUN4bDMhhmDmqYvkapou2heurHogC8NJQ=;
 h=From:To:Cc:Subject:Date:From;
 b=StobRZIyNs2R4q8Iwgdaw0k6SdLv/HUVSTmJk+bphh99WrwyM5trcHHZoQ62Mt8WD
 7giblqvjKPuBhdzoU1GHV9+k733vF2L6/WyEWOo6stSUgRZADMmKHnZjle2IPUevQx
 wjklxH4vVvLzrlAdfwMRSVALZlXxZeTVvYXzwaBoK5ZRcrPEuKVwPmOxh6lnPGx1m2
 8lqEo05HxRIVqrqcp2JB+BgmxNe19jKH/Gf7QgPzAGu+l9XLZwsV/Rt4+ft4AH44/j
 8gvlZg44ywTo1+fV4qH0YWF7jk0WVhaF4VH2tSEuvGS1gBJaap4B9NtQQFRaPeqawH
 zHClfJYP4rypg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=StobRZIy
Subject: [Buildroot] [PATCH 1/1] package/unbound: security bump version to
 1.25.1
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

https://nlnetlabs.nl/projects/unbound/download/

Used new signing key to verify the source tarball:
https://nlnetlabs.nl/signing-keys/

Fixes CVE-2026-33278, CVE-2026-42944, CVE-2026-42959, CVE-2026-32792,
CVE-2026-40622, CVE-2026-41292, CVE-2026-42534, CVE-2026-42923,
CVE-2026-42960, CVE-2026-44390 and CVE-2026-44608.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/unbound/unbound.hash | 8 ++++----
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 19966d889e..46b88900e6 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.asc
-# with key: 948EB42322C5D00B79340F5DCFF3344D9087A490
-sha256  44e7b53e008a6dcaec03032769a212b46ab5c23c105284aa05a4f3af78e59cdb  unbound-1.24.2.tar.gz
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.25.1.tar.gz.asc
+# with key: 231018690C4D903EF419146AA144323DEAACDF45
+sha256  0fe8b6277b0959cfd17562debac0aa5f71e0b02dc4ffa9c60271c583edab586f  unbound-1.25.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index a702f4762d..589b286c26 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.24.2
+UNBOUND_VERSION = 1.25.1
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
