Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292B8C001DB
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 16:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B702A83C86;
	Fri, 25 Aug 2023 16:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B702A83C86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3mSNLcolH2W; Fri, 25 Aug 2023 16:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1659883C73;
	Fri, 25 Aug 2023 16:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1659883C73
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05D721BF2CB
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFCAB41F75
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFCAB41F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HA7ZVgnUSOXa for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 16:12:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D352C41EA0
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 16:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D352C41EA0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA4D78633E; Fri, 25 Aug 2023 16:12:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 18:11:08 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c31651c2f2350011ac6c038f20736ab417ac39d6
X-Git-Newrev: d41d079735b82c9f5fdce8d26903e91ce952fbdd
X-Patchwork-Hint: ignore
Message-Id: <20230825161214.BA4D78633E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-iptables:
 fix _find_library()
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

commit: https://git.buildroot.net/buildroot/commit/?id=d41d079735b82c9f5fdce8d26903e91ce952fbdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit bbf3454f8f760e323ebcc0fffeafb6606692c5c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
