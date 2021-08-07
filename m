Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCCDC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:03:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39D3860FD8
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39D3860FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F18AD82ACD;
	Thu, 26 Aug 2021 22:03:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1c-4S_sLmZa4; Thu, 26 Aug 2021 22:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E9DE82BA7;
	Thu, 26 Aug 2021 22:03:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31A191C1135
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 222DA614B0
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8I_uaq9VacO for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DB9A61487
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E2A6C8DC50; Thu, 26 Aug 2021 22:01:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 10:55:22 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b53cbf680c1ba6821722145752f239bf798cbbea
X-Git-Newrev: 80f5a6ca924740b8daca86f9a48c4e41b6295826
X-Patchwork-Hint: ignore
Message-Id: <20210826220126.E2A6C8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mutt: link with
 -latomic if needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=80f5a6ca924740b8daca86f9a48c4e41b6295826
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Link with -latomic if needed to avoid the following build failure with
openssl:

configure:10549: checking for X509_STORE_CTX_new in -lcrypto
configure:10574: /tmp/instance-0/output-1/host/bin/sparc-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/tmp/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/include  -static -L/tmp/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib conftest.c -lcrypto -lz  >&5
/tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /tmp/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(x509cset.o): in function `X509_CRL_up_ref':
x509cset.c:(.text+0xfc): undefined reference to `__atomic_fetch_add_4'

Ideally, mutt should use pkg-config but upstream don't want to use it:
https://gitlab.com/muttmua/mutt/-/merge_requests/25

Fixes:
 - http://autobuild.buildroot.org/results/e357984853f8ca879156245717fadbeaa9b0dbae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mutt/mutt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index a8734855f8..66616f032c 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -12,6 +12,10 @@ MUTT_CPE_ID_VENDOR = mutt
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPTS = --disable-doc --disable-smtp
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+MUTT_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
 MUTT_CONF_OPTS += --enable-iconv
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
