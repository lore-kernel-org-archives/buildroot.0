Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A78EC64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 21:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3256681753;
	Tue, 28 Feb 2023 21:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3256681753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L4OHY_1djea3; Tue, 28 Feb 2023 21:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A9AF8149E;
	Tue, 28 Feb 2023 21:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A9AF8149E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0826A1BF2BF
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E472E40191
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 21:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E472E40191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8ED0bPNfCym for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 21:41:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B16F400C8
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 21:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B16F400C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE0B686DF5; Tue, 28 Feb 2023 21:41:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 22:32:08 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4f9cbe8bc85ac6234c628c1a8ca04bda796fb7d0
X-Git-Newrev: 160d949f05137dcf280c20efeca6d832f034c5bb
X-Patchwork-Hint: ignore
Message-Id: <20230228214133.EE0B686DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zabbix: fix
 BR2_SHARED_STATIC_LIBS
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

commit: https://git.buildroot.net/buildroot/commit/?id=160d949f05137dcf280c20efeca6d832f034c5bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

zabbix uses custom --enable-{static,shared} options, instead of standard
libtool directives resulting in the following build failure with openssl
or libcurl:

configure:13132: /home/autobuild/autobuild/instance-6/output-1/host/bin/or1k-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0  -I/home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -rdynamic  -static -L/home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib conftest.c -lssl -lcrypto -lm   >&5
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(dso_dlfcn.o): in function `dlfcn_globallookup':
dso_dlfcn.c:(.text+0x2c): warning: Using 'dlopen' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(b_addr.o): in function `BIO_lookup_ex':
b_addr.c:(.text+0x1128): warning: Using 'getaddrinfo' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(b_sock.o): in function `BIO_gethostbyname':
b_sock.c:(.text+0x90): warning: Using 'gethostbyname' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /tmp/cceWHjDi.o: in function `main':
conftest.c:(.text.startup+0x8): undefined reference to `SSL_connect'

[...]

configure: error: OpenSSL library libssl or libcrypto not found
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 895686180fa73a23f2e4e9ee374618fa259a79ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zabbix/zabbix.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index adc54028ad..e00d693ba5 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -125,6 +125,13 @@ endif
 
 endif # BR2_PACKAGE_ZABBIX_SERVER
 
+# zabbix uses custom --enable-{static,shared} options, instead of
+# standard libtool directives resulting in a build failure with libcurl
+# or openssl.
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+ZABBIX_CONF_OPTS += --disable-static
+endif
+
 define ZABBIX_INSTALL_INIT_SYSTEMD
 	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
 		$(INSTALL) -D -m 0644 $(ZABBIX_PKGDIR)/$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
