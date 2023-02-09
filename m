Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60353C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 06:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A78812AE;
	Thu,  9 Feb 2023 06:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A78812AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QPEESPiYPNX2; Thu,  9 Feb 2023 06:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3EE081233;
	Thu,  9 Feb 2023 06:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3EE081233
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 858561BF852
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 06:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FB3F60BA9
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 06:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB3F60BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lSwxIjoy9dEa for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 06:48:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A60A360B97
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A60A360B97
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 06:48:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5A639100006;
 Thu,  9 Feb 2023 06:48:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQ0jO-00Gg7G-Ft; Thu, 09 Feb 2023 07:48:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230208181933.3925279-1-peter@korsgaard.com>
 <20230208192425.GA2677@scaer>
Date: Thu, 09 Feb 2023 07:48:30 +0100
In-Reply-To: <20230208192425.GA2677@scaer> (Yann E. MORIN's message of "Wed, 8
 Feb 2023 20:24:25 +0100")
Message-ID: <87r0uzfi69.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/pkg-waf.mk: drop bundled
 waf/waflib when external waf is used
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2023-02-08 19:19 +0100, Peter Korsgaard spake thusly:
 >> Waf requires that the version of the waf script matches the version of
 >> waflib, so drop any bundled waf/waflib if _NEEDS_EXTERNAL_WAF is used, as
 >> otherwise waf errors out with errors like:
 >> 
 >> Waf script '2.0.24' and library '1.9.3' do not match
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/pkg-waf.mk | 8 ++++++++
 >> 1 file changed, 8 insertions(+)
 >> 
 >> diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
 >> index e090afa9e6..a067e69c9b 100644
 >> --- a/package/pkg-waf.mk
 >> +++ b/package/pkg-waf.mk
 >> @@ -38,6 +38,13 @@ WAF_OPTS = $(if $(VERBOSE),-v) -j $(PARALLEL_JOBS)
 >> 
 >> define inner-waf-package
 >> 
 >> +# The version of waflib has to match with the version of waf,
 >> +# otherwise waf errors out with:
 >> +# Waf script 'X' and library 'Y' do not match
 >> +define WAF_PACKAGE_REMOVE_WAF_LIB
 >> +	$(RM) -fr $(@D)/waf $(@D)/waflib
 >> +endef
 >> +
 >> # We need host-python3 to run waf
 >> $(2)_DEPENDENCIES += host-python3
 >> 
 >> @@ -47,6 +54,7 @@ $(2)_NEEDS_EXTERNAL_WAF ?= NO
 >> ifeq ($$($(2)_NEEDS_EXTERNAL_WAF),YES)
 >> $(2)_DEPENDENCIES += host-waf
 >> $(2)_WAF = $$(HOST_DIR)/bin/waf
 >> +$(2)_PRE_CONFIGURE_HOOKS += WAF_PACKAGE_REMOVE_WAF_LIB

 > It would make more sense to make that either a post-extract or a
 > post-patch hook.

I hesitated between post-patch and pre-configure, but went with
pre-configure as this is closely related to the configure step - But I'm
fine with making it a post-patch hook instead.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
