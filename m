Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E12BFEE4F8
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 21:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28C7060FEF;
	Sat, 28 Feb 2026 21:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PijJu8TdmXQo; Sat, 28 Feb 2026 21:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA5960FEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772313112;
	bh=nmm8huO3y8oGMZtPExoyrc7SsZdz1RRZnrzR8It0Hps=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lGE1KS8m70lz4vPiCk8UQW40xZmeftHHVZ8ljwxQczV+0QA9lUoQ58OHp8eny5Wu5
	 YA3lIUyZTYC1CecoByYlpWJMDAwhYiq7Gcru8rQSFqkk8/vq5tkYml+OGjQ1tmM4dF
	 NqFPlQjCETfpG+KzoaSTDQIaNfLDpZAENXtnVrGEzM7HFrFw2Yf++SVf/nzZiTKG+Z
	 Zai8F26s+D6EqFzUf9MEeuxNBoQke14aPVM5I1jWZSG8u+kXUiCywhUUcGsAlGXQNx
	 O2V5lrerJJtt3RCuPN3py35o4HqfE8AF4ZyrbaXJAT53qbPI+5SzSbQgGyAuEA4SAA
	 zkgsM4a6o9FRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCA5960FEB;
	Sat, 28 Feb 2026 21:11:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 931B618D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78DCB60FEB
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74lhWcQPXwR2 for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 21:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CB1C60F7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CB1C60F7B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CB1C60F7B
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 21:11:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQJ5-1vJHRL2Bq3-00aCmt; Sat, 28
 Feb 2026 22:11:40 +0100
Message-ID: <189d197f-7eaa-4451-ae87-53ac052313d2@gmx.de>
Date: Sat, 28 Feb 2026 22:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Afshin Pir <Afshin.Pir@gallagher.com>
References: <SYAPR01MB2784705D867B9F21DE6958119474A@SYAPR01MB2784.ausprd01.prod.outlook.com>
 <f3fd06cf-ef36-41a8-a1c7-3be67fad1a8b@gmx.de>
 <SYAPR01MB27842E68F6D883C8AAB9E82C9475A@SYAPR01MB2784.ausprd01.prod.outlook.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
Cc: Buildroot ML <buildroot@buildroot.org>,
 Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <SYAPR01MB27842E68F6D883C8AAB9E82C9475A@SYAPR01MB2784.ausprd01.prod.outlook.com>
X-Provags-ID: V03:K1:OehegbGueYzYjjC/JHxEOI5I+YulbDxVV+HQ3nRTUL9b1UbdRiv
 kcOaXfLvYqujc68elkbrEI33t0i19yNofpB9+w0FCVlevZu+zdZZIKQE/2hVcKqPqQIGnwH
 KGwzeBGpEz8ALy0VTY2ySI2JkgyhBbNaocUo+lcqot+crm/17Ie1pCMrBkhvHzjwCmNtGYW
 vcKP6wwFGV7F6c1fVb6nQ==
UI-OutboundReport: notjunk:1;M01:P0:0Hu0MYdWpSQ=;qpiCsTfl2FkYytzY0I5S4/+FEYj
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772313100; x=1772917900; i=fiona.klute@gmx.de;
 bh=iOKPjUQdaVBOCaSODRiB0QoXR0rDU6By+0GigrW6Xmo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:Cc:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=MSJFYLmHFL5zmA0t+qcz/24lvMK9thSTTYxKvOvJ5MtIhF8hd2yiozuhu/kCdlep
 WA8lVPi/HQNpiz2CieVkX1cB/RytM8NENY0vJ65E+xfD8+uQlYz7r4afiZ3j9aAIq
 DY3S+QXeqSQ4mjGzncYZrGrxDO4hWLh1jr1UEf6R/eCH+bFz2ENbXDzwG7Q+f6i0C
 2qo1/tTyoNiCmzVeKyYpoLtcDmgD6Q4TF5PuyGrolwTgjsudpI53osAuxHR3F6eyh
 p9KL2dHoh3j6w3+DykQJFKZaPLoMoe636S/5NQFnvM7kPN3dKJFxHFlM2w9ZO5J3G
 qkNntwp2rA9NuiteFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MSJFYLmH
Subject: Re: [Buildroot] Cargo package dependencies for local package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Afshin,

please keep the discussion on the mailing list unless you want to 
contract me for support.

Am 26.02.26 um 00:45 schrieb Afshin Pir:
> Hi
> 
> That was practically first thing that I tried but I somehow could not get it work. Maybe I give it another go.
> I was able to get local method work with a hacky workaround like this:
> 
> define HELLO_WORLD_GET_DEPS
>      mkdir -p "$(@D)/.cargo/"
>      mkdir -p "$(BR_CARGO_HOME)"
> 
>      $(HOST_MAKE_ENV) \
>          $(HOST_CONFIGURE_OPTS) \
>          CARGO_HOME="$(BR_CARGO_HOME)" \
>          flock "$(BR_CARGO_HOME)"/.br-lock \
>          cargo vendor \
>          --manifest-path "$(@D)/Cargo.toml" \
>          "$(@D)/VENDOR" \
>          > "$(@D)/.cargo/config.toml"
> endef
> 
> CXOS_HELLO_WORLD_POST_RSYNC_HOOKS += HELLO_WORLD_GET_DEPS
> 
> But if I get git method to work, it will be much simpler.

Here's an example from my external tree (if anyone else is interested in 
the package for Buildroot I can send a patch). I can replace the _SITE 
URL (commented out) with the path of a local clone:

IIO_RRD_BRIDGE_VERSION = v0.2.1
#IIO_RRD_BRIDGE_SITE = https://codeberg.org/airtower/iio-rrd-bridge.git
IIO_RRD_BRIDGE_SITE = $(HOME)/development/iio-rrd-bridge
IIO_RRD_BRIDGE_SITE_METHOD = git
IIO_RRD_BRIDGE_LICENSE = Apache-2.0
IIO_RRD_BRIDGE_LICENSE_FILES = LICENSE
IIO_RRD_BRIDGE_DEPENDENCIES = libiio rrdtool

# Rust links statically by default with musl, switch to dynamic.
IIO_RRD_BRIDGE_CARGO_ENV = \
	CARGO_BUILD_RUSTFLAGS="-C target-feature=-crt-static" \
	BINDGEN_EXTRA_CLANG_ARGS="-I$(STAGING_DIR)/usr/include"

$(eval $(cargo-package))

If I delete the source archive "make iio-rrd-bridge-source" will rebuild 
it just fine, no matter which _SITE variant I use.

Also, Marcus sent a patch for cargo packages and OVERRIDE_SRCDIR a few 
days ago [1], maybe that could be adapted to make the "local" method 
work, too.

Best regards,
Fiona


[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20260223164257.486598-1-buildroot@bubu1.eu/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
