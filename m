Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1708C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DD8860759;
	Sun, 21 Jul 2024 16:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozBDL6ucV2dK; Sun, 21 Jul 2024 16:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B66F60837
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B66F60837;
	Sun, 21 Jul 2024 16:35:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A57D51BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9191A80DBE
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKkoRhYbTca7 for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:35:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7139D80D9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7139D80D9A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7139D80D9A
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:35:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D57A1FF803;
 Sun, 21 Jul 2024 16:35:02 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:35:02 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240721183502.489a1546@windsurf>
In-Reply-To: <20240721150011.1437080-1-fontaine.fabrice@gmail.com>
References: <20240721150011.1437080-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/7dAY4jz+sUShdsFub4WAzsfmFwyI7hAnHU31zR2ZU=;
 b=OuV1Gbb+XYdqBH99S09Js6BXvpLv0nkUYvnVGa4Id2kGkAnM4GUzARVANHq/8rspEFu0KX
 TDtITs6Qi1T1QfTy9FpqC2crYOBYt9N9vDNPjWUuDcS5z05earCLNVTB+QN6VvGdoGP91R
 HXa8SvP7fYnDxhclhX+4SGL8LgapCwIYUBBkwKLDEGdqrUwChqbwfQ5zzHlR+RvYyXqXhr
 CDaHz6zyeds0H1T5nTG+zSzG9KY61uNJ+OGCto+c5GWE6T6FbBsKwInX7djDMJF6d8G7Rv
 Nh58YY9LZ6Ts6vPo9b++CBjU1njzGokp5OAoruxV0ShKocTj5lle8mOrE0ZWGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OuV1Gbb+
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
Cc: Stefan Ott <stefan@ott.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Jul 2024 17:00:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> unbound unconditionally calls the (deprecated) ENGINE_* logic in
> libopenssl resulting in a build failure when
> !BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
> 623d3bbe43e9193aa8e3395367d01af59071b859:
> 
> sldns/keyraw.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
>   167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
>       |                                   ^~~~~~~~~~~~~~~~~
> 
> Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
>  - http://autobuild.buildroot.org/results/b7782f5ba54543df53a835552632f58d4ad6c082
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/unbound/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
