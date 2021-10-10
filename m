Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35F6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 22:49:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09E360EE4
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 22:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D09E360EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B92740227;
	Sun, 10 Oct 2021 22:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_4gFNPImRsi; Sun, 10 Oct 2021 22:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 859C54023C;
	Sun, 10 Oct 2021 22:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC2461BF311
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 22:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D821A40324
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 22:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_sfZ-6Mvy3X for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 22:49:28 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3C004030D
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 22:49:27 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZhWPmiaMKVTMxZhWQmiGo0; Mon, 11 Oct 2021 00:42:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1633905743; bh=sgNXvhYsZK44pq0mYi1hPXLGygkc5VoKZ6su466Wcho=;
 h=From:To:Subject:Date:MIME-Version;
 b=AjvtQLL1p0s1HygjmRL/4B2ZV31tYUBN1eo9N0gT7EHySoUt67OFwD6mODxI7Da29
 GZgDDZNrQrqPdhQic1dRyafm9TXcFhX/aesVIQ/z0t8h+zlE0HJC9EvZQDWOnsvQv3
 6LgLJ6Tk62cqJMRASOXYf6OeQT40f8Yn3yb93UM4kWz2LyF2BJbqo1f5jZPZ/fl4Ud
 KRmH2sAbLviLakFASxYFjMrn1S9emk3H3uKwchtwj67nC4UIihaeEJw5gFTEEUqokA
 CuX/EnBlf+O8frty47GTwPx/DSNWDz1XqdwhjptQcNNGdFx7wO48Izqq1+apZ9ChsW
 nMaLTdTiGv+0g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 00:42:20 +0200
Message-Id: <20211010224220.1111960-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCqgMme6k1lZmJ2CplqXFQeL1Nrbkcm7QZ8Ev0KJ+vHZGfw+ZryK38es5lTnV/sQk+oWfuWiST+s6Wi/052k3rpn9aejZgv54gByqb/TDpYuDpguEzMw
 CzOgQ2JJBg9Ngl5FqyerBqPTeHHeGgYCiGjY1chiT+Wz5T1OG0XiHZk8Pia3vfK39OQH4Njwu7je9dNiEAUVfjygYjCFuWTBo3R42DKwneyrcssjA8YD9N1d
 q/ABb4R1u8p09EUJ3D3pJ9369ieeRW5+qetM7zL5VM5OuwqF86w2x5G/R6cdMHjfnsLc6SI4ipcHNy/E1nBuG6F5YWRBe8A/3P7OJizsS8M=
Subject: [Buildroot] [PATCH] package/gqrx: add missing reverse dependency
 for gnuradio
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gnuradio suffers from gcc bug 43744 but gqrx that depends on it doesn't
take into account the gcc bug. So let's add it as:
'depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio'

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/gqrx/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 60942c36c8..9faa50603e 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -8,7 +8,8 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
 comment "gqrx needs qt5"
 	depends on !BR2_PACKAGE_QT5
 
-comment "gqrx needs a toolchain not affected by GCC bug 64735"
+comment "gqrx needs a toolchain not affected by GCC bug 43744 and 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_GQRX
@@ -21,6 +22,7 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # gnuradio -> boost-atomic
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
