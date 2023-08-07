Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CF0C001DB
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 13:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E6581DF4;
	Mon,  7 Aug 2023 13:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E6581DF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kFgd_9j2jryl; Mon,  7 Aug 2023 13:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5655081D67;
	Mon,  7 Aug 2023 13:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5655081D67
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29CE01BF2F6
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 13:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BC9D40913
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 13:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BC9D40913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vb6fQMl-PpBQ for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 13:50:10 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 753AC40B60
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 13:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 753AC40B60
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6124D3520C58; Mon,  7 Aug 2023 15:50:08 +0200 (CEST)
Date: Mon, 7 Aug 2023 15:50:08 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZND2kP8kQgFsEzMZ@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691416208; bh=WRsSzGK5sv1L/LTCjjntXcmcWSkBVkNeczN1dqviKQM=;
 h=Date:From:To:Cc:Subject:From;
 b=sJrIkR8ritv1oF8MkUcKNIdS6frZaLNTE0wOHqaMEIsHBjxjK+ijsGTRtByvGggYb
 Xoa0QbInFO6KPPwsMAkU9Af6J1yN9sC7rZnPI6E2c9vIcmY80K5Pfl/mnIto8ARd0q
 oRkPoAnwkNgkHIKVRvWdSTa6yssgJPAQXo78SiwoAfceWeEl9iw1y03fHcxj+/Noox
 Zq5TlSF0POP/TTLvWDGwbYR1REv3sCJZTkC27PzTiwfsBFw9UMfI87ffjAXjCZ3rlS
 nOTh7pJViTp3/trre7FAEmgog6CefHPDFgL/aYR8jwLnA1DZHwvBOX+CEiIuR1qRKF
 8RhbLseoCpn3Q==
Subject: [Buildroot] [PATCH 2/2] package/openssh: fix build failure due to
 gcc bug 110934
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following ICE occurs for m68k builds:
(cd openbsd-compat && /home/autobuild/make/make)
/home/autobuild/autobuild/instance-10/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -pipe -Wno-error=format-truncation -Wall
+-Wpointer-arith -Wuninitialized -Wsign-compare -Wformat-security -Wsizeof-pointer-memaccess -Wno-pointer-sign -Wno-unused-result -Wimplicit-fallthrough -Wmisleading-indentation -fno-strict-aliasing
+-D_FORTIFY_SOURCE=2 -ftrapv -fzero-call-used-regs=all -fno-builtin-memset   -fPIC -I. -I.. -I. -I./.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
+-D_DEFAULT_SOURCE -D_GNU_SOURCE -DHAVE_CONFIG_H -c bsd-closefrom.c
during RTL pass: zero_call_used_regs
bsd-closefrom.c: In function 'closefrom':
bsd-closefrom.c:151:1: internal compiler error: in change_address_1, at emit-rtl.c:2275
  151 | }
      | ^
0x7fa76f4bad09 __libc_start_main
        ../csu/libc-start.c:308
Please submit a full bug report,
with preprocessed source if appropriate.
Please include the complete backtrace with any bug report.
See <http://bugs.buildroot.net/> for instructions.
make[2]: *** [Makefile:106: bsd-closefrom.o] Error 1

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/openssh/openssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index e14d752290..a2c3f16129 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -35,6 +35,10 @@ define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_110934),y)
+OPENSSH_CONF_OPTS += --without-hardening
+endif
+
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 OPENSSH_CONF_OPTS += --without-pie
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
