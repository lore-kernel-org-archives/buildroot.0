Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4803C3526D
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 15:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19A70409A0;
	Wed, 26 Jan 2022 15:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oP2rGfrDbaEb; Wed, 26 Jan 2022 15:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C740403E9;
	Wed, 26 Jan 2022 15:30:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD2251BF4DD
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 15:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A97E9415EB
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 15:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=kalray.eu header.b="MPjZm7a9";
 dkim=pass (1024-bit key) header.d=kalray.eu header.b="Hp48oX7K"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFETC4fpO_JI for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 15:30:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fx306.security-mail.net (smtpout30.security-mail.net
 [85.31.212.37])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8851341553
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 15:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fx306.security-mail.net (Postfix) with ESMTP id B692C399432
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 16:30:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1643211045;
 bh=qRGEMk95MRqch8nPr4WqAQZ/BFczPJSIaO92ctCrnCs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject;
 b=MPjZm7a9gZwfZt/jVwkU9iy+lWAXxxltYscy4p9EH4317wSqSuaFOdpv0XsoQ4KwI
 2LTYYGfxPSbVO28zRKSgXWXRHga78Q25cv+JEeAzcfZHnL4Werfo9CQdm7X+rnNV7J
 hGxXvUnCfjZiihvrOOzsK9njhcssByB0LfN3eXkY=
Received: from fx306 (localhost [127.0.0.1]) by fx306.security-mail.net
 (Postfix) with ESMTP id 64053399022; Wed, 26 Jan 2022 16:30:45 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx306.security-mail.net (Postfix) with ESMTPS id DD0C939905F; Wed, 26 Jan
 2022 16:30:44 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id BEE0B27E03FE; Wed, 26 Jan 2022
 16:30:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id A729B27E03FF; Wed, 26 Jan 2022 16:30:44 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 sT5z1kuAmZnP; Wed, 26 Jan 2022 16:30:44 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTP id 9459427E03FE; Wed, 26 Jan 2022
 16:30:44 +0100 (CET)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <484c.61f16924.db30a.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu A729B27E03FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1643211044;
 bh=oy9BvyJNfVM+PuIYCxXXAJA/bDNvJmPtDIw5rDkQ/bM=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Hp48oX7K2uDcyB3GErtdHFi0dJIA7Ps5W7HTcVrFofPK5DdDdvkfBRU85WkpaYMjv
 reD1Ds1tje2tL3cLL8iIMf/G8Q8SCr68Y2valtVKlU3BvsyyDDLq9USOiOGSpKkB9+
 nc94YkrJ/a/be2Dim50/J24kchNJIFJSuKo6AX6k=
Date: Wed, 26 Jan 2022 16:30:44 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <608336144.1670038.1643211044586.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20220124225356.03c1c658@windsurf>
References: <20220124173521.2236-1-jborne@kalray.eu>
 <87k0ep9gbx.fsf@tarshish> <20220124220238.1fa0568b@windsurf>
 <20220124212149.GJ2502@scaer> <20220124225356.03c1c658@windsurf>
MIME-Version: 1.0
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 9.0.0_GA_4126 (ZimbraWebClient - FF90 (Linux)/9.0.0_GA_4126)
Thread-Topic: Fix binutils/libiberty target install directory
Thread-Index: cbBvRK4hJnWFJFoWYpxsG4MtvNNe5Q==
X-ALTERMIMEV2_out: done
Subject: Re: [Buildroot] [RFC PATCH 0/1] Fix binutils/libiberty target
 install directory
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
From: Jonathan Borne via buildroot <buildroot@buildroot.org>
Reply-To: Jonathan Borne <jborne@kalray.eu>
Cc: ysionneaux@kalray.eu, jmaselbas@kalray.eu,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi again, 
thank you very much for your answers!

----- On Jan 24, 2022, at 10:53 PM, Thomas Petazzoni thomas.petazzoni@bootlin.com wrote:

> On Mon, 24 Jan 2022 22:21:49 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
>> > # We just want libbfd, libiberty and libopcodes,
>> > # not the full-blown binutils in staging
>> > define BINUTILS_INSTALL_STAGING_CMDS
>> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
>> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
>> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
>> > endef
>> > 
>> > # If we don't want full binutils on target
>> > ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
>> > define BINUTILS_INSTALL_TARGET_CMDS
>> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
>> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
>> >         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
>> > endef
>> > endif
>> > 
>> > This is *extremely* suspicious. Indeed, we get the libraries
>> > unconditionally installed in staging, so any other library or program
>> > that we build after binutils can potentially link against thosze
>> > libraries.
>> > 
>> > But we only install them conditionally in $(TARGET_DIR) if
>> > BR2_PACKAGE_BINUTILS_TARGET=y.
>> > 
>> > This seems very bad to me. Both target and staging installations should
>> > be done under the same condition.
>> 
>> Not really. You missed the fact that binutils is an autotools package.
>> 
>> As such, when BR2_PACKAGE_BINUTILS_TARGET=n, then the full binutils are
>> instaleld in target, so the libs will be installed in target.

I think you made a typo here... 
The full binutils install to target is made when BR2_PACKAGE_BINUTILS_TARGET=y.

> 
> Aah, indeed, the condition is:
> 
> ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
> 

Double negation is a bit confusing indeed, 
maybe the message could be changed to 

# If we don't want full binutils on target
ifeq ($(BR2_PACKAGE_BINUTILS_TARGET),n)

>> So whatever gets in staging is present in target, but target can be a
>> superset of what is in staging, so whatever links to a binutils lib from
>> staging will find it in target.

Agreed! So if I understand correctly, as was suggested by Romain and Thomas,
we could indeed get rid of

$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install

in BINUTILS_INSTALL_TARGET_CMDS.

Thanks again
Best Regards.
Jonathan.




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
