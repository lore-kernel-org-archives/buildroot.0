Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DB5C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 15:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC7C841A3C;
	Fri, 16 Dec 2022 15:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC7C841A3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x91XneHFe-wr; Fri, 16 Dec 2022 15:06:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C9AF41A1C;
	Fri, 16 Dec 2022 15:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C9AF41A1C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36DD81BF342
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 15:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B1FA4150E
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 15:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B1FA4150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZ_kZ8AKzQ-Z for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 15:06:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09E77410C7
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 15:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09E77410C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9BB58679A; Fri, 16 Dec 2022 15:06:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Dec 2022 16:04:11 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: d6943457c4afb2fb5103875243593d77c47ec552
X-Git-Newrev: b85968ac06d3a5f1b99fade5bba8379d8dd5c54f
X-Patchwork-Hint: ignore
Message-Id: <20221216150635.E9BB58679A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libuwsc: fix
 wolfssl build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b85968ac06d3a5f1b99fade5bba8379d8dd5c54f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

libuwsc needs BR2_PACKAGE_WOLFSSL_ALL (which enables openssl compat
layer) to avoid the following wolfssl build failure raised since the
addition of the package in commit
120c04775d7ebe5a2cfc14848f5d11f3a333970b:

/home/br-user/work/instance-1/output-1/build/libuwsc-3.3.5/src/ssl.c:62:5: error: unknown type name 'SSL_CTX'
   62 |     SSL_CTX *ctx;
      |     ^~~~~~~

Note that we do not select _ALL when wolfssl is enabled, because wolfssl
is neither the only nor the preferred choice, so the condition would
have to be a bit more complex:

    select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL \
        && !BR2_STATIC_LIBS && !BR2_PACKAGE_OPENSSL

It is not overly complicated, but it is no longer trivial or obvious,
and would easily break if the ordering of preferences were to change in
the .mk fie in the future.

Fixes:
 - http://autobuild.buildroot.org/results/6c2a6ed6fca1f92aab299f6ed9cd900b20e8d512

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: explain why we don't select _ALL]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1567fbd72d4b547f70a7509247bf9abb73ab58e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuwsc/libuwsc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
index cad351529d..051ea411fa 100644
--- a/package/libuwsc/libuwsc.mk
+++ b/package/libuwsc/libuwsc.mk
@@ -18,7 +18,7 @@ LIBUWSC_CONF_OPTS += \
 	-DUWSC_USE_MBEDTLS=OFF \
 	-DUWSC_USE_OPENSSL=ON \
 	-DUWSC_USE_WOLFSSL=OFF
-else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 LIBUWSC_DEPENDENCIES += wolfssl
 LIBUWSC_CONF_OPTS += \
 	-DUWSC_SSL_SUPPORT=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
