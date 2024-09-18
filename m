Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDE1CCD19A
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 11:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECF7C60733;
	Wed, 18 Sep 2024 11:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gZx3i61ZbGF; Wed, 18 Sep 2024 11:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 104736073E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 104736073E;
	Wed, 18 Sep 2024 11:09:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B867E1BF29C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 11:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4E0D4018D
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 11:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQg4esSb-vbS for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 11:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16A46400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16A46400F8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16A46400F8
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 11:09:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B84051BF20A;
 Wed, 18 Sep 2024 11:09:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sqsYv-00DBT4-3C;
 Wed, 18 Sep 2024 13:09:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <ZsM3ZxeXudm/p3Jf@waldemar-brodkorb.de>
Date: Wed, 18 Sep 2024 13:09:33 +0200
In-Reply-To: <ZsM3ZxeXudm/p3Jf@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Mon, 19 Aug 2024 14:15:35 +0200")
Message-ID: <87bk0ltdzm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Disable RNG support so that following build failure does not happen:
 > In file included from ../../../../src/libstrongswan/plugins/plugin.h:28,
 >                  from wolfssl_plugin.h:34,
 >                  from wolfssl_plugin.c:29:
 > wolfssl_plugin.c: In function 'get_features':
 > ../../../../src/libstrongswan/plugins/plugin_feature.h:321:119: error: 'FEATURE_WC_RNG' undeclared (first use in this function); did you mean 'FEATURE_RNG'?
 >   321 | #define __PLUGIN_FEATURE_REGISTER(type, _f)                                     (plugin_feature_t){ FEATURE_REGISTER, FEATURE_##type, .arg.reg.f = _f }
 >       |                                                                                                                       ^~~~~~~~
 > ../../../../src/libstrongswan/plugins/plugin_feature.h:332:73: note:
 > in expansion of macro '__PLUGIN_FEATURE_REGISTER'
 >   332 | #define _PLUGIN_FEATURE_REGISTER_RNG(type, f)
 > __PLUGIN_FEATURE_REGISTER(type, f)
 >       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
 > ../../../../src/libstrongswan/plugins/plugin_feature.h:248:39: note:
 > in expansion of macro '_PLUGIN_FEATURE_REGISTER_RNG'
 >   248 | #define PLUGIN_REGISTER(type, f, ...)
 > _PLUGIN_FEATURE_REGISTER_##type(type, f, ##__VA_ARGS__)
 >       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
 > wolfssl_plugin.c:510:17: note: in expansion of macro 'PLUGIN_REGISTER'
 >   510 |                 PLUGIN_REGISTER(RNG, wolfssl_rng_create),
 >       |                 ^~~~~~~~~~~~~~~
 > ../../../../src/libstrongswan/plugins/plugin_feature.h:321:119: note:
 > each undeclared identifier is reported only once for each function it
 > appears in
 >   321 | #define __PLUGIN_FEATURE_REGISTER(type, _f)
 > (plugin_feature_t){ FEATURE_REGISTER, FEATURE_##type, .arg.reg.f = _f
 > }
 >       |                                                                                                                       ^~~~~~~~
 > ../../../../src/libstrongswan/plugins/plugin_feature.h:332:73: note:
 > in expansion of macro '__PLUGIN_FEATURE_REGISTER'
 >   332 | #define _PLUGIN_FEATURE_REGISTER_RNG(type, f)
 > __PLUGIN_FEATURE_REGISTER(type, f)
 >       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
 > ../../../../src/libstrongswan/plugins/plugin_feature.h:248:39: note:
 > in expansion of macro '_PLUGIN_FEATURE_REGISTER_RNG'
 >   248 | #define PLUGIN_REGISTER(type, f, ...)
 > _PLUGIN_FEATURE_REGISTER_##type(type, f, ##__VA_ARGS__)
 >       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
 > wolfssl_plugin.c:510:17: note: in expansion of macro 'PLUGIN_REGISTER'
 >   510 |                 PLUGIN_REGISTER(RNG, wolfssl_rng_create),
 >       |                 ^~~~~~~~~~~~~~~
 > make[6]: *** [Makefile:659: wolfssl_plugin.lo] Error 1

 > Reported Upstream:
 > https://github.com/strongswan/strongswan/issues/2410

 > This build failure started since 5.9.11 update in commit
 > 78959665b94b412d7a82ee43e3ede14278a5d924.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/278/278b3f74c48c858ae368d59069752adb69c05246

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
