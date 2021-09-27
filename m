Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E689C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:32:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8DEB60FED
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8DEB60FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF67E60ABF;
	Mon, 27 Sep 2021 19:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBpDBkxFu5zU; Mon, 27 Sep 2021 19:32:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 017E560A57;
	Mon, 27 Sep 2021 19:32:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 683671BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 582376068C
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khoccAr3xOfU for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:32:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 970B460611
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:32:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D80E78D3A0; Mon, 27 Sep 2021 19:30:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 21:32:02 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3cee0ac57046ddacc59b55bb4323166eb28678b3
X-Git-Newrev: 30c218fec803259669942c0d9259823b6cb9c89b
X-Patchwork-Hint: ignore
Message-Id: <20210927193024.D80E78D3A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libkrb5: fix
 CVE-2021-37750
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

commit: https://git.buildroot.net/buildroot/commit/?id=30c218fec803259669942c0d9259823b6cb9c89b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The Key Distribution Center (KDC) in MIT Kerberos 5 (aka krb5) before
1.18.5 and 1.19.x before 1.19.3 has a NULL pointer dereference in
kdc/do_tgs_req.c via a FAST inner body that lacks a server field.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b9646b18bf46a91b9b3b21b41d8b89fd9f4d5d52)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-null-deref-on-TGS-inner-body-null-server.patch | 47 ++++++++++++++++++++++
 package/libkrb5/libkrb5.mk                         |  3 ++
 2 files changed, 50 insertions(+)

diff --git a/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch b/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
new file mode 100644
index 0000000000..ec6f623380
--- /dev/null
+++ b/package/libkrb5/0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
@@ -0,0 +1,47 @@
+From d775c95af7606a51bf79547a94fa52ddd1cb7f49 Mon Sep 17 00:00:00 2001
+From: Greg Hudson <ghudson@mit.edu>
+Date: Tue, 3 Aug 2021 01:15:27 -0400
+Subject: [PATCH] Fix KDC null deref on TGS inner body null server
+
+After the KDC decodes a FAST inner body, it does not check for a null
+server.  Prior to commit 39548a5b17bbda9eeb63625a201cfd19b9de1c5b this
+would typically result in an error from krb5_unparse_name(), but with
+the addition of get_local_tgt() it results in a null dereference.  Add
+a null check.
+
+Reported by Joseph Sutton of Catalyst.
+
+CVE-2021-37750:
+
+In MIT krb5 releases 1.14 and later, an authenticated attacker can
+cause a null dereference in the KDC by sending a FAST TGS request with
+no server field.
+
+ticket: 9008 (new)
+tags: pullup
+target_version: 1.19-next
+target_version: 1.18-next
+
+[Retrieved from:
+https://github.com/krb5/krb5/commit/d775c95af7606a51bf79547a94fa52ddd1cb7f49]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/kdc/do_tgs_req.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/kdc/do_tgs_req.c b/src/kdc/do_tgs_req.c
+index 582e497cc9..32dc65fa8e 100644
+--- a/src/kdc/do_tgs_req.c
++++ b/src/kdc/do_tgs_req.c
+@@ -204,6 +204,11 @@ process_tgs_req(krb5_kdc_req *request, krb5_data *pkt,
+         status = "FIND_FAST";
+         goto cleanup;
+     }
++    if (sprinc == NULL) {
++        status = "NULL_SERVER";
++        errcode = KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN;
++        goto cleanup;
++    }
+ 
+     errcode = get_local_tgt(kdc_context, &sprinc->realm, header_server,
+                             &local_tgt, &local_tgt_storage, &local_tgt_key);
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 89f219d913..d41e7559a5 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -16,6 +16,9 @@ LIBKRB5_CPE_ID_PRODUCT = kerberos_5
 LIBKRB5_DEPENDENCIES = host-bison $(TARGET_NLS_DEPENDENCIES)
 LIBKRB5_INSTALL_STAGING = YES
 
+# 0001-Fix-KDC-null-deref-on-TGS-inner-body-null-server.patch
+LIBKRB5_IGNORE_CVES += CVE-2021-37750
+
 # The configure script uses AC_TRY_RUN tests to check for those values,
 # which doesn't work in a cross-compilation scenario. Therefore,
 # we feed the configure script with the correct answer for those tests
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
