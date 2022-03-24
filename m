Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F51BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 06:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 055FD418A1;
	Thu, 24 Mar 2022 06:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nldouyZoWlRu; Thu, 24 Mar 2022 06:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0596E41895;
	Thu, 24 Mar 2022 06:38:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C96D21BF420
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 06:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C59CC60EF4
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 06:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uwEXAqV-UF0F for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 06:38:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D8D660EC3
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 06:38:14 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 869F91C0005;
 Thu, 24 Mar 2022 06:38:11 +0000 (UTC)
Date: Thu, 24 Mar 2022 07:38:08 +0100
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org, snathick <snathicktechno@gmail.com>
In-Reply-To: <CAN5CKbfJWXWZ2sQhOf-=81p+h-9QkZgRbegAnXHLPRn78XxNKg@mail.gmail.com>
References: <CAN5CKbfJWXWZ2sQhOf-=81p+h-9QkZgRbegAnXHLPRn78XxNKg@mail.gmail.com>
Message-ID: <4470C393-DAE8-4385-A817-9895CF2CFECC@0leil.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] Python package integration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On March 24, 2022 5:49:46 AM GMT+01:00, snathick <snathicktechno@gmail.com> wrote:
>Hi,
>
>I am trying to add the below python package to buildroot
>
>https://github.com/richteel/TeelSys_Python_SHT
>
>
>.mk file as follows
>
>################################################################################
>#
># python-sht21
>#
>################################################################################
>
>PYTHON_SHT21_VERSION = 1.0
>PYTHON_SHT21_SOURCE = pysht21-$(PYTHON_SHT21_VERSION).tar.gz
>PYTHON_SHT21_SITE = https://github.com/richteel/TeelSys_Python_SHT

I think this is one of the issues.

The documentation (https://buildroot.org/downloads/manual/manual.html#github-download-url) states that you should use:
PYTHON_SHT21_SITE = $(call github,richteel,TeelSys_Python_SHT,$(PYTHON_SHT21_VERSION))

I also don't think there's a need for PYTHON_SHT21_SOURCE since Buildroot will figure it out from _SITE variable here.

Finally, I couldn't see tags or releases on this github repo, so you want to pass a commit id to PYTHON_SHT21_VERSION, e.g. 84398b3267158d15e2322878294c0d7e0e6fa78d for the last commit in master branch.

>PYTHON_SHT21_LICENSE = BSD

It's actually MIT.

Cheers,
Quentin

>PYTHON_SHT21_LICENSE_FILES = LICENSE
>PYTHON_SHT21_SETUP_TYPE = setuptools
>
>$(eval $(python-package))
>
>make command giving following error
>
>wget --passive-ftp -nd -t 3 -O
>'/home/snathick/buildroot/output/build/.pysht21-1.0.uyWYsC/output' '
>http://sources.buildroot.net/pysht21-1.0'
>--2022-03-24 08:57:12--  http://sources.buildroot.net/pysht21-1.0
>Resolving sources.buildroot.net (sources.buildroot.net)... 172.67.72.56,
>104.26.0.37, 104.26.1.37, ...
>Connecting to sources.buildroot.net (sources.buildroot.net)|172.67.72.56|:80...
>connected.
>HTTP request sent, awaiting response... 404 Not Found
>2022-03-24 08:57:13 ERROR 404: Not Found.
>
>package/pkg-generic.mk:185: recipe for target
>'/home/snathick/buildroot/output/build/python-sht21-1.0/.stamp_downloaded'
>failed
>make[1]: ***
>[/home/snathick/buildroot/output/build/python-sht21-1.0/.stamp_downloaded]
>Error 1
>Makefile:84: recipe for target '_all' failed
>make: *** [_all] Error 2
>
>
>Any suggestions to resolve the issue
>
>
>
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
