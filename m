Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FE1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 06:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8CD58299E;
	Thu, 10 Feb 2022 06:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BlaCbVObV-6r; Thu, 10 Feb 2022 06:43:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E617B82983;
	Thu, 10 Feb 2022 06:43:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 314A01BF409
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 06:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17AEC60E6B
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 06:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qYH6gW-MhsR for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 06:43:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFEAB60E6A
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 06:43:00 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 1E5F728375E;
 Thu, 10 Feb 2022 07:42:57 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 10 Feb 2022 06:42:57 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Peter Korsgaard <peter@korsgaard.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>
In-Reply-To: <mailman.6747.1644442447.66748.buildroot@buildroot.org>
References: <mailman.6747.1644442447.66748.buildroot@buildroot.org>
Message-ID: <2378b58c9e724d2bb27ec019e165798e@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 000/107] Drop python 2.7
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,
Hi Peter,

On 2022-02-09 21:34, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Peter ,All,
> 
> On 2022-02-09 17:50 +0100, Peter Korsgaard spake thusly:
>> Python 2.7 is EOL since April 2020 and almost all packages support
>> python 3, so drop it before the 2022.02 release.
>> 
>> It is a big series, but the changes are mainly mechanical in nature.
>> 
>> There is still some cleanup to do, E.G. the python2 support in
>> pkg-python and the host python-setuptools package - But this is IMHO
>> the minimum changes before -rc1.

There seem to be some more references to python(2) in packages; this 
build failure is from package/crda:

# make clean && make
   ...
make[1]: *** No rule to make target 'host-python', needed by 
'/home/data/buildroot.x86_64/build/host-python-pycryptodomex-3.13.0/.stamp_configured'. 
  Stop.
make: *** [Makefile:23: _all] Error 2

$ grep python-pycryptodomex */*.mk
crda/crda.mk:CRDA_DEPENDENCIES = host-pkgconf host-python-pycryptodomex 
libnl libgcrypt
python3-pycryptodomex/python3-pycryptodomex.mk:# Please keep in sync 
with package/python-pycryptodomex/python-pycryptodomex.mk
python3-pycryptodomex/python3-pycryptodomex.mk:HOST_PYTHON3_PYCRYPTODOMEX_DL_SUBDIR 
= python-pycryptodomex
python-pycryptodomex/python-pycryptodomex.mk:# python-pycryptodomex

Kind regards,
Andreas

>> Peter Korsgaard (107):
> ...
>>   package/python: drop target package
> ...
>>   package/python: drop host package
> ...
>>   docs/manual: drop python2 references
> 
> All 107 patches applied, thanks!
> 
> I'll reply further to two of them, with ultra-minor nits.
> 
> Pfew, 21st century, here we come at last! ;-)
> 
> Regards,
> Yann E. MORIN.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
