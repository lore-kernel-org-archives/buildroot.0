Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A11CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4875260623;
	Sun, 11 Oct 2026 13:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbF46qGA1ZEU; Sun, 11 Oct 2026 13:03:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7556760612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791723808;
	b=e8TbXaFLjWEpwtoL/Qe6stUNWNzO7MOgs5iSI+ANMBq2K0EEHBepPADW7qzHhH9MclmH
	 5PZkag6iR4067Wwz6EfebIzyetqul4jdarTS0eSzB248PMHSe7v1DfXDgH1RPwGJbXLfl
	 +wujRHrM1eZ8L2mqsBC9wRSVSGgx0mOOAm5BrbhCY+TenSnSJk1seKZ9g2jnVAEHqRKK9
	 MbpywarFoM1wl75UdxPZpFngvmkEErmVvHmLkKc2Z2b2Mm6fmF34klUnN9nqsxAyyBhaq
	 D6WjtEwpNJ5dNPFALUla/HPFQNZeSwVYhyO7o/LIoC+aOPZb/zo5gqI3cXTnVp9Ou1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791723808;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0P+W+h5Xn3iyVxgqeyjcrDoZyYBePQqnoCVj3jDUi4U=;
	b=bmE31YGVDPbcc/uRYrShr84J3fI87I5N7ZCLZRNgGhgNl4oahFMTKZ6+V7yzHIfNBkI4
	 kip7vjQB5vnJIzpTlzfPPG1FIXIpdFgKg4sPvpNHuUMOb4mTAUhiCIMCeD6usCKCRp6zD
	 kFF1CLH3junBr8elolM/jagy/mQTGOMI7cZni4PETz33Zk4Y0gfqmzG5CDbF9mFj31o78
	 Ahp9CK8EBE+3PATUHUiT3qArtwd3oaipBAqdSSO5wpkdVGI3shVww+3rBbxDdhSfZEA8v
	 S/KmOzsdcPEh6wuJsZz0N0phsrLPH4T4op6vYRqnYrR8ewf20YIo3+8axPeuIXmsVCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=at+wfbam;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791723808;
	bh=0P+W+h5Xn3iyVxgqeyjcrDoZyYBePQqnoCVj3jDUi4U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UpTgl3mymTEs4LRuZ/FNUjVuXDRsAxmy5jiKPQ+47AJ6gooPSaqNrIZwEaKYL49zP
	 btSaLwBIrBvvUAa+1bFx/pS8SujJvwaDx6ohaP8aFf9XWxwty+ubxFu0kLcF6+a2AR
	 KB1c/TcIKUJNwpMubljeMoNYuw/HX9NBQktW2k0yESi7hj+O+zueYrfWs12o16o/oT
	 FW8ft1aXECzDWZ+mj6Z9NLnz05pA0oa2/ulbn/0SE9ccrXUn91bwU9slammd9/MbJ4
	 1HVKBnQ90JHTLAHnmi+UsQO5UKWB1dAGBVhSK3vtlV59DkuB+nmZMXh9Aecy6JjCRz
	 pnYckzph4OJcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7556760612;
	Sun, 11 Oct 2026 13:03:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E1647194
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D333160612
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcgiMGdR5tAW for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:03:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2AB4660611
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791723806;
 b=FToh3nCTa9LUV4mkX7gJTz7xR/pNEVmn7Qv3g2tu69TRqq22fzawKz0r5/oQ67u89WQ8
 6qkXmD55dJQAO8C0WIDAfn8GEeBwNLYIKuyaYE5PIaK1qDkKWUKGs73stO+HPP0IZplzy
 EnN138Y8r1URTPs7jQrT9JdMATotokW8jD8vnUuzTbYr+QM1x9U78I40Fs5eEbKKAeVS7
 zdlpME8y94BzpJ6eIUt5DJGjrSd4G3/jknY+LTrz3s6qr8FoObNLjQgGhfACS/WaO+eF0
 EfCTMB0rjx8OrMW2TqBRqRLs+zt76uupmz8yR46S3vvhh33nvlV3BTy4mCS/izqAmuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791723806;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=vIDNoHpVeJZB8z4EGtEfI6I1XV+Bp573iBXq5YpjQFA=;
 b=ph7vyXMRWu49GTrP+98Zn11bb0onbauxTF79kP21UGlyoHhOdIsv853L2Mgxzj3gAt5T
 iSzj4GhFb53/qUgXwL+YaIVfEU2xUj3zUuKIdzw0abXsJ1c5i2c0RlPRaqET7Y11Pd3cG
 i00vuZs5zlBHqRRQUTB6LJJUaT2IIFQk5d+8d3me9P7/W3uMlvWFeJn71QO1sNcNq4OuG
 Yr/C8/H6zr9Pk+k8Z3Rl4fw+ElWnWM53FYjtvvvL3pgtrnHpvJqFfOHqYGv8iVor1dm3f
 l/9V+fYBg6EbqHSPpW5jn7VquewinaZ2KKpOYWrhn76K2EvPx8LT8V1Tk2bBsrEBXJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=at+wfbam; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=at+wfbam
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AB4660611
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723662;
 bh=vIDNoHpVeJZB8z4EGtEfI6I1XV+Bp573iBXq5YpjQFA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=at+wfbamKBdsSFVHtgXKyOtvluzYiSf+n7QmXSkRiiw9rqq/DyqfaAa++dbmlvTzV
 j+6rtvvkIkiwm1FUmLuKB9NTFYEu6VXuRFo8kroLw8c7T/zMBs9KLFws+9pjZ/hk2+
 2v/ij5CXja/Xe90eYZP8MrI+5huVO0ZBViqTtZczeCoDCx8/DgCWyDfSHuO29ZVbGM
 XOuI8A4N2DVK+nxbCCgqWgtfg9AZBEwlRlrqh6f1IiWG0bIWPF9KeytO3PT+KEU7no
 O9VV6enTFWFuCt2HzwSNdzxbYxyspM2pg87szVKEtAP84aX0CXXH1L8hPlX3pfHz2f
 yGp1/PTHk4y9g==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 y7SxU0sMPIFw49xWEkad0j9gbJL9lQIJySUPlfuwtsxSls1KEehheUnDInSoeKfgtYih0IiZ8lZ
 QUlZ/0Wo2OOPZEfK1MuspBO+eOLII4lMRgYy3DjQ2S/Fmxbez4Iczz/Xc2IlNjxl9IAINQEL+FW
 IpFxj61vF1pqaC9adZVgfLx6+0K8RH8Hyn0oWJ/vRsp0y+XJLL9huOmXmTigZ6JAKzLf0av3LeL
 ZD97OK5mSIbEHaeZkHW3eg3Ry/tL8+lsdy2yC3Ih3Vjh6jvgtaaJyP1UtoIpAMAvgLNKlW6brKT
 ILJhzRFjY7I1rlGWPcTdNOJA/RA4nj3KsqAE3uivTO6rF3wOBINWsMv8Dx4zzb2aXVGFYbnezLR
 UHkcrdEUofJ0EehjtIG5UcAr3yAixAFWJ2AxhmPLKMWof0a/phwo8Vkh74BkyFOMP9pIouq1ZNt
 byo+hOcqH9kDIleQk7cD8EBoROOmedwhivV3fvsOiFgWb6m4Z2LJyoZ5pskLBMl6kT+mzCvrB0t
 ompwLJXmDXBtmjhEbQ9Cy0/aMEaVSVb+Slqct6B4rnuzF4ZVN9abaeUjiPbuI/+00ewsUGIVcFD
 6bLPpq+65nrfp+F4mNtn2Pe7I3yfmL020nRXqU1j8W/aqRo=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46C8DA4C5850;
 Sun, 11 Oct 2026 15:01:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAj-000000007Fz-1FJ9;
 Sun, 11 Oct 2026 13:01:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:16 +0200
Message-ID: <20261011130058.3443432-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v9 11/52] package/boost: fix coroutine
 dependencies
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
 package/boost/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 929a9c3869..f22f263538 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -102,21 +102,21 @@ comment "boost-contract needs a toolchain w/ NPTL"
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
 	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  deprecated coroutine library, the non-deprecated coroutine2
 	  library is a header-only library and does not need to be
 	  selected.
 
 comment "boost-coroutine needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_DATE_TIME
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
