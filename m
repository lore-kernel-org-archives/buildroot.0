Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3171C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 17:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F6ED8293D;
	Wed,  3 Aug 2022 17:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F6ED8293D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCIu5CviPmYn; Wed,  3 Aug 2022 17:17:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8C982640;
	Wed,  3 Aug 2022 17:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B8C982640
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 675DB1BF281
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 17:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42F1560DFF
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 17:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42F1560DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kYTqNXjlbyMz for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 17:17:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E84860B4A
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 17:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E84860B4A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DB04A86D8D; Wed,  3 Aug 2022 17:03:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 19:17:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec82347cdee190a5fa451b83cdb3727c78cda315
X-Git-Newrev: fa4dba4aa202de20e3821eace5513aad81c23275
X-Patchwork-Hint: ignore
Message-Id: <20220803170331.DB04A86D8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openswan: allow uClibc build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa4dba4aa202de20e3821eace5513aad81c23275
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc-ng 1.0.41 added ns_t_tkey, but since external toolchains may
have a version older than 1.0.41, we introduce a compatibility patch
that avoids the use of ns_t_tkey. This compatibility patch can be
dropped in the future when uClibc-ng 1.0.41 is sufficiently deployed.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...swan-constants.c-workaround-missing-ns_t_.patch | 29 ++++++++++++++++++++++
 package/openswan/Config.in                         |  6 ++---
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch b/package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch
new file mode 100644
index 0000000000..ea50dd11ad
--- /dev/null
+++ b/package/openswan/0001-lib-libopenswan-constants.c-workaround-missing-ns_t_.patch
@@ -0,0 +1,29 @@
+From 66f8abe037970dda50fbc460edb2a2fa9f391d8a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 3 Aug 2022 19:14:25 +0200
+Subject: [PATCH] lib/libopenswan/constants.c: workaround missing ns_t_tkey
+ definition in uClibc < 1.0.41
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ lib/libopenswan/constants.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/libopenswan/constants.c b/lib/libopenswan/constants.c
+index 90c973b5f..04e68da42 100644
+--- a/lib/libopenswan/constants.c
++++ b/lib/libopenswan/constants.c
+@@ -1411,7 +1411,9 @@ static const char *const rr_qtype_name[] = {
+ 	NULL
+     };
+ 
+-enum_names rr_qtype_names = { ns_t_tkey, ns_t_any
++/* ns_t_tkey is 249, but its definition is missing from uClibc <
++ * 1.0.41, so let's hardcode it */
++enum_names rr_qtype_names = { 249 /* ns_t_tkey */, ns_t_any
+ 			      , rr_qtype_name, &rr_type_names };
+ 
+ static const char *const rr_class_name[] = {
+-- 
+2.37.1
+
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index c71d064daf..724654e984 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
 	depends on BR2_USE_MMU # iproute2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # ns_t_tkey
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
 	help
@@ -10,7 +9,6 @@ config BR2_PACKAGE_OPENSWAN
 
 	  http://www.openswan.org
 
-comment "openswan needs a glibc or musl toolchain w/ headers >= 3.4"
+comment "openswan needs a toolchain w/ headers >= 3.4"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || \
-		BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
