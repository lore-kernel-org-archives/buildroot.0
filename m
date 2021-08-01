Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B9AC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:14:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EA82600CD
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EA82600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 339E4838F0;
	Sun,  1 Aug 2021 09:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIA2SzmAafMT; Sun,  1 Aug 2021 09:14:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57B44833C7;
	Sun,  1 Aug 2021 09:14:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1B401BF399
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0B8F4026C
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 09:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rQsnmwCwL7So for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 09:14:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EC2C401DF
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 09:14:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f047:5d71:3678:2af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A2321200371;
 Sun,  1 Aug 2021 11:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627809271;
 bh=Z/OMisP1xVtuKZSTUJvcOW8fbaH4WQ0uakhJCLExmz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WTukJ6WquxKNDeHvqYqkZibObPOsMYwQRl+hrofrhT5qcqPFHQ1jg0OnpVLcSx4/k
 2UnMYfKs/VEDyolOAcsVMy4DYQ22GI72/fTQftBN04Lam+i4ulKAP0nTl8wJkogo0a
 tHfe0t4WW2z0RTL+aUYeeu0oSqrAKtvJtw9kkIy93han4gT7G7aKDwUgc2zq32iAoM
 4q5F1EejqHNqNNsTtJXexCgBk7xv4uZqmCWG/by5ib2zhaR3XcqGX+E9uZGSvPTDZ0
 k5Oh3oTJJCLfdWxUWA3dnZ5cnaEuAaODveBvSGFm83NN5A1dPb4YbKOxeZgwPVvRy1
 4vub4RIWYtFdw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 11:14:16 +0200
Date: Sun, 1 Aug 2021 11:14:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20210801091416.GQ3189549@scaer>
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
 <20201219153525.1361175-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2r_kBmCAF_ZAvF4EWivhXxaU1OBh6N=eAZSB=ZMqtrdow@mail.gmail.com>
 <20210729225000.750b323e@windsurf>
 <CA+h8R2onPMjOuvC0U6iM8QbhuAQQ9=aQ-yB-rWQkCbhpxcdiHw@mail.gmail.com>
 <20210801070830.GP3189549@scaer>
 <CA+h8R2pLN_aYiQ1vp+rTMUsQAcGT88fsAiCC-i9uJpK1y0r4rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2pLN_aYiQ1vp+rTMUsQAcGT88fsAiCC-i9uJpK1y0r4rw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 05/12] support/download/go-post-process:
 implement Go vendoring support
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Anisse Astier <anisse@astier.eu>,
 Ryan Barnett <ryan.barnett@rockwellcollins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Christian, All,

On 2021-08-01 00:24 -0700, Christian Stewart spake thusly:
> On Sun, Aug 1, 2021 at 12:08 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > So I also hashed the archives you provided, and they too are identical:
> >     $ sha1sum *.tar.gz
> >     bd887a60c4ca60e55d062067132ccab7d85e7d95  embiggen-disk-bad.tar.gz
> >     bd887a60c4ca60e55d062067132ccab7d85e7d95  embiggen-disk-good.tar.gz
> > Did you mess up when sending the archives?
> Not sure how that got mixed up, attached is the correct
> embiggen-disk-bad.tar.gz:

So, what are the differences?

First, looking at the compressed archive is useless. We really need to
look at the uncompressed archives to see what is going on.

    $ gunzip embiggen-disk-good.tar.gz embiggen-disk-bad.tar.gz

    $ hxedump -Cv embiggen-disk-good.tar >embiggen-disk-good.tar.hex
    $ hxedump -Cv embiggen-disk-bad.tar >embiggen-disk-bad.tar.hex

    $ diff -du embiggen-disk-good.tar.hex embiggen-disk-bad.tar.hex >embiggen-disk.diff

    $ diffstat <embiggen-disk.diff
     embiggen-disk-bad.tar.hex |   52    26    26     0 +++++++++++++-------------
     1 file changed, 26 insertions(+), 26 deletions(-)

So, there aren't so many differences, in the end. What's about them,
then? Let's see the first hunk (the others are very similar):

    @@ -4,10 +4,10 @@
     00000030  31 61 32 33 30 38 2f 43  4f 4e 54 52 49 42 55 54 |1a2308/CONTRIBUT|
     00000040  49 4e 47 2e 6d 64 00 00  00 00 00 00 00 00 00 00 |ING.md..........|
     00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
    -00000060  00 00 00 00 30 30 30 30  36 34 34 00 30 30 30 30 |....0000644.0000|
    +00000060  00 00 00 00 30 30 30 30  36 36 34 00 30 30 30 30 |....0000664.0000|
     00000070  30 30 30 00 30 30 30 30  30 30 30 00 30 30 30 30 |000.0000000.0000|
     00000080  30 30 30 31 33 34 37 00  31 33 36 31 36 36 36 32 |0001347.13616662|
    -00000090  36 31 33 00 30 32 30 34  30 33 00 20 30 00 00 00 |613.020403. 0...|
    +00000090  36 31 33 00 30 32 30 34  30 35 00 20 30 00 00 00 |613.020405. 0...|
     000000a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
     000000b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
     000000c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|

So, the first obvious delta: the access mode. In the 'good' archive, it
is 0644 (rw-r--r--), while in the 'bad' archive, it is 0664 (rw-rw-r--).

But Buildroot is supposed to enforce the mode, see Makefile:

    70: REQ_UMASK = 0022
    ...
    77: ifneq ($(shell umask):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
    ...
    83: _all:
    84:     @umask $(REQ_UMASK) && \
    85:         $(MAKE) -C $(CANONICAL_CURDIR) --no-print-directory \
    86:             $(MAKECMDGOALS) $(EXTRAMAKEARGS)

So, how comes that the two have different modes?

The second change is a bit more curious. As per the GNU tar manual [0]:
offset 0x94 (148) is 'char chksum[8]'.

So we should expect an 8-byte field (still from [0]):

    The chksum field represents the simple sum of all bytes in the
    header block. Each 8-bit byte in the header is added to an unsigned
    integer, initialized to zero [...]

OK, so because the mode is different, the delta from the mode is carried
over to the chksum.

If we can find why the modes are different in your two cases, we can
probably solve the issue.

QED.

Still, I would prefer that we do use the tarball helper, because then we
would have a single location where we could solve this kind of
problems...

[0] https://www.gnu.org/software/tar/manual/html_node/Standard.html

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
