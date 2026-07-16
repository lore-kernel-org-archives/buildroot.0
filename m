Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01A1C44515
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 14:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1026088E;
	Thu, 16 Jul 2026 14:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXUVPNFkFGkh; Thu, 16 Jul 2026 14:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2CE36087B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784212660;
	bh=QQCX+da3vHEZgmuSSQXqaGm28QGcFPaIGyJX3Ve0erQ=;
	h=In-Reply-To:References:Date:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nGO+s5wWxvx/e7MZPeGKFbMDqo4yzhU6loklwpWUIAzmDCNmzZYZjUuXN1KiLSAfo
	 zNYiqhBCrnYGCxOZfj5FDx6lySIU5bpCUnqYqwmuy2e5BcMAwTtSF6HJW7WDk0QQke
	 ePnltRjVFA1hRdUUA9PkDDQMJEu5i5uCl0HQIT4f7HiBYezLLV2wkQFwBOAa0DWHqL
	 ROQzpbwdnWPmNiwIN/e79KXKDIf7vXxIlDeGPLghP735fLkYZWZDfglK3hzyffLVgt
	 i6tbNsYwD2PSBqd8hXz2h8Gyfmw15taPuR5rT9eWnASzSBZpC276iBQKRZeFcERaZE
	 +x0KaoXkVVIxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2CE36087B;
	Thu, 16 Jul 2026 14:37:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D9F81F6
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 14:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F3904090A
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 14:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MX14CDWg0Ab1 for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 14:37:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A589B408DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A589B408DB
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A589B408DB
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 14:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 13A111814BE; Thu, 16 Jul 2026 16:37:32 +0200 (CEST)
In-Reply-To: <ecd077db-2ded-4ba5-bf23-eec72b143ed5@rnout.be>
References: <20260715193512.46B9288999@busybox.osuosl.org>
 <d69f1972-f7e5-a606-5ec3-9c82324726f8@heine.tech>
 <ecd077db-2ded-4ba5-bf23-eec72b143ed5@rnout.be>
Date: Thu, 16 Jul 2026 16:37:32 +0200
To: "Arnout Vandecappelle" <arnout@rnout.be>
MIME-Version: 1.0
Message-ID: <312d9bc4-c680-c909-6860-b5c44ff8053c@heine.tech>
User-Agent: SOGoMail 5.12.8
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1784212654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rjXzppcxVUo3IMPK84hqCbv4Nehdql/vloKJ7oQvnFE=;
 b=XeoRlKmIEGBhNx8L/FsL7VAdRcFZiEITDYwJ5us0pkVbfxunEYz13xDAIA7/epNMkfpJnk
 SRVaJ+RSfyUFXxYQVSWBxAhMH9VF5AcvuobQrqZyaocon5C918P8BCbdkEwIj1iGm6e+dW
 itF8IJOZTAjiDf0ae7MJsqkmb0/DvB8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=XeoRlKmI
Subject: Re: [Buildroot] 
 =?utf-8?q?=5Bgit_commit=5D_docs/website/download=2Eh?=
 =?utf-8?q?tml=3A_remove_old_stable?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

thanks for the information. That clears that up.

Regards,
Michael

On Thursday, July 16, 2026 13:33 CEST, Arnout Vandecappelle <arnout@rnout.be> wrote:

> 
> 
> On 16/07/2026 09:06, Michael Nosthoff wrote:
> > Hi Arnout,
> > 
> > I'm a bit confused. Was there a change to the policy described in [0] that "The first release of each year is a long term support release, LTS"?
> > I couldn't find any announcement related to this. Can you enlighten me here?
> 
>   Oh yes, we changed that to a 3-year LTS (instead of 1 year) that is started 
> every 2 years (so with 1 year of overlap). See [1].
> 
>   It looks like we forgot to update the manual. Thomas, Titouan, care to take 
> care of that?
> 
>   Regards,
>   Arnout
> 
> [1] https://buildroot.org/lts.html#releases
> 
> > 
> > Regards,
> > Michael
> > 
> > 
> > [0] https://buildroot.org/downloads/manual/manual.html#_releases
> > 
> > On Wednesday, July 15, 2026 21:33 CEST, Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:
> > 
> >> commit: https://gitlab.com/buildroot.org/buildroot/-/commit/931803d24d37243af45c76fb8087e77141caa544
> >> branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master
> >>
> >> Now 2026.05.1 is released, we no longer need to advertise the EOL old
> >> stable.
> >>
> >> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
> >> ---
> >>   docs/website/download.html | 26 --------------------------
> >>   1 file changed, 26 deletions(-)
> >>
> >> diff --git a/docs/website/download.html b/docs/website/download.html
> >> index 57183da23c..35d8c28dae 100644
> >> --- a/docs/website/download.html
> >> +++ b/docs/website/download.html
> >> @@ -70,32 +70,6 @@
> >>               <a href="/downloads/buildroot-2026.05.1.tar.xz.sign">[PGP sig]</a>
> >>             </td>
> >>           </tr>
> >> -        <tr>
> >> -          <th>Old stable (EOL)</th>
> >> -          <th>2026.02.x</th>
> >> -          <td>June 2026</td>
> >> -          <td>
> >> -            2026.02.3<br/>
> >> -            <a href="https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02.3/CHANGES">
> >> -              Changelog
> >> -            </a>
> >> -          </td>
> >> -          <td>2026-06-16</td>
> >> -          <td>
> >> -            <a href="/downloads/buildroot-2026.02.3.tar.gz">
> >> -              <img src="images/zip.png" width="24" alt="">
> >> -              .tar.gz
> >> -            </a><br/>
> >> -            <a href="/downloads/buildroot-2026.02.3.tar.gz.sign">[PGP sig]</a>
> >> -          </td>
> >> -          <td>
> >> -            <a href="/downloads/buildroot-2026.02.3.tar.xz">
> >> -              <img src="images/package.png" width="24" alt="">
> >> -              .tar.xz
> >> -            </a><br/>
> >> -            <a href="/downloads/buildroot-2026.02.3.tar.xz.sign">[PGP sig]</a>
> >> -          </td>
> >> -        </tr>
> >>           <tr>
> >>             <th>Long-term support</th>
> >>             <th>2025.02.x</th>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
> > 
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
