Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE3FC43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD81D40A5F;
	Mon, 11 Jul 2022 17:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD81D40A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_SrV3fy8mAg; Mon, 11 Jul 2022 17:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEF40401E1;
	Mon, 11 Jul 2022 17:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEF40401E1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 92E3F1BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D502401E1
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D502401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PxEg7idWS0B for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:26:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4844D4019B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4844D4019B
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:26:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D706BE0005
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:26:27 +0000 (UTC)
Message-ID: <dc3379ae-51f7-46e5-9c67-f4c494a1393d@korsgaard.com>
Date: Mon, 11 Jul 2022 19:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220610165412.3605141-1-fontaine.fabrice@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220610165412.3605141-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gtest: needs gcc >= 5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/06/2022 18.54, Fabrice Fontaine wrote:
> Commit be38432532b23275869a3a914c0ad0031323259c wrongly assumed that
> is_trivially_copy_constructible was available since gcc 4.9 but it
> wasn't fully available until gcc 5.1 and
> https://github.com/gcc-mirror/gcc/commit/f5e523b76d1bdaf0df15f6bfdee602a3e153be68
> resulting in the following build failure with gcc 4.9.1:
> 
> In file included from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/internal/gtest-death-test-internal.h:39:0,
>                   from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-death-test.h:41,
>                   from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest.h:64,
>                   from /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/src/gtest-all.cc:38:
> /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-matchers.h: In static member function 'static constexpr bool testing::internal::MatcherBase<T>::IsInlined()':
> /nvmedata/autobuild/instance-13/output-1/build/gtest-1.11.0/googletest/include/gtest/gtest-matchers.h:414:12: error: 'is_trivially_copy_constructible' is not a member of 'std'
>              std::is_trivially_copy_constructible<M>::value &&
>              ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1723705cb7aea5f6fcc7e6722d866ed3bd098115
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x and 2022.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
