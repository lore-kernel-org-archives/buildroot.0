Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE9FC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 21:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FAB76083F;
	Mon, 19 Aug 2024 21:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrlcKgMWoQ6E; Mon, 19 Aug 2024 21:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BE1860600
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE1860600;
	Mon, 19 Aug 2024 21:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D40FC1BF398
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C152740174
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKSi3dKBsbYz for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 21:31:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 250DB40170
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 250DB40170
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 250DB40170
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 21:31:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 084FD20003;
 Mon, 19 Aug 2024 21:31:44 +0000 (UTC)
Date: Mon, 19 Aug 2024 23:31:44 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240819233144.5a3ed08f@windsurf>
In-Reply-To: <ZsM3ZxeXudm/p3Jf@waldemar-brodkorb.de>
References: <ZsM3ZxeXudm/p3Jf@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724103105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3WD47JwXbiZqc3NU+9H6QOLnJINfPuDjrIEiBbRJ4M=;
 b=X3dnk/6+MIFOp0Pao+DYXtEhZHURLqbQo6PTpDMIpIt2u4DUbSbmzx98pa9tL6HT9dtnmu
 a72XHwUlHvUQI2+/3F8B35LTK9jH8H7pnbpt43E/Gh/8h003YqJ3yt3ka5rTDeZWz0e1iW
 I9TpLkk7eF5pvJKBXezy2iXV7OiPRROvwAxEahwZj7/zimTMGaNuipyym5/dlCBP4HM/eh
 mzG9ly3VIqO6WA2Yd1pc0qWH3PhL8I4VRhn2hP76YVESsrnFZa+I7Fi1Hq0layV78SOZz0
 9vsgKCA1kFub8546OAERJPlUhl1d2Tfi4YD3nh8SjNXIohC4dn4TTphGvetXzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X3dnk/6+
Subject: Re: [Buildroot] [PATCH] package/strongswan: fix wolfssl compile
 issue
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

On Mon, 19 Aug 2024 14:15:35 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Disable RNG support so that following build failure does not happen:
> In file included from ../../../../src/libstrongswan/plugins/plugin.h:28,
>                  from wolfssl_plugin.h:34,
>                  from wolfssl_plugin.c:29:
> wolfssl_plugin.c: In function 'get_features':
> ../../../../src/libstrongswan/plugins/plugin_feature.h:321:119: error: 'FEATURE_WC_RNG' undeclared (first use in this function); did you mean 'FEATURE_RNG'?
>   321 | #define __PLUGIN_FEATURE_REGISTER(type, _f)                                     (plugin_feature_t){ FEATURE_REGISTER, FEATURE_##type, .arg.reg.f = _f }
>       |                                                                                                                       ^~~~~~~~
> ../../../../src/libstrongswan/plugins/plugin_feature.h:332:73: note: in expansion of macro '__PLUGIN_FEATURE_REGISTER'
>   332 | #define _PLUGIN_FEATURE_REGISTER_RNG(type, f)                           __PLUGIN_FEATURE_REGISTER(type, f)
>       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../../../../src/libstrongswan/plugins/plugin_feature.h:248:39: note: in expansion of macro '_PLUGIN_FEATURE_REGISTER_RNG'
>   248 | #define PLUGIN_REGISTER(type, f, ...) _PLUGIN_FEATURE_REGISTER_##type(type, f, ##__VA_ARGS__)
>       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
> wolfssl_plugin.c:510:17: note: in expansion of macro 'PLUGIN_REGISTER'
>   510 |                 PLUGIN_REGISTER(RNG, wolfssl_rng_create),
>       |                 ^~~~~~~~~~~~~~~
> ../../../../src/libstrongswan/plugins/plugin_feature.h:321:119: note: each undeclared identifier is reported only once for each function it appears in
>   321 | #define __PLUGIN_FEATURE_REGISTER(type, _f)                                     (plugin_feature_t){ FEATURE_REGISTER, FEATURE_##type, .arg.reg.f = _f }
>       |                                                                                                                       ^~~~~~~~
> ../../../../src/libstrongswan/plugins/plugin_feature.h:332:73: note: in expansion of macro '__PLUGIN_FEATURE_REGISTER'
>   332 | #define _PLUGIN_FEATURE_REGISTER_RNG(type, f)                           __PLUGIN_FEATURE_REGISTER(type, f)
>       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../../../../src/libstrongswan/plugins/plugin_feature.h:248:39: note: in expansion of macro '_PLUGIN_FEATURE_REGISTER_RNG'
>   248 | #define PLUGIN_REGISTER(type, f, ...) _PLUGIN_FEATURE_REGISTER_##type(type, f, ##__VA_ARGS__)
>       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
> wolfssl_plugin.c:510:17: note: in expansion of macro 'PLUGIN_REGISTER'
>   510 |                 PLUGIN_REGISTER(RNG, wolfssl_rng_create),
>       |                 ^~~~~~~~~~~~~~~
> make[6]: *** [Makefile:659: wolfssl_plugin.lo] Error 1
> 
> Reported Upstream:
> https://github.com/strongswan/strongswan/issues/2410
> 
> This build failure started since 5.9.11 update in commit
> 78959665b94b412d7a82ee43e3ede14278a5d924.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/278/278b3f74c48c858ae368d59069752adb69c05246
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/strongswan/strongswan.mk | 5 +++++
>  1 file changed, 5 insertions(+)

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
