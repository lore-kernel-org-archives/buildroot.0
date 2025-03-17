Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1268EC282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 17:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE32260A61;
	Mon, 17 Mar 2025 17:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnTiuTOcrBRW; Mon, 17 Mar 2025 17:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74E0C60735
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74E0C60735;
	Mon, 17 Mar 2025 17:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EF51216E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDCB94056E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivuTeyC_nMpn for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 17:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5E83400F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5E83400F2
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 17:54:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92639880B1; Mon, 17 Mar 2025 17:54:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 18:32:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dcd6bea6aeee09a533974d30c578b990c2ecdede
X-Git-Newrev: 27ab880ebb9a3efdec15733841f7b88063604247
X-Patchwork-Hint: ignore
Message-Id: <20250317175458.92639880B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl do not build in parallel
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=27ab880ebb9a3efdec15733841f7b88063604247
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With highly parallel builds on a heavily loaded machine, the libopenssl
build often (about half of the time) fails with spurious missing rules
in its Makefile:

    >>> host-libopenssl 3.4.1 Installing to host directory
    [...] /usr/bin/make  -C [...]/build/host-libopenssl-3.4.1 install
    "/usr/bin/make" depend && "/usr/bin/make" _build_libs
    "/usr/bin/make" depend && "/usr/bin/make" _build_modules
    "/usr/bin/make" depend && "/usr/bin/make" _build_programs
    [...]
    make[3]: *** No rule to make target '_build_modules'.  Stop.
    make[2]: *** [Makefile:3159: build_modules] Error 2
    make[2]: *** Waiting for unfinished jobs....
    make[3]: Nothing to be done for '_build_programs'.
    make[3]: Nothing to be done for '_build_libs'.
    make[1]: *** [package/pkg-generic.mk:283: [...]/build/host-libopenssl-3.4.1/.stamp_host_installed] Error 2
    make[1]: *** Waiting for unfinished jobs....
    [...]
    make: *** [Makefile:23: _all] Error 2

Ideally, we'd like to fix the issue. However, the Nakefile is generated
by the Configure script, written in perl, from the template in
Configurations/unix-Makefile.tmpl, which also uses some kind of special
(perl-related, probably) templating language. That makes it pretty
difficult to see what is going on, though, and nigh impossible to fix
without a deep understanding of the openssl buildsystem.

So, we can only disable parallel builds until the issue is fixed
upstream [0]. Add a comment to both build commands (host and target) to
reference the upstream issue report.

Note that the issue has mostly been observed in the build of the host
variant so far, but there is no reason why it can't happen in the build
of the target variant.

[0] https://github.com/openssl/openssl/issues/27074

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index c1c5b818d7..663e8d9b9f 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -132,24 +132,26 @@ endef
 LIBOPENSSL_POST_CONFIGURE_HOOKS += LIBOPENSSL_FIXUP_STATIC_MAKEFILE
 endif
 
+# Parallel build broken: https://github.com/openssl/openssl/issues/27074
 define HOST_LIBOPENSSL_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
 
+# Parallel build broken: https://github.com/openssl/openssl/issues/27074
 define LIBOPENSSL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
 
 define LIBOPENSSL_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define HOST_LIBOPENSSL_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install
 endef
 
 define LIBOPENSSL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
 	$(RM) -rf $(TARGET_DIR)/usr/lib/ssl
 	$(RM) -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
