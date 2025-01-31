Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC76C02194
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 18:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A59760667;
	Fri, 31 Jan 2025 18:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz3QobIY20fP; Fri, 31 Jan 2025 18:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 657636080C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 657636080C;
	Fri, 31 Jan 2025 18:40:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E368016E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 640C540F50
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lz4BgBV6VIbh for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 18:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22E154127D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22E154127D
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 18:40:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EB3F85F84; Fri, 31 Jan 2025 18:40:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 Jan 2025 19:25:56 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ebbc5e892a919c527ae730cff68237923634a020
X-Git-Newrev: acfdec5515b84d9bf890f0ee257ab863956ec719
X-Patchwork-Hint: ignore
Message-Id: <20250131184014.0EB3F85F84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-django:
 security bump to version 5.0.11
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=acfdec5515b84d9bf890f0ee257ab863956ec719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following vulnerability:

CVE-2024-56374: Potential denial-of-service vulnerability in IPv6 validation

Lack of upper bound limit enforcement in strings passed when performing IPv6
validation could lead to a potential denial-of-service attack.  The
undocumented and private functions clean_ipv6_address and
is_valid_ipv6_address were vulnerable, as was the
django.forms.GenericIPAddressField form field, which has now been updated to
define a max_length of 39 characters.

The django.db.models.GenericIPAddressField model field was not affected.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 463ca4d4f7..4bd5af24f1 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  9e539af55750660a1095775fac910d1a  Django-5.0.10.tar.gz
-sha256  0f6cbc56cc298b0451d20a5120c6a8731e9073330fb5d84295c23c151a1eb300  Django-5.0.10.tar.gz
+md5  e340a2898555cbfb285b00b5e67d324d  Django-5.0.11.tar.gz
+sha256  e7d98fa05ce09cb3e8d5ad6472fb602322acd1740bfdadc29c8404182d664f65  Django-5.0.11.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 7c64c65d00..7353ef1307 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.0.10
+PYTHON_DJANGO_VERSION = 5.0.11
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a8/52/06fedfe94a2610e2ea94ba3786c5475088e1e422b31c0ecd5b4c2ae6a561
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/02/9c/614ef004c122cfdf9f2d291eab75e24ab94d24c0693a0ca0db44e9633dc3
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
