Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F75C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 16:41:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A63E260184
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 16:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A63E260184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66FD840104;
	Sun, 29 Aug 2021 16:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNYijB5LZCZV; Sun, 29 Aug 2021 16:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2DA540108;
	Sun, 29 Aug 2021 16:40:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A414B1BF298
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 16:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 924C840409
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 16:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XnHTl4menxTA for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 16:40:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87BA3401B5
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 16:40:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87f:483a:a09f:382b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9D74E5FFAA;
 Sun, 29 Aug 2021 18:40:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630255248;
 bh=n0eWI1yjgcZ2lmr7WyKg/k/vLS0oE42rtfXmG8WwiKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UmrlUCDCDEWdSIIi5kYJM/uqlFcKWLYG8k6dLH/EcvkbuL4GOPQoj9lEPsRdW3FgS
 qKlzRdWP7K9ofTUHZ24g7GmZSU0N8a3tZDbvMreopASYplojJd4DaQ/JzoKT/H0Opm
 Pcak128NltoTVB2VUigphwotL2QCCVrk5JhF6DYzI8XnmzFWVJr2TQdLKTs++yL+Bb
 dhyNx4nY7KWO+Lvz79ERJvv81k2/hv6xCeRUBykRNKNryGJU1ISjtBlft+cYHiLDMO
 Y6MuJHg0eLIv3hdsoaqqM1DT520SxWDVOBRXJWQfHz/qfCHg2VWi2Pm6OL+LJdR4Uy
 9zpIus8c/DI6A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Aug 2021 18:40:31 +0200
Date: Sun, 29 Aug 2021 18:40:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210829164031.GB1053080@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-8-herve.codina@bootlin.com>
 <20210828224740.GS2661@scaer> <20210829133955.74d921e9@windsurf>
 <20210829125121.GA1053080@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210829125121.GA1053080@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 07/16] package/pkg-generic.mk: detect
 files overwritten in TARGET_DIR and HOST_DIR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Thomas, All,

On 2021-08-29 14:51 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> Finally, as a side note: there is still a case of file overwrite that we
> do not detect, even with this series: if two packages that are not part
> of the same dependency chain (i.e. they do not depend one on the other),
> and they both install the same file, then the file-overwrite will only
> happen when we eventually assemble the global target/ and host/ from the
> individual PPD target/ and host/ and we still have to add a detection
> for that case (which is not a pre-requisite before we apply the current
> series, of course).

And of course, this will also cause an overwrite when two such packages
are also dependencies of a third patckage, and so when the PPD of that
third package is prepared, we would have to detect file overwrite.

Note: let's assume the following hypotetical dependency graph (where the
notation A --<-- B means that B depends on A):

      .-<-- A --<-.                 S: skeleton
     /             \                F: target-finalize
    S --<-- B --<-- C
     \               \
      `-<-- D --<-----<-- F

If A and B both install the same file, then we do not have a sane PPD
to build C.

If D and any package in the dependency chain of C (i.e. S, A, B, or C
itself) install the same file, then we can only detect it in
target-finalize.

So, let's take a step back, and have a wider look. I wonder if the end
of a package installation step is the best location to detected file
overwrite...

Indeed, let's assume that we do file overwrite detection:

 1. in PPD preparation (when we rsync the dependencies, in the macro
    per-package-rsync): we can also detect that a package overwrites one
    or more files of another package, report those files, *and* prevent
    building a package with unsound dependencies;

 2. in {target,host}-finalize: we can detect that a package overwrites
    one or more files provided by another package, and report those
    files.

So, the above (still theoretical implementation) is all we would need,
in the end, and we would not need to do the detection at the end of a
package installation step of each package, because it would not provide
any information that we couldn't have with the above.

However, a benefit of also doing it at the end of the installation step,
of a package, is that we can cut short on the build time. However, I am
not sure that benefit is that important or major...

So, I'd like we think a bit harder before we apply this patch...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
