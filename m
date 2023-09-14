Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FBAEDE994
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 08:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DFAA416F8;
	Thu, 14 Sep 2023 08:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DFAA416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFXuc8ehEFAZ; Thu, 14 Sep 2023 08:28:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D473408C0;
	Thu, 14 Sep 2023 08:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D473408C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79B821BF5A2
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 546E8401C9
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 546E8401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wd2e2V26S6Xn for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 08:28:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B13E40079
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 08:28:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B13E40079
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52D9324000C;
 Thu, 14 Sep 2023 08:28:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qghiV-0085H5-8o; Thu, 14 Sep 2023 10:28:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230221143533.1510153-1-fontaine.fabrice@gmail.com>
 <20230830234632.29121f26@windsurf>
Date: Thu, 14 Sep 2023 10:28:51 +0200
In-Reply-To: <20230830234632.29121f26@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 30 Aug 2023 23:46:32 +0200")
Message-ID: <87r0n1xinw.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/helpers.mk: fix uclibc locale
 support
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Tue, 21 Feb 2023 15:35:33 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> locale_t is defined by uclibc in xlocale.h:
 >> https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c31efd6e887182948f627be/include/xlocale.h#L46
 >> 
 >> As a result, without xlocale, locale is not fully enabled which will
 >> result in the following build failure with
 >> toolchain-external-synopsys-arc and libcpprestsdk:
 >> 
 >> In file included from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/json.h:18,
 >> from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/pch/stdafx.h:88,
 >> from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/http/client/http_client_msg.cpp:13:
 >> /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/asyncrt_utils.h:317:13: error: 'locale_t' does not name a type
 >> 317 |     typedef locale_t xplat_locale;
 >> |             ^~~~~~~~
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/e6778e60cc1ea455f5b4511d5824f04d8040f67b
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> toolchain/helpers.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > I've applied this one to master, after squashing it with
 > "toolchain/toolchain-external/toolchain-external-synopsys-arc: drop
 > locale", and writing a better commit log. See:

 >   https://gitlab.com/buildroot.org/buildroot/-/commit/3c8d890c1946308f5396aa6428da5274b25c3a5f

 > Thanks a lot!

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
