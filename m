Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FBAC3DA63
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 20:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77CB840E22;
	Wed, 24 Jul 2024 20:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTcEORG-m8DL; Wed, 24 Jul 2024 20:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 825E64052A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 825E64052A;
	Wed, 24 Jul 2024 20:02:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65F901BF2C8
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 613C04052A
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcStEopVflKQ for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 20:02:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6776440242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6776440242
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6776440242
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 20:01:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E871C0003;
 Wed, 24 Jul 2024 20:01:58 +0000 (UTC)
Date: Wed, 24 Jul 2024 22:01:57 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240724220157.0217f28e@windsurf>
In-Reply-To: <20240724163806.262384-1-fontaine.fabrice@gmail.com>
References: <20240724163806.262384-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721851318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/DWs0GN4HCutcyVqtzWisgNmAkRjb0J58DW7DbCQMZs=;
 b=kvACJmXkvw5j2/2I021F91nUVqFVySj0sktaQct0puNx6vvBar1AaIw5WJNYM7PB/OPTGi
 vh0a1OCQ3ChgnlMTigGmmO8zuAUcGz9oOE5WYeXb9TJo2+Vz7y0Uw24QIOfwlA7ySc4pE2
 ohRcoL2N6At3qeDw1ZNZ8Sov3inFEkz6dFvT1OeESjMa21RljwNuQhHtze4ryffh7GTcs/
 xjVROsN6m0CLTr0XLR6DxONnDucjZn+ucvarLALexcH6lYbFax77SiPyAu+W/ZRu4ccBZF
 SfhNn63c26C9kwIRATrGmq7xTbMh1VBTk7PPw46SmD1Hoj9CoUq5N6JvNKfTbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kvACJmXk
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: fix powerpc64 build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 Jul 2024 18:38:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with powerpc64 raised since bump to
> version 3.8.2 in commit 21eca49ed5110872407b76ab9337d2877c4cda24:
> 
> In file included from /home/autobuild/autobuild/instance-23/output-1/build/libressl-3.8.4/crypto/rc4/rc4_enc.c:61:
> /home/autobuild/autobuild/instance-23/output-1/build/libressl-3.8.4/crypto/../include/openssl/rc4.h:75:9: error: unknown type name 'RC4_INT'
>    75 |         RC4_INT x, y;
>       |         ^~~~~~~
> 
> Fixes: 21eca49ed5110872407b76ab9337d2877c4cda24
>  - http://autobuild.buildroot.org/results/2533f8f642f435b40ce687b6df482c51a3fa0250
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ists-txt-Fix-HOST-variable-for-ppc64.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/libressl/0004-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch

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
