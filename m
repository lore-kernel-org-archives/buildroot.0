Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C20C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 18:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA9E760F22;
	Wed,  7 Feb 2024 18:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9noSo2lNRufx; Wed,  7 Feb 2024 18:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DBA360ABE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DBA360ABE;
	Wed,  7 Feb 2024 18:51:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7946B1BF20D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 647D5403AA
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pl8u1R0OOZM8 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 18:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7CBB40338
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7CBB40338
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 18:51:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB0DC8769C; Wed,  7 Feb 2024 18:51:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 19:51:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5d83b4b649ee1e77811d9bf8ca6398725f6cce1
X-Git-Newrev: 55c6ae5656a0bbd04baf5d6fbbeb060124e71e4a
X-Patchwork-Hint: ignore
Message-Id: <20240207185138.CB0DC8769C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: add patches fixing
 hangs asn1parse
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

commit: https://git.buildroot.net/buildroot/commit/?id=55c6ae5656a0bbd04baf5d6fbbeb060124e71e4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The asn1parse command hangs forever on 3.2.0 when the genstr or genconf
option is passed.

This commit fixes the issue by adding upstream commits [1] [2].

[1] https://github.com/openssl/openssl/commit/a552c23c6502592c1b3c67d93dd7e5ffbe958aa4
[2] https://github.com/openssl/openssl/commit/749fcc0e3ce796474a15d6fac221e57daeacff1e

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...05-Fix-genstr-genconf-option-in-asn1parse.patch |  42 +++++++
 ...-Harden-asn1-oid-loader-to-invalid-inputs.patch | 122 +++++++++++++++++++++
 2 files changed, 164 insertions(+)

diff --git a/package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch b/package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch
new file mode 100644
index 0000000000..9fa36d83be
--- /dev/null
+++ b/package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch
@@ -0,0 +1,42 @@
+From 749fcc0e3ce796474a15d6fac221e57daeacff1e Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@openssl.org>
+Date: Tue, 5 Dec 2023 14:50:01 -0500
+Subject: [PATCH] Fix genstr/genconf option in asn1parse
+
+At some point the asn1parse applet was changed to default the inform to
+PEM, and defalt input file to stdin.  Doing so broke the -genstr|conf options,
+in that, before we attempt to generate an ASN1 block from the provided
+genstr string, we attempt to read a PEM input from stdin.  As a result,
+this command:
+openssl asn1parse -genstr OID:1.2.3.4
+hangs because we are attempting a blocking read on stdin, waiting for
+data that never arrives
+
+Fix it by giving priority to genstr|genconf, such that, if set, will just run
+do_generate on that string and exit
+
+Reviewed-by: Hugo Landau <hlandau@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/22957)
+Upstream: https://github.com/openssl/openssl/commit/749fcc0e3ce796474a15d6fac221e57daeacff1e
+Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
+---
+ apps/asn1parse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/apps/asn1parse.c b/apps/asn1parse.c
+index 097b0cc1ed..6597a6180b 100644
+--- a/apps/asn1parse.c
++++ b/apps/asn1parse.c
+@@ -178,7 +178,7 @@ int asn1parse_main(int argc, char **argv)
+ 
+     if ((buf = BUF_MEM_new()) == NULL)
+         goto end;
+-    if (informat == FORMAT_PEM) {
++    if (genstr == NULL && informat == FORMAT_PEM) {
+         if (PEM_read_bio(in, &name, &header, &str, &num) != 1) {
+             BIO_printf(bio_err, "Error reading PEM file\n");
+             ERR_print_errors(bio_err);
+-- 
+2.40.0
+
diff --git a/package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch b/package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch
new file mode 100644
index 0000000000..299ecbc2ed
--- /dev/null
+++ b/package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch
@@ -0,0 +1,122 @@
+From a552c23c6502592c1b3c67d93dd7e5ffbe958aa4 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@openssl.org>
+Date: Tue, 5 Dec 2023 15:24:20 -0500
+Subject: [PATCH] Harden asn1 oid loader to invalid inputs
+
+In the event that a config file contains this sequence:
+=======
+openssl_conf = openssl_init
+
+config_diagnostics = 1
+
+[openssl_init]
+oid_section = oids
+
+[oids]
+testoid1 = 1.2.3.4.1
+testoid2 = A Very Long OID Name, 1.2.3.4.2
+testoid3 = ,1.2.3.4.3
+======
+
+The leading comma in testoid3 can cause a heap buffer overflow, as the
+parsing code will move the string pointer back 1 character, thereby
+pointing to an invalid memory space
+
+correct the parser to detect this condition and handle it by treating it
+as if the comma doesn't exist (i.e. an empty long oid name)
+
+Reviewed-by: Hugo Landau <hlandau@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/22957)
+Upstream: https://github.com/openssl/openssl/commit/a552c23c6502592c1b3c67d93dd7e5ffbe958aa4
+Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
+---
+ apps/asn1parse.c                  |  2 +-
+ crypto/asn1/asn_moid.c            |  4 ++++
+ test/recipes/04-test_asn1_parse.t | 26 ++++++++++++++++++++++++++
+ test/test_asn1_parse.cnf          | 12 ++++++++++++
+ 4 files changed, 43 insertions(+), 1 deletion(-)
+ create mode 100644 test/recipes/04-test_asn1_parse.t
+ create mode 100644 test/test_asn1_parse.cnf
+
+diff --git a/apps/asn1parse.c b/apps/asn1parse.c
+index 6597a6180b..bf62f85947 100644
+--- a/apps/asn1parse.c
++++ b/apps/asn1parse.c
+@@ -178,7 +178,7 @@ int asn1parse_main(int argc, char **argv)
+ 
+     if ((buf = BUF_MEM_new()) == NULL)
+         goto end;
+-    if (genstr == NULL && informat == FORMAT_PEM) {
++    if (genconf == NULL && genstr == NULL && informat == FORMAT_PEM) {
+         if (PEM_read_bio(in, &name, &header, &str, &num) != 1) {
+             BIO_printf(bio_err, "Error reading PEM file\n");
+             ERR_print_errors(bio_err);
+diff --git a/crypto/asn1/asn_moid.c b/crypto/asn1/asn_moid.c
+index 6f816307af..1e183f4f18 100644
+--- a/crypto/asn1/asn_moid.c
++++ b/crypto/asn1/asn_moid.c
+@@ -67,6 +67,10 @@ static int do_create(const char *value, const char *name)
+     if (p == NULL) {
+         ln = name;
+         ostr = value;
++    } else if (p == value) {
++        /* we started with a leading comma */
++        ln = name;
++        ostr = p + 1;
+     } else {
+         ln = value;
+         ostr = p + 1;
+diff --git a/test/recipes/04-test_asn1_parse.t b/test/recipes/04-test_asn1_parse.t
+new file mode 100644
+index 0000000000..f3af436592
+--- /dev/null
++++ b/test/recipes/04-test_asn1_parse.t
+@@ -0,0 +1,26 @@
++#! /usr/bin/env perl
++# Copyright 2023 The OpenSSL Project Authors. All Rights Reserved.
++#
++# Licensed under the Apache License 2.0 (the "License").  You may not use
++# this file except in compliance with the License.  You can obtain a copy
++# in the file LICENSE in the source distribution or at
++# https://www.openssl.org/source/license.html
++
++use strict;
++use OpenSSL::Test qw(:DEFAULT srctop_file);
++use OpenSSL::Test::Utils;
++
++setup("test_asn1_parse");
++
++plan tests => 3;
++
++$ENV{OPENSSL_CONF} = srctop_file("test", "test_asn1_parse.cnf");
++
++ok(run(app(([ 'openssl', 'asn1parse',
++              '-genstr', 'OID:1.2.3.4.1']))));
++
++ok(run(app(([ 'openssl', 'asn1parse',
++              '-genstr', 'OID:1.2.3.4.2']))));
++
++ok(run(app(([ 'openssl', 'asn1parse',
++              '-genstr', 'OID:1.2.3.4.3']))));
+diff --git a/test/test_asn1_parse.cnf b/test/test_asn1_parse.cnf
+new file mode 100644
+index 0000000000..5f0305657e
+--- /dev/null
++++ b/test/test_asn1_parse.cnf
+@@ -0,0 +1,12 @@
++openssl_conf = openssl_init
++
++# Comment out the next line to ignore configuration errors
++config_diagnostics = 1
++
++[openssl_init]
++oid_section = oids
++
++[oids]
++testoid1 = 1.2.3.4.1
++testoid2 = A Very Long OID Name, 1.2.3.4.2
++testoid3 = ,1.2.3.4.3
+-- 
+2.40.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
