Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF314C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 18:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B82B84E1A;
	Fri, 28 Jan 2022 18:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aztuEXnkvPzs; Fri, 28 Jan 2022 18:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B379F84E13;
	Fri, 28 Jan 2022 18:38:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A61011BF2F7
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9481841D0C
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:37:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpBEaLuEUqx1 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 18:37:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5F8741D0A
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 18:37:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4EB0F82B2A; Fri, 28 Jan 2022 18:30:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 18:01:20 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: a07dc684c304eade263e83f863abee3ed587a986
X-Git-Newrev: d8d740b04a58ffd8d8347d9ce2e33f6298e1bea2
X-Patchwork-Hint: ignore
Message-Id: <20220128183025.4EB0F82B2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/nodejs: security
 bump to version 14.18.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8d740b04a58ffd8d8347d9ce2e33f6298e1bea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fixes the following security issues:

Improper handling of URI Subject Alternative Names (Medium)(CVE-2021-44531)

Accepting arbitrary Subject Alternative Name (SAN) types, unless a PKI is
specifically defined to use a particular SAN type, can result in bypassing
name-constrained intermediates.  Node.js was accepting URI SAN types, which
PKIs are often not defined to use.  Additionally, when a protocol allows URI
SANs, Node.js did not match the URI correctly.

Certificate Verification Bypass via String Injection (Medium)(CVE-2021-44532)

Node.js converts SANs (Subject Alternative Names) to a string format.  It
uses this string to check peer certificates against hostnames when
validating connections.  The string format was subject to an injection
vulnerability when name constraints were used within a certificate chain,
allowing the bypass of these name constraints.

Incorrect handling of certificate subject and issuer fields (Medium)(CVE-2021-44533)

Node.js did not handle multi-value Relative Distinguished Names correctly.
Attackers could craft certificate subjects containing a single-value
Relative Distinguished Name that would be interpreted as a multi-value
Relative Distinguished Name, for example, in order to inject a Common Name
that would allow bypassing the certificate subject verification.

Prototype pollution via console.table properties (Low)(CVE-2022-21824)

Due to the formatting logic of the console.table() function it was not safe
to allow user controlled input to be passed to the properties parameter
while simultaneously passing a plain object with at least one property as
the first parameter, which could be __proto__.  The prototype pollution has
very limited control, in that it only allows an empty string to be assigned
numerical keys of the object prototype.

For details, see the advisory:
https://nodejs.org/en/blog/vulnerability/jan-2022-security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9096036f00c5a0f37e3b3916417f0d0b166b73e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index f330757341..6365ef852b 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v14.18.2/SHASUMS256.txt
-sha256  3e8a9ce10f8bcd3628eb6dd049f7f03c84ba9219be6f9743e2221154b9cc680b  node-v14.18.2.tar.xz
+# From https://nodejs.org/dist/v14.18.3/SHASUMS256.txt
+sha256  783ac443cd343dd6c68d2abcf7e59e7b978a6a428f6a6025f9b84918b769d608  node-v14.18.3.tar.xz
 
 # Hash for license file
 sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 44bf786dfd..bd34860ef7 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 14.18.2
+NODEJS_VERSION = 14.18.3
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
