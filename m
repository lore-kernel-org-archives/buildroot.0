Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9121BC0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 05:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E120B41DF7;
	Fri, 11 Aug 2023 05:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E120B41DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3ab45XCdaBi; Fri, 11 Aug 2023 05:30:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1430D40876;
	Fri, 11 Aug 2023 05:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1430D40876
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 242BA1BF410
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 05:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1D0A4010D
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 05:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1D0A4010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lq0-mC5O7E6H for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 05:30:28 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF6BC400D1
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 05:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF6BC400D1
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2DB8B3528DC4; Fri, 11 Aug 2023 07:30:24 +0200 (CEST)
Date: Fri, 11 Aug 2023 07:30:24 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNXHcDjCcjLhkR7Z@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691731825; bh=jeP/jKzDZTXkD5W2S/JSJeljXDT043l5up2XhnDN8Rw=;
 h=Date:From:To:Subject:From;
 b=gcCptCaUBu+EHV0Epr6TfVWoImyvP6axYSgPasoM5Jqynxl1LVyG0efc3XLKWQ5g7
 +Qme1EUYuI6gglB/Ppeboo380lmcLhjUcQzolZy/KLywNytYp1N1BfNYy4XR/DfYGe
 JoDjIlz/ad0YMkGoWWUq3jrY4VIsaCMTJGvxf3NUZwiN5+dZYSVG7Wlkw8ak5lBvsH
 Ue1yIw9kEBRBnUnfcwHO3so/QScIiESSixHzNmmy6rBteuVy8zH9EIxQIT67YWrSvB
 KV/Tj5BUB/6u6tyQHWmc1kVKGofaDngpCWJ2NgrkFp/j5bUR6Ij1OL3hInE45HPBFu
 xNR6Ntpz/KeGg==
Subject: [Buildroot] [PATCH] package/cairo: fix pthread detection
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

Cairo configure fails to detect pthreads, because of the following warning
binutils 2.39+ emits:
ld: warning: some.o: missing .note.GNU-stack section implies executable stack
ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker

Then the build errors out with:
error: #error "XXX: No mutex implementation found.  Cairo will not work with multiple threads.

Fixes:
 - http://autobuild.buildroot.net/results/2c4/2c4b983248b25ed6769c91d8b687c54434068eb7

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/cairo/cairo.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 7bc8f92deb..3373aa4f73 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -26,8 +26,12 @@ ifeq ($(BR2_m68k_cf),y)
 CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
 endif
 
+# cairo configure check for pthreads is failing when
+# binutils is warning about executable stack
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
 CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
+else
+CAIRO_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -z noexecstack"
 endif
 
 # cairo can use C++11 atomics when available, so we need to link with
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
