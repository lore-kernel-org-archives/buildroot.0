Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9848CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 917BB405CC;
	Sun, 11 Oct 2026 13:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_PfIMMAGjjs; Sun, 11 Oct 2026 13:04:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A6570404C1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723858;
	b=bNo0YJ88DFXSfFddOqOaIlwtBIoOYJqxmqLrYAHFrSuHlMWBmjUr8d7LLRhOU0/b0MkU
	 PwgfhEMTne/xXG7MwTTY4s6eknPs4gGzfu0B4BGpltosC/YcnX6qt5UvidZ9mWdE2c48Q
	 L7KWRdrBP2lDH/k/BbQCGhn0UX0Qyc7Me3gbZjb0f5/Jyc0Zs5SRZUrgLIaeeEpq3WcYI
	 LOkkNK8hJ+5lcMr98doJDiEH0sdFjBQXIrjdDzX89zdZVY59g3Esd1l+EXw2Ff6CZe1aC
	 hxZqEpjn9F5khtTl75aTQQsCRv3C53Jq/GVg48Qhtul0DWq2y5ve4OEOVlFdYlvbDrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723858;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AIYRLMVF335t9xCY2eqDbTO0cvxrC0PVpjrlE8NwbNw=;
	b=NczowU29Le+vtmlMZl4Vadplg7EygylzMujCpBEsGUUFKuP6aYXWPw21fSHNN8K3yjPT
	 nXMMpI2wq66HPX8p370kslAWMZIIUMny+nKBYTUefK8yeHZP3fC5boE++UAQFVcmzAJeg
	 dIl0NNG08CSOW4kAKI4w2H1s9c0HsRUOlKtfz6eq0RK8/SJEMo9P8AgjIy2VcnhYjJaoX
	 tGDbjjcP0j6YRZ0cZ9Z1ckTFkAJcqtWtRirpI37FmOubz2r+LMfM4g86bdvcUePGeH/Wl
	 EAC0j9kJIFLaF5IlhPiUIj66qBI1btG6UaSxbw6LN7ncmtNFi7pNE1D1LcdBIi/LQWQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723858;
	bh=AIYRLMVF335t9xCY2eqDbTO0cvxrC0PVpjrlE8NwbNw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abhnYTFd4GeEPb3mQiNsuglGcpvyMDR4OgEEBcET6Fq/G5TrZ+wpirConIbkeCWKG
	 eK9sTDnDgMxoQJ6+GOtFg/6w+lm4jzkeXwG1/C7+wt6VMZNxp/ZPCoyo5aiMhHPu0S
	 HX+xsZHYyuuDyLM6Ixgoa0/vniEko9Dp+wdTSxr9ZYSMtbayFaAakGJ5/hibboIOQV
	 nrmt2Ew2wcUzs66EKpbuJbtwL6ys6Wktd/gwUYaWAxIhmIzxZirUQdPO2wZvvRdVaZ
	 kkKHx301LlQrBCTpZfaMhUNbX2pP1SnWRzcC3F+fWdMyT40un5+S42sGzTR1UaAcxt
	 Z+Jz4bR5j39Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6570404C1;
	Sun, 11 Oct 2026 13:04:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C1437111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEF0D60611
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-nasw8jtXny for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:04:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D1ACE6060E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723856;
 b=c1A01UKt71iufNzHtvNp9SY9ZsWeZxxQTd7bc9ePz5v7tCb/AUYzYXoWC1jjRoIsdX2b
 l8+klMAKObp2kv2zK/vQT2pOBw/xD09q0DxInpHx9LBn9dreRh7GxSv5EfoKGVu8+3FM3
 H50FMPTglWGPVpFKniLlnz2+bLU/R0PG4/MDzirL+HhCzUk3951jQHdqHw0L/a5OhF/8/
 ADLuVGYj2u/3bXRASyErzLukNHzffOCYR0u83Swq7a3PxrTJ9zKxdtD+8IDvCVnXuXKeM
 t5tFentoPSA1bsIFzw8jajmD8MEmk3OTvgUCLctB3r5VmeqcwV9OjrUMnv63t6GR6Ig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723856;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0WvuyoXdPZkowHcARcKEdBcyHC/6pk36qqEPbaWwV/I=;
 b=dZhVIrQ5hDOhA91HjZ8sKuvGgFxuqe9VEEeF89YQFucoEtLwNyEIfCkxVaqMwia3NJ4Y
 UzfUymBxChUBUa6LrlkjpkmAGn2yMJl6dSn8Z2dnNH5MjZDHlbKjM9J0NxqaJ3GVScqyF
 Mwu6t0RfWbM065sAbfTzZ0OaioGVu0oSUk23sfZz6r9v9RWuRbT+OVJcsXmGU2eiAok/j
 pAOU1wt21FANckXqdIAGE6sjTYjKPJWO5fVefRkV47WJFSCrvPUtHTZ2my0Xz+kqC08JE
 cWSCtk9AKPvihlkxnh/CLJblR8VMu58oPFiYPBnC6cG3kx9eJPsLxGrsBpCLtM9W3bA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lOv6zJJd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lOv6zJJd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1ACE6060E
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=0WvuyoXdPZkowHcARcKEdBcyHC/6pk36qqEPbaWwV/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lOv6zJJdeFmGHCD8nVbpy6VfOELMvLGM5gcA5PobG9v7IIt7N4TBzju3ohKyKUmks
 5K3gP24vsxhBaWRa4YgH5MneNiKjkpPuZRdskdRdNSSLG9c0HaTk46BAOv/C0AYpRa
 2Ua+70na2oSrfugJEtbvQdvqFA9jE/EZSjuAyubbsowmaLEBaReY2k4zcMB1Jvpphk
 SDdAOEGRGYMPVUmqUQOr4Y2oh+ZeSrhvF2VyCGkcv94toC9eprPSt5SxDYZ7HEEx47
 9hnw5juT5ACRvQ+wAxnY9/sxHl8MfSPBk/RokBsNqgAuM2mxQrmIm4rM3eUgDckdxw
 CtDx1tKGqTxBA==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 GgMyJVBLh9fpRaTI5Ck16QYspdyi/EVFpJahC3gUO9BN5RJKtDbjhnbp3DpYNIIuv+pqNdScJp5
 MyVR9B1f3dmu+XRLAXO3cPsGtlyyUT/Gm+CQ1p5ClkoWjtVimG/GCGs9rHxAFMrIviULqZyZqH0
 w+3oWojJ82ZwMRZxUqUKChgNS+PTLQNsM622bpokhX7gxGXIwUd9lu9b12Kwdo0fToMgPjOxpCZ
 Xx3e2cLM1Tlm94TQBa9XkJpGyCD5968uhUjho8I8TLhsQBWNBa05sQag6gPu6OPeUhlbD+nWvWX
 SAP6n8ErB+i+aUdfHQ7L+96ZTuZ1VXTYtaPFwjTo3x1CWYgnltcZ8+YwvmkiU8MRFtK6hSbCH+Q
 vV3f10uic7xC804uiyiMKu1eMs8fQmK25A2QoMd5zLcmPJ33+13BbbAroYa2ceiJ9rmqJ5vbFIO
 RPbKJAtQ1zDhzXS4Ome3/hFmDC7WCLwknTkzSw9JL/UuiaJ9U4r+d4txIkEcSRnHs23WhzAlC8E
 IcWD5UvTbJ8Mc9T3sCiAopGdGq+pu98Q9mvn2zUgjI4rsD7tCQY4UR82glAwQg0oiaachSTv2L4
 ssmF7XEg9csyfSTn3kGxaY8qZtiuNhrYbmXMeAJv/jxf0qxCPkxFIuPPxtopMrAEGa/xEDFEQue
 X+5FOLIQRnI36DA==
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 908D4A4C5856;
 Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-24c4;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:19 +0200
Message-ID: <20261011130058.3443432-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v9 14/52] package/boost: math needs container
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 63c50d9835..e88f497f6a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -257,6 +257,7 @@ comment "boost-log needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	select BR2_PACKAGE_BOOST_CONTAINER
 	select BR2_PACKAGE_BOOST_RANDOM
 	help
 	  Boost.Math includes several contributions in the domain of
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
