Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3206DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD82D40B47;
	Thu, 27 Jan 2022 07:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY4YALQavaVd; Thu, 27 Jan 2022 07:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9AC840B41;
	Thu, 27 Jan 2022 07:23:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6D0A1BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2BBE40B41
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:23:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jtli82p_xd5F for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:23:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A098140B25
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:23:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70F81FF805;
 Thu, 27 Jan 2022 07:23:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCz7Y-0002Y0-Mx; Thu, 27 Jan 2022 08:23:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>,
 thomas.petazzoni@bootlin.com
References: <20220108164622.89A0281DFE@busybox.osuosl.org>
Date: Thu, 27 Jan 2022 08:23:04 +0100
In-Reply-To: <20220108164622.89A0281DFE@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sat, 8 Jan 2022 17:51:24 +0100")
Message-ID: <87v8y5d4mf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/ca-certificates: remove
 dependency on host-python-cryptography
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

Hi,

 > commit: https://git.buildroot.net/buildroot/commit/?id=363dd649f31c7e7732f3cd509d43cebbb53e51ce
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The host-python-cryptography module is only used by ca-certificates
 > for a check of the expiration date of certificates, which is only a
 > warning not even causing the build to abort, i.e something that
 > Buildroot users are most likely never going to see.

 > Since the host-python-cryptography dependency would soon require a
 > dependency on rust, it's a lot simpler to just patch the
 > certdata2pem.py script to no longer require cryptography, but only
 > make use of it if available.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]

 > +++ b/package/ca-certificates/ca-certificates.mk
 > @@ -7,7 +7,7 @@
 >  CA_CERTIFICATES_VERSION = 20211016
 >  CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
 >  CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
 > -CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python-cryptography
 > +CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3

Can we then change to BR2_PYTHON3_HOST_DEPENDENCY instead of
host-python3 now that no extra python modules are used?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
