Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D40C44501
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3916541172;
	Fri,  3 Jul 2026 14:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWJ424zoYfqk; Fri,  3 Jul 2026 14:27:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FABF4116B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088828;
	bh=AVOtcIyatAFDbPfYcQIPs+jspEcsoP8HX0w5Mm/b5kc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s6qaInG4zIWXHAvb94N7MEH3IY2MLE6qr7y4uw9xjfzVBg0A9DUtBgI+XLrITj6X3
	 bJ2gKU+FqH2mOWNe7nL9bfDiwaNDKLmkXRK4TNoHMEleYLu57kifgkN18N3Z5mB6sU
	 qiug6d2ALLXcPdaZSvMaMZjO71nWNC7vjB0CR3VnPmr3Xqe8ffF0TkFjp40Z7tXbNV
	 71nAfuFGEVc6sY9V5gJ6L5X+05Us6DyvcHTeZgJBZm5XnLS3yOtxnk38AyPhR+DeTu
	 uceKCrG2vUwqsYrxdqqG4NQ0xZVg+38LN5DWsd1YYjTt6HZj2qdlYUVglkwVWTMhvB
	 +fvtryhoQLICg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FABF4116B;
	Fri,  3 Jul 2026 14:27:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B92847E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6278660648
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_yx7wjD71FM for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B8A160ADA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B8A160ADA
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2425883A1; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:53:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6401cd531a3444f826560e993813704ff27186e0
X-Git-Newrev: 7938b9236b0b5e69b25f583056942ad5d604785b
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.B2425883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/squid: backport
 patch for CVE-2026-33526
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7938b9236b0b5e69b25f583056942ad5d604785b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-33526:
    Squid is a caching proxy for the Web. Prior to version 7.5, due to
    heap Use-After-Free, Squid is vulnerable to Denial of Service when
    handling ICP traffic. This problem allows a remote attacker to perform
    a reliable and repeatable Denial of Service attack against the Squid
    service using ICP protocol. This attack is limited to Squid
    deployments that explicitly enable ICP support (i.e. configure non-
    zero `icp_port`). This problem _cannot_ be mitigated by denying ICP
    queries using `icp_access` rules. Version 7.5 contains a patch.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-33526
  - https://github.com/squid-cache/squid/commit/8138e909d2058d4401e0ad49b583afaec912b165

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/squid/0004-CVE-2026-33526.patch | 34 +++++++++++++++++++++++++++++++++
 package/squid/squid.mk                  |  3 +++
 2 files changed, 37 insertions(+)

diff --git a/package/squid/0004-CVE-2026-33526.patch b/package/squid/0004-CVE-2026-33526.patch
new file mode 100644
index 0000000000..572a0197cb
--- /dev/null
+++ b/package/squid/0004-CVE-2026-33526.patch
@@ -0,0 +1,34 @@
+From 8a7d42f9d44befb8fcbbb619505587c8de6a1e91 Mon Sep 17 00:00:00 2001
+From: Joshua Rogers <megamansec@gmail.com>
+Date: Tue, 10 Feb 2026 19:58:49 +0000
+Subject: [PATCH] Do not escape malformed URI twice when sending ICP errors
+ (#2374)
+
+In this context, escaping escaped URI always produces incorrect URI
+because `%` character in the escaped URI gets escaped again. Feeding the
+result of the first rfc1738_escape() call to the second call is also
+dangerously wrong because the result of the first call gets invalidated
+during the second call.
+
+No other cases of such "chained" rfc1738_escape() calls were found.
+
+Broken since 2002 commit e6ccf245.
+Upstream: https://github.com/squid-cache/squid/commit/8138e909d2058d4401e0ad49b583afaec912b165
+CVE: CVE-2026-33526
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/icp_v2.cc | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/icp_v2.cc b/src/icp_v2.cc
+index 2a4ced3bfab..25f7b71d25e 100644
+--- a/src/icp_v2.cc
++++ b/src/icp_v2.cc
+@@ -490,7 +490,6 @@ HttpRequest *
+ icpGetRequest(const char * const url, const int reqnum, const int fd, const Ip::Address &from)
+ {
+     if (strpbrk(url, w_space)) {
+-        url = rfc1738_escape(url);
+         icpCreateAndSend(ICP_ERR, 0, rfc1738_escape(url), reqnum, 0, fd, from, nullptr);
+         return nullptr;
+     }
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 4a56e32e59..e072ec6137 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -21,6 +21,9 @@ SQUID_IGNORE_CVES += CVE-2025-62168
 # 0003-CVE-2026-33515.patch
 SQUID_IGNORE_CVES += CVE-2026-33515
 
+# 0004-CVE-2026-33526.patch
+SQUID_IGNORE_CVES += CVE-2026-33526
+
 SQUID_DEPENDENCIES = libcap host-libcap libtool libxml2 host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
