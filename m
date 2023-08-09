Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2539CC0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 12:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8CC540BBC;
	Wed,  9 Aug 2023 12:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8CC540BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNz-gW0JA8yl; Wed,  9 Aug 2023 12:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0040A40C11;
	Wed,  9 Aug 2023 12:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0040A40C11
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98E871BF37C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 12:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D21F4179D
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 12:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D21F4179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Opma66lEzWe for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 12:55:22 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C08B941777
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 12:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C08B941777
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 81C5D352BD75; Wed,  9 Aug 2023 14:55:18 +0200 (CEST)
Date: Wed, 9 Aug 2023 14:55:18 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNOMtm7TTVd12BQ3@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691585718; bh=ZUeixe0hyIBDcVHgz100wYc5H3UohWmduWXlAb0DVVE=;
 h=Date:From:To:Subject:From;
 b=GZrNakT76jQ7ywbMXzp/OzFnh+Na35urFrGH08SMseLgQDGeAkv+j9PPOPXLkFSWx
 cTQZp53hFiQOY+tiMJ0lWEzFZ/bw86sXic8ky1hsUtPS7W1XMAblpPnIXF2GAwEYaK
 bTLdE/1yOaiYKwfZVj21kVqE0O43v6uc3pqX/s97GLovkUPZPi70zrfOlwQVGZTrI0
 d6sNJq5N8ffTizW7bZdLNQNUh/HNb58TZ2nBruJPi7X8NXoTjvF1wyW0IbjvKmvFDu
 kJrkkXaWbSKNUUJ1vDA7CdAJmzJkcQZN8EzoNIY5fqGjRY8ro2s6DhNFKOm3A+kMHO
 UvuH+7Ojdq9eA==
Subject: [Buildroot] [PATCH] package/perl: threads support needs locales
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

The thread support in perl needs locales enabled in the C library.
Otherwise it fails with:
POSIX.xs:3386:13: error: 'MBLEN_LOCK' undeclared (first use in this function); did you mean 'MUTEX_LOCK'?

This failure was introduced in commit 7c1ef8129f37200b046750c6405ecd304fd4f1bf which upgraded
perl to 5.34.0.

Fixes:
 - http://autobuild.buildroot.net/results/13d/13d66e281cb4778f7498f909f5f7c65d4b28bcbb/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/perl/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 0ead1c4a46..9eb6334b9e 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_PERL_MODULES
 config BR2_PACKAGE_PERL_THREADS
 	bool "thread support"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_ENABLE_LOCALE
 	help
 	  Enable use of threads in Perl scripts
 
@@ -34,4 +35,7 @@ config BR2_PACKAGE_PERL_THREADS
 	  is officially discouraged.
 	  See https://perldoc.perl.org/threads.html#WARNING
 
+comment "Threads support needs locales"
+	depends on !BR2_ENABLE_LOCALE
+
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
