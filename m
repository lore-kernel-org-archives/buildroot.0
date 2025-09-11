Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C596CAC58F
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19A3584A47;
	Thu, 11 Sep 2025 19:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeWigeNgfBzG; Thu, 11 Sep 2025 19:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3D384950
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3D384950;
	Thu, 11 Sep 2025 19:01:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BBDD443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34AA241E9C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3U0e-2yx1bke for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15CD941EC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15CD941EC3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1301F842A2; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 18:01:03 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: b362148e1472914af6b17798f7600082e101e89b
X-Git-Newrev: c80f90e4d281cb332a888ae74abb399f59c93a1c
X-Patchwork-Hint: ignore
Message-Id: <20250911190109.1301F842A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/mariadb: fix
 openssl RMD160 requirement
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c80f90e4d281cb332a888ae74abb399f59c93a1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

On the autobuilder the mariadb package fails to build when the
BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 variable is not set.

See the following autobuilder error:

```
/workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c: In function 'ma_hash_get_algorithm':
/workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c:40:12: error: implicit declaration of function 'EVP_ripemd160'; did you mean 'LN_ripemd160'? [-Wimplicit-function-declaration]
   40 |     return EVP_ripemd160();
      |            ^~~~~~~~~~~~~
      |            LN_ripemd160
/workdir/instance-0/output-1/build/mariadb-10.11.11/libmariadb/libmariadb/secure/openssl_crypt.c:40:12: error: returning 'int' from a function with return type 'const EVP_MD *' {aka 'const struct evp_md_st *'} makes pointer from integer without a cast [-Wint-conversion]
   40 |     return EVP_ripemd160();
      |            ^~~~~~~~~~~~~~~
```

This error can be reproduced with the following config:

```
cat <<EOF >.config
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_LIBOPENSSL=y
# BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 is not set
BR2_PACKAGE_MARIADB=y
EOF
make olddefconfig
make mariadb
```

This patch adds a requirement to the RMD160 crypto for the MariaDB
package.

Fixes: https://autobuild.buildroot.org/results/f2b/f2b749cb7019856c5434c27987e8bfb2dc179cda
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5ce1d6f01736cf8c41b7a191e2e35b7f9efb50b4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mariadb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
index 693b7ce925..503f884c62 100644
--- a/package/mariadb/Config.in
+++ b/package/mariadb/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PCRE2
 	help
 	  MariaDB is one of the most popular database servers in the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
