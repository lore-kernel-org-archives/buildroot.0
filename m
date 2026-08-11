Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D27C5AC67
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 13:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B0A24057B;
	Tue, 11 Aug 2026 13:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsy9WkjrT0kL; Tue, 11 Aug 2026 13:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72A91405DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786455706;
	bh=OND0kT20iK6LfMNH71dYK0rmUVhkB6ArRK3RIhbxCj4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fBF486VW+He/14Eg6l8mXYvp35tAFHci9RD+koBhm3gnkOleJE6CEl5lLW63v6MgE
	 p5dqcpyp1OBuD5NFtOx+ntwOpQQcauMVwOuRZKqi42FVAoFxDizdMVDSntC5dkp9jW
	 INl7slOvw1sqglPce61jNCRwThFSFBcZue4TXtX8mAF5YJG0NWC6CoueuoRw5rIphi
	 gfhUlNDFKlYo/sQi4O3j+uGOx52J6y9bcVIyaULNa+L2t1WmOLbmOQ8g59202uzibt
	 0ag1xG/IBheX3SIvZXGrd2fMASP/uDEOCryYh4rVJ4Sbqc3RX4+5FFhQ0hrkNKNSRO
	 QF0IQXh6y7TuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A91405DE;
	Tue, 11 Aug 2026 13:41:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA38F345
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 13:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D83D7405DE
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 13:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFEwMyq4Vyp0 for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 13:41:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96C3D4057B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96C3D4057B
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96C3D4057B
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 13:41:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-47f7854678cso2091151f8f.1
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 06:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786455701; x=1787060501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1gxSgU5peaxb8nrqHg7aPdJBOfeEyF+5kM3SZVP49LQ=;
 b=F3LNh5QAB39CvKyl9GCSULedUxoBzgFaQwzRVh6pWFtZn79O5ruBLH6dC+8BWWuytb
 3nF+t48cQF6arozuUHce4eUsyDIyrL+CuXEvpA+AMoiLUs9F/R1yWbfiBn8cPdurkdAt
 BOpB9tIBrW8osbGd+nor3agxYZlp7P4G/86p9/wVfGh84PLoJmEzl66t9eeTEJP15Iyi
 ICndVfUcsnvMKTld3NbnRhYYitF/uLfC46Xq1sFURQeMBU07JF3Op9nJlcseo1U1HzUp
 8cCbVoAf6bD3Kx+QAF58Wa3sLcLMh7kp5glpFTz0dQpjM9kGM+2+RiQ/76/DPcfRXQWg
 4cLQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpWQeGWSav5sdYVNh3q2ErAmut1zL/cQjGsE9Pb4Xr9iXW+wXn7mqKybwi7x9zBVw6jZ6sIysnf600=@buildroot.org
X-Gm-Message-State: AOJu0Yy6IBGt8u0VMiYKUxI+6JB6vUu186qzj+7tG4MYM7h+pqUNRqnR
 Kh1HFk9H9Gn7SzAwZO42qmrUfb9WBRp39sysa1/kzNpHqyj01Au9p/SBiorK9FpJDdkDUtY/IZL
 QTVXA
X-Gm-Gg: AR+sD10lLKx1zGJM9UzbfyKFiB9Pg5k6ymbVPFdxU5UUtPlGDE9uGH4N0B+OJJ7PCub
 ITGEf2WDv0tpDyOM6S/5PyGoDTB0rIOxhw0CCOP8OOUiZeC6txT4USXhBKflcIeZZqIbVmjHr0z
 gp3VpjOEBDH7HTmwknYjKLT3IaisJysLfJMLDbsMwWKxAqY/9kyQ35iUZZSx0Bk///VWYkBQORj
 hfI2DgfqmjbOK+zR9OfLpV4BsLAQ8Y806yQ1RW65/ePrFVEAZZ3MWC1j7YS7sfg3S1CewSKdav/
 o88qrL/skHtJ6RSGfVDB0hKct+G73FXFUoDqPNN3lmtVbNhgSpRbNaauTAzl2Ts9CrqYlDe6SRH
 zlMnLfjFw2ffux9+CTqkLcHLzZelhlt1OAQeJuy3nyM93c9W7KQ8PAKXh6h74jhJXJ/by+xbhTb
 r7KVm3FRHDMnO5K9IQeRSpo0fcUvR0Bcc9jFXi2CS7V/iXl7hZhWZ50A==
X-Received: by 2002:a05:6000:2607:b0:47f:e748:3ae3 with SMTP id
 ffacd0b85a97d-4814ad83223mr6729780f8f.3.1786455700911; 
 Tue, 11 Aug 2026 06:41:40 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4814a7096c5sm4677289f8f.24.2026.08.11.06.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 06:41:40 -0700 (PDT)
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Tue, 11 Aug 2026 15:41:38 +0200
Message-ID: <20260811134138.169378-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8d6fa46d-8200-454e-b5ac-aeccc4809647@cherry.de>
References: <8d6fa46d-8200-454e-b5ac-aeccc4809647@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786455701; x=1787060501; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1gxSgU5peaxb8nrqHg7aPdJBOfeEyF+5kM3SZVP49LQ=;
 b=NdbHLqJ26oraM+/yKIWyIMOlMYTYK/Q8NjMaF05A5jQCOCp5nwkss2qNugFbpfCHqL
 TDfb5ugXOdkUc1NSuTTlw4ojXpSjOT3BUbsK8zUrTSImBScP/XanqV+FMHb4yvBRXEHf
 +6Rzr/XK0JfxNgRKoeUBRxd2vYCnrrBlMYD/lSIYUmCkmPSmOPhMNMrhn8+7UqjaC9S6
 WDqMTm5NWPOrkOa8OdZrVj7iPBEm+AMgMvivFpVMBtZv0DmcoVVMliX1W1zgWv52XKA9
 9A//H/HKcRqIFH3cirbbFVKJyUBTzolzWPHh17MBbnBiI7P0bkjT0DXDcYG4Dm36zd7W
 YrgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NdbHLqJ2
Subject: Re: [Buildroot] [PATCH v2] docs/website: link LTS tooling
 documentation and staging branch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

In reply of:
> Hi Thomas,
> 
> On 8/11/26 2:26 PM, Thomas Perale wrote:
> > Users asked where the notes are available and if the information are
> > publicly available.
> > > Those changes clearly explain the location and convention of the staging
> > branches and also link to more documentation on how to read the
> > annotations.
> > > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> > ---
> > v1 -> v2: took into account review from https://lore.kernel.org/r/<f6b4e9a2-8ee5-4799-960f-36dbf5710da6@cherry.de>
> 
> Please don't forget to remove the <> otherwise it's not a valid link.
> 
> > ---
> >   docs/website/lts.html | 29 +++++++++++++++++++----------
> >   1 file changed, 19 insertions(+), 10 deletions(-)
> > > diff --git a/docs/website/lts.html b/docs/website/lts.html
> > index 3bfd2a4374..7513acc885 100644
> > --- a/docs/website/lts.html
> > +++ b/docs/website/lts.html
> > @@ -166,10 +166,6 @@
> >       <br/>
> >       <br/>
> >   > -    <p>
> > -    More details about the LTS workflow at <a href="https://gitlab.com/buildroot.org/buildroot-lts-tools">buildroot.org/buildroot-lts-tools</a>.
> > -    </p>
> > -
> >       <div id="organization" class="br-lts-section-header">
> >           <div class="br-lts-bg-grid"></div>
> >           <div class="br-lts-title-box">How we work</div>
> > @@ -181,12 +177,25 @@
> >       analyze based on the previous week's commits to the master branch. The
> >       commits are then annotated to define a list of candidates for the LTS
> >       branches.
> > -    <br><br>
> > -    On Thursday, the candidates are cherry-picked to a staging branch to be
> > -    reviewed by the other maintainers. On Thursday evening the branch is
> > -    synced with upstream and contributors are notified. Feedback from
> > -    users, sponsors and autobuilders are then collected and vulnerability
> > -    analyses updated.
> > +    </p>
> > +
> > +    <p>
> > +    On Thursday, the candidates are cherry-picked to a staging branch hosted on
> > +    <a href="https://gitlab.com/essensium-mind/buildroot/">gitlab.com/essensium-mind/buildroot</a>.
> > +    Every maintained branch has a staging branch, with the <code>.x</code>
> > +    suffix replaced by <code>.pre</code>. The staging branch allows other
> > +    maintainers to review the changes before they are pushed upstream.
> > +    </p>
> > +
> > +    <p>
> > +    On Thursday evening, the branch is synced with upstream and contributors
> 
> Which timezone :)
> 
> We don't need to be precise, so I think something like "Europe time" would be precise enough for that purpose.

To be honest the main takeaway should be: "It will be synced by the end of the
week". The Thursday evening mention came from when Arnout was syncing and no
longer really apply today.

I will change to a more vague timing instead.

> I appreciate the "synced" term comes from https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/README.md#syncing-pre-and-x-branches and is clear to you, but it isn't for me, I read this as the equivalent of rebasing 2025.02.pre on top of 2025.02.x in case there were other patches pushed since 2025.02.pre branched off 2025.02.x (typical workflow if you have multiple maintainers with merge requests to a single branch).
> I also see it being used in the graph in "How we work". The only important part to the user I believe is that the .pre branch is pushed to the .x upstream branch (and because it's pushed, a mail per new commit is sent on the mailing list). Unlike the kernel and Yocto stable branch workflows, I seem to have understood that patches in Buildroot are directly merged to the stable branch(es), without prior public notice on the mailing list (except if they were initially posted on the mailing list, by other contributors). Is that correct? 

Correct.

> If so, I suggest to simply reword "sync[ed] with upstream [branch]" with "push[ed] to upstream [branch]". What do you think?

Yes, let's change it to 'push'. Match the git terminology better.

> 
> > +    are notified. Feedbacks from users, sponsors and autobuilders are then
> > +    collected and vulnerability analyses updated.
> 
> Feedback is not countable, no trailing s.
> 
> Also, I'm not sure what I'm supposed to understand from this sentence. What do you do with feedback from users, sponsors and autobuilders? Are they visible somewhere? Is this what's reported in e.g. https://lore.kernel.org/buildroot/6a545c29.87c5160c.35d6c8.0d2e@mx.google.com/?

Feedback from users are email reaction if a cherry pick landed on a branch it
should not by mistake or a commit was not cherry picked and the user ask the
reason.
Autobuilder feedback are the build-errors from https://autobuild.buildroot.org/
that may start after pushing some changes.

> For the updated vulnerability analyses, I'm assuming it's the one available at security.buildroot.org as listed in the 2. Vulnerability tracking & reporting section? The link is for 2025.02.x which is a bit weird since 2027.02.x will also be an LTS. Maybe simply point at https://security.buildroot.org/ and let the user figure out where to go from there?
> 
> With the timezone + feedback typo fixed:
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> as the rest can always be improved later on.
> 
> Cheers,
> Quentin
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
