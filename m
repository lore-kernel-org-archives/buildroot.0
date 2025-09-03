Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23435CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CD13422E9;
	Wed,  3 Sep 2025 16:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SD3bJrFKIwnE; Wed,  3 Sep 2025 16:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A837422EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A837422EA;
	Wed,  3 Sep 2025 16:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ECC62BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E041F42226
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M82ljecwCAJc for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0082240207
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0082240207
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:23:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDCE387EA1; Wed,  3 Sep 2025 16:23:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Sep 2025 18:12:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f55145837edbaebd2182d0b81782af79843f36cf
X-Git-Newrev: c7a8c85d45c92ee8963c318f6b1899c4000a59d2
X-Patchwork-Hint: ignore
Message-Id: <20250903162313.EDCE387EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netavark: security bump to v1.16.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7a8c85d45c92ee8963c318f6b1899c4000a59d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though this is not mentioned in the release notes:
- https://github.com/containers/netavark/releases/tag/v1.16.0
- https://github.com/containers/netavark/releases/tag/v1.16.1

According to https://bugzilla.redhat.com/show_bug.cgi?id=2383941,
the fix for the CVE has been merged upstream, and is in netavark
since v1.16.0.

This fixes the following vulnerability:
- CVE-2025-8283:
    A vulnerability was found in the netavark package, a network stack for
    containers used with Podman. Due to dns.podman search domain being
    removed, netavark may return external servers if a valid A/AAAA record
    is sent as a response. When creating a container with a given name,
    this name will be used as the hostname for the container itself, as
    the podman's search domain is not added anymore the container is using
    the host's resolv.conf, and the DNS resolver will try to look into the
    search domains contained on it. If one of the domains contain a name
    with the same hostname as the running container, the connection will
    forward to unexpected external servers.
    https://www.cve.org/CVERecord?id=CVE-2025-8283

Also bump package/aardvark-dns in the same lockstep, as advised in
the packages .mk version comments.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aardvark-dns/aardvark-dns.hash | 2 +-
 package/aardvark-dns/aardvark-dns.mk   | 2 +-
 package/netavark/netavark.hash         | 2 +-
 package/netavark/netavark.mk           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index cef7f262e5..9c502775a4 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d38758c5cf1a732d34c8bcf8f4d3d49d308903206082721c6099daf89fcca87f  aardvark-dns-v1.15.0-git4-cargo4.tar.gz
+sha256  629df64d5d713b5b78cf8d9387de12d84b88103a8581457e60c7697cf64ad83c  aardvark-dns-v1.16.0-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
index 1d2e06fd03..368e52ab39 100644
--- a/package/aardvark-dns/aardvark-dns.mk
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update netavark in lockstep
-AARDVARK_DNS_VERSION = v1.15.0
+AARDVARK_DNS_VERSION = v1.16.0
 AARDVARK_DNS_SITE = https://github.com/containers/aardvark-dns
 AARDVARK_DNS_SITE_METHOD = git
 
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index 0f6d3976e6..8e8adc4ad3 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a530b275d73c937c63d513bfe3f5ac3651b9346fdf98411b16fdcf9e1cd59b0  netavark-v1.15.2-git4-cargo4.tar.gz
+sha256  1eb17a5ed223928bdd433e0eb8518682ae71dd02981019fb726a9330d7166b2d  netavark-v1.16.1-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
index 4a4038d02f..1754759bc6 100644
--- a/package/netavark/netavark.mk
+++ b/package/netavark/netavark.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update aardvark-dns in lockstep
-NETAVARK_VERSION = v1.15.2
+NETAVARK_VERSION = v1.16.1
 NETAVARK_SITE = https://github.com/containers/netavark
 NETAVARK_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
