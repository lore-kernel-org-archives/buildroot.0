Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176D0C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6BEC8174D;
	Sun, 15 Sep 2024 08:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZ85da6KC4Sq; Sun, 15 Sep 2024 08:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0FB881751
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0FB881751;
	Sun, 15 Sep 2024 08:35:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 782321BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 675DF607E6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2midafLCrft for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:35:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27EA5607E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27EA5607E4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27EA5607E4
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:35:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C983160003;
 Sun, 15 Sep 2024 08:35:10 +0000 (UTC)
Date: Sun, 15 Sep 2024 10:35:09 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240915103509.477e03f5@windsurf>
In-Reply-To: <20240915073805.1552173-1-james.hilliard1@gmail.com>
References: <20240915073805.1552173-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726389311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7JCCQRYkiqSwUTK9AqAzIa223AQJsPHvH+h+WHEdplE=;
 b=W2QZhl9KoJB3Dv5OrWcQd6X+FbD3cC0yJfETVHtziSZEvzVXdpSo0wNY4iwd0/zgmIFRv4
 TrFUMnzgacQ0yjB3Ra8Oz3HSlqEHTSzAHWW/3kWrsPrGjmmnA5UcJkhBnLG+HdExcBSACi
 nug/KTXXhmH/GHFdtDD4hcmRZfFYGxc1hfGh9+VBXc1OLNC52ixY9u0tkYICByeZzvSA26
 vIj0kGNgsqrKhfhiV1KcLcqhOF5YqHw0qSCUo81HtVC5U1dPnYlTGpctmZ5opt+aySeu78
 w1rlIZF5uuwgo4LcbZGa3vE2U12ikwmc69qXRp1HGl9TvMnOfq36T+aIWa8hSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W2QZhl9K
Subject: Re: [Buildroot] [PATCH 1/1] package/python-grpc-requests: bump to
 version 0.1.20
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sun, 15 Sep 2024 01:38:05 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Add new python-protobuf runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-grpc-requests/Config.in                 | 1 +
>  package/python-grpc-requests/python-grpc-requests.hash | 4 ++--
>  package/python-grpc-requests/python-grpc-requests.mk   | 4 ++--
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-grpc-requests/Config.in b/package/python-grpc-requests/Config.in
> index 1cdd0d3f67..ad29617795 100644
> --- a/package/python-grpc-requests/Config.in
> +++ b/package/python-grpc-requests/Config.in
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
>  	select BR2_PACKAGE_PYTHON_GOOGLE_API_CORE # runtime
>  	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
>  	select BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION # runtime
> +	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime

You're adding a select, but not propagating the "depends on" of
BR2_PACKAGE_PYTHON_PROTOBUF. In this case, I have already done so as
part of your previous google-api-core bump, which selected
python-proto-plus, which selected python-protobuf, and therefore also
had this dependency. But if possible try to be careful when adding
select, and think about those dependencies.

So here, I have just updated the comment next to the
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS depency:

-       depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-google-api-core
+       depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-google-api-core, python-protobuf

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
