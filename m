Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E20C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 20:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3982D404AB;
	Mon,  7 Mar 2022 20:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N27RE7uLw3Pn; Mon,  7 Mar 2022 20:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0945540364;
	Mon,  7 Mar 2022 20:05:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B15C11BF3A0
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C11E40364
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSKdps3vsw_s for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 20:05:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E6684016A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 20:05:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 90C9240002;
 Mon,  7 Mar 2022 20:05:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRJbv-000zsL-Mo; Mon, 07 Mar 2022 21:05:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220221220703.2198424-1-fontaine.fabrice@gmail.com>
Date: Mon, 07 Mar 2022 21:05:39 +0100
In-Reply-To: <20220221220703.2198424-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 21 Feb 2022 23:07:03 +0100")
Message-ID: <87r17d5y0c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/re2: fix build with gcc <= 5
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

 > Fix the following build failure with gcc <= 5 raised since bump to
 > version 2022-02-01 in commit d2cf91e0c6a082261cc7ebb06dfdbd7bc2c2956f
 > and
 > https://github.com/google/re2/commit/a022cc0c55b0519629d64d775e7a5195af34a477

 > ./re2/sparse_array.h:266:37: warning: defaulted and deleted functions only available with -std=c++11 or -std=gnu++11
 >  SparseArray<Value>::SparseArray() = default;
 >                                      ^
 > ./re2/sparse_array.h: In copy constructor 're2::SparseArray<Value>::SparseArray(const re2::SparseArray<Value>&)':
 > ./re2/sparse_array.h:273:3: error: 'copy_n' is not a member of 'std'
 >    std::copy_n(src.sparse_.data(), src.max_size(), sparse_.data());
 >    ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8ebbac67f32fe24416a1f72aad0afd42b567b403

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Don't set prefix in build step

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
