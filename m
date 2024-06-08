Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFE8C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 16:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FCEF40126;
	Sat,  8 Jun 2024 16:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6FR1L-Elpgi; Sat,  8 Jun 2024 16:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A144263A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A144263A;
	Sat,  8 Jun 2024 16:48:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62BA71BF414
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E86C4263A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpwJrcaCzdIO for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 16:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E2D64171E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E2D64171E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E2D64171E
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 16:48:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A012840004;
 Sat,  8 Jun 2024 16:48:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFzEr-00268I-08;
 Sat, 08 Jun 2024 18:48:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240528192008.32699-1-ju.o@free.fr>
Date: Sat, 08 Jun 2024 18:48:21 +0200
In-Reply-To: <20240528192008.32699-1-ju.o@free.fr> (Julien Olivain's message
 of "Tue, 28 May 2024 21:20:08 +0200")
Message-ID: <87jzizz8h6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ccache: always disable
 developer mode
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
Cc: Xavier Roumegue <xroumegue@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > Ccache CMake build system has some conditions that automatically
 > enables a developer mode (sets CCACHE_DEV_MODE=ON). See [1].

 > More specifically, if CCACHE_DEV_MODE is unset AND the environment
 > variable "CI" is set, CCACHE_DEV_MODE is set to "ON".

 > This situation can happen when Buildroot builds are executed in
 > Jenkins jobs, for example. Since Buildroot does not set
 > CCACHE_DEV_MODE and Jenkins sets the "CI" environment variable,
 > this ccache developer mode can be enabled in an unexpected way
 > for the Buildroot user. For example, it happened that a Jenkins build
 > breaks, while the build with the same configuration in the user
 > session is working.

 > One of the effects of enabling this ccache developer mode, is to treat
 > compiler warnings as errors, see [3]. This can lead to build error,
 > depending on the ccache version and the host compiler being used.

 > This behavior can be reproduced and observed, with commands:

 >     cat > .config <<EOF
 >     BR2_aarch64=y
 >     BR2_TOOLCHAIN_EXTERNAL=y
 >     BR2_CCACHE=y
 >     BR2_PACKAGE_BUSYBOX=y
 >     EOF
 >     make olddefconfig

 >     make clean
 >     make host-ccache

 > Outputs:

 >     ...
 >     -- Ccache version: 4.9.1
 >     -- Ccache dev mode: OFF
 >     -- Setting CMAKE_BUILD_TYPE to Release as none was specified.
 >     ...

 > Whereas:

 >     make clean
 >     CI=true make host-ccache

 > Outputs:

 >     ...
 >     -- Ccache version: 4.9.1
 >     -- Ccache dev mode: ON
 >     -- Setting CMAKE_BUILD_TYPE to Debug as none was specified.
 >     ...

 > For a failure example: on Fedora 40 with host gcc 14.1.1, Buildroot at
 > tag 2024.02 has ccache 4.8.2. Host ccache can fail, when building with
 > "CI=true make host-ccache" with output:

 >     /buildroot/output/build/host-ccache-4.8.2/src/third_party/fmt/core.h:3119:44:   in 'constexpr' expansion of 'fmt::v8::make_format_args<>(args#0, args#1)'
 >     /buildroot/output/build/host-ccache-4.8.2/src/third_party/fmt/core.h:1706:15: error: possibly dangling reference to a temporary [-Werror=dangling-reference]
 >      1706 |   const auto& arg = arg_mapper<Context>().map(std::forward<T>(val));
 >           |               ^~~

 > This commit sets CCACHE_DEV_MODE=OFF to make the ccache behavior more
 > deterministic in Buildroot, independently of being used in a CI tool
 > or not.

 > [1] https://github.com/ccache/ccache/blob/v4.9.1/CMakeLists.txt#L56
 > [2] https://github.com/jenkinsci/jenkins/blob/jenkins-2.459/core/src/main/java/jenkins/model/CoreEnvironmentContributor.java#L43
 > [3] https://github.com/ccache/ccache/blob/v4.9.1/cmake/StandardWarnings.cmake#L5

 > Reported-by: Xavier Roumegue <xroumegue@gmail.com>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Note: while this patch is meant for master branch, I believe it would
 > also be interesting to apply this patch on maintenance branches, like
 > 2024.02.x, because they includes older ccache versions which are likely
 > to generate compiler warnings (and therefore errors in the described
 > case). I let the maintainers decide.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
