Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77509C4167D
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 18:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A809400FE;
	Wed,  8 Nov 2023 18:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A809400FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id juf2Dodas3C7; Wed,  8 Nov 2023 18:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D243E4012A;
	Wed,  8 Nov 2023 18:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D243E4012A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15CE91BF4DA
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 18:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E20DD81F14
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 18:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E20DD81F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ybCQtdveBkMa for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 18:10:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBE3D81F11
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 18:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBE3D81F11
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D71D186D15; Wed,  8 Nov 2023 18:10:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 19:05:48 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 23eed2aac124650bd21f02d7188d03cf04faba10
X-Git-Newrev: 1082b6f9f35ff1e48bb3d57e290e2b2be18353be
X-Patchwork-Hint: ignore
Message-Id: <20231108181051.D71D186D15@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-django:
 security bump to version 4.1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=1082b6f9f35ff1e48bb3d57e290e2b2be18353be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following (Windows-only) security issue:

CVE-2023-46695: Potential denial of service vulnerability in UsernameField
on Windows

The NFKC normalization is slow on Windows.  As a consequence,
django.contrib.auth.forms.UsernameField was subject to a potential denial of
service attack via certain inputs with a very large number of Unicode
characters.

In order to avoid the vulnerability, invalid values longer than
UsernameField.max_length are no longer normalized, since they cannot pass
validation anyway.

https://www.djangoproject.com/weblog/2023/nov/01/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 4979f20ca5..c2d41f977b 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  6f95e92e5e8964c4a1e00e2fcaadf437  Django-4.1.12.tar.gz
-sha256  d02483ad49872238fa59875c1269293fe4f17ecee13c121893607cc0b284696b  Django-4.1.12.tar.gz
+md5  a16208af2aa54cbe97ff79ec4426da84  Django-4.1.13.tar.gz
+sha256  94a3f471e833c8f124ee7a2de11e92f633991d975e3fa5bdd91e8abd66426318  Django-4.1.13.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 944cf1e3ca..e094974078 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.12
+PYTHON_DJANGO_VERSION = 4.1.13
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/68/76/b1cf87eda3bf5b2d7dd9a23bb4df70ea5511e426a54a04ed2c4ca2ff67cd
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/34/09/300498ca0a5f37e0621b90a94c71fc8a4227be5488a3bd5550869c6e0049
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
