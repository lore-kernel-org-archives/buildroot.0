Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F934C88E50
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 10:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D214E80AC2;
	Mon, 14 Sep 2026 10:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVq20zoG3F5P; Mon, 14 Sep 2026 10:12:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 113448099D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789380777;
	b=kdnshEYxnHOWMEPcIl5BfqHhxvZHRpbrMqrI58O9OZsgOSk/bwewfD7yJAnWHRQM9hR+
	 zBV8WBdhk0Kb7FcT66D5a0MtifC0sl5POKtCz+cgHShtn5SZulcEaECqIOolyd/5ijgfm
	 zjJD5VBb34lvlk/AAOVHE38ILe4rFkflEmItz86BSm4wXgbZwNhtNuDYHhtoWmu+19VBv
	 RjWRBPxqZVrfALDQybAnhNIkbIw2hPQboc+r63bI6joCWRqVDlVAq/0bDRcnnDHREDC3U
	 sxFGrbExHWCQO1JSIT1w9Oxx0IlEELMyMD1pVG/BLf7tDwDgFLbQXZi8VuN2mcWfGzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789380777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=G8eufEbh7WO4+VOt0Ro5I1U50KF6QIkVlcKs7g5Nol0=;
	b=IXcID8IPY8fAhFTiqWS5AYOqqUgpp9FF60Kwj8qQO5xB+WZZ+Mrz8OX54oHor/t6SxQM
	 2srOW+MDe51su4/x2P8LSowl15MQ0VU5ItprvJ+mLp2dRWspWjULlVI2kAACuDOwr9Ti/
	 WYDs/od2tkyRvC8md/RunO6gg1wdgT9+RZ3XswCTJJ3Hod1K0C6ueGqXp7yIqhT14+RCY
	 aIlEKUcs0Kd7+LgE1OFUtMBNGXnyuuhh2dLtTlxeE1RhAyOMABvOiI9bWcvSoDtrB0/dT
	 hT8lcqW5VLnASDxylbMG1pLNx9U8H0fY34F/cItv3Dv42TJMzGNNFDaJ0uRWnJi62lw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789380777;
	bh=G8eufEbh7WO4+VOt0Ro5I1U50KF6QIkVlcKs7g5Nol0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VxRertvLcPJRA9MQQz5kqhXj48den8e5NRPovDEp4eh7SntLMBxM3sX4HW9x4J5Jz
	 7p5li5H0Iz+g3UA+BU37Z5EcTo75/wRMtu6L7OGkfjbrfm0HkpYyaPuv4YIZ0aRG03
	 rTVUyjIsapyg6sYuzX08hG9oXwRpWx1sPeU3Qo6Y55P8j9/g/AnGJKgrPCyeI0p4cH
	 8Mv3SXjJBwhXVq38RBusEu8jDdsxfIzT11d8C3z0UzVh0RXaIYyvD8spal4sGSOtMI
	 dnn1h7HorOt13i7P/ruE3GpFosCzXDFc9TtMN6MJOT4CUIy8hkYWrcJ/JXPXj66gIp
	 YOTrQda/NFSKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 113448099D;
	Mon, 14 Sep 2026 10:12:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDD4E362
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 10:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF2C1405E8
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 10:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEhvXiMudMlw for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 10:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AC9B6405E2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789380775;
 b=dAoIAiZhZX0YTRqxIgSrAKtbQnXgf6ICcjg8a1pNbEuCWeNk5wlgcJVnTwclWOIjbJVY
 hKAgVgALO9gyydEXVG+u6yzCMuGmPSBNKGEHxXGXZOR+jFQOH4rlrAaiaVNztTF1rrm3B
 7cUU42KBB4nwrCeGGVBHeBfUnTkQIxfWXmCcxTBrkUiiFQQ4Qr7SQwyRvZX+/y9ZC4eXs
 Xi63/N3cXRg6Vs13iAzJUmE8x0Csh80rDASuVug2IsM78VzSyETKEEY4FmVqZACyIthGN
 Ndoa8ToM6eqSm6EK2+GgSwr4i+A+w58fcyI+WqFq4uCKNuak3bGhD1ATO57JxG7OMmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789380775;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=VJC1wvAam9Lnk052jK71ByC+LUdi4TUgNP7k6H2rPOg=;
 b=TJNgFjY7su9nGdlBodzKohaJHwtdFoCITmTcUewxSF8toNB/f4E1t0cXDYzEm6jYk1pS
 E+Rm4FVvkrxS9affVtIpbdiOu1aMWe0qCCC0fVJsBHZaDtFLnrchna+2xvq9s3BPp4xAa
 q2amTStWvvut3sdNT8XED5VDFzlnVyZkOB0NVQa/iNljaxoPyS5UgYTgbCwCs/IGRcRdv
 TwFvuPqI/T6LD1+g/7ukG9Tm9BTFdtOtnhN/6tqR552ll53mYIDFqjsVa2HBPNZlVmve2
 iXMnlFkJbpjC4z4dcRnE9zPcng7mnjCTDOuN7apY+rmhefb0ZGWZ2lEp1VqWzMNav6w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC9B6405E2
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1789380771; bh=XDJsxVayushiMkJ/SKS34Ru91hZ+RfHFw2kBYaEDwDA=;
 h=Date:From:To:Subject:From;
 b=F8LZ52UOPVLJ1fTixyyc5w/YjFRQQm09jwa2aosiqFxMUL9a8O4J6xMesc4+oUeBW
 yW2oInCeXn9KhPc4IjLGqATOXtS5dkQKp2YXgs06Hlh2xKtl13oEIflxYtHnkJlLUd
 gMKdv1GJw8ftyI4yEVkW+hxDFQGkOuXLwT5R2wmQz2+GNEa4S+tXQy/MFZtAx6WRb5
 0oLX8nxJFLtBxapLJc1v4hJpoxksvqSWQnFwgjbqF0FqY/jbBoyVEx83rlK4in1Abg
 zOKFZNmwNbrI/JlNuqaaxDNAQxaurUqm53SFCQiP1fbXoBTKmSGhX0SGLmRXRZZ2mz
 Gsk9ieWIx+W7w==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1E47431E0505; Mon, 14 Sep 2026 12:12:50 +0200 (CEST)
Date: Mon, 14 Sep 2026 12:12:50 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aqfIorWR8_0zlvgB@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/libpam-pkcs11: bump to 0.6.14
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

Minor bugfix release, see here for a Changelog:
https://github.com/OpenSC/pam_pkcs11/releases/tag/pam_pkcs11-0.6.14

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libpam-pkcs11/libpam-pkcs11.hash | 2 +-
 package/libpam-pkcs11/libpam-pkcs11.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpam-pkcs11/libpam-pkcs11.hash b/package/libpam-pkcs11/libpam-pkcs11.hash
index 95747afc08..01d6fcd17c 100644
--- a/package/libpam-pkcs11/libpam-pkcs11.hash
+++ b/package/libpam-pkcs11/libpam-pkcs11.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8a853f4e6e136ceecdcffad798570e3d6af2fde08e975656b2dc931989c35aff  pam_pkcs11-0.6.13.tar.gz
+sha256  5d9acdb177ea2dfd7b698f6cdcc485107888cc1c9dcd15227436831c098a4075  pam_pkcs11-0.6.14.tar.gz
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libpam-pkcs11/libpam-pkcs11.mk b/package/libpam-pkcs11/libpam-pkcs11.mk
index 4bad47f69a..0b952492cb 100644
--- a/package/libpam-pkcs11/libpam-pkcs11.mk
+++ b/package/libpam-pkcs11/libpam-pkcs11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPAM_PKCS11_VERSION = 0.6.13
+LIBPAM_PKCS11_VERSION = 0.6.14
 LIBPAM_PKCS11_SOURCE = pam_pkcs11-$(LIBPAM_PKCS11_VERSION).tar.gz
 LIBPAM_PKCS11_SITE = https://github.com/OpenSC/pam_pkcs11/archive/refs/tags
 LIBPAM_PKCS11_LICENSE = LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
