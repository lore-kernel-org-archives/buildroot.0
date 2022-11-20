Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C064C433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 10:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B4DB40493;
	Sun, 20 Nov 2022 10:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B4DB40493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ovmcE6teL5e; Sun, 20 Nov 2022 10:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 354EA4049A;
	Sun, 20 Nov 2022 10:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 354EA4049A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D26461BF5E6
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 10:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B724A607F9
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 10:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B724A607F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAkQLq10wpS9 for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 10:25:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B90CA607C9
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B90CA607C9
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 10:25:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so6999376wms.0
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 02:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zNKYT/je2EvyezjcueJUvUZuHKPQpoawL/uhLphMcPs=;
 b=bCtoUX1BCSz4PKhCJ9jACkafYn/r4Q3873FB9HEgdv+TqehVgd+dX1yPaCVH4pQsfK
 rc9EUr17J+/VJ2Tjna1gYS94+Grrw238eI/yIvN02NPuhP3vohj0zqZ8r4A8iEd55EHO
 QRuM+sLbxk/UFW+NKHPSJNDKxAuToust/KesXw5YfZJOD3a4pCwnGmS/yyw+bd/KIkUe
 BY1ihqmqUc2EBvzWiz7G1Z0GEhrG765wkuZqgEtaSpy01a1RHRntSoLSICQ99lzZoFVh
 CrzW/09KudNdBuX21iBAK6nPfsJivsJtPgC8gdOuCRhnqmteQQ2SGhNFoFM2a2wtirKa
 9qpA==
X-Gm-Message-State: ANoB5pknbOiCWX02idSsvTPQjR0ito90Y4EQyK7y6KHCpeoIkfm2GH+S
 K90BCj9XGX1rwGYFtXbqzl9+l7Vqy8g=
X-Google-Smtp-Source: AA0mqf4JR+pMhh7NC3hdKnBTKuusTojTlbqDHwK/GmTi0OB2FYPNgqeSrAbaF4jz2Dq7pYOEGSjP1g==
X-Received: by 2002:a7b:c852:0:b0:3c6:a8c7:755e with SMTP id
 c18-20020a7bc852000000b003c6a8c7755emr1861126wml.167.1668939935532; 
 Sun, 20 Nov 2022 02:25:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g26-20020adfa49a000000b002366e3f1497sm8682282wrb.6.2022.11.20.02.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 02:25:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 11:25:31 +0100
Message-Id: <20221120102531.16432-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zNKYT/je2EvyezjcueJUvUZuHKPQpoawL/uhLphMcPs=;
 b=ZIhsGMUMdq9HlU+6ayWkmt36QHRaxgWgRbsoCiwX/30SrX0jTnE8ZYyssSKmcAIjCj
 uLNIO8TLEnpFGTFM07nO9kmTJAWRgdDHJjh+GBBNzbFx5fp2sxeV/wf1clGAtOUOF/GH
 3lpQdZ0UqSqxd5TpJQxazzwKG+JJvjn0tZtf2yC40AMN3JMzEtOHaeeOfS2gqU/+oqgx
 6CUWxPKChf/9T0bl8JxXLihd44mg5dCpMIohyasiebkDDQkVxTutZiPdxrTagOsrjxq9
 6lP75rXCq6uBuZ9coNJIpP6RpT1pFdchGRrblaIGPnIDOg0zJcGkyhsbqrFlp+PIe44x
 WdTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZIhsGMUM
Subject: [Buildroot] [PATCH v2,
 1/1] package/sysstat: security bump to version 12.6.1
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

Fix CVE-2022-39377: sysstat is a set of system performance tools for the
Linux operating system. On 32 bit systems, in versions 9.1.16 and newer
but prior to 12.7.1, allocate_structures contains a size_t overflow in
sa_common.c. The allocate_structures function insufficiently checks
bounds before arithmetic multiplication, allowing for an overflow in the
size allocated for the buffer representing system activities. This issue
may lead to Remote Code Execution (RCE).

Despite what is written above in the CVE announcement, and as written in
the Changelog, the fix is also included in version 12.6.1 (12.7.1 is a
development version):
https://github.com/sysstat/sysstat/commit/c1e631eddc50c04e4dcea169ba396bee2bd6b0ab

Someone suspicious of the github warning that "this commit does not
belong to any branch on this repository" could check that the
check_overflow function is defined in common.c and used in sa_common.c.

https://github.com/sysstat/sysstat/security/advisories/GHSA-q8r6-g56f-9w7x
https://github.com/sysstat/sysstat/blob/v12.6.1/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Update commit message

 package/sysstat/sysstat.hash | 4 ++--
 package/sysstat/sysstat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index b573f312c6..b47f000e57 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,5 +1,5 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1  1e38bc029979def730ae1fb1e39f631bd1a3bc73  sysstat-12.4.2.tar.xz
+sha1  a730982e0c2d4964a0022c1509f3ea0a345402bc  sysstat-12.6.1.tar.xz
 # Locally calculated
-sha256  3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1bcffa018f  sysstat-12.4.2.tar.xz
+sha256  18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342  sysstat-12.6.1.tar.xz
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 6948f6b390..377396d986 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 12.4.2
+SYSSTAT_VERSION = 12.6.1
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-file-attr
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
