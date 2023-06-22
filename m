Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C11EB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 05:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66DB483AC1;
	Thu, 22 Jun 2023 05:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66DB483AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oz0yRey4p3bn; Thu, 22 Jun 2023 05:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ACCB83B33;
	Thu, 22 Jun 2023 05:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ACCB83B33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A62B1BF288
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 05:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F54641F74
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 05:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F54641F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZLoiLXXwzoCW for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 05:17:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02AD341F70
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02AD341F70
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 05:17:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6F78A4C00B7
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 07:17:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48632)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qCCgp-0004wF-1l
 for buildroot@buildroot.org; Thu, 22 Jun 2023 07:17:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 07:17:03 +0200
Message-Id: <20230622051703.2543-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622051703.2543-1-bernd@kuhls.net>
References: <20230622051703.2543-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687411023;
 bh=E5x8gSWrg/r9CLjWA6uYAjYP43DqIMMfTh6gP1k1U90=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=M1xx/KCl0oKii8KgY8PZQrGP48tIAAn0j4KTOdtifWRJMJIXZlx+PaSBKxAYGnLYS
 OHcoCJ+ZnhxLkpbdLqltzGjPfHjS9XlsHXXfFWx7l5sNTXJbpDqXdAeRWy+4qA/9nY
 K3wGT2FF22Nx3G+vPGHMav4Q2xV+VCUsBQbOvFnS9Sk9eT2DP9nJYFiT6ty78hSOya
 mfHq6wHqQXSv7D+A9QJPgCTiNJmK1dm/zJtU1wc4JC1Wo7WfjE8OMpXLarQpUDXbcl
 4B5CIRP11yH5sHRncnvOaS2gTEdh9I5WVcSHBRR8Av43kPBO0auWWVhQiqlL9z1ayu
 0TOw11bfJB/vA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=M1xx/KCl
Subject: [Buildroot] [PATCH v2 2/2] package/raptor: fix build with newer
 versions of libxml2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/6a5/6a5139fe86b8370477dc6cb044bf29180bd145df/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 ...s-to-entities-checked-private-symbol.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch

diff --git a/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch b/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch
new file mode 100644
index 0000000000..cd9542a9a9
--- /dev/null
+++ b/package/raptor/0002-Remove-the-access-to-entities-checked-private-symbol.patch
@@ -0,0 +1,35 @@
+From 4dbc4c1da2a033c497d84a1291c46f416a9cac51 Mon Sep 17 00:00:00 2001
+From: David Anes <david.anes@suse.com>
+Date: Thu, 4 May 2023 11:54:02 +0200
+Subject: [PATCH] Remove the access to entities 'checked' private symbol for
+ libxml2 2.11.0
+
+Since version 2.11.0, some private symbols that were never intended
+as public API/ABI have been removed from libxml2, therefore the field
+'checked' is no longer present and raptor fails to build in this
+scenario.
+
+Upstream: https://github.com/dajobe/raptor/commit/4dbc4c1da2a033c497d84a1291c46f416a9cac51
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/raptor_libxml.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/raptor_libxml.c b/src/raptor_libxml.c
+index 538c2c8e..8bcee139 100644
+--- a/src/raptor_libxml.c
++++ b/src/raptor_libxml.c
+@@ -246,10 +246,11 @@ raptor_libxml_getEntity(void* user_data, const xmlChar *name)
+     
+     ret->owner = 1;
+ 
+-#if LIBXML_VERSION >= 20627
++#if LIBXML_VERSION >= 20627 && LIBXML_VERSION < 21100
+     /* Checked field was released in 2.6.27 on 2006-10-25
+      * http://git.gnome.org/browse/libxml2/commit/?id=a37a6ad91a61d168ecc4b29263def3363fff4da6
+      *
++     * and was later removed in version 2.11.0
+      */
+ 
+     /* Mark this entity as having been checked - never do this again */
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
