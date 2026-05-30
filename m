Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118D4CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB281408A3;
	Sat, 30 May 2026 13:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5-ow8xfPB4A; Sat, 30 May 2026 13:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0920A40877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146073;
	bh=oYr9EToRcKao495ZbYx5IhsZCVQPITwL8tNC4ssZBG0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YsIjdu4zgE5oVVzKzSTVp6mRflutJoMPw7Avso093CaTGTMtqa10W0t07WDsLq/7L
	 u7TdTqBgE3QpLGGp053IClcUXErtijxxQr3KQEfOMqJgZ8q8aI0eW3RJ04152gd6Ke
	 vyW3BCMMGRym1wI/8hl49zyFPtTa63j7NzzXq3w58JfLraX+76N4CmT0QcQJQ9B8po
	 AI0MOmqPuZQ+Dh7FURQieZaP6zkRmtR6nMVQjEGliaRtTC0rSNScZVDtW6LaegvpBA
	 osHiFTdLqrzqP7u9evUKkN6DmFjswSuTWlc7ThnUK6Hp1XrtgjBI+pcQsdgHNU9U8N
	 +js0xIQ89hTRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0920A40877;
	Sat, 30 May 2026 13:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E2CB5D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C123D6F545
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1YoksPYjhzwT for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:01:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E01D76F544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E01D76F544
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E01D76F544
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1AA59B97C71E; Sat, 30 May 2026 12:49:28 +0200 (CEST)
Message-ID: <7ec8f71a-63ba-4c71-af51-141841ca2d1f@rnout.be>
Date: Sat, 30 May 2026 12:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260411095704.1241777-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260411095704.1241777-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780138169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=vyrEU3m/gJqYcsAVC4BMy0MfxjmZUgWoTYhTvqRrHlc=;
 b=JCjWUR5unspKE3nXn9UYph9AH/h7AJa5uv7i5uHX4LlqboGPDLmx9DrFVmWXGjPf8ipMY2
 6Mlo4Wvl4vkYYTpnXTsB0xXUNDW1/aP0kPpMZFvoQp35M8dLpv2KNeKklHqUT8NJvki6G4
 AvF8/2kn2N8/7WozuMldj78THkXMBDPJjuzN79obREcFglLPLdztfOYN8u96AloH382TVl
 Lb3fuV3ZWSmXN2HUBfCBdYrNsUuC8NEeSZXlBBFkwGZKasaY0tsf1gjXEQXdiGUuYRDuWf
 aIZI2OUvDJlaLJzWcEUpdDLzOx620QY3KZ84QVdcPIfQ/aqEEY4irwdf9RbacA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=JCjWUR5u
Subject: Re: [Buildroot] [PATCH 1/1] package/suricata: fix build
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



On 11/04/2026 11:57, Bernd Kuhls wrote:
> Buildroot commit a3374e49baa45679997c37a25accaf1574132c4a bumped the

  I added "from 2026.05-rc1" here, so the LTS maintainers see right away it's 
not for them.

  Applied to master, thanks.

  Regards,
  Arnout

> package from 6.0.20 to 8.0.4.
> 
> Upstream included in version 8.0.1 a commit adding rustdoc as build
> dependency "required for the tests":
> https://github.com/OISF/suricata/commit/6d74656befe20cd939de8a97bfe272efa112c90b
> 
> This causes an error during configure in buildroot:
> 
>    checking for rustdoc... no
>    configure: error: rustdoc required
> 
> To fix we problem we add RUSTDOC=true to _CONV_ENV.
> 
> Fixes:
> https://autobuild.buildroot.net/results/489/48984ab369d01fae9b53b7b1f51e874bada0619f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   package/suricata/suricata.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
> index 0ee3752a21..56bbc0c89b 100644
> --- a/package/suricata/suricata.mk
> +++ b/package/suricata/suricata.mk
> @@ -30,6 +30,7 @@ SURICATA_DEPENDENCIES = \
>   SURICATA_CONF_ENV = \
>   	ac_cv_path_HAVE_SPHINXBUILD=no \
>   	CARGO_HOME=$(BR_CARGO_HOME) \
> +	RUSTDOC=true \
>   	RUST_TARGET=$(RUSTC_TARGET_NAME)
>   
>   SURICATA_MAKE_ENV = \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
