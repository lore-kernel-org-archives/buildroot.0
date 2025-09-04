Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5EBCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63096605F0;
	Thu,  4 Sep 2025 16:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJQeWqSlGXU0; Thu,  4 Sep 2025 16:12:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA1CF605DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA1CF605DD;
	Thu,  4 Sep 2025 16:12:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DAF7AE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B0188074C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNdwOdriPSDn for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DC5380272
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DC5380272
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 799D98624F; Thu,  4 Sep 2025 16:12:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 18:01:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b8a1d1435a8ce38a4fc555589089ca1b306cef5
X-Git-Newrev: 5ce1d6f01736cf8c41b7a191e2e35b7f9efb50b4
X-Patchwork-Hint: ignore
Message-Id: <20250904161210.799D98624F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: fix openssl RMD160
 requirement
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ce1d6f01736cf8c41b7a191e2e35b7f9efb50b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
