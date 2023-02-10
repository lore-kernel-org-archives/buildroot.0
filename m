Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F8CC636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 14:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0144641991;
	Fri, 10 Feb 2023 14:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0144641991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nC9w2iBKY99q; Fri, 10 Feb 2023 14:10:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE91F4198C;
	Fri, 10 Feb 2023 14:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE91F4198C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27E601BF2C9
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 023EC82111
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 023EC82111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLQOBJmVVnQI for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 14:09:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E02D28210A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E02D28210A
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:09:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DB3E91BF209;
 Fri, 10 Feb 2023 14:09:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQU67-00HaAK-2R; Fri, 10 Feb 2023 15:09:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230208181933.3925279-1-peter@korsgaard.com>
 <20230208192425.GA2677@scaer>
Date: Fri, 10 Feb 2023 15:09:55 +0100
In-Reply-To: <20230208192425.GA2677@scaer> (Yann E. MORIN's message of "Wed, 8
 Feb 2023 20:24:25 +0100")
Message-ID: <87bkm1fw7g.fsf@dell.be.48ers.dk>
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

Committed after changing it to use a post-patch hook, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
