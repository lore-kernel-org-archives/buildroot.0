Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9247C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8864783F48;
	Fri, 11 Jul 2025 10:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moyDQC-00rKh; Fri, 11 Jul 2025 10:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8AB883F27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8AB883F27;
	Fri, 11 Jul 2025 10:21:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B29A1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DF5640DB3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trXnN-hEbWZS for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C49940DAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C49940DAB
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A59986377; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:38:32 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 09ba8925c3d208e2429a3c4fd1d479a1e21e4191
X-Git-Newrev: 78e297a3a85483a1a388455e75e116c809e29915
X-Patchwork-Hint: ignore
Message-Id: <20250711102104.2A59986377@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libp11: fix build
 w/ host-gcc15
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

commit: https://git.buildroot.net/buildroot/commit/?id=78e297a3a85483a1a388455e75e116c809e29915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The following error appeared on the autobuilder for host using
host-gcc15:

```
p11_attr.c: In function 'pkcs11_addattr_bool':
p11_attr.c:126:25: error: expected identifier or '(' before 'true'
  126 |         static CK_BBOOL true = CK_TRUE;
      |                         ^~~~
p11_attr.c:127:25: error: expected identifier or '(' before 'false'
  127 |         static CK_BBOOL false = CK_FALSE;
      |                         ^~~~~
p11_attr.c:128:44: error: lvalue required as unary '&' operand
  128 |         pkcs11_addattr(tmpl, type, value ? &true : &false, sizeof(CK_BBOOL));
      |                                            ^
p11_attr.c:128:52: error: lvalue required as unary '&' operand
  128 |         pkcs11_addattr(tmpl, type, value ? &true : &false, sizeof(CK_BBOOL));
      |                                                    ^
make[3]: *** [Makefile:646: libp11_la-p11_attr.lo] Error 1
```

This is due to the change in the default C language version in GCC15.

This patch backport the upstream patch that fix that issue by not using
the keywords.

Fixes: https://autobuild.buildroot.org/results/da7/da71db9b04f181b9d2e72df73ac8541709f5a1d4

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit df60b105b4383893e541224870315b39226d02cd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...02-change-bool-attribute-true-false-names.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/package/libp11/0002-change-bool-attribute-true-false-names.patch b/package/libp11/0002-change-bool-attribute-true-false-names.patch
new file mode 100644
index 0000000000..d63ec74590
--- /dev/null
+++ b/package/libp11/0002-change-bool-attribute-true-false-names.patch
@@ -0,0 +1,67 @@
+From 89ccb1f097f56a0933f881af051422b8d67e457f Mon Sep 17 00:00:00 2001
+From: dlegault <dlegault@blackberry.com>
+Date: Fri, 2 Sep 2022 12:01:23 -0400
+Subject: [PATCH] Change bool attribute true/false names to _true/_false
+
+This prevents conflicts with true/false defined in stdbool.h
+
+fixes #472
+
+Upstream: https://github.com/OpenSC/libp11/commit/89ccb1f097f56a0933f881af051422b8d67e457f
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/p11_attr.c |  6 +++---
+ src/p11_ec.c   | 14 +++++++-------
+ 2 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/src/p11_attr.c b/src/p11_attr.c
+index d425241a..a420efad 100644
+--- a/src/p11_attr.c
++++ b/src/p11_attr.c
+@@ -123,9 +123,9 @@ unsigned int pkcs11_addattr(PKCS11_TEMPLATE *tmpl, int type, void *data, size_t
+ 
+ void pkcs11_addattr_bool(PKCS11_TEMPLATE *tmpl, int type, int value)
+ {
+-	static CK_BBOOL true = CK_TRUE;
+-	static CK_BBOOL false = CK_FALSE;
+-	pkcs11_addattr(tmpl, type, value ? &true : &false, sizeof(CK_BBOOL));
++	static CK_BBOOL _true = CK_TRUE;
++	static CK_BBOOL _false = CK_FALSE;
++	pkcs11_addattr(tmpl, type, value ? &_true : &_false, sizeof(CK_BBOOL));
+ }
+ 
+ void pkcs11_addattr_s(PKCS11_TEMPLATE *tmpl, int type, const char *s)
+diff --git a/src/p11_ec.c b/src/p11_ec.c
+index 4fb4efc3..16e3b3af 100644
+--- a/src/p11_ec.c
++++ b/src/p11_ec.c
+@@ -590,22 +590,22 @@ static int pkcs11_ecdh_derive(unsigned char **out, size_t *outlen,
+ 	CK_MECHANISM mechanism;
+ 	int rv;
+ 
+-	CK_BBOOL true = TRUE;
+-	CK_BBOOL false = FALSE;
++	CK_BBOOL _true = TRUE;
++	CK_BBOOL _false = FALSE;
+ 	CK_OBJECT_HANDLE newkey = CK_INVALID_HANDLE;
+ 	CK_OBJECT_CLASS newkey_class= CKO_SECRET_KEY;
+ 	CK_KEY_TYPE newkey_type = CKK_GENERIC_SECRET;
+ 	CK_ULONG newkey_len = key_len;
+ 	CK_OBJECT_HANDLE *tmpnewkey = (CK_OBJECT_HANDLE *)outnewkey;
+ 	CK_ATTRIBUTE newkey_template[] = {
+-		{CKA_TOKEN, &false, sizeof(false)}, /* session only object */
++		{CKA_TOKEN, &_false, sizeof(_false)}, /* session only object */
+ 		{CKA_CLASS, &newkey_class, sizeof(newkey_class)},
+ 		{CKA_KEY_TYPE, &newkey_type, sizeof(newkey_type)},
+ 		{CKA_VALUE_LEN, &newkey_len, sizeof(newkey_len)},
+-		{CKA_SENSITIVE, &false, sizeof(false) },
+-		{CKA_EXTRACTABLE, &true, sizeof(true) },
+-		{CKA_ENCRYPT, &true, sizeof(true)},
+-		{CKA_DECRYPT, &true, sizeof(true)}
++		{CKA_SENSITIVE, &_false, sizeof(_false) },
++		{CKA_EXTRACTABLE, &_true, sizeof(_true) },
++		{CKA_ENCRYPT, &_true, sizeof(_true)},
++		{CKA_DECRYPT, &_true, sizeof(_true)}
+ 	};
+ 
+ 	memset(&mechanism, 0, sizeof(mechanism));
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
