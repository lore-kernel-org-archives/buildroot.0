Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A6BC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B180C41215;
	Thu, 24 Sep 2026 18:59:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIf0WqNPhwMT; Thu, 24 Sep 2026 18:59:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A91A2411F6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276391;
	b=M7A5cP2ZzCOZcSPa3nnNyVqXeu2fE/ZRcDQDCT3kU8gpz2q9hqA81rnL6mqWVgb5baLx
	 fYMsj9vtKl3dWTnIytTUm2lGQ/i3SgaDy4LN48VxlFt/1JYSDODAKV/D2forvo+fgB1Mx
	 ONsmmEYZDfDXTr5YpGqqx0dCjpxEEL4JvGPAVSjp7BHUgy363ao+xes2rDD7Iv95diFOB
	 b1I0UgBcS6QstaeOYLUw+JlXqoB8TSr0X9IDCSXTAYxW1PJnS8gqHHWOvnX1qCgZBYBkX
	 wYQhCmT67qfB7YHeM+/xs/sLF9bIxq0YUnXCYSDoCBykydmJO4+oJ7LzMQcQgwmcNgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YGucWTa75sDNaKohgVCjjKwr9pORUZwDktYDIGPubWw=;
	b=So/whR0Cu7BnU/I3J+9AKnyOnwz6uKudwfSWOjvtmSsm+FaaH37LAo5q9PPDjwLnnGf7
	 Wtq2e9ncibxU03e41cNa34YsTmz712WeFDM+Ct6a7nkSCoFL8sZZ13Ha6tCmhrFPbSbuF
	 ZdXtGU+gUjHO8rrgzwG47bQTWOfoSOIfEVLM4EK5ejLcA/tdqQru7J68KNmuNkSV5urmE
	 Dt3K13C/oSQMvy1/XyYoNeOurlpF91omYKd1i1tRXr44TdrVbGUTc7FZtECZb12s1A0a7
	 Jb8Kiee3Gc78fMcUTpb4CO4vqFyC1fzcTewBQQSquaN2HiLSxnDczU5qRdWIcelbcxw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276391;
	bh=YGucWTa75sDNaKohgVCjjKwr9pORUZwDktYDIGPubWw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ptmnTrHbNtEizA/4c1KQtQQ8+QuvlXoD81DvD/M8E2qMPGwh2+hJRDgGHZ7iBGegx
	 +g2PZSeaVg2tslH53RUBiRPcyQk0ttomxbYJggQEaR49YAQcZjAzp0M3ct8Iz8+Son
	 /G7bRJIqdB8S2TZQee2n60bQTBfsZMD8H/nd4qWkTpu7j9dSmkSCfjxjIBbFvHgPsC
	 CUvNYOq4TO6zMPcEwPv34CaSIRV71ZHoGZceSPInK4tlBzvt+E52QzItO2pXQt7iNl
	 43qndVS8bj8ZidS48KCt+srRT+WOfsHZySUC4oUlXNQHOh5/QYXnxq2ER9NApNCeWB
	 IOm+06jkKNXGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91A2411F6;
	Thu, 24 Sep 2026 18:59:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EFC6F328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E81A481225
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0N-Jw5zXUCKx for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C4E688123F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=RRakRwzR6jiyDEilVAYhaao6HwC6lt1bNzfOg0/ePnTD/BludXo1Q73CSkuzjhVVzYyO
 yO9dL8iDdgNdlMmYEjuccZ7rONwd3zuNm48aFKKR8cvk7xVyDf5W6O01xhagojpDLFUre
 BPuT9S+ssFhqGR2N2ULQV4cu2tkCubZlXsIgCzp9w2jhIlUFq3kbMv2R8bt9P44m2CmNA
 dp953s5tyW8fKJBrNLBRP4n+cysOeSVilw56xboXiqiYfwA109lz9sOG3J2oTF80ExlnM
 IxrmneZafMTQBk9EzQ9TfW4d4DUk20+IWh0heSFgSBb7FXYOQKqfZkiT/8Ep8/SBKdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ih8pHPfVENPKO1qw2+2o6jr+Hi176bkXhfr5yeP6zXs=;
 b=qv6J6wFQdKtEXR1zBqtRj1rfjkbxlJWsktTl2nSLsdqeRxx61CcJjxybt2vfdtcmj7j1
 Np94pz1KEJ4tPuJCn8NAOuXFCutPnJKd1XKDSJKTIw+RwJ22QA94bpD+OmESj0zjQLkF+
 u6r534mauaWn/Fk03FQLwKyKNgiIKQL7wrLGsoLi0FHodIbTjlNjR0ZtJmPWk+Bzh/fDt
 oZOCRNzSYAG/BADeCUllTjXhNFBy6YnyGuyJWjJCAfDxe3Td7jy9WEFrf9QATydf93GxT
 EqeskX1XGdgN3/miKl9F3w1g/ocYhMPiFvKO6uTJ2IVATnp8pjoPqGAF/DGm3vaAv2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4E688123F
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66EA69828F; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:33:09 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 8ad879736ec00ed644fe78a82cab2807783903be
X-Git-Newrev: 76818c5a85a2342c9ba48c96531187577b9e6e58
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.66EA69828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/gnuradio: fix
 dependencies of BR2_PACKAGE_GNURADIO_PYTHON
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
Content-Type: multipart/mixed; boundary="===============4532053332600097427=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4532053332600097427==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76818c5a85a2342c9ba48c96531187577b9e6e58
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_GNURADIO_PYTHON selects BR2_PACKAGE_PYTHON_NUMPY, so it
should inherit its dependencies, but BR2_TOOLCHAIN_GCC_AT_LEAST_9 was
forgotten in commit 8b3993178d0ffae312d7dd0df70d30d1d3d88873, when
python-numpy got this gcc >= 9 dependency added.

Note that the existing BR2_HOST_GCC_AT_LEAST_9 dependency is correct:
it is there because gnuradio needs host-python-numpy at build time.

Fixes: 8b3993178d0ffae312d7dd0df70d30d1d3d88873 ("package/python-numpy: needs gcc >= 9")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c6986e6d2e284604bcac43bf9dfd79f3d028ef6d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gnuradio/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 98d87aed56..e87275de4d 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -80,6 +80,7 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime
 	select BR2_PACKAGE_PYTHON_PYBIND
@@ -87,8 +88,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Enable python component
 
-comment "python support needs a glibc or musl toolchain w/ host gcc >= 9"
-	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
+comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_GNURADIO_SOAPY

--===============4532053332600097427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4532053332600097427==--
