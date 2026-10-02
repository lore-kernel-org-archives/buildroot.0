Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7F2CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E71B48134B;
	Fri,  2 Oct 2026 19:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaM6su_lOJRp; Fri,  2 Oct 2026 19:36:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2A4E88133E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969811;
	b=IqFCcTx+uv0TkPY0//e/TNc6sJ5DHAcg2GEVE/lYgptZUmVhguptagIsqoY/U56HmAgN
	 XbmEyMJsD6XXPegTywljGcYNzvJWzHSA5sZTXzEVDgKpnm9zrM6Pzq0NfkdFqysUteQOJ
	 tuGVuUgHEDvSmLb6P8vEnU9fNzYHLUZKruVWN3MbfcteQeo7dYUP2ExCpXZHkBoYWxhaO
	 rgqB4CMdiIckrbLnGMDG0HEMzPQjAfLlxnWDHGEcuKiUeZgkHndZEtiMGt4zk+P3e7Iyc
	 uiL3zopUd1B2Aro4hY9knw3/6nxzIn1QkqQ8cMboGsJYj8+QMu+0xjM2Qd4g03zq8Gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969811;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eLiw01M6Z0MboGuiDskIpRCuSJex/ainXu+T07zagyI=;
	b=agjvQSgAu4LkQCuQJ8+UuOrO/xCQlt82J16spFoNbhuuB1VEJ2UGuBlDyGjxm+APOkSz
	 9SDmPWgVyN/fiAv507YT6fX9j4Q47egFoU2+rlbEFhXiTR4kSuNo8bBhuoKQh274McPKS
	 rYtrWY6BJjUQzWbKHLEtyTMNRynNh/wXE1XkoSpSr6QtWeci/sCJijvwkbTid2wqLbyxE
	 Z+7kmJ9azRyL+8J7EZjA/p98qsKs0td8T3NTyu5RZQ+N0v0z09LevxaSjPe6jYaKkGIWI
	 JKTlpnqFD1Dnq3kt7BXbSm7OTAyU/59Bqr3Fo+4Tfh66R2Tno8TH7GZoBZDg4lN3V8Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969811;
	bh=eLiw01M6Z0MboGuiDskIpRCuSJex/ainXu+T07zagyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h8TLh/870e3k04nH5pjpeDzc2+XA8MoDsuh5F1zrZX7QJojo4ZXsPQuk9CSnezu51
	 sG/ovwDXy8gytTL7C5aLumCWjRVUm1P6cND/mttjmYSyu8/fQ0ZKDtY/lveuZx3GNB
	 /VEgI+QidAgknKsW7RMo/7Ga6PCqp/Z0bOUKbAYCGXkzUEXkYKKRrNFl4kdLNGxSpx
	 oTA0YFm8BAMZxxbT2zxX3+lv5pGNvdnWbnLfCc6bjgZoxjgtHqzWKQcWgGBG0E/hGm
	 kbVFPqeH48BV/JLzt8LLBf/a5bczkb07zFbYXIWjnJuBh3bVQTG2SnsqhoDZWWE1ZG
	 deezQx4dzU06g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A4E88133E;
	Fri,  2 Oct 2026 19:36:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1091A282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0223140DC6
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UK3ghDxXezWJ for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:36:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6478440B78
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969809;
 b=UdK0eevtAfTUYyxsQVvpT5izfPrwbgWn5EpixVtccROl5NRYLHU1RCGROUc3b1xylGxf
 sPB92dqb/M5mMQOJ1PQVj8G2Jl8yX4t4LM7q01Y5qUnuB1bUkzOeGyJo6IpdSrUb4ZTmd
 KKqqYAkm7uTM6IaPn9l+gZuu+L03Z8fket+NSqHr2+pCil2KlhXuCz1aSe9Z7xY3QJ+J0
 Gr8gqIvwc+mYZP4knwbNyxsqdk02t31Or9VJt8P3uh0zVAqbMh0DajfNLUgqymHWLkbaa
 ex5o87dBakMIOV07yats8H/iovfLCr72A4J3rf3DQlfaNctzjKvevLP8DgPT6xI0PtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969809;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UyeHUPrsZhkaTd+eG+QvuKY0b9Ft7Y4eFV6PfejXNuM=;
 b=Q0gxL6aYBgk6kjEBPrZq/1Vy1wXyu/Gn/gAbYe9e/Rd2IcySeHhMatxGrf7hWELw06M9
 0pDO+oZzxZ/ccrJOcCQtv/Ko6bVE7CrhZF83MIgAKKPzsrBtsqV+CKR95gycDHadnx0N5
 SmFAozDOtyMC/egM/NTuOKOjqw+TrzgmKGLqeoBqMAQaIF2hGeP321K3/cTOUbIQf5m2y
 FzZ6R43rcieS1ADdhL73mAMA0R026PPcnoxGdCen7R0nbw4wxGIarbToVRT7lB12vvMW5
 hIEs1o8Ygkz0dDOSm4oAMyy7km/NBy3EfIUakegQ0GaB9tMd3qOp/JUxBtitQnfN4pw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6478440B78
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:36:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C9FA80091; Fri,  2 Oct 2026 19:35:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:36:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 845982a4f4a5057c88d5a88f59642ee97b05638c
X-Git-Newrev: d236b45fc43c3979eecb183bf2995dddc4b3aec0
X-Patchwork-Hint: ignore
Message-Id: <20261002193535.0C9FA80091@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lvm2: set unconditional dependency
 with "=", not "+="
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d236b45fc43c3979eecb183bf2995dddc4b3aec0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is a simple style fix.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lvm2/lvm2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 8db1899ed4..21fd5134c1 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -25,7 +25,7 @@ LVM2_CONF_OPTS += \
 	--disable-nls \
 	--with-symvers=no
 
-LVM2_DEPENDENCIES += host-pkgconf
+LVM2_DEPENDENCIES = host-pkgconf
 
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the toolchain passed at configure time.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
