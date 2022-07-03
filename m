Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84823C43334
	for <buildroot@archiver.kernel.org>; Sun,  3 Jul 2022 09:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFF3340223;
	Sun,  3 Jul 2022 09:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFF3340223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45-7rDK9eywR; Sun,  3 Jul 2022 09:57:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E784F4014C;
	Sun,  3 Jul 2022 09:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E784F4014C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE301BF593
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 09:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB8CB4014C
 for <buildroot@lists.busybox.net>; Sun,  3 Jul 2022 09:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8CB4014C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zs68F8MgUJqV for <buildroot@lists.busybox.net>;
 Sun,  3 Jul 2022 09:56:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58FCF40017
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58FCF40017
 for <buildroot@buildroot.org>; Sun,  3 Jul 2022 09:56:55 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s1so9278459wra.9
 for <buildroot@buildroot.org>; Sun, 03 Jul 2022 02:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a7FWzsN2rQIoY6XZ9XRemxsvQBQOd8KGI7bNKCTxNAc=;
 b=JN7h+vPFmzwjnMpUf0B2kgRetruZULOvB/uu5BZYMUT9lHhGR2PpGv0xD53A839w3u
 HHNwN7rQIPoTN+gj2z/DMJXKUkQjpHaMCrpQN12Xb9Ko2CqQGz3gGgbv2gcbrGk8GJ+W
 1Cb1X6/QSMaCpH4pUkzxHccJ94OjrLabOAUre+QIUEslubdze42DD/WUtsNPzgn0k7WL
 KM012SThXeMfZZ2WleQwoeJpnA0kwV0lFBNCW5Gtx3GJ9SjO5q7MoECvL2Fi/vEnj83f
 aFB7uiFviSoLxQ0JAmKBjFjHJSH3wO81KqjhNu5QPW9Aw3Fu6bwobiN9DVgH0DSyW4Nr
 2CcA==
X-Gm-Message-State: AJIora+LHv7OrTFc1ca+uqOQexd8ik2U9gTXzsU5xWlNKXsIibMtRq4w
 GaT/OUpVKHXap/DA1yCGAfyfKh3gGco=
X-Google-Smtp-Source: AGRyM1vDSfMLw8hG4jSs/Lj6Km1GP34n4wcvhNgQ8vGIjYRsiVmpCcGgArSioJ5Wsuwjo8JDq9J4dg==
X-Received: by 2002:a5d:5a15:0:b0:21d:630c:a609 with SMTP id
 bq21-20020a5d5a15000000b0021d630ca609mr4891106wrb.468.1656842212909; 
 Sun, 03 Jul 2022 02:56:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d67c7000000b0021b9e8d4c22sm27150601wrw.61.2022.07.03.02.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 02:56:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Jul 2022 11:53:47 +0200
Message-Id: <20220703095347.1318735-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a7FWzsN2rQIoY6XZ9XRemxsvQBQOd8KGI7bNKCTxNAc=;
 b=Any+AEocnko1o7YbeQ5fleW35C5NU7DJu4JA5te1qXoODhHvwTh8kEul9ykedrQwQd
 L9z73tpB3BzYb2UpzdkNdpePWPFXLWorKoMP+DlUD4+QkrOq/BmC3IDhrUBiVpNXXeG1
 cdNSmwD/RtpU9R05BYSGI0UPFNg3pYreoW5B6sV1Ygk5CrwUAAjWGMPLMHMkihP85xgz
 kFGhB6B7AqVyIHOyXdzzNQxUGuEqg6vQzI5UYdYhVwT4OGXQ7xgoC6LCzgnMCPSfIthi
 P1Lv5GmhkNUvCocnCUmJ8qXoHuvgyawDSmoiedS1epbttIs1JTUbSO5x6hfGyoux88sG
 ZiMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Any+AEoc
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 version 1.1.1p
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The c_rehash script allows command injection (CVE-2022-2068)
============================================================

Severity: Moderate

In addition to the c_rehash shell command injection identified in
CVE-2022-1292, further circumstances where the c_rehash script does not
properly sanitise shell metacharacters to prevent command injection were
found by code review.

When the CVE-2022-1292 was fixed it was not discovered that there
are other places in the script where the file names of certificates
being hashed were possibly passed to a command executed through the
shell.

This script is distributed by some operating systems in a manner where
it is automatically executed.  On such operating systems, an attacker
could execute arbitrary commands with the privileges of the script.

Use of the c_rehash script is considered obsolete and should be replaced
by the OpenSSL rehash command line tool.

https://www.openssl.org/news/secadv/20220621.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index ec5fd0fe84..2f76241c72 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1o.tar.gz.sha256
-sha256  9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f  openssl-1.1.1o.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1p.tar.gz.sha256
+sha256  bf61b62aaa66c7c7639942a94de4c9ae8280c08f17d4eac2e44644d9fc8ace6f  openssl-1.1.1p.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 1aff93429b..f19a63da41 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1o
+LIBOPENSSL_VERSION = 1.1.1p
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
