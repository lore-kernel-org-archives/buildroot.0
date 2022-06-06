Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEF3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CA5041764;
	Mon,  6 Jun 2022 10:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNDtDZQDXKi7; Mon,  6 Jun 2022 10:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A6D2416F3;
	Mon,  6 Jun 2022 10:17:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC5981BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBB16840D9
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:17:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZHOx_xm1C4f for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:17:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1CC3831A5
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:17:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB5EC240008;
 Mon,  6 Jun 2022 10:17:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ny9o3-00CldX-49; Mon, 06 Jun 2022 12:17:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220524172819.2361896-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Jun 2022 12:17:55 +0200
In-Reply-To: <20220524172819.2361896-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 24 May 2022 19:28:19 +0200")
Message-ID: <87tu8yxfho.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libfreeimage: fix musl build
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
Cc: =?utf-8?B?UsOpbWkgUsOpcm9sbGU=?= <remi.rerolle@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following musl build failure:
 > In file included from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/sysroot/usr/include/pthread.h:31,
 >                  from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/include/c++/9.4.0/armeb-buildroot-linux-musleabi/bits/gthr-default.h:35,
 >                  from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/include/c++/9.4.0/armeb-buildroot-linux-musleabi/bits/gthr.h:148,
 >                  from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/include/c++/9.4.0/ext/atomicity.h:35,
 >                  from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/include/c++/9.4.0/bits/basic_string.h:39,
 >                  from /nvmedata/autobuild/instance-12/output-1/per-package/libfreeimage/host/armeb-buildroot-linux-musleabi/include/c++/9.4.0/string:55,
 >                  from Source/Utilities.h:44,
 >                  from Source/FreeImage/PluginPSD.cpp:27:
 > Source/FreeImage/PluginPSD.cpp: In function 'BOOL Save(FreeImageIO*, FIBITMAP*, fi_handle, int, int, void*)':
 > Source/FreeImage/PluginPSD.cpp:130:10: error: cannot convert 'std::nullptr_t' to 'BOOL' {aka 'int'} in return
 >   130 |   return NULL;
 >       |          ^~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f9c4ba83a506d374d8a28673aac619d8ff80f3da

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
