Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D0BC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0897960E2F;
	Mon,  1 Jan 2024 20:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0897960E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uX6oexJzxU6q; Mon,  1 Jan 2024 20:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4422E60E5D;
	Mon,  1 Jan 2024 20:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4422E60E5D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9432F1BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D09981380
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D09981380
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFj9RxMvaG1t for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:36:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E498D8137C
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E498D8137C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E3BAE0002;
 Mon,  1 Jan 2024 20:36:09 +0000 (UTC)
Date: Mon, 1 Jan 2024 21:36:09 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101213609.402e27c8@windsurf>
In-Reply-To: <20231229220427.47110-1-fontaine.fabrice@gmail.com>
References: <20231229220427.47110-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704141370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dyLZ9kC7wvaLb4+YXR+kXsnEuz8Gk6R4fd0sDOeAopA=;
 b=chdxJ6JcL/3BevG4qK9smrhF//VkS2N9XNbVGIpOXtqZC2rCDvIzgtZPBQAQ2fWwa28Vh7
 4PAszEAJy236grIWfkhm6x6JDN8ZzQF2s4tQABRyKuzchDPUjECVKbC3HBZDgnJtmlkikD
 rsf2/vwWfGH5Yq5S62wdA0WH64IJlci2M6eaMaRW887coVZf2gbcxEp71WCv4fdhIYU3wa
 UMFyplU0IBSyeLYtoUWhMN1wWksfi5ABKX0/u8vvnPzl55mPQF+9zrnyRjOlhYm+3jCj9D
 pLYoeq/MyPyltzWvPTdePJR8xwvxjhBKCYrHlR6swD8cpZvmW/gJwXhgo+KKfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=chdxJ6Jc
Subject: Re: [Buildroot] [PATCH 1/1] package/libiio: fix build with libxml2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Dec 2023 23:04:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump of libxml2 to version
> 2.12.1 in commit d8ac52108c12f0fcc9641b63e7922009270f96c6:
> 
> /home/buildroot/autobuild/instance-1/output-1/build/libiio-0.25/xml.c: In function 'xml_create_context':
> /home/buildroot/autobuild/instance-1/output-1/build/libiio-0.25/xml.c:481:15: warning: implicit declaration of function 'xmlReadFile' [-Wimplicit-function-declaration]
>   481 |         doc = xmlReadFile(xml_file, NULL, XML_PARSE_DTDVALID);
>       |               ^~~~~~~~~~~
> /home/buildroot/autobuild/instance-1/output-1/build/libiio-0.25/xml.c:481:43: error: 'XML_PARSE_DTDVALID' undeclared (first use in this function); did you mean 'XML_DOC_DTDVALID'?
>   481 |         doc = xmlReadFile(xml_file, NULL, XML_PARSE_DTDVALID);
>       |                                           ^~~~~~~~~~~~~~~~~~
>       |                                           XML_DOC_DTDVALID
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f97c2db33e07a02699e4650caf97de5f3c475eb8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...l-Fix-compatibility-with-libxml-2-12.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
