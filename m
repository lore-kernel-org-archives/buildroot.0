Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7E2C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF96701D5;
	Tue, 21 Feb 2023 01:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF96701D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f_atSLBTbyvK; Tue, 21 Feb 2023 01:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C5A701E9;
	Tue, 21 Feb 2023 01:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53C5A701E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 979B71BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F169B610E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F169B610E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szIkpud_CME6 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 228DB70024
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 228DB70024
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2115981979; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:37:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: add76a41c3c68e649ecae69aa896d5f8b627d1be
X-Git-Newrev: 895686180fa73a23f2e4e9ee374618fa259a79ce
X-Patchwork-Hint: ignore
Message-Id: <20230220205259.2115981979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zabbix: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=895686180fa73a23f2e4e9ee374618fa259a79ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
