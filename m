Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAC3C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 17:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB57605FA;
	Wed, 21 Feb 2024 17:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejYJjp2E9Rs5; Wed, 21 Feb 2024 17:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CECA4606B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CECA4606B0;
	Wed, 21 Feb 2024 17:42:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD6741BF2FD
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9F6A41771
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 17:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grdNNXpqinE0 for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 17:42:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B761402B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B761402B1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B761402B1
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 17:42:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A8ACC13F879;
 Wed, 21 Feb 2024 18:42:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 18:42:39 +0100
Date: Wed, 21 Feb 2024 18:42:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZdY2Dx9HxdRxvTqH@landeda>
References: <20240221173916.1095723-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221173916.1095723-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708537362;
 bh=qZlSHdlmw67ExAkc6tOfq/P0jivetBxUsU+Zf+fW6oU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bgQP8MUildzNfXzvmmmt3H+Uc2mNxVYSDeKpNPSNHIcSFmWJd1dVhXGqE5rhgiRXY
 RCSX8I47WRQDaDOL9WEfXx2aBmU2baDEjrGX5ddX2KI0GRQ8Lv/XKJHlu7oHiRF+Do
 +B9TiF+HpOX4Eeh334/UF/764ebm0DYAxD+Dcc0yOnxT/ei1PSwhyjjehZuudJpJvC
 xgUKjrzfe3XdiL5R3tOuK9y47fdy9Mlob8xlUO/Sfw+RVCFtl8MfmkwLLvtpWhUoup
 6/mrnSfKcMVIe+gVCDyKOOBPUqPe/RWkT85IwmI7daK6fjfSnPpv60O+gpUCkZuFiA
 8DMaRCSMzIhWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bgQP8MUi
Subject: Re: [Buildroot] [PATCH 1/1] package/cegui: fix build with libxml2
 >= 2.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-02-21 18:39 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of libxml2 to version
> 2.12.1 in commit d8ac52108c12f0fcc9641b63e7922009270f96c6:
> 
> /home/buildroot/autobuild/instance-1/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp: In member function 'virtual void CEGUI::LibxmlParser::parseXML(CEGUI::XMLHandler&, const CEGUI::RawDataContainer&, const CEGUI::String&, bool)':
> /home/buildroot/autobuild/instance-1/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp:111:40: error: invalid conversion from 'const xmlError*' {aka 'const _xmlError*'} to 'xmlError*' {aka '_xmlError*'} [-fpermissive]
>   111 |         xmlError* err = xmlGetLastError();
>       |                         ~~~~~~~~~~~~~~~^~
>       |                                        |
>       |                                        const xmlError* {aka const _xmlError*}
> 
> Fixes: d8ac52108c12f0fcc9641b63e7922009270f96c6
>  - http://autobuild.buildroot.org/results/b239b7b03542311e311e4612e9b811c154302a6e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-of-xmlGetLastError-for-libxml2-2-12.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
> 
> diff --git a/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch b/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
> new file mode 100644
> index 0000000000..9091062e28
> --- /dev/null
> +++ b/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
> @@ -0,0 +1,29 @@
> +From 285ba5a2c0c435ed865c6e86afe314a822fd1e3f Mon Sep 17 00:00:00 2001
> +From: oreo639 <oreo6391@gmail.com>
> +Date: Sun, 18 Feb 2024 14:16:21 -0800
> +Subject: [PATCH] Fix return type of xmlGetLastError for libxml2 2.12
> +
> +https://gitlab.gnome.org/GNOME/libxml2/-/commit/45470611b047db78106dcb2fdbd4164163c15ab7
> +
> +Upstream: https://github.com/cegui/cegui/commit/285ba5a2c0c435ed865c6e86afe314a822fd1e3f
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + cegui/src/XMLParserModules/Libxml2/XMLParser.cpp | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp b/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
> +index 74a3dbddd..a408f9305 100644
> +--- a/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
> ++++ b/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
> +@@ -109,7 +109,11 @@ void LibxmlParser::parseXML(XMLHandler& handler,
> + 
> +     if (!doc)
> +     {
> ++#if LIBXML_VERSION >= 21200
> ++        const xmlError* err = xmlGetLastError();
> ++#else
> +         xmlError* err = xmlGetLastError();
> ++#endif
> + 
> +         throw GenericException(
> +             String("xmlParseMemory failed in file: '") +
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
