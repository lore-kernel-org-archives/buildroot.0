Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3940FCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F28FE61398;
	Fri, 16 Oct 2026 13:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPO4UF5eF90b; Fri, 16 Oct 2026 13:13:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E5843613AB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156416;
	b=U7nM9OVwBNXOuCaDk7/xJy+wCrLR1Ef3mXDks04yuS0JHH8zulnV/+xj88NIQ2krbw6l
	 PpleSIUn469qskKC2pdFSwlxmoWC1Fg+Q3eMberO6nKzTYYxZxQM4AsuJwkADPyD06tTp
	 OXtJH8AInSNJDJu6UTQJJvB4PPCoZtFi27vpmiRWRDUmrQZjGeDpH1Yu3ffcCNawUT5ZV
	 +HCq7lv6banhJPQqH8jgo2JqqgsIgy4Ep0MRblTmjXhV3asw2Dvgi5KBsgnEnjwRSxJpH
	 GjPd3TlsWYP+/HfMgDRv9Q0y/feNxQMMlzx36uUrOuvpdsc0+ylutaQPsfrbOyb+a3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156416;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ERu4iIudfHYAeHvx6JIhPeNiLnLwfXOgkrepypKXkt0=;
	b=SJKCoZpDGqOGLa1KToJcUO2isHMbPJoIRaWTCTUMh+hkZVo+V3sSdn1RPXf+Ewimu3Az
	 3E7L6P2SKNWczQAyNXf5OYsMo8OOhAtoLMEtvnv8gOF9EMLLasJ7L8pwLqh13C6+H51Yp
	 qzbZyPKzogo1XjNoVhu7x75gTeRDeKnb6q7ABqw5fEXnKB9vneV62+pjrXPVPNAuU6EEO
	 GrTS+uvjXXnOcRktkZHnITNjDsDNqtfwJKxGCf+FGcwH087qrDtbonIONGJIDX/L58Tk2
	 ubdNX/bKy5DAArzsA1vmdZQO6MMitHp+i0RkEE6kwMI1Kc9N4jZrllZLTXOKUYWtGcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156416;
	bh=ERu4iIudfHYAeHvx6JIhPeNiLnLwfXOgkrepypKXkt0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EtrPHJ5O7PQgQtNdsItDqSj1e39etWpwWPKOhuDdyhN1q0AhE4R10Dy6CKklTwGV0
	 LHp2XNIYZ6pzcJK8shk509IxTEa14Mvk8OmvjQbWshnTifeJarZJQ5oRI83pFYw0Iz
	 Q0hbs4RU+7cl/Mg6QPSIl56Ssb5jxWbJymlfDffHHiAOkU9zbyOqp1HJ9OuGOatbl1
	 CxR9nL42sFwcqh9jBvot6+UMi3LUIo57DJX8Q1pzmK3ycb9LLziNPcQQE1Iq594OLP
	 DNO/I2hGeHlYkmzbZUwgH52jhBJQCGEkjKHJ9ExfndvrS7L5gla0AT2rcsQRGpkg42
	 stNv/MHvu7YXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5843613AB;
	Fri, 16 Oct 2026 13:13:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E15920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A2ED60EFC
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mra38Yb_h60M for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 461A460F40
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=OTMSBzZGO7WMD0PXULAQTUEI1YgcWYiWjbfws3GI0Duf+aLzpWKFOfPtYhoF2tiA5gHS
 aNjYpbOwAF9feJnqRzLx9ae6Xns7B2SRSKo9CYCq/IbEg7/6J0OFbSpKT98ENLIV4T1X9
 Sw54QNC9Irm4rGS6HVGCH/7RB5aKe4fDRH32r0WZK4razhMUkyHIM0Pie52wYmOOK2Bj6
 Atd19t69SKURjMSDRl7sTbKZUUitiLEehuZ+QsFT8di10ayxGoLBDiitBIBiyT2of9LGc
 EQ6y3hSk2229wRbW5dtKX3fKCdwR3WSF5jTolHdvnrhnL46TmntxQyDV132x9L8qe2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mxeytqTQxfDY4gWpK9/FWolvNq7oObsqWVLDh67cYw4=;
 b=hChU3iJmci6GER80N9I8H3p6kG/GyMHVjHYugjoT7n0csVr5VD6D5bVl9in7FwrkdyFQ
 TRCoqfq8kUvZJFfJxcg+Mzp9R49hjzIJVSj17VfH1FAU6+fyPysfIF7Qgnp4csVXrMoG7
 hV7nCC3wu9GsPt1L9UtFE+8rPLXGSMweAHRGDwDCCPp4wJPGpuepvj7ui9D8T4DnGft4m
 wWbEcKzlJRJQNa66pBcg5tzMmdQaJoSVu/NDxHd6eEO/xipxZH88ohOu15/x0Zct2y327
 9j04Mytix3PiVnjoAhKk2HE1omoeWiVtWBU/Q+6Ry3P8a7TE2vM0LTbU45VJkRoNu6Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 461A460F40
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35637960DA; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:14:50 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a6a37ba0db759363cb8e4fdc016385234108025c
X-Git-Newrev: 500860e2f0cd5363ed8473f8ff17f8a829e5093d
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.35637960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/iproute2: fix
 build failure due to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4757725072163491289=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4757725072163491289==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/500860e2f0cd5363ed8473f8ff17f8a829e5093d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

iproute2's configure script enables HAVE_RPC as soon as libtirpc is
found, and misc/ss.c then calls getrpcbynumber() from its RPC service
resolver. Since the bump of libtirpc to version 1.3.7 in Buildroot
commit 3f3d6e43de9b4aac7df8545fd811171256f878d3, which includes upstream
commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
that symbol is only exported when libtirpc is configured with
--enable-rpcdb. On non-glibc toolchains there is no libc fallback
either, so linking ss fails:

  ld: ss.o: in function `init_service_resolver':
  ss.c:(.text+0x2558): undefined reference to `getrpcbynumber'

Select BR2_PACKAGE_LIBTIRPC_RPCDB when libtirpc is enabled, like lsof
and other users of these functions already do.

Fixes:
https://autobuild.buildroot.org/results/390b7ed00da20c2349fe069ade4a65404834a484/

Fixes: 3f3d6e43de9b4aac7df8545fd811171256f878d3 ("package/libtirpc: bump to version 1.3.7")
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fc23067ac65890428a85f71d604c816f560cb728)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/iproute2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index ab9e515eca..106a0aaf2c 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # __kernel_{u,}long_t
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	help
 	  Kernel routing and traffic control utilities. Provides things
 	  like ip and tc.

--===============4757725072163491289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4757725072163491289==--
