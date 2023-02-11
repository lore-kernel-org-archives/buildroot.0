Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDDEC636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 13:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37C268202A;
	Sat, 11 Feb 2023 13:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37C268202A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7uTwKAtp7LF; Sat, 11 Feb 2023 13:17:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CAF48201E;
	Sat, 11 Feb 2023 13:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CAF48201E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B36421BF420
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 13:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 945A760A9D
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 13:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 945A760A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PiCZDCJhUadq for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 13:17:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47FC960A6D
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47FC960A6D
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 13:17:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB04C240003;
 Sat, 11 Feb 2023 13:17:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQpkw-001W5i-Uo; Sat, 11 Feb 2023 14:17:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
References: <20230208181933.3925279-1-peter@korsgaard.com>
 <20230208192425.GA2677@scaer>
 <e22f405b-5dba-66e6-f40e-8a8fb5cd2b4a@smile.fr>
Date: Sat, 11 Feb 2023 14:17:30 +0100
In-Reply-To: <e22f405b-5dba-66e6-f40e-8a8fb5cd2b4a@smile.fr> (Romain Naour's
 message of "Sat, 11 Feb 2023 10:33:04 +0100")
Message-ID: <87v8k8cped.fsf@dell.be.48ers.dk>
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

Hi,

 >>> +# The version of waflib has to match with the version of waf,
 >>> +# otherwise waf errors out with:
 >>> +# Waf script 'X' and library 'Y' do not match
 >>> +define WAF_PACKAGE_REMOVE_WAF_LIB
 >>> +	$(RM) -fr $(@D)/waf $(@D)/waflib

 > We need more $$ here :)

 > Otherwise:

 >>>> aubio 0.4.9 Patching
 > rm -f -fr /waf /waflib

Ahh crap, thanks for pointing it out.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
