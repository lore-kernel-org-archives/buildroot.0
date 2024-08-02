Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0A8C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 20:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4038E410C4;
	Fri,  2 Aug 2024 20:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UWzGeI1uWmg; Fri,  2 Aug 2024 20:07:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5D3410E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5D3410E6;
	Fri,  2 Aug 2024 20:07:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDD9A1BF37F
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B75C4606C6
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 20:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Snc3pe3xUNpj for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 20:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9C3BB606C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C3BB606C0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C3BB606C0
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 20:07:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 696371BF205;
 Fri,  2 Aug 2024 20:06:58 +0000 (UTC)
Date: Fri, 2 Aug 2024 22:06:57 +0200
To: Kory Maincent via buildroot <buildroot@buildroot.org>
Message-ID: <20240802220657.6ae4a337@windsurf>
In-Reply-To: <20240620143853.1259543-2-kory.maincent@bootlin.com>
References: <20240620143853.1259543-1-kory.maincent@bootlin.com>
 <20240620143853.1259543-2-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722629218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFi6GUIDWPqMBE18PeHBhqKv4lM4zR95wdeCUScFfzw=;
 b=OQ2UDo21wQ4nSf191L9pUXxGIDG3q/KXYw0GGeW22nQp/R7cOiYWXPGSqhEu9P5cTA5v5R
 QKBMq8ofnMvpRv2CLwovI+VoxPUwZPyJzGTrsaYpWKTRf5//fNxx03i/zNIFGAWlNaoiBR
 qfGHbusBFjeYq6pN+sQZPxJZ5+Gl9UaYmVh9iTHOmw+pKFwfUwS8q0qoL2GtgwLFhhVXFe
 aSu3gTxPjAkdmHysHZCgiGq7Ao9PE7RmfiKaU1TgzzxPoMstUvWJaiJyuAiBvZjvRyZxby
 LbHnbwg+4L0RC7mSapnkChIRH7nmqeeLAAUWWjXWpJgiBLuxfk9pYW8aUyy09w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OQ2UDo21
Subject: Re: [Buildroot] [PATCH 1/3] package/optee-client: Add support for
 custom tarball
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Jun 2024 16:38:51 +0200
Kory Maincent via buildroot <buildroot@buildroot.org> wrote:

> OP-TEE OS supports custom tarballs. If the OP-TEE OS custom tarball version
> does not match the latest optee-client version supported by Buildroot,
> optee-client might not build or run properly. This patch adds support for
> an optee-client custom tarball URL to address this potential issue.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  package/optee-client/Config.in       | 38 ++++++++++++++++++++++++++++
>  package/optee-client/optee-client.mk | 24 ++++++++++++++++--
>  2 files changed, 60 insertions(+), 2 deletions(-)

Thanks, series applied!

I just dropped the:

ifeq ($(BR2_PACKAGE_OPTEE_CLIENT_LATEST),y)

around the LICENSE_FILES. Indeed, we can now override the hash files in
a per-configuration basis, so this should no longer be needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
