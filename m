Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF50C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 16:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EB8C81ECF;
	Tue, 19 Mar 2024 16:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBf7_cAcEtFF; Tue, 19 Mar 2024 16:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE0181EDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CE0181EDA;
	Tue, 19 Mar 2024 16:36:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBA281BF976
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B80B940730
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDQ9JpRfSWYp for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5D114070D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5D114070D
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BD9F82CE5; Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 16:35:53 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 9e976c46a656b059ebc102fbab03dfd0a46878cc
X-Git-Newrev: 6f11832fb1531084298c19fded17d6436e9931a0
X-Patchwork-Hint: ignore
Message-Id: <20240319163621.7BD9F82CE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/fluent-bit: force
 libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f11832fb1531084298c19fded17d6436e9931a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
(cherry picked from commit f64f82f78ffd9c4b530a7a7f17e1a66feaa23c80)
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
