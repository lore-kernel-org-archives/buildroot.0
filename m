Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB08C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6783B41823;
	Wed, 30 Aug 2023 21:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6783B41823
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFLKataq0lVd; Wed, 30 Aug 2023 21:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A25374181F;
	Wed, 30 Aug 2023 21:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A25374181F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DCBC1BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 515376129F
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 515376129F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IKMockbt7R9N for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:46:38 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D1CF60E68
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1CF60E68
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CA9C240003;
 Wed, 30 Aug 2023 21:46:33 +0000 (UTC)
Date: Wed, 30 Aug 2023 23:46:32 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230830234632.29121f26@windsurf>
In-Reply-To: <20230221143533.1510153-1-fontaine.fabrice@gmail.com>
References: <20230221143533.1510153-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693431994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNsGPhkK9u7FlhR4kGJKNLLU5RBRqhWw0tIONvzIyW4=;
 b=N9NxIVQAVmmHJmIuWWtWYNcO0S4GlfMjK+fUAxzzF2SvT5hTLQ5eG9qGV5JGFIOp3kD9qC
 6jLqFJh7PszoK5T7ZzFRWM/rpk+rwohmPLmgPgEI/cmQXOMp9GaRRI2eLZauDU+1lOtb5a
 vZj3C6bggUc/cp02nCKjaobn3wbDvRLH5qVzFBhJW1M44gDdCB/lom3lypEpEcYOoaLvWN
 w8Hfrz3ej1uT79vfR+CW9bkbdjRjk9afFd+mG/dLgaEatGhyYi8CmzrgEzYiO3ofgD4TB0
 7e19Am2VHsidEYEJdjYk2UB+425R8txAfJbIVS3xHUZKIvUtNAdAhB49tHlBbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N9NxIVQA
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Feb 2023 15:35:33 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> locale_t is defined by uclibc in xlocale.h:
> https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c31efd6e887182948f627be/include/xlocale.h#L46
> 
> As a result, without xlocale, locale is not fully enabled which will
> result in the following build failure with
> toolchain-external-synopsys-arc and libcpprestsdk:
> 
> In file included from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/json.h:18,
>                  from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/pch/stdafx.h:88,
>                  from /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/src/http/client/http_client_msg.cpp:13:
> /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release/include/cpprest/asyncrt_utils.h:317:13: error: 'locale_t' does not name a type
>   317 |     typedef locale_t xplat_locale;
>       |             ^~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e6778e60cc1ea455f5b4511d5824f04d8040f67b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  toolchain/helpers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied this one to master, after squashing it with
"toolchain/toolchain-external/toolchain-external-synopsys-arc: drop
locale", and writing a better commit log. See:

  https://gitlab.com/buildroot.org/buildroot/-/commit/3c8d890c1946308f5396aa6428da5274b25c3a5f

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
