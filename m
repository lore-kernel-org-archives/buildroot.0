Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07416C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFEDB41561;
	Tue, 30 Apr 2024 21:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dc2Pa5Mea16w; Tue, 30 Apr 2024 21:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0E8241572
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0E8241572;
	Tue, 30 Apr 2024 21:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 947CE1BF3E1
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DB79407A2
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giHqP94nmDi1 for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D458407B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D458407B3
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:01:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDCB286331; Tue, 30 Apr 2024 21:01:08 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 23:00:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8d068929b3b5ef5ae28691a3d0d7e1948435d7b
X-Git-Newrev: dd244feb37fff29620a09ee96b4006cf7d558380
X-Patchwork-Hint: ignore
Message-Id: <20240430210108.EDCB286331@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: add libxcrypt optional
 dependency for sshd
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd244feb37fff29620a09ee96b4006cf7d558380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing sshd's libcrypt dependency this broke
the sshd password authentification at runtime using glibc version 2.39.

  # sshpass -p testpwd ssh -oStrictHostKeyChecking=no localhost /bin/true
  Permission denied, please try again.

Without libcrypt, OpenSSH >= 6.2 fall back to using openssl's DES_crypt
function on platorms that don't have a native crypt() function [1].

Note that DES_crypt is deprecated since openssl 3.0 [2] [3].

"Use of the low level DES functions has been informally discouraged for a
 long time. We now formally deprecate them.

 Applications should instead use the EVP APIs, e.g. EVP_EncryptInit_ex,
 EVP_EncryptUpdate, EVP_EncryptFinal_ex, and the equivalently named decrypt
 functions."

Also DES_crypt is provided by openssl only if
BR2_PACKAGE_LIBOPENSSL_ENABLE_DES is enabled. Otherwise crypt() is
never defined:

  sd-compat.a(xcrypt.o): in function `xcrypt':
  xcrypt.c:(.text+0x48): undefined reference to `crypt'

It's not clear why the password authentification fail with openssl's
DES_crypt but since it's deprecated we use libxcrypt to provide
a working crypt() function for glibc based toolchains.

[1] https://github.com/openssh/openssh-portable/blob/V_9_7/openbsd-compat/xcrypt.c#L57
[2] https://github.com/openssl/openssl/commit/c6fec81b88131d08c1022504ccf6effa95497afb
[3] https://www.openssl.org/docs/man3.2/man3/DES_crypt.html

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6623402147

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/openssh/Config.in  | 1 +
 package/openssh/openssh.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 08d3c7d391..25843447a7 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_OPENSSH_CLIENT
 config BR2_PACKAGE_OPENSSH_SERVER
 	bool "server"
 	default y
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Server programs: sshd, sftp-server
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f0b499590a..d7f4db59ca 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -45,6 +45,11 @@ endif
 
 OPENSSH_DEPENDENCIES = host-pkgconf zlib openssl
 
+# crypt() in libcrypt only required for sshd.
+ifeq ($(BR2_PACKAGE_OPENSSH_SERVER)$(BR2_PACKAGE_LIBXCRYPT),yy)
+OPENSSH_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 OPENSSH_DEPENDENCIES += cryptodev-linux
 OPENSSH_CONF_OPTS += --with-ssl-engine
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
