Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAABBC88E59
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 14:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FD2F80CAF;
	Sat, 12 Sep 2026 14:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QK2_1eOePdc; Sat, 12 Sep 2026 14:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 56F7F80E4F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789225055;
	b=kgwNq/+TUPpvSY9tTqpok+OVYlMqZxztIvJkIVreFFmQTBmQnx2uDiAZ4Tw4SCefXWV1
	 3y5emEsl7JDv8IbYKqYUQi8XmfwoLgwP59r3bmTdjHAwmU+7C9XcjNfKWyGQl4CSsE1or
	 x/Pe67e0o55K4lpL/bZjrjybYrj/0leSfQh1zttLoM2Yp9dRT5JvvjUWu/N9mwQsNY1RG
	 p96VYHZmv1tXdlRDBCG1G+O03EDh34NDPEgAFtFNKjdCDUhhHisB/QaVkT3hrYaraV08P
	 UypNsmqrWsh6Exw4DRqvMX6wOA7XAXbIcc8hj+j3OlCYhqa5JnzRfBtpr7y4TxVwnWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789225055;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=kyC4+0FQezjM0ijikGPUOr0jX+aVJtk8LXtLEOorEjE=;
	b=gASJkrzGRZbFJ7IdyAL75VeosuJjRotxDYBVT7hq4jXkkusHY6+lOVgWuDc+9MOUEozy
	 0JQe6nhXIbP4QOVk2XNlDIt8lH8pEBJFuCp2egcRMs2Ek6fZUb+UXPwSotYP1gyb5gnpC
	 CwHdA3iOcY/4+gno7COb/8+1SF0cWiTJa5VTVVp5vCFX7m0kCgdNdhzuYiCZ5aOidt/53
	 YW0Tvg/+CzbejISrvs0WEwZSkFUraRWzluB4ouVdbO8mpn/GoDV9W7k4pUXXFuMbthSp7
	 S9mKen9kerLLAqsx0yptYZ2mVLaARQbptYcpuy2o28anzIwvQ25KL1fI5+hnlQt5+Zg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789225055;
	bh=kyC4+0FQezjM0ijikGPUOr0jX+aVJtk8LXtLEOorEjE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r7MitX/6nxhaOUgfR/o7wwg+Z1QnFuTlw3AcghnUND8JH8tjFwY/Q3APNq1SbzVI0
	 XHft3oeXdnaKR6F8s+oZhB7/1IL0p+FOS+OtH/kLFmiqZS/lM1nLpmiN5yqJzB+qmL
	 QS8vfMHroe0AGAly5Bza/ZQkCbDLntMvYq4kDJMUmRua3/uTsvsEzUraeHDv1UQujc
	 ZkZ77yRBRuWY726sCyC3LW9Vu6dHdWmRATswyxyllrsEmzFlic7VxkBPWzJwvgIiDX
	 DmjBkump2dOjfr6058ZzrPLf5Fzr5xqIlYA/cwdZMAyzdpEdWeYzhYebJVZDroAjlz
	 7Y5xAOfLwhpuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56F7F80E4F;
	Sat, 12 Sep 2026 14:57:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D798EB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 039E9406EB
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHeng9fkJBLX for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 14:57:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1BA63406E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789225053;
 b=A9CYWk1zHXVWjnl4tm8WP2PU/peQxBKx84pgN2YeTYQjb4ytQf6bt69pmC8DNHDQf778
 AYnowfiupnp6ov0fUx9sjh8UTojWUHHsoKiO66JmwTuOYo4L3KjKidowO74tFzmIXuDPa
 Sp2PENwA/Nzpv3p1zJqwHah2WJ29Lys/8Fcez56OZCttY4LbcJ2xlvZJcMCq1Eoss5WEw
 5ZDVQzo8zwEocRfK85eZxX/z0OgWeA0kGXJZCs/kmJDHs4SeMqUH8vHuiHdyGcQob4Cvm
 2kLNmyOwh20EhnwqyJS3BuVLz07j2SfkQKmfwJHXk6ruAA3gJJd8TVt2G6OI4PVLX1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789225053;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FDlJ7WvDF5RpL5Cx6Lky/aQm9CCvjBiZho6h2/2vYUQ=;
 b=aMv+L3xlKNqh1mpPAMHEbikttdAkhm91NTJREHXpIFZtGmd1Z/SAFwiRQU5U5xzihxa6
 1f6Tw4hwbRZk6a2BRsamf91gmM5fNP5Ln75svCkgApT+Gh33B6dcSVsIaZro+EuvCzQk7
 yO22Z+Ne7re0IPsDLi6qkoGUUznfTstMoNYNdontTtTnSP+acjs+lJ7ez7F9WfL1YZdHs
 hp8aU26SVSedBxIkxDbm5GO4UWviCg2Chfn+w/Yoo2VdpqF8otgerYmzTyzS4GrXXwXgO
 tj4Y1lGwTfbuN5c1+I7a8WF3s9I9F9tomUzCnD5Q6aCHi+5nqHGcY7+FK5QwjX3+WzA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BA63406E8
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 14:57:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A980A95993; Sat, 12 Sep 2026 14:56:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 16:22:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51b366290b780a6c5f9e09f8e84bf5749d2022b2
X-Git-Newrev: 17be3c2dcd33a57e1a606416146e1f110c09bba2
X-Patchwork-Hint: ignore
Message-Id: <20260912145628.A980A95993@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tools: security bump version
 to 5.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17be3c2dcd33a57e1a606416146e1f110c09bba2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tpm2-software/tpm2-tools/blob/5.8/docs/CHANGELOG.md

Fixes: GHSA-v7w4-4gc9-qcgv, GHSA-gwfg-w3jr-xh66 & GHSA-qp88-8f4j-wv7q.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tpm2-tools/tpm2-tools.hash | 3 ++-
 package/tpm2-tools/tpm2-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index cb7e8085d6..a2ce45205e 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,4 @@
+# From https://github.com/tpm2-software/tpm2-tools/releases/tag/5.8
+sha256  1cb73185cae814b4e15c7c2d0b22642d640faf48775f4156a1fd92edf84bef73  tpm2-tools-5.8.tar.gz
 # Locally computed:
-sha256  3810d36b5079256f4f2f7ce552e22213d43b1031c131538df8a2dbc3c570983a  tpm2-tools-5.7.tar.gz
 sha256  f6995d52c8b8e4d2c3bace7fc9c330a77a90d808166fbad4d7ead7e8ba2fc66c  docs/LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index cdb8931a3c..72b0dbf8c5 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 5.7
+TPM2_TOOLS_VERSION = 5.8
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = docs/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
