Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18885C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 13:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67EDB4053C;
	Sun,  5 Dec 2021 13:20:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpgNpojF9lLa; Sun,  5 Dec 2021 13:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD646404FE;
	Sun,  5 Dec 2021 13:20:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D87051BF275
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 13:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C82496070C
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 13:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHxrbSiwgHGU for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 13:20:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75FD0606F8
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 13:20:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B59BE200002;
 Sun,  5 Dec 2021 13:20:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mtrRa-0002IJ-1M; Sun, 05 Dec 2021 14:20:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20211025215520.3712974-1-fontaine.fabrice@gmail.com>
 <50b4a2e3-fb9f-aaec-534c-3a18cfee50bc@mind.be>
Date: Sun, 05 Dec 2021 14:20:42 +0100
In-Reply-To: <50b4a2e3-fb9f-aaec-534c-3a18cfee50bc@mind.be> (Arnout
 Vandecappelle's message of "Wed, 17 Nov 2021 21:55:30 +0100")
Message-ID: <87wnkj89xx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,1/1] package/p7zip: add 7za support
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
Cc: =?utf-8?Q?Andr=C3=A9?= Zwing <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 25/10/2021 23:55, Fabrice Fontaine wrote:
 >> Add 7za stand-alone executable as 7zr is a "light-version" of 7za that
 >> only handles 7z archives and cannot handle encrypted archives.
 >> 
 >> Fixes:
 >> - https://bugs.buildroot.org/show_bug.cgi?id=14266
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> Changes v1 -> v2 (after review of Arnout Vandecappelle):
 >> - Add a dedicated option
 >> 
 >> package/p7zip/Config.in | 22 ++++++++++++++++++++++
 >> package/p7zip/p7zip.mk  | 11 +++++++++--
 >> 2 files changed, 31 insertions(+), 2 deletions(-)
 >> 
 >> diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
 >> index badfb9b9e8..3b30fd71cc 100644
 >> --- a/package/p7zip/Config.in
 >> +++ b/package/p7zip/Config.in
 >> @@ -12,6 +12,28 @@ config BR2_PACKAGE_P7ZIP
 >> http://sourceforge.net/projects/p7zip
 >> +if BR2_PACKAGE_P7ZIP
 >> +
 >> +choice
 >> +	prompt "p7zip binary"
 >> +	default BR2_PACKAGE_P7ZIP_7ZR

 >  Unfortunately, this means 7za will never be built in the
 > autobuilders, because they don't randomize choices. Oh well, tough
 > luck.

 >  Applied to master, thanks.

Next, not master.


 >> +
 >> +config BR2_PACKAGE_P7ZIP_7ZA
 >> +	bool "7za"
 >> +	help
 >> +	  Stand-alone executable that handles fewer archive formats
 >> +	  than 7z

I guess this text is taken from the man page:

https://linux.die.net/man/1/7za

But it doesn't really make much sense if we don't provide the full
7z. As a user it isn't really clear if I want "..that handles fewer
archive formats" or "a light-version of 7za".

Perhaps the z7a help text should be something like:

Full 7za archiver. The program supports 7z, ZIP, CAB, ARJ, GZIP, BZIP2,
TAR, CPIO, RPM and DEB formats

(also from the man page).

And for 7zr:

Lightweight 7zr archiver. The program only handles 7z archives and
cannot handle encrypted archives

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
