Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD5C982DF
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB1940B9A;
	Fri, 18 Sep 2026 13:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aOx3LK9-6e4V; Fri, 18 Sep 2026 13:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7447540B7A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736757;
	b=IB667KA3tBstzNjqqGImYCQn1qNctYc9FlqJJmb3pb15maWe8lno0Qb+OK5vkI1FnDcE
	 zV6ueB+ggfnAw3ZC+zTIRknn93cgMSCHZ16GjY2xteE0HLcjon61tCPtQgnLl/ezx0sf/
	 aqMP6zQzNNjX11YO/5gE753q5VfapXMvqLJyGBr0rzpYZa5FqtMgSU9CU6f1Pnj4FP52r
	 4365Jtf4XI0U8V18k//XAVURxLazkYmfvvcY8cHUvoCXKadXFx1HHlcCNMmPh+wrG05Fs
	 mz5zLvrl9PTR1/xBu2vrkKPuyn6BKfH8t68xlf26hpoGAJjHxJzwYOm6G4jVup+Mqrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3DbRm3rfBNfnLcPNB/Or2rWzvYHCEvG0iXQodAcbnCg=;
	b=UcF4nleU+cUXd45gT8f91ODENmQ1cEUEtTT1hMZo52DjyNKSoBTz7etioSLo8vLuuuib
	 kxXa5EGeSY+D1VCLE7dnh304BFfo0qPa/A4oD+v5t9fatcScIbvzoGfE71bt02/hwznJ0
	 OaochlaTEc9sFlsG/P1Z+7FkwnEyr3Crp77Rw6zRafByVf42pfiViF2z32Th5S2JS0FzU
	 gvbgyleAMtWhnuSjOnoyaC683bwXbrZrYHK+1qQkjQkNG0Jc1mlmC+vbPfY+FVamR7PcZ
	 X+Dxq673zrtwE2uI6v0rdqVKKGnv6MmG4vfuXLReVf3euOrc1QlePNgtnfWG1ZM3epg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736757;
	bh=3DbRm3rfBNfnLcPNB/Or2rWzvYHCEvG0iXQodAcbnCg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LAJv9B84vWHDH+XyXLDHCC7LTS9MMXCUv3qGL/tj7Iy6ZhcTZNKk6ZTWfbOxMzCN5
	 dRX1hVE3x67pDrHwOiPoo5aTdyaw0p4ucnk9dkjJyZxgE8d0AjfKTlBoRAqGkIZ74W
	 /wvhXVIdfdnWzJ8gNnHiZnaMfv5GTPXZweQJ04I7aFNVEoh404NfnEQlR3M6CuCy/G
	 tmfO8gwfbjCOGAMW6eULK+tadP3vtqsAk5IcdFFzgKcPzmNrv6uALr6Ml/e7szrqU9
	 ZkWo/bZqgdUojblpt55+uOB0wldXylNvGNreZ/ZPWpwumNDbZbVjJB012Kb0i0jrLG
	 KtR1xJvy+bN+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7447540B7A;
	Fri, 18 Sep 2026 13:05:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 659D9B0C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6333060D7D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8BZUTRtyoC9 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 947C960D6E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=WfRpVp7LsBxRxC0EpLUtWpFwqg0VAtYwOQKhssnuCfpoDX9iQwD3LTVf8VZE8SddFF6r
 moMYRE3Hn86tO1FLhAJ5ULt3holsDA5BjvjSMLn9KadBEWow/ywQmiUHSKKBazQOTYk0c
 7KT57deg2XuOsquF/UmpG74SNtYlNUQKHFd0xAEqU6apye35Q8qdNAMkwOshz626DaZJY
 nqjpamYab9caVaIPKwTnKIkaCDcJXcVh0UrFyKmzPSiWQ7tlUgf7TmDczSRyv9NTWLSzy
 hhq9SHxlCjtIj9P/TFBB7lowsyW15Qd4MG77+LD6JXJrr1mrmeb7T9f4o1JNU24S3Gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TYNj2PN34t8o2IhGXYBBCdxJ26ob3OJksU4Kvycb9BU=;
 b=Qwy5rcE3edjfr9ME3VNzNZ9OKZ83bh+tCraIJVP9kpdou55zBY57p3Xz1/LC96pnMuxh
 Iei+0ILfoWSmLSk6UDOq7BU03V/BG5Y/UrsHjH8TK8BgHhS3vIvS3aODg8rsv4s4jA+7S
 8xxb4Gpoji/NDNjV6YMoz/oGvt5zPLtojhHqRCitKeR8+BVBAiZVy4v+GK6NQDv2Zf2f8
 umkU+hZpZBZlqQ6PAhAlR0DuFBXzDSEB+Hy4iq83t/va0zFm+srNo7a+uinUlCT22jXwK
 QCtuUOl+CiDA/zq/orB1/P+4zbxvRVgGDWfDUJZGxOf9fDGx/l4E9HHocYfdQIpRqoA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 947C960D6E
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D8699718A; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 11:18:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 405a43413214affc4358e72c69c653c297d483df
X-Git-Newrev: 871b9edde865b905e77e1a3a3daff49f6437727b
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.4D8699718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bcc: propagate
 missing dependency from clang
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/871b9edde865b905e77e1a3a3daff49f6437727b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since bcc was introduced in commit
146498d13c487e8f43d6725e343eae4474147695, it lacked a dependency
propagation from clang for BR2_TOOLCHAIN_HAS_GCC_BUG_64735, this
commit fixes this mistake.

Fixes: 146498d13c487e8f43d6725e343eae4474147695 ("package/bcc: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c305370f361f98016beb0bf8381b2759db295e58)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bcc/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/bcc/Config.in b/package/bcc/Config.in
index bf46f07d93..9f3907b9be 100644
--- a/package/bcc/Config.in
+++ b/package/bcc/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_BCC
 	depends on BR2_USE_WCHAR # clang, python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # clang, python3
 	depends on !BR2_STATIC_LIBS # clang, python3
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # clang, llvm
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_FLEX # needs FlexLexer.h
@@ -48,3 +49,8 @@ comment "bcc needs a glibc toolchain, C++, wchar, threads, dynamic libs, gcc >=
 		|| !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS
+
+comment "bcc needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
