Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126CFC61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 20:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCE080B59;
	Tue, 25 Aug 2026 20:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAwi2AH98Inc; Tue, 25 Aug 2026 20:09:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787688565;
	bh=b9f7jKi5ud1E8BVaxLRTM7I87tDuuOjUvxHUNLZzVQU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=goli+a0HszWRDMsSWu9vADbp7e1ckd7DB8uGJFtKMruW88esDjlYflXxShSA96ucL
	 MOIhzLVTEnTPaGkPh/CJzSpVtGfqydzCAebDsd3gZmJqhKDJl/cMGE6GCbYTZlqmEu
	 OscAQArytjZ7ObfPWxVRoWAYUuArZHKq8v3ykPpZ3sFwXVGfsUmz0JwkqgkYhG0CAu
	 G7l//Fdqtf6Xt+znduN7JJgVFb8HUbJdyyxZPsCZqrsghse8xvrh3x0RlT2cYBn5tr
	 Lt0rsaKudetqgJIk/BaUkHaTjNOBFYCsmxcXBfN6lWqWcpyC/bssQBibezSNFHnHZG
	 Fd5ArxFg80Whg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D171D80B63;
	Tue, 25 Aug 2026 20:09:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57D6B39E
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A2E840055
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXdBApPt4yZU for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 20:09:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3502440199
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:09:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 805CF91AAC; Tue, 25 Aug 2026 20:08:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 21:57:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9dc567aa78e6381ff7100b696535f1ffdd8447f7
X-Git-Newrev: c22fc74f2b4e5b6082203ecd839d530058e0106d
X-Patchwork-Hint: ignore
Message-Id: <20260825200827.805CF91AAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: fix no high quality entropy
 warning on Linux <3.17 or glibc <2.25
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c22fc74f2b4e5b6082203ecd839d530058e0106d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

In some situations (old Linux <3.17 or glibc <2.25), expat fail at
compilation time with the error:

xmlparse.c:150:4: error: #error You do not have support for any sources of high quality entropy enabled.
For end user security, that is probably not what you want. Your options include:
  * Linux >=3.17 + glibc >=2.25 (getrandom): HAVE_GETRANDOM,
  * Linux >=3.17 + glibc (including <2.25) (syscall SYS_getrandom): HAVE_SYSCALL_GETRANDOM,
  * BSD / macOS >=10.7 / glibc >=2.36 (arc4random_buf): HAVE_ARC4RANDOM_BUF,
  * BSD / macOS (including <10.7) / glibc >=2.36 (arc4random): HAVE_ARC4RANDOM,
  * BSD / macOS >=10.12 / glibc >=2.25 (getentropy): HAVE_GETENTROPY,
  * Linux (including <3.17) / BSD / macOS (including <10.7) / Solaris >=8 (/dev/urandom): XML_DEV_URANDOM,
  * Windows >=Vista (rand_s): _WIN32.
If you insist on not using any of these, bypass this error by defining XML_POOR_ENTROPY and be vulnerable to hash flooding;
you have been warned. If you have reasons to patch this detection code away or need changes to the build system, please open a bug. Thank you!

This is caused by the upstream commit [1] "Autotools: Stop using
/dev/urandom by default", first included in expat 2.8.2. The
Buildroot expat package was bumped to that version in commit [2].

But since all Linux systems have /dev/urandom, we can just enable
it by default.

Note: this commit does not globally switch the entropy source to
/dev/urandom. It is rather enabling it in the list of available
sources. On more recent Linux systems (linux >= 3.17, glibc >= 2.25),
other sources will be chosen. The entropy source preference order
amongst the enabled sources is defined in [3].

This commit also changes the _CONF_OPTS to multiline layout to fit
within the 80 characters.

[1] https://github.com/libexpat/libexpat/commit/d30eca113a44562137d59835cf2255ea32d11ba6
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/6b1f6f7a480765b3d6ca07691095035a8b899eaf
[3] https://github.com/libexpat/libexpat/blob/R_2_8_3/expat/lib/xmlparse.c#L1115-L1142

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Julien: add extra info in the commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/expat/expat.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 7645edfd52..a82be75a4d 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -14,8 +14,16 @@ EXPAT_CPE_ID_VENDOR = libexpat_project
 EXPAT_CPE_ID_PRODUCT = libexpat
 
 EXPAT_CONF_OPTS = \
-	--without-docbook --without-examples --without-tests --without-xmlwf
-HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests
+	--with-dev-urandom \
+	--without-docbook \
+	--without-examples \
+	--without-tests \
+	--without-xmlwf
+
+HOST_EXPAT_CONF_OPTS = \
+	--without-docbook \
+	--without-examples \
+	--without-tests
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
