Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E8BC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 10:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DA4441F39;
	Sat, 13 Jan 2024 10:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DA4441F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxIMjgn5965L; Sat, 13 Jan 2024 10:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C755741F34;
	Sat, 13 Jan 2024 10:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C755741F34
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD9271BF397
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 10:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6E5D41F33
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 10:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6E5D41F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i6Z1LWmq6gJ3 for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 10:33:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87D3141F31
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 10:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D3141F31
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F48E1BF204;
 Sat, 13 Jan 2024 10:33:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rObKQ-00CZJt-2b;
 Sat, 13 Jan 2024 11:33:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240106091149.57205-1-fontaine.fabrice@gmail.com>
Date: Sat, 13 Jan 2024 11:33:26 +0100
In-Reply-To: <20240106091149.57205-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 6 Jan 2024 10:11:49 +0100")
Message-ID: <87cyu5wmix.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: fix uclibc build
 with libiconv (again)
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 7991d2c48a859f9c0333ade8192868c21b1a8a31 wrongly removed patch
 > added by commit 1e8cce6f2b1936dbda9d63ddf4f41acf59a64113, advocating
 > that upstream applied a different "solution", this "solution" was
 > already tested on buildroot with commit
 > 9525bc7e64e8f44c31ab9dfd3f516ecb35982429 and is utterly broken as stated
 > in:
 > https://github.com/libarchive/libarchive/pull/1825#issuecomment-1403537856
 > https://github.com/libarchive/libarchive/pull/1825#issuecomment-1437451472
 > https://github.com/libarchive/libarchive/issues/1819#issuecomment-1439962521
 > https://github.com/libarchive/libarchive/issues/1841#issuecomment-1426628554
 > https://github.com/libarchive/libarchive/pull/1813#issuecomment-1396373372

 > As a result, build failures are again raised by uclibc-ng with libiconv
 > on fwup/gvfs/...:

 > configure: error: Requires libarchive. Libarchive must be built with zlib support.

 > [...]

 > Run-time dependency libarchive found: NO (tried cmake)

 > ../output-1/build/gvfs-1.48.1/meson.build:405:2: ERROR: Dependency
 > lookup for libarchive with method 'pkgconfig' failed: Could not
 > generate cargs for libarchive:
 > Package iconv was not found in the pkg-config search path.
 > Perhaps you should add the directory containing `iconv.pc'
 > to the PKG_CONFIG_PATH environment variable
 > Package 'iconv', required by 'libarchive', not found

 > So revert the upstream "solution", put back previous patch and let's
 > hope that upstream improve their skills in pkg-config and static
 > building but they probably don't really care about it...

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0f5058634ecc2ffae3993f6f4513d8ce75e6c02f
 >  - http://autobuild.buildroot.org/results/20fc291ef7e37ee8bd553976cbe841e53345680b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
