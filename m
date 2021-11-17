Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0514EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:42:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B0D5613D3
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B0D5613D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 211E780F57;
	Wed, 17 Nov 2021 21:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ErE2G1j-QTxa; Wed, 17 Nov 2021 21:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68FCF80EFA;
	Wed, 17 Nov 2021 21:42:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CC8A1BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4966480EFA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oY_vHO3OSpzQ for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:42:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2064F80D22
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:42:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8AF57100002;
 Wed, 17 Nov 2021 21:42:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mnSgy-0006KP-J4; Wed, 17 Nov 2021 22:42:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211112131645.3334046-1-fontaine.fabrice@gmail.com>
Date: Wed, 17 Nov 2021 22:42:08 +0100
In-Reply-To: <20211112131645.3334046-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 12 Nov 2021 14:16:45 +0100")
Message-ID: <87tugatq6n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: fix build with gcc 4.8
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 4.8 raised since the addition
 > of the package in commit c23612b5db036fe89accb8db48690d1ce1be4b1b:

 > In file included from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_impl.hpp:100:0,
 >                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:50:
 > /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp: In constructor 'HWAccelIterator::HWAccelIterator(cv::VideoAccelerationType, bool, AVDictionary*)':
 > /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp:939:23: error: use of deleted function 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)'
 >              s_stream_ = std::istringstream(accel_list);
 >                        ^
 > In file included from /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/complex:45:0,
 >                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core/cvstd.inl.hpp:47,
 >                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core.hpp:3306,
 >                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/include/opencv2/videoio.hpp:46,
 >                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/precomp.hpp:57,
 >                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:42:
 > /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: note: 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)' is implicitly deleted because the default definition would be ill-formed:
 >      class basic_istringstream : public basic_istream<_CharT, _Traits>
 >            ^
 > /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: error: use of deleted function 'std::basic_istream<char>& std::basic_istream<char>::operator=(const std::basic_istream<char>&)'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/60f8846b435dafda0ced412d59ffe15bdff0810d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
