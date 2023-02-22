Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDF4C64EC4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59DC840BE0;
	Wed, 22 Feb 2023 16:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59DC840BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYYFOKLo5zTx; Wed, 22 Feb 2023 16:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A790B416ED;
	Wed, 22 Feb 2023 16:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A790B416ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 483731BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2184B61203
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2184B61203
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ygx4O-gm5gdw for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:38:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 160FA61227
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 160FA61227
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:38:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 345C224000D;
 Wed, 22 Feb 2023 16:38:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pUs8Y-007zs6-Eb; Wed, 22 Feb 2023 17:38:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
 <20221127130739.1862398-6-ricardo.martincoski@gmail.com>
Date: Wed, 22 Feb 2023 17:38:34 +0100
In-Reply-To: <20221127130739.1862398-6-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 27 Nov 2022 10:07:19 -0300")
Message-ID: <87356xvenp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [next 05/25]
 support/scripts/generate-gitlab-ci-yml: improve test-pkg support
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

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Following the example of test-pkg config described in commit
 > "12c7a05da1 utils/test-pkg: add gitlab-ci support" to test a defconfig
 > fragment that contains a disabled option is currently possible, but
 > it do requires one to change the git config core.commentChart so the
 > lines starting with "#" are not discarded by git when creating/editing
 > the commit message.

 > For instance, without the indentation the 3rd line below would be
 > excluded from the commit message when the editor is closed:
 >     test-pkg config:
 >     SOME_OPTION=y
 >     # OTHER_OPTION is not set
 >     SOME_VARIABLE="some value"

 > Requiring to change git configs is not very nice.
 > So make the developer's life easier by changing the sed expression to
 > remove indentation with spaces from a defconfig fragment found on a
 > commit message.
 > For instance these lines become valid and generate a defconfig fragment
 > without the indentation of one space to be tested in GitLab CI:
 > test-pkg config:
 >  SOME_OPTION=y
 >  # OTHER_OPTION is not set
 >  SOME_VARIABLE="some value"

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > ---
 > Example usage:
 > https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704846763

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
