Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E042BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91C5E813EA;
	Thu, 27 Jan 2022 07:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaJE7-j4TXmN; Thu, 27 Jan 2022 07:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDD1F813D3;
	Thu, 27 Jan 2022 07:53:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2E931BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C19864168E
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NoTBGjnUC_27 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:53:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D5B94019E
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:53:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D1456200012;
 Thu, 27 Jan 2022 07:53:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCzb1-00076j-5S; Thu, 27 Jan 2022 08:53:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20220108164622.9ABE7832B4@busybox.osuosl.org>
Date: Thu, 27 Jan 2022 08:53:31 +0100
In-Reply-To: <20220108164622.9ABE7832B4@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sat, 8 Jan 2022 17:51:24 +0100")
Message-ID: <87r18td37o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/rustc: fix
 BR2_PACKAGE_HOST_RUSTC_ARCH for ARMv5
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=1ed4147e76fe56322c47468be8a222204c459adf
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > BR2_PACKAGE_HOST_RUSTC_ARCH only had a special value for
 > BR2_ARM_CPU_ARMV7A, but it also needs a special value for
 > BR2_ARM_CPU_ARMV5, as the pre-compiled Rust standard library for
 > ARMv5TE is identified with the "armv5te" architecture name, see
 > https://doc.rust-lang.org/nightly/rustc/platform-support.html.

 > We noticed this because Rust binaries wouldn't work on an ARMv5
 > platform (Illegal instruction). This was due to the usage of the
 > arm-unknown-linux-gnueabi variant of the Rust standard library, which
 > is for ARMv6. Thanks to this commit, we correctly use the
 > armv5te-unknown-linux-gnueabi variant, and Rust binaries work properly
 > on ARMv5TE.

 > A better approach would be to do the conversion from architecture
 > options to Rust tuples in a single string symbol that also defines the
 > supported architectures, similar to how it's done in e.g. openblas.
 > However, that's a much bigger change. So for now, just do the easy thing
 > and fix this one issue.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
