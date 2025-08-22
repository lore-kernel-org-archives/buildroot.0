Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A36CA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 10:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4836B60B34;
	Fri, 22 Aug 2025 10:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVzo7bQdstM6; Fri, 22 Aug 2025 10:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04CD860B16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04CD860B16;
	Fri, 22 Aug 2025 10:11:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F8141C7
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 10:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 216624056A
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 10:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Su8UEOlRLPAg for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 10:11:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07A404057A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07A404057A
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07A404057A
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 10:11:48 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 2596A440567;
 Fri, 22 Aug 2025 13:09:17 +0300 (IDT)
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <CA+TH9V=dotgxON+5qP+7oBD83c=W=Z4hCAz8_kpA3ED4NH=4uw@mail.gmail.com>
 (Angelo Compagnucci's message of "Thu, 21 Aug 2025 21:09:53 +0200")
References: <20250821182337.3563734-1-angelo.compagnucci@gmail.com>
 <87ms7szf0d.fsf@tarshish>
 <CA+TH9V=dotgxON+5qP+7oBD83c=W=Z4hCAz8_kpA3ED4NH=4uw@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 22 Aug 2025 13:11:45 +0300
Message-ID: <87h5xzzmvy.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1755857357;
 bh=39t7GcZ1lYfBoaieqAL2LhQub52/6a039vwPAkCsRXY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=zAnHwpZlCh+Iz89C5zbYdQ9rdgt1j+Egzs05lsLG3qUWTzIaZQ0YL3HWYGFVgr8iQ
 gJ21AaeUR8WZCRaMi66ssR3NDRdvjYHjfToz8G5YT9gzz8xC+BGh0JECttC3WoLgyk
 wZTwRpDLEvF/w5q0g6cIJCQToUFjvblDEabJl+4RJGucRwRDFWPgQ99mBUUh3ZifQE
 YYiA9U0lojEfx2yGyOvNrnHAhUr/IKjjyfovrhjzKLs28niq4k9MiUXhZ0tgnVwHb0
 kwmBvwcS7GeqOY5cESkj87ZYzHyumoHDPtp8Ns/l805MAh1ANdDZ43CvGWF/jjqt9a
 3OCm1RznYUydw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=zAnHwpZl
Subject: Re: [Buildroot] [PATCH v2] package/wcurl: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Algelo,

On Thu, Aug 21 2025, Angelo Compagnucci wrote:
> Il giorno gio 21 ago 2025 alle ore 20:49 Baruch Siach <baruch@tkos.co.il> ha scritto:
>
>  On Thu, Aug 21 2025, Angelo Compagnucci wrote:
>  > wcurl is a command line tool which lets you download URLs without having to
>  > remember any parameters.
>  >
>  > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
>  [...]
>
>  > diff --git a/package/wcurl/Config.in b/package/wcurl/Config.in
>  > new file mode 100644
>  > index 0000000000..31a007b61f
>  > --- /dev/null
>  > +++ b/package/wcurl/Config.in
>  > @@ -0,0 +1,9 @@
>  > +config BR2_PACKAGE_WCURL
>  > +     bool "wcurl"
>  > +     depends on BR2_PACKAGE_LIBCURL # runtime
>  > +     depends on BR2_PACKAGE_LIBCURL_CURL # runtime
>
>  Why not 'select'?
>
>  You don't provide a comment to guide the user about these
>  dependencies. With 'select', no comment is needed.
>
> Well, libcurl has several dependencies, and therefore selecting it
> didn't sound right to me.  I mean, I want wcurl installed, wcurl
> selects libcurl which cannot be built because some dependency is not
> met, It doesn't sound right.

BR2_PACKAGE_LIBCURL needs no dependency. Over 40 packages select
BR2_PACKAGE_LIBCURL already in Buildroot.

Surely when you 'select' a package you need to propagate its 'depends'
to avoid the issue you mentioned. But in the case of BR2_PACKAGE_LIBCURL
there is no such 'depends'.

baruch

> I think this is something for the maintainers to decide, but let me
> know what you think and I'll happily respin.
>  
>  
>  baruch
>
>  > +     help
>  > +       wcurl is a small command-line tool that wraps curl for easier use
>  > +       when downloading files from the web.
>  > +
>  > +       https://curl.se/wcurl/
>  > diff --git a/package/wcurl/wcurl.hash b/package/wcurl/wcurl.hash
>  > new file mode 100644
>  > index 0000000000..b747e99502
>  > --- /dev/null
>  > +++ b/package/wcurl/wcurl.hash
>  > @@ -0,0 +1,3 @@
>  > +# sha256 locally computed
>  > +sha256  a745475f3511090685c4d000a10f4155147b75a8c7781764612a7e8f67bb6d82  wcurl-2025.05.26.tar.gz
>  > +sha256  0127bdd267b1fa65bf5a6c487c907948e0c009aa35a5949c8aed91f779d27810  LICENSE
>  > diff --git a/package/wcurl/wcurl.mk b/package/wcurl/wcurl.mk
>  > new file mode 100644
>  > index 0000000000..8499bd3e1b
>  > --- /dev/null
>  > +++ b/package/wcurl/wcurl.mk
>  > @@ -0,0 +1,16 @@
>  > +################################################################################
>  > +#
>  > +# wcurl
>  > +#
>  > +################################################################################
>  > +
>  > +WCURL_VERSION = 2025.05.26
>  > +WCURL_SITE = $(call github,curl,wcurl,v$(WCURL_VERSION))
>  > +WCURL_LICENSE = curl
>  > +WCURL_LICENSE_FILES = LICENSE
>  > +
>  > +define FOO_INSTALL_TARGET_CMDS
>  > +      $(INSTALL) -D -m 0755 $(@D)/wcurl $(TARGET_DIR)/usr/bin
>  > +endef
>  > +
>  > +$(eval $(generic-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
