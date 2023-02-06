Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156CFC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE8D940354;
	Mon,  6 Feb 2023 11:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE8D940354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1hMaP825a5ZF; Mon,  6 Feb 2023 11:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEB58402EB;
	Mon,  6 Feb 2023 11:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEB58402EB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 580671BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31AA181322
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31AA181322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXT_tV-H40W4 for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:37:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1F898101B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1F898101B
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:37:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 52E9E240008;
 Mon,  6 Feb 2023 11:37:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pOzo6-00DqbB-9Q; Mon, 06 Feb 2023 12:37:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
 <20221127130739.1862398-18-ricardo.martincoski@gmail.com>
Date: Mon, 06 Feb 2023 12:37:10 +0100
In-Reply-To: <20221127130739.1862398-18-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Sun, 27 Nov 2022 10:07:31 -0300")
Message-ID: <87v8kf9g9l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [next 17/25] package/gitlab-runner: ensure use of
 LIBCURL_OPENSSL
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Currently this minimal config is accepted while it shouldn't:
 > BR2_x86_i686=y
 > BR2_PACKAGE_BEARSSL=y
 > BR2_PACKAGE_LIBCURL_BEARSSL=y
 > BR2_PACKAGE_GITLAB_RUNNER=y

 > BR2_PACKAGE_GITLAB_RUNNER selects BR2_PACKAGE_LIBCURL_OPENSSL.
 > Kconfig does not enforce a select when the symbol selected is part of a
 > choice. See similar explanation on [1] and [2].

 > Doing something similar to [3] and depending on the choice option
 > instead of selecting it would create a Kconfig recursive dependency.

 > Just dropping the ineffective select would keep the above defconfig
 > snippet as an accepted one.

 > Adding a comment to the menu, i.e.:
 > comment "gitlab-runner must use BR2_PACKAGE_LIBCURL_OPENSSL"
 >        depends on BR2_PACKAGE_GITLAB_RUNNER
 >        depends on !BR2_PACKAGE_LIBCURL_OPENSSL
 > could improve user experience but it also keeps the above defconfig
 > snippet as an accepted one.

 > So bail out the build when gitlab-runner is enabled and libcurl-openssl
 > is not selected, similar to what is done in [4].

 > [1] "a44b1c1405 legacy: update the BR2_PREFER_STATIC_LIB option"
 > [2] "b1d5aa1bc2 package/qwt: Fix selecting OpenGL support in qt4"
 > [3] "9fc652a373 package/libmodsecurity: needs dynamic library with
 >      libcurl and mbedtls"
 > [4] "fda53f0791 package/Makefile.in: add detection for the lack of C
 >      library"

 > Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

The change as such is fine, but why does gitlab-runner really need the
curl binary to use the openssl backend? Perhaps it is just about curl
having HTTPS support?



> ---
 >  package/gitlab-runner/Config.in        | 1 -
 >  package/gitlab-runner/gitlab-runner.mk | 4 ++++
 >  2 files changed, 4 insertions(+), 1 deletion(-)

 > diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
 > index 89e3e87b5c..5b8a6cacbe 100644
 > --- a/package/gitlab-runner/Config.in
 > +++ b/package/gitlab-runner/Config.in
 > @@ -11,7 +11,6 @@ config BR2_PACKAGE_GITLAB_RUNNER
 >  	select BR2_PACKAGE_GIT # runtime
 >  	select BR2_PACKAGE_LIBCURL # runtime
 >  	select BR2_PACKAGE_LIBCURL_CURL # runtime
 > -	select BR2_PACKAGE_LIBCURL_OPENSSL # runtime, for ca-certificates.
 >  	select BR2_PACKAGE_OPENSSL # runtime
 >  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # runtime
 >  	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
 > diff --git a/package/gitlab-runner/gitlab-runner.mk b/package/gitlab-runner/gitlab-runner.mk
 > index c7c2da2fe1..c997785d90 100644
 > --- a/package/gitlab-runner/gitlab-runner.mk
 > +++ b/package/gitlab-runner/gitlab-runner.mk
 > @@ -12,6 +12,10 @@ GITLAB_RUNNER_LICENSE_FILES = LICENSE
 >  GITLAB_RUNNER_LDFLAGS = \
 >  	-X gitlab.com/gitlab-org/gitlab-runner/common.VERSION=$(GITLAB_RUNNER_VERSION)
 
 > +ifeq ($(BR2_PACKAGE_GITLAB_RUNNER):$(BR2_PACKAGE_LIBCURL_OPENSSL):$(BR_BUILDING),y::y)
 > +$(error gitlab-runner must use BR2_PACKAGE_LIBCURL_OPENSSL for ca-certificates at runtime)
 > +endif
 > +
 >  # Don't run gitlab runner as root.
 >  define GITLAB_RUNNER_USERS
 >  	gitlab-runner -1 gitlab-runner -1 * /var/run/dbus /bin/false - Gitlab Runner
 > -- 

 > 2.34.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
