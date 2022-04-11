Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4195C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 07:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E8B360E2F;
	Mon, 11 Apr 2022 07:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IY2XRCO8hTEW; Mon, 11 Apr 2022 07:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B330760803;
	Mon, 11 Apr 2022 07:16:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9A1A1BF2B9
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6DD2831F2
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7aVlqGfFWVKI for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 07:16:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6688A831F5
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 07:16:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3DCC8FF807;
 Mon, 11 Apr 2022 07:16:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ndoHK-005wJX-7v; Mon, 11 Apr 2022 09:16:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220410172403.590419-1-fontaine.fabrice@gmail.com>
Date: Mon, 11 Apr 2022 09:16:02 +0200
In-Reply-To: <20220410172403.590419-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 10 Apr 2022 19:24:03 +0200")
Message-ID: <87a6csjdjh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/belr: fix
 BR2_SHARED_STATIC_LIBS build
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

 > Fix the following build failure with BR2_SHARED_STATIC_LIBS:
 > CMake Error at src/CMakeLists.txt:56 (add_library):
 >   add_library cannot create target "belr" because another target with the
 >   same name already exists.  The existing target is a static library created
 >   in source directory

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d1ef96c8f370b5a522985c37f1681dd10bbc15bb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/belr/belr.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/belr/belr.mk b/package/belr/belr.mk
 > index f243830a85..1a849328ec 100644
 > --- a/package/belr/belr.mk
 > +++ b/package/belr/belr.mk
 > @@ -18,7 +18,7 @@ BELR_CONF_OPTS = \
 >  ifeq ($(BR2_STATIC_LIBS),y)
 >  BELR_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
 >  else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 > -BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
 > +BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
 >  else ifeq ($(BR2_SHARED_LIBS),y)
 >  BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
 >  endif

This makes the BR2_SHARED_STATIC_LIBS and BR2_SHARED_LIBS conditionals
the same, so I just changed it to:

ifeq ($(BR2_STATIC_LIBS),y)
BELR_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
else
# cannot build static and shared together
BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
endif

And committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
