Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D6DD59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FF79606B8;
	Wed,  6 Nov 2024 22:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TO6ErjjhvDoe; Wed,  6 Nov 2024 22:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7450160A88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7450160A88;
	Wed,  6 Nov 2024 22:26:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D04B4C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59891400E0
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZzDqIqagIRA for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 134D240720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 134D240720
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 134D240720
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:26:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E70140005;
 Wed,  6 Nov 2024 22:26:23 +0000 (UTC)
Date: Wed, 6 Nov 2024 23:26:23 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon
 <asafka7@gmail.com>
Message-ID: <20241106232623.64b7b474@windsurf>
In-Reply-To: <20241105165235.1384246-1-james.hilliard1@gmail.com>
References: <20241105165235.1384246-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730931984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=viHsffvTthY3OCCAilMMW+p1v2aiu4sAsIySi4rpbms=;
 b=O+/NUz6lrxUSEUFv0uKsU0KRPv3I5+1KW/w92Gxv1xegWRfcIvltEKp+RiWF4hgezubDvo
 2brcPF0gylp4yWhiouWvk16nun4AQNTO4U+a1ckEXmeOHjoEAryb12K9qAzg3/ZGRrWNCJ
 D6ZI4aSyk7kJxHfmu1hhmxT9jE/aMW/rXG92WbBLXJQcIbn8SlOUxz9aLZbVDzy6VHbqu/
 0GzAbJnXmGx5ARatfJLXoWyMJtBPbe04s8Yw1DO2J9qKXLLIHcziPWb34oPq6HadXXyI08
 IynPd8xmiAeTS+19xwGwPSV3CuHmuDfMx3Cbow/3hxgOfl51hQ1VTPMus25O9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O+/NUz6l
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-babel: use poetry
 setup type
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  5 Nov 2024 09:52:35 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Use the new poetry setup type which automatically pulls in the
> host-python-poetry-core dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask-babel/python-flask-babel.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

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
