Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923C9EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B743401E1;
	Wed, 12 Jul 2023 21:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B743401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2b831Aam-EAx; Wed, 12 Jul 2023 21:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 510BA416CF;
	Wed, 12 Jul 2023 21:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 510BA416CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0ACFA1BF97E
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0F2F41C26
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F2F41C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJEdtayM0NKU for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF2DE41B54
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF2DE41B54
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAD6086F36; Wed, 12 Jul 2023 21:23:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 23:22:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7aa9c8f8c0f99d29581d1e3f691afe0471de858e
X-Git-Newrev: bbf3454f8f760e323ebcc0fffeafb6606692c5c3
X-Patchwork-Hint: ignore
Message-Id: <20230712212318.CAD6086F36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iptables: fix
 _find_library()
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbf3454f8f760e323ebcc0fffeafb6606692c5c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the commit [1] already fixed some runtime issue with
uClibc toolchain, the same test TestPythonPy3Iptables fail
with Glibc toolchain.

  xtables_version = 12
  if xtables_version:
      _searchlib = "libxtables.so.%s" % (xtables_version,)
  else:
      _searchlib = "xtables"
  _lib_xtables, xtables_version = find_library(_searchlib)

  _lib_xtables and xtables_version are null with glibc

The implementation of find_library() rely on the custom
_find_library() that try to use the IPTABLES_LIBDIR
environment variable (that does not exist in the context
of Buildroot).

Within the scope of buildroot we can determine what
IPTABLES_LIBDIR should be at build time and replace the
calls to os.environ.get('IPTABLES_LIBDIR', None) with
the correct value.

[1] d341ec035067120b456f669a826e26eb594c0237

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-iptables/python-iptables.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index 0ccf064217..9cb4285ec3 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -15,6 +15,7 @@ define PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
 	XTABLES_VERSION=`awk '/XTABLES_VERSION_CODE/ {print $$NF}' $(STAGING_DIR)/usr/include/xtables-version.h`; \
 	sed -i "s%os.getenv(\"PYTHON_IPTABLES_XTABLES_VERSION\")%$$XTABLES_VERSION%" $(@D)/iptc/xtables.py
 	sed -i "s%os.getenv(\"XTABLES_LIBDIR\")%\"/usr/lib/xtables\"%" $(@D)/iptc/xtables.py
+	sed -i "s%os.environ.get('IPTABLES_LIBDIR', None)%\"/usr/lib\"%" $(@D)/iptc/util.py
 endef
 
 PYTHON_IPTABLES_PRE_BUILD_HOOKS += PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
