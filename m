Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D109C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D31B060E30;
	Wed,  4 Jun 2025 18:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0yUx3NnJppL; Wed,  4 Jun 2025 18:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B911608D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B911608D1;
	Wed,  4 Jun 2025 18:47:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44FADDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ADEC40B10
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRoBmFW-QD3P for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F86640AF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F86640AF4
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F86640AF4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:47:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A5BF21C107E; Wed,  4 Jun 2025 20:47:09 +0200 (CEST)
Message-ID: <dd1d070e-394d-4186-aa34-fbd2c5fc574a@rnout.be>
Date: Wed, 4 Jun 2025 20:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>, buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250602080056.2466471-1-roykollensvendsen@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250602080056.2466471-1-roykollensvendsen@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749062829; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rkjLa6Y+c816ufAP6b0BwOE9GnNYQfosemHxzh768wo=;
 b=Qj3M3XDmuNa8x/utboL3Lw5w40MI+1TEeSmysU7zNLHbL9EjLe/AydwL95JaOHO5YI6Ddk
 z6My2NIKwdAICwNE/zUjryIBG05+oYVMzFaS5G1pCOb8sav8vQ/m9gTtVH2NomU7NDWza9
 rloBQ9aUp1Q0YcYylIGzJyl+AMcU1TQ4yLKAYgaqWVQHvX6mtWZaqHSo0X/vFW6NnCXMB2
 iXpTqZgo7nkyRNC9t2rEL023S1BAkUFaXAAH36f80fHX93IZPo3XhWJy+/QGZThDR6zCwx
 nSO94X8dx3MbyIAD1vCL0bvAWlV07xDir2yDGX38ERuy4GHz7ed+nNGdbkvlFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Qj3M3XDm
Subject: Re: [Buildroot] [PATCH v4 0/3] package/qt6/qt6tools: fix build
 failures
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/06/2025 10:00, Roy Kollen Svendsen wrote:
> These patches were originally part of the series bumping Qt6 to 6.9.0.
> 
> The fixes were rebased on the old 6.8.1 version, and reordered to match
> the order in which they actually appeared.
> 
> The commit messages and comments were updated.
> 
> Backport to: 2025.02.x, 2025.05.x

  A bit premature to talk about backporting to 2025.05.x :-)

  Applied to master, thanks.

  Regards,
  Arnout

> 
> Changes v1 -> v2:
>    - add missing patch "package/qt6/qt6tools: build without clang support"
> Changes v2 -> v3:
>    - remove options to build assistant, designer and linguist for target
> as there is no good use-cases for these in buildroot for the moment (suggested by Thomas)
>    - since target assistant, designer and linguist are unconditionally disabled, I
> remov the target package.
>    - squash the target build fixes related to assistant, designer and linguist
>    - remove unised host option
> Changes v3 -> v4:
>    - it was not a good idea to remove the target variant, as this is needed, so we just
> unconditionally disable the the targets that fail to build.
> 
> Roy Kollen Svendsen (3):
>    package/qt6/qt6tools: avoid build failures
>    package/qt6/qt6base: remove unused hidden host option
>    package/qt6/qt6tools: build without clang support
> 
>   package/qt6/qt6base/Config.in.host  |  5 -----
>   package/qt6/qt6base/qt6base.mk      | 10 +---------
>   package/qt6/qt6tools/Config.in.host |  3 ---
>   package/qt6/qt6tools/qt6tools.mk    | 13 +++++++++++++
>   4 files changed, 14 insertions(+), 17 deletions(-)
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
