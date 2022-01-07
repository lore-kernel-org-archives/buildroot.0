Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D453AC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8475C4049E;
	Fri,  7 Jan 2022 18:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dNhmR8IH1QfC; Fri,  7 Jan 2022 18:33:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5045940144;
	Fri,  7 Jan 2022 18:33:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E660C1BF5E9
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E28F2607A4
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:33:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8P9i15HoUWe for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:33:54 +0000 (UTC)
X-Greylist: delayed 00:42:14 by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C1AF605EA
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:33:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C6C42200008;
 Fri,  7 Jan 2022 18:33:52 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n5u3k-00053H-5t; Fri, 07 Jan 2022 19:33:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220104180826.3171770-1-fontaine.fabrice@gmail.com>
Date: Fri, 07 Jan 2022 19:33:52 +0100
In-Reply-To: <20220104180826.3171770-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 4 Jan 2022 19:08:26 +0100")
Message-ID: <87mtk7l7jj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pcm-tools: fix static build
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

 > Don't build c_example which needs a dynamic library and so will raise
 > the following static build failure since bump to version 2021.10 in
 > commit d1d93d488c76d4bc2551270007096693d8194435 and
 > https://github.com/opcm/pcm/commit/12647a6ee579c29bd306fd034470eb62dcb3156e:

 > /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: cannot find -lpcm

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1276a3d49c8848039f034e7f03632df365097e94

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/pcm-tools/pcm-tools.mk | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
 > index 8a58034232..d676df57f9 100644
 > --- a/package/pcm-tools/pcm-tools.mk
 > +++ b/package/pcm-tools/pcm-tools.mk
 > @@ -17,7 +17,8 @@ define PCM_TOOLS_BUILD_CMDS
 >  	touch $(@D)/daemon-binaries
 >  	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 >  		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC" \
 > -		UNAME=Linux HOST=_LINUX
 > +		UNAME=Linux HOST=_LINUX \
 > +		$(foreach f,$(PCM_TOOLS_EXE_FILES),$(f).x)

This could also have used addsuffix, but OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
