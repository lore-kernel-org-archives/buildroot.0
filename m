Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4B3C531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 10:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00A7440625;
	Mon, 27 Jul 2026 10:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hszsb9TbyUMP; Mon, 27 Jul 2026 10:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 263AB406CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785147332;
	bh=yB7dJGm8cw4Uba09Fq7yP/w/bg38wXjbDiE0wYxlI1s=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bFonFU+PecsSaWoAPQBYBGj9mE75r+g0QdLjBcVK1Rfyl/v8K5RRy2sVwsEElOQhV
	 Uw+jvnIBU6pnoYz+qcPCJNY/ljWWJU5wlO3AQBc5IdQeARhnITUboMLn6teh22j+Gx
	 Ok7EMMD5nHXffxxzFHUUpAtvzxi9GaN4oxp5s1u9cNXrSxdRDrfxSmRP5/0+56qijX
	 2eUxfm4DT/tXksT/Pw6ymszh8k/24Kv6I8kjA+DWc8pcFsEEfXJSEkcg2XnhFKmmap
	 gs3/t55r/ShSgSECu5unnZk9Es3w9cRqQ3gwCobM1MlNuyyGwWf/ScqSD0bMetyNai
	 K6zce0+IMbQNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 263AB406CE;
	Mon, 27 Jul 2026 10:15:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C274469
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 10:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A05884010A
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 10:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsweccfsdR26 for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 10:15:28 +0000 (UTC)
X-Greylist: delayed 433 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 Jul 2026 10:15:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B7CE40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B7CE40106
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.144;
 helo=esa1.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com
 [23.90.104.144])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B7CE40106
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 10:15:26 +0000 (UTC)
X-CSE-ConnectionGUID: lsdiNV8DR0iO7bU+vhyXqA==
X-CSE-MsgGUID: oweQg3NCR2GEJJyGw6b4jA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
 by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 13:08:12 +0300
X-CSE-ConnectionGUID: JCc1m/8rTf6L8aH5d9+82g==
X-CSE-MsgGUID: ccDgYPjAQ3yHbsUr3I6XEw==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.2])
 by ces02_data.me-corp.lan with SMTP; 27 Jul 2026 13:14:03 +0300
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 27 Jul 2026 13:08:11 +0300
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon, 27 Jul 2026 13:07:38 +0300
Message-ID: <20260727100739.1847998-1-jimmy.wesolowski@mobileye.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1785147327; x=1816683327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Y2ET1M55aHwIvv7YNlBkDx5N2FN6IbZZcvHaySDYWk=;
 b=LchkMUiuxwIV6/HD7Kcw4Fl/Wb2vij+tij0YaLZ6G4NuDMhosiBtEqma
 G4af9zqRH3JQ5J/8Fj8AlE8u8Z/jZIIKVNxUxUsR9PQ7j+wxNiQIerzfE
 klr//4cDM4ACpcx2S3IT50F6fkVlWhXS66lYKYl/39VIkdUKk5/DWTz1M
 cYHT03N9DDA2fkTIJoR6mcFVV3q2l5CxpNNq7As/4drUpo8099WwUnAPW
 jDRMVbD0vKneAu5+6sPzSBBa58GWnEU2CTYTWFujpObNH0xf+oCzM5WVk
 6am+wfbhOeZtznnmZLUEufDT1aIuJK1AviHR/srdQpeUXMX7s9PcsfYWe
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH] package/openssh: enable DES when using
 libopenssl
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

When the OpenSSL library is selected (instead of LibreSSL), OpenSSH needs
DES to be enabled, even if all the other encryption algorithms are enabled
(except MDC2 that depends on DES).

If disabled, libopenbsd-compat "xcrypt" function will require crypt (in
place of DES_crypt), and any linking against it will fail:

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

Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
 package/openssh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 25843447a7..06aadbbc52 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  A free version of the SSH protocol suite of network
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
