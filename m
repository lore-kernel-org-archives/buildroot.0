Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A40C4167D
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 07:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82AEB85459;
	Mon, 30 Oct 2023 07:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82AEB85459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAs3f8hqgV-1; Mon, 30 Oct 2023 07:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 786188545E;
	Mon, 30 Oct 2023 07:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 786188545E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F31481BF955
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 07:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA40785378
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 07:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA40785378
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id snv088QWn4Zu for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 07:40:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF3D985374
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 07:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF3D985374
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD16086154; Mon, 30 Oct 2023 07:40:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 08:35:24 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 1068d2b6a82488246089c1a278c757246c10f4c8
X-Git-Newrev: 0bc9bf988829d45253e80625ef0709bc22ded8bb
X-Patchwork-Hint: ignore
Message-Id: <20231030074035.CD16086154@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/python-django:
 security bump to version 4.1.12
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
Content-Type: multipart/mixed; boundary="===============7129150529188843763=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7129150529188843763==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0bc9bf988829d45253e80625ef0709bc22ded8bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes the following security issue:

CVE-2023-43665: Denial-of-service possibility in django.utils.text.Truncator

Following the fix for CVE-2019-14232, the regular expressions used in the
implementation of django.utils.text.Truncator’s chars() and words() methods
(with html=True) were revised and improved.  However, these regular
expressions still exhibited linear backtracking complexity, so when given a
very long, potentially malformed HTML input, the evaluation would still be
slow, leading to a potential denial of service vulnerability.

The chars() and words() methods are used to implement the truncatechars_html
and truncatewords_html template filters, which were thus also vulnerable.

The input processed by Truncator, when operating in HTML mode, has been
limited to the first five million characters in order to avoid potential
performance and memory issues.

https://www.djangoproject.com/weblog/2023/oct/04/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index ee1776b44f..4979f20ca5 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  3720c85a8c25cacbce2f95d345d0f5ad  Django-4.1.10.tar.gz
-sha256  56343019a9fd839e2e5bf203daf45f25af79d5bffa4c71d56eae4f4404d82ade  Django-4.1.10.tar.gz
+md5  6f95e92e5e8964c4a1e00e2fcaadf437  Django-4.1.12.tar.gz
+sha256  d02483ad49872238fa59875c1269293fe4f17ecee13c121893607cc0b284696b  Django-4.1.12.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 61dfd54dcd..944cf1e3ca 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.10
+PYTHON_DJANGO_VERSION = 4.1.12
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/70/d4/eded564fa5928f68771d082ec0eef4d023f9d19dfa1d2923305bc3e62afe
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/68/76/b1cf87eda3bf5b2d7dd9a23bb4df70ea5511e426a54a04ed2c4ca2ff67cd
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject

--===============7129150529188843763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7129150529188843763==--
