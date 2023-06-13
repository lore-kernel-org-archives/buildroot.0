Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83172EB64D0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 13:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9712461148;
	Tue, 13 Jun 2023 13:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9712461148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4xvB2z-FjPa; Tue, 13 Jun 2023 13:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF66960071;
	Tue, 13 Jun 2023 13:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF66960071
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8D081BF2FA
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 13:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEDB4416F7
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 13:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEDB4416F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_OvOZ9oGPhg for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 13:35:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5817402E4
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5817402E4
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 13:35:38 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 2CC57440828;
 Tue, 13 Jun 2023 16:35:06 +0300 (IDT)
References: <20230506214618.373562-1-yann.morin.1998@free.fr>
 <87y1knwnah.fsf@48ers.dk>
User-agent: mu4e 1.9.21; emacs 28.2
To: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Jun 2023 16:33:57 +0300
In-reply-to: <87y1knwnah.fsf@48ers.dk>
Message-ID: <87sfavqyc8.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1686663306;
 bh=fej35PXJetOBQ+Ng8eKS8DbKcoQ78vtau+RwG2PIFaQ=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=DGss94oQSmSAnBNTVc0ED51g3TrSwCXO9dvlYtTwvag3PKpS+S0eU2fAZFalrw0a2
 tV+wnbpTzdAeGIKnlAS28B1VKmdJFLzZKnFvK0Faa+Cr5duolYLHBaxJoWT3SRcNzV
 r/0WZwYJPVTouUGsgJ1uSFSNCKhz2U3ILFNAK+AEXPqpcQm3yumdoelUYC/KWBR+KW
 Fa/RpBpg6gMp4y0CskENi6UCby9Q0nP6kadQB2Fb5NtEeBam7iFcBO/ZwtaGJM9UCc
 Rwk1qJocmh4XiXYFAGdyCSdg/DfV0A6Gl3QvGOfFHumvIPnChufVaiozxLFF/Z0jI7
 CZrlhEuR+H9gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=DGss94oQ
Subject: Re: [Buildroot] [PATCH] utils/docker-run: make it work in
 workdirs/woktrees
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Tue, Jun 13 2023, Peter Korsgaard wrote:
>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > It is quite customary to use a single repository with multiple workdirs,
>  > one for each active branch, with either the aging 'git new-workdir' or
>  > the more recent 'git worktree'.
>
>  > However, in a workdir/worktree, most entries in .git/ are only symlinks
>  > to the actual files in the main repository.
>
>  > Currently, utils/docker-run only bind-mounts the current working copy.
>  > If that is a workdir/worktree, then it is going to be missing the actual
>  > git data, resulting in errors like:
>
>  >     $ ./utils/docker-run make check-package
>  >     fatal: not a git repository (or any parent up to mount point [....]/buildroot)
>  >     Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
>  >     No files to check style
>  >     make: *** [Makefile:1257: check-package] Error 1
>
>  > So, we also bind-mount the actual git directory. If that is a subdir
>  > of the current working copy, then it is already mounted and thus the
>  > bind-mount is superfluous but harmless; for simplicity, we mount it
>  > unconditionally.
>
>  > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>  > Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
>
> Committed to 2023.02.x, thanks.

Not in 2023.02.x branch as of commit bcddc639d.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
