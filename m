Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B3AC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 17:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EB9460E37;
	Wed, 27 Dec 2023 17:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EB9460E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACl1vd5Gshve; Wed, 27 Dec 2023 17:18:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CEB160B7C;
	Wed, 27 Dec 2023 17:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CEB160B7C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 917FF1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77E1D60B7C
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77E1D60B7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DuYnLijMESP5 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 17:18:05 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 989CB607C0
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 17:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 989CB607C0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C1D36000C;
 Wed, 27 Dec 2023 17:18:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rIXXe-002Rot-2I;
 Wed, 27 Dec 2023 18:18:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231227170759.2902227-1-thomas.petazzoni@bootlin.com>
Date: Wed, 27 Dec 2023 18:18:02 +0100
In-Reply-To: <20231227170759.2902227-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 27 Dec 2023 18:07:58 +0100")
Message-ID: <875y0jr2d1.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] Config.in: rework
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > BR2_DOWNLOAD_FORCE_CHECK_HASHES currently has the following
 > dependency:

 > 	depends on BR2_GLOBAL_PATCH_DIR != ""

 > However, strictly speaking checking all hashes does not necessarily
 > require using BR2_GLOBAL_PATCH_DIR, as long as you don't use custom
 > versions.

 > But more importantly:

 > - Having this dependency means that this options is hidden when people
 >   don't use BR2_GLOBAL_PATCH_DIR. Instead the option should always be
 >   made visible, encouraging people to turn it on.

 > - The Config.in comment was there to mitigate this previous argument,
 >   but this comment then shows up all the time when you have an empty
 >   global patch dir.

 > This seems over-complicated, and it sounds much easier to have the
 > option unconditionally available, and visible, and clarify in its help
 > text that in order to this to work fully with custom package versions,
 > BR2_GLOBAL_PATCH_DIR can be used to provide extra hash files.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  Config.in | 16 +++++++---------
 >  1 file changed, 7 insertions(+), 9 deletions(-)

 > diff --git a/Config.in b/Config.in
 > index 554b4062eb..75f699154d 100644
 > --- a/Config.in
 > +++ b/Config.in
 > @@ -711,20 +711,18 @@ config BR2_FORCE_HOST_BUILD
 
 >  config BR2_DOWNLOAD_FORCE_CHECK_HASHES
 >  	bool "Force all downloads to have a valid hash"
 > -	depends on BR2_GLOBAL_PATCH_DIR != ""
 >  	help
 > -	  For packages where a custom version or location can be set,
 > -	  Buildroot does not carry a hash for those custom versions or
 > -	  locations, so the integrity of such downloads is not verified.
 > -
 >  	  Say 'y' here to enforce downloads to have at least one valid
 >  	  hash (and of course, that all hashes be valid).
 
 > -	  Those hashes are looked in files in BR2_GLOBAL_PATCH_DIR,
 > -	  see above.
 > +	  By default, Buildroot checks hashes of all packages
 > +	  downloaded, except those for which a custom version is
 > +	  used.
 
 > -comment "Forcing all downloads to have a valid hash needs a global patch and hash directory"
 > -	depends on BR2_GLOBAL_PATCH_DIR = ""
 > +	  With this option turned on, Buildroot will check hashes of
 > +	  all packages, including those have use a custom version. In

s/have use/that use/

 > +	  order to provide hashes for such packages, additional hash
 > +	  files can be placed into BR2_GLOBAL_PATCH_DIR directories.

I guess it is really s/can be/must be/, E.G. the build fails if not
done, right?

Maybe we should mention utils/add-custom-hashes to create such .hash
files?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
