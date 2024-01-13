Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12714C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 15:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0A9841DF6;
	Sat, 13 Jan 2024 15:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0A9841DF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3csoWCZ7fKX; Sat, 13 Jan 2024 15:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27CD141D8D;
	Sat, 13 Jan 2024 15:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27CD141D8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BB911BF263
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 15:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14A7960A5D
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 15:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14A7960A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiilGGc1Q2TX for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 15:11:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2809960A63
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 15:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2809960A63
Received: by mail.gandi.net (Postfix) with ESMTPSA id A44471C0005;
 Sat, 13 Jan 2024 15:11:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOff3-00DDCI-00;
 Sat, 13 Jan 2024 16:11:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240103191151.2777684-1-bernd@kuhls.net>
 <20240106111236.6269f39d@windsurf>
Date: Sat, 13 Jan 2024 16:11:00 +0100
In-Reply-To: <20240106111236.6269f39d@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 6 Jan 2024 11:12:36 +0100")
Message-ID: <87cyu5tgjf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/2] package/exim: fix build with
 libexecinfo
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello,
 > On Wed,  3 Jan 2024 20:11:50 +0100
 > Bernd Kuhls <bernd@kuhls.net> wrote:

 >> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
 >> index fb9eecd71b..25d171875d 100644
 >> --- a/package/exim/exim.mk
 >> +++ b/package/exim/exim.mk
 >> @@ -104,6 +104,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 >> $(call exim-config-add,HOSTCC,$(HOSTCC))
 >> $(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 >> $(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
 >> +	$(EXIM_EXTRALIBS)

 > I've changed this to:

 > +       $(call exim-config-add,EXTRALIBS,$(EXIM_EXTRALIBS))

 >> +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 >> +EXIM_DEPENDENCIES += libexecinfo
 >> +define EXIM_EXTRALIBS
 >> +$(call exim-config-add,EXTRALIBS,-lexecinfo)
 >> +endef
 >> +else ifneq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 >> +EXIM_C_FLAGS = -DNO_EXECINFO
 >> +endif

 > And changed this to:

 > +ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 > +EXIM_DEPENDENCIES += libexecinfo
 > +EXIM_EXTRALIBS += -lexecinfo
 > +else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 > +EXIM_CFLAGS = -DNO_EXECINFO
 > +endif

 > so EXIM_EXTRALIBS becomes really the list of extra libraries, and the
 > exim-config-add call is inside EXIM_CONFIGURE_TOOLCHAIN. This means
 > that we can add more things to EXIM_EXTRALIBS for other reasons if
 > needed in the future.

 > Also, I've used EXIM_CFLAGS instead of EXIM_C_FLAGS, and used a
 > slightly different construct for the glibc condition.

 > Applied with those changes, thanks a lot!

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
