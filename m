Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B34C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:45:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4896103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F4896103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 288E240507;
	Tue,  3 Aug 2021 21:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0FnQ6lJC0Oi; Tue,  3 Aug 2021 21:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F74F404A2;
	Tue,  3 Aug 2021 21:45:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD841BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 609DD4044D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oK5kui3iH_5Y for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2A33404D4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 193FA873E2; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Jun 2021 23:32:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c920f0d9b6217dcfde59b6f79e764a9a7f0a5890
X-Git-Newrev: 7c636d9c6601538920f6e46955168f41b458a287
X-Patchwork-Hint: ignore
Message-Id: <20210803210950.193FA873E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/perl-crypt-openssl-rsa: add missing dependency to openssl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7c636d9c6601538920f6e46955168f41b458a287
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

perl-crypt-openssl-rsa inherits the dependency on openssl indirectly
from perl-crypt-openssl-random. Hwvere, perl-crypt-openssl-rsa needs
the openssl libraries for itself, so it must explicitly depend on it.

So far, this was totally unconsequential, but since commit a83d41867c8d
(package/libopenssl: add option to enable some features), features can
be configured out, of which RMD160 that perl-crypt-openssl-rsa needs.
If we were to add the select to that option (in a followup commit),
without a dependency to openssl, that would be very confusing in the
future.

So, add the explicit dependency now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-crypt-openssl-rsa/Config.in                 | 1 +
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
index e58a921bcb..e2c0131345 100644
--- a/package/perl-crypt-openssl-rsa/Config.in
+++ b/package/perl-crypt-openssl-rsa/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
 	bool "perl-crypt-openssl-rsa"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM # runtime
 	help
 	  RSA encoding and decoding, using the openSSL libraries.
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
index b161523421..23fd1ac381 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -9,7 +9,8 @@ PERL_CRYPT_OPENSSL_RSA_SOURCE = Crypt-OpenSSL-RSA-$(PERL_CRYPT_OPENSSL_RSA_VERSI
 PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = \
 	host-perl-crypt-openssl-guess \
-	perl-crypt-openssl-random
+	perl-crypt-openssl-random \
+	openssl
 PERL_CRYPT_OPENSSL_RSA_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_RSA_LICENSE_FILES = LICENSE
 PERL_CRYPT_OPENSSL_RSA_DISTNAME = Crypt-OpenSSL-RSA
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
