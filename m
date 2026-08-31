Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A505C624A5
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 16:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B88260669;
	Mon, 31 Aug 2026 16:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AiHMia3ArlX; Mon, 31 Aug 2026 16:10:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788192628;
	bh=PZWzg6khTYdWqXVOEoFUzIKASqdUCWQ+4DBcGszFWbA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kWATuJ/EcDCjMjwwarALPUITQ3Hj2eR/vyUUNNsi5FBvKr4Qw/O+XSeGxdrCPRcAq
	 Yt8qVOrvWNOAZV+twYOXJSHSPuZ+ykmWLRjfE3DJckL2A1VFLDxNqlPoJtFcHox6eY
	 hv+pmaXeRSDQQPhK2qGm3MYl/ZHzh+14e6r1xdPOtJXGAqnKi9cocliSbPhnhn4v/t
	 o4ooNTrPjtSNEyZfWGbYS4RXXBgS06Ui+3qNxAyz6JYAjQ+na/7+WR4LDILihS6r48
	 p73dOfETcvDboG2KqaWZf/NUgsVQqB79QBQrsbYss7APco9T57Z8IGypElbKTy31uD
	 8PxGO7KKQpFQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9997A60658;
	Mon, 31 Aug 2026 16:10:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8D0523E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 16:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 963DC60658
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 16:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czZwA4qqSaEt for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 16:10:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.147;
 helo=esa2.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com
 [23.90.104.147])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 761366064E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 16:10:21 +0000 (UTC)
X-CSE-ConnectionGUID: EpcjP6NbT4O2mSuBSpryTQ==
X-CSE-MsgGUID: IUul/hUdRFuXPjUXRrECJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
 by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 19:10:19 +0300
X-CSE-ConnectionGUID: 2n2tKLq/TqWRwmRey3pLLQ==
X-CSE-MsgGUID: JFAcOUW8QjKksIlVVv5kJQ==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces02_data.me-corp.lan with SMTP; 31 Aug 2026 19:16:53 +0300
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 31 Aug 2026 19:10:17 +0300
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon, 31 Aug 2026 19:09:41 +0300
Message-ID: <20260831160943.3999351-1-jimmy.wesolowski@mobileye.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727100739.1847998-1-jimmy.wesolowski@mobileye.com>
References: <20260727100739.1847998-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] openssh: ensure libxcrypt is enabled to provide
 a crypt() implementation
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When OpenSSL is enabled, if DES support is enabled, OpenSSH uses
DES_crypt. However, without OpenSSL or its DES support, there is no
available crypt() implementation for OpenSSH libopenbsd-compat xcrypt()
function, resulting in the following error:

.../host/bin/i686-buildroot-linux-gnu-gcc -o sshd-auth sshd-auth.o
  auth2-methods.o auth-rhosts.o auth-passwd.o sshpty.o sshlogin.o
  servconf.o serverloop.o auth.o auth2.o auth-options.o session.o
  auth2-chall.o groupaccess.o auth-bsdauth.o auth2-hostbased.o
  auth2-kbdint.o auth2-none.o auth2-passwd.o auth2-pubkey.o
  auth2-pubkeyfile.o auth2-gss.o gss-serv.o gss-serv-krb5.o
  monitor_wrap.o auth-krb5.o audit.o audit-bsm.o audit-linux.o
  platform.o loginrec.o auth-pam.o auth-shadow.o auth-sia.o
  sandbox-null.o sandbox-rlimit.o sandbox-darwin.o
  sandbox-seccomp-filter.o sandbox-capsicum.o sandbox-solaris.o
  sftp-server.o sftp-common.o uidswap.o ssh-pkcs11-client.o
  ssh-sk-client.o -L. -Lopenbsd-compat/ -D_LARGEFILE_SOURCE
  -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0
  -D_FORTIFY_SOURCE=1 -Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack
  -fstack-protector-strong -pie -lssh -lopenbsd-compat
  -L.../host/bin/../i686-buildroot-linux-gnu/sysroot/usr/lib
  -lssl -lcrypto -lcrypto -lz
.../host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../
  i686-buildroot-linux-gnu/bin/ld:
  openbsd-compat//libopenbsd-compat.a(xcrypt.o): in function `xcrypt':
xcrypt.c:(.text+0x51): undefined reference to `crypt'
.../host/lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../
  i686-buildroot-linux-gnu/bin/ld:
openbsd-compat//libopenbsd-compat.a(xcrypt.o): in function `xcrypt':
xcrypt.c:(.text+0x51): undefined reference to `crypt' collect2: error:
ld returned 1 exit status make[2]: *** [Makefile:233: sshd-auth] Error
1 make[2]: *** Waiting for unfinished jobs....  collect2: error: ld
returned 1 exit status make[2]: *** [Makefile:230: sshd-session] Error
1 make[1]: *** [package/pkg-generic.mk:273:
.../build/openssh-10.4p1/.stamp_built]
Error 2 make: *** [Makefile:83: _all] Error 2

This commit enables BR2_PACKAGE_LIBXCRYPT with OpenSSH as long as the
glibc is used. Since "sshd-auth" is compiled regardless of
BR2_PACKAGE_OPENSSH_SERVER, we need to enable it with BR2_PACKAGE_OPENSSH.

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/openssh/Config.in  | 2 +-
 package/openssh/openssh.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 25843447a7..3b0adad63d 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OPENSSH
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  A free version of the SSH protocol suite of network
 	  connectivity tools. The standard 'ssh', 'sshd', 'scp', and
@@ -22,7 +23,6 @@ config BR2_PACKAGE_OPENSSH_CLIENT
 config BR2_PACKAGE_OPENSSH_SERVER
 	bool "server"
 	default y
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Server programs: sshd, sftp-server
 
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index dd0a6e023e..f2e1f235c0 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -51,7 +51,7 @@ endif
 OPENSSH_DEPENDENCIES = host-pkgconf zlib openssl
 
 # crypt() in libcrypt only required for sshd.
-ifeq ($(BR2_PACKAGE_OPENSSH_SERVER)$(BR2_PACKAGE_LIBXCRYPT),yy)
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 OPENSSH_DEPENDENCIES += libxcrypt
 endif
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
