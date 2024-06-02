Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491FAC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 18:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAEA040025;
	Sun,  2 Jun 2024 18:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tKOqwY_Wi6r; Sun,  2 Jun 2024 18:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BD88400B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BD88400B9;
	Sun,  2 Jun 2024 18:18:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A1EC1BF4DA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3174B803BE
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 18:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AiNJWy_KftVf for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 18:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9599D82033
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9599D82033
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9599D82033
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 18:18:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C99CDE0003;
 Sun,  2 Jun 2024 18:18:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sDpmP-00110M-0d;
 Sun, 02 Jun 2024 20:18:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240602145542.2485828-1-yann.morin.1998@free.fr>
Date: Sun, 02 Jun 2024 20:18:05 +0200
In-Reply-To: <20240602145542.2485828-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 2 Jun 2024 16:55:42 +0200")
Message-ID: <875xurky3m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/pkg-download: use _DL_SUBDIR as
 root dir of generated archives
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, when wegenerate archives, e.g. for git, svn, cargo, go, we
 > use the package _BASENAME_RAW as the root directory of the generated
 > archive. For example, for package foo at version 1.2.3, that would
 > generate an archive rooted at foo-1.2.3/.

 > This is usually what we want, except in one specific condition: when the
 > package shares its download with another package *and* it is a generated
 > archive. In that case, the root directory will be different for each of
 > the two packages, which is incorrect, but was so far benign: we never
 > had any hash for such generated archives, and they were only generated
 > in two cases:
 >   - linux and linux-headers
 >   - barebox and barebox-aux

 > As we skipp one directory depth when extracting the archives, we did not
 > care what the root directory was; whether it was that of one package or
 > the other was of no consequence.

 > But now that we can have hashes for archives generated from custom
 > versions, this breaks the usual case where the headers used for the
 > toolchains are those os the kernel to build for the target. In this
 > case, we may end up downloading the linux-headers package before we
 > download the linux  package, so we'd get the hash for an archive rooted
 > at linux-headers-XXX/, but the one for the linux package the archive
 > wouold be rooted at linux-XXX/, or we may end up (e.g. with parallel
 > builds) downloading the linux pakcage first and linux-headers next.

 > That would cause conflicts in hashes, as demonstrated by the only
 > defconfig we have in that situation, olimex_stmp157_olinuxino_lime.

 > _BASENAME_RAW is a construct that is expanded to include the RAWNAME
 > followed by a dash and the version, if there is a version, or with just
 > the RAWNAME when there is no version.

 > We tweak the download macro to use _DL_SUBDIR followed by the version.

 > This is only used by VCS backends (cvs, git, svn...) and so there will
 > always be a version string, so no need to duplicate the case without a
 > version like is done for _BASENAME_RAW

 > _DL_SUBDIR defaults to _RAWNAME, so this is a noop by default, unless
 > the package declares it shares its download with another one, in which
 > case the generated archive will now be rooted as for the shared package.

 > This was trigerred by:
 >     https://patchwork.ozlabs.org/project/buildroot/patch/20240602070634.597337-1-francois.perrad@gadz.org/

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Francois Perrad <francois.perrad@gadz.org>

That indeed caused quite some head scratching today.

Committed, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
