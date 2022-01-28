Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2953DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 18:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E9740457;
	Fri, 28 Jan 2022 18:28:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmx0KyyzMME9; Fri, 28 Jan 2022 18:28:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0805F4088C;
	Fri, 28 Jan 2022 18:28:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B8C931BF2F7
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A548B405A8
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 18:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvJWvEEBM1fo for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 18:28:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E42E340534
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5C3CB822AC; Fri, 28 Jan 2022 18:21:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 19:27:45 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f541ba0cfffd5653adf1b3c36cbd046e7542f6e4
X-Git-Newrev: 1cee7b40cab2fd5cf4c9dbe34b41d71fa75677eb
X-Patchwork-Hint: ignore
Message-Id: <20220128182120.5C3CB822AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/nodejs: security
 bump to version 12.22.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cee7b40cab2fd5cf4c9dbe34b41d71fa75677eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index f31c7d5d69..11d5ec0672 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.22.7/SHASUMS256.txt
-sha256  cc6a23b44870679a94bd8f3c8d4e1f4b77bb2712a36888ab87463459e6785f6b  node-v12.22.7.tar.xz
+# From https://nodejs.org/dist/v12.22.9/SHASUMS256.txt
+sha256  da982c03e584c2b6e50f432cc5e46605d4e3d8451125be25a645fe716873e24a  node-v12.22.9.tar.xz
 
 # Hash for license file
 sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index c8c5223a0b..c6649ce993 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.22.7
+NODEJS_VERSION = 12.22.9
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
