Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FD1C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 08:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6238280980;
	Sun, 13 Sep 2026 08:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24bEn-Hdvgr1; Sun, 13 Sep 2026 08:23:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 730B980981
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789287792;
	b=QjDeb6RknzhjyuSixs0FDKAzTN4r0WmH1KYXXJ2p7JR0FTu3+RCgnu27RZNnI57245RX
	 98gqjkwrOZpbyzLollw7B7R11JHYldYiB+iHCgRjnIULlCpnLp9pAU0aZf8guUQ7Cla5D
	 ApuSHU6QUYA0pB+Ux+1eiABVDnix4BFd9woWC9WaFySeyqz9ivdXIjHcDXsNOxWvDq43j
	 T+aTB1ebmotdqxhdWuRfXmeUxWkfKSpJhM6+t78JBQU2aeKdLq8skhkHxj8zeiJZlNSWQ
	 mGSUpYvrLudjEUAsIx2iLIs2g1RXU4XER8O925PsOTxuEY4o+OOdOnr5Kco3moY7OFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789287792;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fGc+GhGGwQCxkOuuYNd3xeLR+vVkEHAGgazEs/G8f50=;
	b=hK/+MMydydcJCcOSCM3pgIr2ll3/2V4J54ufDX4BEfotnXzPYseVjzEJ6Jz4ImB5b41o
	 lB/LZTO95P4fjPDjxdFLueKCgRg5OMloIxFXbvGjboKG1AnaiOOsAUQX0sRG24g4w4RQ7
	 sELwdUhF4sN7u06EIcr50rPEp925I96UGIgZxV90/n6BHpyHeA+C2gdJbtG1fiPwTn2N+
	 9vlDQnDT9CEtLWNdnuTvI7xubnLPFiA/2bRLsxUtTfBPb0Ji6ADl5eljeSsXZvqNcBgGV
	 5L0pjDyu6cK8ioO5nxQHE3Dtsod8ISLxnmYELFViJQ6077IwP4ngGigyUMgpQuS7fpw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789287792;
	bh=fGc+GhGGwQCxkOuuYNd3xeLR+vVkEHAGgazEs/G8f50=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HWUG2RkKSvvlDPtxn6px3Dl0dCbZvXVaOUz5SC0IobVQnzqz8qE2otqT89p8f0WND
	 LjGFe/zJIcHs8zFtVIjzFnVOvVsH+h9iKj8QPc2q0t6OzMRVPfO1DlmC6cGlcZ/RUA
	 WgogJUCsceEmKmnQl7c9R/EcMnWGcNpl7X613wYqwMXIOnyMTosfklBbXgV65U5k6w
	 26iYuJMkrVESKIAk7tnuXv2WDHtj8kRT4wiXTPTs9YGNfXo78u3Yyj2N7C0K2HYQ51
	 02n+Vy4oICdz2o80UjgA2rWCgw/HuKyl/dAW94wkLMIC3juoPHPc9flxB9vKPkxG+r
	 VlaYo/qHOL0OQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 730B980981;
	Sun, 13 Sep 2026 08:23:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC99629B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE8784064E
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4APUwWtCKbp for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 08:23:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DBFC94064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789287790;
 b=GTRIksukLaCHAeLrFfc4P5XT+OjlJxFue35pkqRWc3o4H2rGZR9YnXihcl1pV12yG2p7
 l0y5CSgyHAcerZwKRky4clpfd2Ke/pMa4utolw+h77Kx9jRUe6i47NWdBt8tck7b2o0TM
 cSXIFVIiNA46USQ94gvexxZHu+VTQjHM67WRBUu/EsZqGX1CNhBHKiti87hehrC4CCNA/
 tPvW9MGhltbfrTT+rUQj1ezVTep2IDRkQirI03BpYOpwvd1dFLvcvvPAJtQ1ZQbptf9bB
 caKYiC11wDk41oWaEQjHc6K0C5B4hzIE9QRUmqz7L4rET5/2STPy0165xS5VTgNx5yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789287790;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=olkotsM/gLBn++vZwaM4N3BBs7dGuJUDxR1gjize1xk=;
 b=hcRi2z1KKh6BpQAeUzr3Y6wb7coOC1PRvNvGyjpxjEf7jZfGCVNzH7T/6Sj6RGjjtaOX
 DaPvlnoGtaTsCIsZSfFoWzUrhIn9v2sXUfMYrXh3pv4HOTPyQLpburEaLSv90kbPn/mQ4
 rGY9W97U9yfOPmHR4N8QkopSYgM/rrfLAylB293al8+88PgtAG9s26FHl2BwuAbCaECSY
 BW3mdRnUKaobn91SAx/IigxYbUXGpIHGTxgXa6TgZohTSK03WwMGP66jMkHWkCQnSV/bL
 4Q0mZbHkDW14YUf1eUWLW9k/oeJi6hjH3vtwLgVRc0nBMDdhT/aVeqLWVsbxY9a5srQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBFC94064B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 08:23:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13FE98D3F2; Sun, 13 Sep 2026 08:22:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 10:15:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccad393abf2abb386d3031ee4a28f8317ba9a891
X-Git-Newrev: c305370f361f98016beb0bf8381b2759db295e58
X-Patchwork-Hint: ignore
Message-Id: <20260913082206.13FE98D3F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcc: propagate missing dependency
 from clang
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c305370f361f98016beb0bf8381b2759db295e58
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since bcc was introduced in commit
146498d13c487e8f43d6725e343eae4474147695, it lacked a dependency
propagation from clang for BR2_TOOLCHAIN_HAS_GCC_BUG_64735, this
commit fixes this mistake.

Fixes: 146498d13c487e8f43d6725e343eae4474147695 ("package/bcc: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
