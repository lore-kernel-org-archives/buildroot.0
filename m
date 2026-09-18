Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B805C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 20:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA9160E44;
	Fri, 18 Sep 2026 20:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M01IROm9fwJJ; Fri, 18 Sep 2026 20:46:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 96B7B60C0E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789764399;
	b=TEw4fFyoe5Sm0uq/AEIMWEi17CMIK6iSUIISz0AU4v3u6eV3Sh6+u7GhIpWjtSrWyXpQ
	 pkOKnePAaRa7XoeFknNqTSKWcDegmISELf3Cd2PfZ9NDTq0A8Jl0UYwu/A+znC4r/0UAz
	 n/4HkJ28G5HOa/Ckwy5HJan5YT0eVBHhdxXmM65fSKcesCGKfKIg6yxhQGjif6P5BH3uX
	 DEKm39A4JhBCojwMIfUzCGenKTT45UsS2kORVEijP/38Dc8pbMVEKHmXlgr4n+LHsedny
	 E9eYr0kdXGUzt1kouuhMspLRioATSjJTsz6tuaOzgy2xcEPuE2wL1o6BThSm5N7XZ4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789764399;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UixVXuSvej7lRBIMk40AubxSWVDZnYQRpxj/z/Oehvs=;
	b=g0rTm3DsYnSuBdJV5jB0Q9cJ3OgE0AIYBlo1OJV87AAPYbbBKCdpy3fPGpxAdwl7ZuMi
	 O4/fkixLsbnYECymperUMoPK+SfOcVXWR5Heefo74iFFYCADnu4nlbYgaDZojyTwbfPu9
	 9U7m5YegIZ3L8UrPy2nOEy+Q1LcSghCzi8kH3Rv3SWOlcPk4BnxZVWot0lZz3QyUezdgL
	 UGVukhGKpuLjVVF4kVRwHtbnwSvuqpt43qKfcq2kby2G+epAnngqJj5vU9ZEx7I20rTyS
	 YowWDh3de58gBL4O56zd7+q5JZ2nxoDILfIahJx0YZ0I3Ia7X7HwTmq04fgzOycZKjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789764399;
	bh=UixVXuSvej7lRBIMk40AubxSWVDZnYQRpxj/z/Oehvs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qss0SSuWr4oHZUAEvBKtEEkSMSSKzrDOCyICErW+1U+QuL/g31kNt64ICWZAVZVjX
	 PEQWVQ/ZuiUcVTNEPagOXrEkSNdS7Cz6sl80WzIBnQ9kMbbOkTWEpU+Bd5BRE7L151
	 pMBj7hRRkCCieliDDVVKiZXsVPlBd2GLCiaRZS90JWf4889O/0UHQQFm9KJDl1opLB
	 YIG6ctSUxYuuvPh+ZThoJ/c6KDKKNq2A9cv2KJqaJbpEzi0zKhMvmbSKgu5bQs6+UZ
	 sO7eiEWbifAVhNVqKz2Npnsk+nY8b4oosjlU10UrZMIq5SWsV3Q3vwApxChGHf4IFN
	 VxLck2cU2iF2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96B7B60C0E;
	Fri, 18 Sep 2026 20:46:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87D4625B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79D4940BE6
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBOPy-IPtDdd for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 20:46:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E12C140BC9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789764396;
 b=jbuZYGSlAdxeDor5MNOXzNKyun2sWTo0hv0t+bcyThKyh6YceQPeXqIS+vxdjRMBL6BS
 0NMa5LI6fEBDtTe/2ZmiGoj+3ddgJDejz8ahGcy1VivUwhf30Gk3vttomjkb+ZQZurAzY
 WZ2H24EWZ12eYnwjeEdCxlDJs1+yLitpDDMwqiwFljNoGgHDDusw4rEbc3ebS28JSL8XU
 aV8gzWM6cjFnLadnInrwtgL3ezvKjP3gWmTKC5GfQx+yArIYotUJH74ezstmHdZzKm4T6
 sN/628nQ2ZAezPJ8LVSfb37rmSCJ68Sz9Uwo40B6RnM3Mn9DuDme5uUip5i06mIjHdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789764396;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Dey3UUbODZXH5qVPg9gdw4ypnavm5zehjrhBLSkZ4T0=;
 b=cIYfCKWxmIgw4YB/wv8KWLezsapeHnTbM+oy6wqmLLiCYkgZfPuRoa/nXH4SAwJ6F+MV
 oSNySqWUekMuSpOLc1hwVhWbmC/KB0txaX/5wlxFdNC0KADLDY7LTZ/aMXqCe1c/X0LP7
 oAHV4Nn6OqBR5lhunVuI8GDXS3ObOqe3wuC9OfwSRnQ0VKSOLCX54WG5tqsErDFEHgMJN
 SkBgL5xajkGmLxNB61EMmyft4e1GcMbMmQ/PrIELBfcMe20nPRN3jZ53Bqiz2Crw0tpTP
 YIdHVbKTXRjwDCsqf/ZkfKDpI+j6qWHvUjKkC/k6rAbkRK8NKjCfteAxe1tAMRGtQUA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E12C140BC9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:46:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 715C7976B1; Fri, 18 Sep 2026 20:45:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 22:45:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6fec797ebb79c50a496fcba6820935823aea4daf
X-Git-Newrev: fc5e3c8d9cf41778909619cb2cff14a5f1348405
X-Patchwork-Hint: ignore
Message-Id: <20260918204529.715C7976B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xmlstarlet: replace += by = when
 appropriate
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc5e3c8d9cf41778909619cb2cff14a5f1348405
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For unconditional dependencies, using += isn't useful, and our common
practice is to use a simple = assignment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xmlstarlet/xmlstarlet.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 2a38ae206d..17dd57f76b 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -9,7 +9,7 @@ XMLSTARLET_SITE = https://github.com/xmlstarlet/xmlstarlet/releases/download/$(X
 XMLSTARLET_LICENSE = MIT
 XMLSTARLET_LICENSE_FILES = COPYING
 
-XMLSTARLET_DEPENDENCIES += host-pkgconf libxml2 libxslt \
+XMLSTARLET_DEPENDENCIES = host-pkgconf libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -22,7 +22,7 @@ else
 XMLSTARLET_CONF_OPTS += --disable-static-libs
 endif
 
-HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt host-pkgconf
+HOST_XMLSTARLET_DEPENDENCIES = host-libxml2 host-libxslt host-pkgconf
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
