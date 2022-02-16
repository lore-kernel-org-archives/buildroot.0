Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2E2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CA904088B;
	Wed, 16 Feb 2022 21:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zMOs1DuIuCqJ; Wed, 16 Feb 2022 21:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8472F404A6;
	Wed, 16 Feb 2022 21:49:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C544F1BF9BA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B41E860BEB
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUZFjb1ygRoF for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0075A60BE5
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2BF0B83776; Wed, 16 Feb 2022 21:41:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:37:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f2020f9040fe2378c2797bfa256f77d118be372
X-Git-Newrev: afe11e84576e4ac15589159d181e1ff5d78942b6
X-Patchwork-Hint: ignore
Message-Id: <20220216214135.2BF0B83776@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sudo: drop openssl workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=afe11e84576e4ac15589159d181e1ff5d78942b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop workaround added by commit bf899e50d89439b1a1bdf22bc933075958ffc108
because sudo natively supports pkg-config for searching openssl (which
is enabled by default) since version 1.9.2 and
https://github.com/sudo-project/sudo/commit/4cadd549513ef35d4d740e941576294f4491d13d

As a side-effect, this will fix the following build failure when openssl
is not installed on host (as LIBS is set before AX_PROG_CC_FOR_BUILD):

configure:8162: checking whether the C compiler works
configure:8184: /usr/bin/gcc -O2 -I/home/buildroot/autobuild/instance-2/output-1/host/include -I/home/buildroot/autobuild/instance-2/output-1/host/include -L/home/buildroot/autobuild/instance-2/output-1/host/lib -Wl,-rpath,/home/buildroot/autobuild/instance-2/output-1/host/lib conftest.c -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lssl -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -pthread -latomic -lcrypto -pthread -latomic  >&5
/usr/bin/ld: skipping incompatible /home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libssl.a when searching for -lssl
/usr/bin/ld: skipping incompatible /home/buildroot/autobuild/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libssl.a when searching for -lssl
/usr/bin/ld: cannot find -lssl

Fixes:
 - http://autobuild.buildroot.org/results/7a5d4dd22343be46a5ddd1c1a1a8e1799517d564

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sudo/sudo.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index f2c074e55f..a752217123 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -45,17 +45,17 @@ endif
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 SUDO_DEPENDENCIES += openldap
 SUDO_CONF_OPTS += --with-ldap
-# If we are building sudo statically and openldap was linked with openssl, then
-# when we link sudo with openldap we need to specify the openssl libs, otherwise
-# it will fail with "undefined reference" errors.
-ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_OPENSSL),yy)
-SUDO_DEPENDENCIES += host-pkgconf
-SUDO_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
-endif
 else
 SUDO_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SUDO_DEPENDENCIES += host-pkgconf openssl
+SUDO_CONF_OPTS += --enable-openssl
+else
+SUDO_CONF_OPTS += --disable-openssl
+endif
+
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
 	$(MAKE) $(HOST_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
