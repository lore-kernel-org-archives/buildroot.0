Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94285C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6271C4069D;
	Mon, 12 Feb 2024 21:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-Zwc8nF09rS; Mon, 12 Feb 2024 21:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80730407B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80730407B2;
	Mon, 12 Feb 2024 21:56:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73F641BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6143D81FBB
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qxnCdVUWKYK for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:56:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 138C381F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 138C381F6E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 138C381F6E
 for <buildroot@busybox.net>; Mon, 12 Feb 2024 21:56:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B01820003;
 Mon, 12 Feb 2024 21:56:34 +0000 (UTC)
Date: Mon, 12 Feb 2024 22:56:33 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20240212225633.483a6ff1@windsurf>
In-Reply-To: <20240212172619.13550-1-francois.perrad@gadz.org>
References: <20240212172619.13550-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707774994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMJwVEaqN97xVuO0moTfkLz8WwHgSEPCmCT5Od5+uNw=;
 b=Fxm3ppUQ6hYHqrrrDx64Nj48/fHyrzH/GVgp6aSqmdO5z1fFbjQlXmVy45BgOtc/tGVRtB
 ajyuC/2IBRPKu0fL+FMvKX3hP/n55YY5yCpsZLuU7Ss1Yxbft03iKZWByb0JBMcrqjEBHw
 0EZ3Puews6UZ4Tv8u1SztCPz1qKnnYv7T4z3a9D7jov5NRgJGVPWAg7xj38jcEWftWODBk
 dcKQla/Lh11E4ydfw0tv1FapSRrUtDI1CID6h+L0eLeaBuTeObflOpcY6tUGohnTQrD8do
 WCEEy5qT/+0EF7iYgC2IXEC9AtIGyiHaeyCNdfrkmj7w70P1hzjqpWejurW80Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fxm3ppUQ
Subject: Re: [Buildroot] [PATCH v2] package/lua-http: fix CVE-2023-4540
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Feb 2024 18:26:19 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> see https://nvd.nist.gov/vuln/detail/CVE-2023-4540
>   & https://cert.pl/en/posts/2023/09/CVE-2023-4540
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...andle-EOF-when-body_read_type-length.patch | 71 +++++++++++++++++++
>  package/lua-http/lua-http.mk                  |  3 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch

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
