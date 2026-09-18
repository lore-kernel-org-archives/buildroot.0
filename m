Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD18C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 436DE60E83;
	Fri, 18 Sep 2026 19:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvAH3Ec-FZgz; Fri, 18 Sep 2026 19:35:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E25C460E30
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760137;
	b=XhvatqvQJ7LFIP+Vqms7Y1vf0D2Jm6QoliP4qVv6J3moLnS3tjbCB86ukvPZ4DOibNPx
	 zc3luZ86JS7cbD+q98dnxZyRviHehX5plZqHa2MHedD5nTAEBLzdpj5cv3c9kmSVAX/Et
	 KO2UFuI0KJfeLldz7IU6iYzNLSJkIPLn2BGyrfshKnQhF3+Di84SmlzmVz3WyIdp6lIfg
	 Vn2pCpucTNQvrWs6DnliRH7gDmJvk0ntWKoC+vZKovNdGG5FXKKdeMP0xzUjqbn8KSn6B
	 ZUWCMZ+4zXokWIEU8wApA7kAgs9Lsxdbiph2PzZYviU7iqTr9/vdIKT4pPRdG5YmOrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y/a9J75Iny8v4ZNGkg8QK3YK1ZJy/SC8Sv/0nKwFwhM=;
	b=hWrYb1yAzMSfLGUcwvldkBpHcEhJiRRp+hfvtrUWHzkYt5gQKQLSZQfnF/HwZR+14aMi
	 v9LmSn6OqIB89SNezxTDDBKphHws3MWJZXDArq7wkW6ld0XND6TTLC2iUsyuAjXkqdjKG
	 EeueoI4MC9GM3XVufVK+nBZmLY3j8VidAWkFOvDkurBKf4hrJ/NO+Vc6mPpY68LDI4o8w
	 Hh30KA8bG9OhguJna66dLC8CS0k7IZcrVeOIK+b1r8iCoF5aZt+dP3eM5i2NHuhy/Mys2
	 HAu34UrDDowXvfFdyLu5ylTAFWz3lP9v8gspKNVW601cFqRJNHEnRN3PyqhsCOVnXLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760137;
	bh=Y/a9J75Iny8v4ZNGkg8QK3YK1ZJy/SC8Sv/0nKwFwhM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bNz4XfwbKa6Jv7ZSsB5pe5XKBDMnpY3bEvftAzFE3rG30pwVlUc8LlVhlgUS8qbvs
	 BfSsS5E+alO1yzyASs+csHuOuvKW0GOzmg6ML711ZQ1/txv4JBKZoks618rL7Asl5s
	 OMhJdJk078MN+jSrEe8npnuJHQmHw1Z/sGHUxqT4xmDp/TSp7ihmdvZmSvqSlM8Sox
	 09XxK8as/pzTbwoi2JmXPWAkUJQVmX5TW6j072bm9wXvd75A+WUP4Y7QBjJB5+iQ6o
	 iTzBN+eVAH+hI6AxOv+iIOCnVCTaYLrnmpbHtg9ZkEK7CTplgrz9BqKoe8el4+a+V9
	 4fM76HaNQxDnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25C460E30;
	Fri, 18 Sep 2026 19:35:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F3F025B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6137F81324
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xG3GocxL0f_v for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8B66181322
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760132;
 b=jYgGNZoniA1x/OINwy6H/atesEqyneF69RKBM8jSa+uGev0/czJt7nK5K0veSqTkqGU2
 jNloY3TdUnF5UPJkhNVy5POsSPt+360NVAJzlhf6atuAKk89qHlpfgBj2jNYCtbWtVDSG
 vWqKB1QW3RMpsv5tm8Zwqp1Rk4Abj259bRB9plYSMzJzjCj3Po9kN+5YJYVhILainhI+q
 Hhrt08Vw+VyLHskufwmo1cBkurOBbnRtJoEUWNTRld7OULTPLAR6SGP7VZ7OJL/+GBE1K
 rFVgDXORCjvjPhRuUATLiBVBc9SB+UTb1Csh5cQnd/Pm+pWxZ5eIXD4askESDQ8GPUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zI3NmuPmPE8KgRXlxUJTN2K9SeXZVisGJuztsGl1Tlc=;
 b=eJ0ddeDqHvLO4QWG4E3xxGL0usW7dGzwA4Fx1e78l2x2h1v40pfj+jb5wPbyJGi2e5v2
 uziSapaT8P+0l1JvvFlDa9TebLl78PGhWDrjS4blc+M+0QyamJXvNdDjIDt74MvQxBW4Y
 dPNA1ie/Bme3QtMLv2FMBZFOZtoDgIrRhZW6k1MEvJHK5109u1I11M/3kw4t60rBelq15
 hevp+ARXm7+3FAhV7nyNRlj8L5YKp7Edr/wxei7YEbbJn7O99eYbc1E4QVXS0dTI2scbA
 LpCCS04fle+rr8t31FJtgZd9Gi5r1MTcGZg3SmDVgVBf7TEggYVFlZrAoWlIwOLqdXA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B66181322
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11B2E976A4; Fri, 18 Sep 2026 19:34:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 21:24:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3164c837e1c9a9c56777138d161036ad403d452
X-Git-Newrev: 93282f76a535ce54e9a853c72c01152a2c3a6805
X-Patchwork-Hint: ignore
Message-Id: <20260918193425.11B2E976A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk3: add missing
 !BR2_STATIC_LIBS dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/93282f76a535ce54e9a853c72c01152a2c3a6805
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libgtk3 selects at-spi2-core, so it should inherit its
!BR2_STATIC_LIBS, which this commit does.

This has been an issue since libgtk3 started using at-spi2-core
instead of atk in commit 2c3ca7bea1de76163aeef432412eb14551ed0581.

Fixes: 2c3ca7bea1de76163aeef432412eb14551ed0581 ("package/atk: remove package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgtk3/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 52ee50db49..f7618832f1 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,10 +1,11 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, dynamic library"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 comment "libgtk3 needs an OpenGL or an OpenGL-EGL backend"
 	depends on BR2_USE_MMU
@@ -23,6 +24,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL || \
 		BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
