Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A2BC48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 11:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4597820BC;
	Mon,  4 Mar 2024 11:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQr99DwGptAi; Mon,  4 Mar 2024 11:49:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB671820EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB671820EF;
	Mon,  4 Mar 2024 11:49:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F13C21BF2F3
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEB55820EF
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 11:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWagLnmDHtG6 for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 11:49:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30D60820BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30D60820BC
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 11:49:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1659D88047; Mon,  4 Mar 2024 11:49:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 12:47:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8035ea0a712eaa16d2ac96cd29db0e8726b0f685
X-Git-Newrev: f64f82f78ffd9c4b530a7a7f17e1a66feaa23c80
X-Patchwork-Hint: ignore
Message-Id: <20240304114923.1659D88047@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: force libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=f64f82f78ffd9c4b530a7a7f17e1a66feaa23c80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libressl dropped engine support since version 3.8.1 resulting in the
following build failure since bump of libressl to version 3.8.2 in
commit 21eca49ed5110872407b76ab9337d2877c4cda24:

/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/12.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: ../library/librdkafka.a(rdkafka_admin.c.o): in function `rd_kafka_UserScramCredentialUpsertion_new':
/home/autobuild/autobuild/instance-0/output-1/build/fluent-bit-2.2.2/lib/librdkafka-2.3.0/src/rdkafka_admin.c:5909: undefined reference to `RAND_priv_bytes'
/home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/armeb-buildroot-linux-gnueabi/12.3.0/../../../../armeb-buildroot-linux-gnueabi/bin/ld: ../library/librdkafka.a(rdkafka_ssl.c.o): in function `rd_kafka_ssl_set_certs':
/home/autobuild/autobuild/instance-0/output-1/build/fluent-bit-2.2.2/lib/librdkafka-2.3.0/src/rdkafka_ssl.c:1384: undefined reference to `ENGINE_load_ssl_client_cert'

Fixes:
 - http://autobuild.buildroot.org/results/dd74eb4e31e0e4d23e7638cff47c6876fda59952

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluent-bit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index dec40c4371..53284ee17d 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_FLUENT_BIT
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_LIBYAML
 	help
 	  Fast and Lightweight Logs and Metrics processor.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
