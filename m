Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C1FC54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 12:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B3881457;
	Mon, 30 Jan 2023 12:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B3881457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLP0VDrhV-Xx; Mon, 30 Jan 2023 12:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A2508141D;
	Mon, 30 Jan 2023 12:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A2508141D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FC661BF5A4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 12:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 590F760A6B
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 12:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 590F760A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5aVpwy8fwnzn for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 12:17:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72687605A1
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72687605A1
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 12:17:44 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id t16so13746029ybk.2
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 04:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d8WInqpJvaewL7Qa6UsCl6S3/SOgECQ9RQy3kDSAvxw=;
 b=sraVBloWxq/xL1JOnYRKDe9Cm/dEtuDUzfvXQaqu3w7O7AQI0O2DVgi6ioTQQk1OY5
 lvYmgfuW6bPCMFOBVX08qZ+pMr1hgQbNiCWSXMqKdEnKn0jUHuuAp4IzKYm3A5t8fzxb
 JaSyMrscxS0EH0Bseke3fZzU6jzDr+h/gCme4d3JxCmuZIzkeKbdd559iVMZCZYAPvRG
 mYXTV6jZHdPGVRS6bPNhJnAU+LqEund0pUzVD7jvGlaWxeLpWVz2HPajQp4XVK5pyECM
 pHYkY0wo4JqB/IFafvckKpxP2hlH4xPcGeOkGQ5diwdKHWjMOIhHh0xKKFTecYJoaLNk
 LvcQ==
X-Gm-Message-State: AFqh2ko6NKMRHFmFoXH5C121mXZAWFULaKwWSuVxYlL8wpN09F2qhgaU
 W2KWdUydxhpgA8Tl02Kkz1UtnWW3htC+MtcZziP18PH00/o=
X-Google-Smtp-Source: AMrXdXsEU5ZmSR2LYlmEdkyiXVvfBraj2kxL1KByVdPd+1N9XlV3+6XblrSbsMZwL0Va/69ip438dX/6kfq9VK0z/Dk=
X-Received: by 2002:a5b:947:0:b0:7d2:a94c:1ebf with SMTP id
 x7-20020a5b0947000000b007d2a94c1ebfmr5837193ybq.554.1675081062988; Mon, 30
 Jan 2023 04:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20190531075800.7064-1-vcrini@gmail.com>
 <20190804175202.5161324c@windsurf.home>
 <CAFGQKxfSLb8cgtbTnsYmkHXtsmod=39iHrb9aedoAxrxYF+6Vg@mail.gmail.com>
 <CAGm1_kv-r9CUBSQ1mNsin4LNgJyNb=1bN9BqNZsscGueFQ_huQ@mail.gmail.com>
 <CAO-fR8RtJ=_xEO95P+Qf3WAVmN204iVWt4wKWv9i6-BSbTwVAg@mail.gmail.com>
In-Reply-To: <CAO-fR8RtJ=_xEO95P+Qf3WAVmN204iVWt4wKWv9i6-BSbTwVAg@mail.gmail.com>
Date: Mon, 30 Jan 2023 13:17:31 +0100
Message-ID: <CAGm1_ku4HDHspdMpzwRW8kKRzSo5U=Vmy9Y0qHto_TuWa1eK=g@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d8WInqpJvaewL7Qa6UsCl6S3/SOgECQ9RQy3kDSAvxw=;
 b=HlAL1ZpBf2SAix86tJoyKvlNK/UMojmfWPba47RTGYMxk7/VGuyVFKZjf4UmPES4qM
 WR9T2qy66Y8HOMN16VTH6NjayqQLYwitBWYeydpDJ6yxrDCnlJC4ZxZpigfFdEIElqVX
 Q8Q+YnMj44D3CgigBAbOpmj0hXUiK8llGpyRBrnEdx9kLwPagnPKry5QTWfY4yWdG9R8
 8+i1cwR6xsKEb5n6CJRs6u6ia+lJz97dYIdq1pJaPKoMwRW/kNWJNRgmG8c/TkLDs5jX
 768P8rSL1v1Cg774ReOS/3v5vYcA9vyPujLJ0cHWSueASoA+DVZgdbu9KqUEMrplp1+p
 /hQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HlAL1ZpB
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts: add node modules to
 check-bin-arch's IGNORES list
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi All,

On Wed, Dec 9, 2020 at 7:35 AM Valerio Crini <vcrini@gmail.com> wrote:
>
> Hi Yegor,
> Thanks for trying to fix the issue.
> Unfortunately I do not work for the company that gave me the opportunity to use the code that gave me the original error. So I am not able  to reproduce the issue anymore.
>
>
> Il mar 8 dic 2020, 16:36 Yegor Yefremov <yegorslists@googlemail.com> ha scritto:
>>
>> Hi all,
>>
>> On Sat, Aug 10, 2019 at 5:44 PM Martin Bark <martin@barkynet.com> wrote:
>> >
>> > Hi,
>> >
>> > On Sun, 4 Aug 2019 at 16:52, Thomas Petazzoni
>> > <thomas.petazzoni@bootlin.com> wrote:
>> > >
>> > > Hello Valerio,
>> > >
>> > > +Martin Bark in Cc.
>> > >
>> > > On Fri, 31 May 2019 09:58:00 +0200
>> > > Valerio Crini <vcrini@gmail.com> wrote:
>> > >
>> > > > From: Valerio Crini <valerio.crini@docomodigital.com>
>> > > >
>> > > > Some node modules as stf ship compiled binaries causing check-bin-arch script
>> > > > to return errors.
>> > > >
>> > > > Signed-off-by: Valerio Crini <valerio.crini@docomodigital.com>
>> > > > ---
>> > > >  support/scripts/check-bin-arch | 5 +++++
>> > > >  1 file changed, 5 insertions(+)
>> > > >
>> > > > diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
>> > > > index 3449bd1aeb..a276b75b92 100755
>> > > > --- a/support/scripts/check-bin-arch
>> > > > +++ b/support/scripts/check-bin-arch
>> > > > @@ -25,6 +25,11 @@ declare -a IGNORES=(
>> > > >       # it for a different architecture (e.g. i386 grub on x86_64).
>> > > >       "/lib/grub"
>> > > >       "/usr/lib/grub"
>> > > > +
>> > > > +     # Skip files in /usr/lib/node_modules, since it is possible to have it
>> > > > +     # for a different architecture (e.g. stf module has some packages already
>> > > > +     # compiled for several architectures).
>> > > > +     "/usr/lib/node_modules"
>> > >
>> > > Thanks for providing this patch. Could you give a bit more details
>> > > about which libraries get installed, what is their name, etc. ?
>> > >
>> > > Indeed, rather than ignoring files from /usr/lib/node_modules, it would
>> > > be a lot better to remove the libraries that are anyway not useful
>> > > because they don't match the CPU architecture of the target. This would
>> > > both reduce the filesystem size *and* solve the check-bin-arch issue.
>> >
>> > Yes i agree Thomas, this is the correct solution.  I would recommend
>> > you create a custom package for your application and in the BUILD_CMDS
>> > use $(NPM) install to install you node_modules followed by code to
>> > filter out any files that do not match your CPU architecture.  Here is
>> > a script i've used before to do this
>> >
>> > # Remove executables which are not the correct target arch
>> > for f in $(find $(@D) -executable -type f) ; do
>> >     a=$(${TARGET_READELF} -h $f 2>&1 | sed -r -e '/^  Machine:
>> > +(.+)/!d; s//\1/;')
>> >     if [ ! -z "$a" -a "$a" != "${BR2_READELF_ARCH_NAME}" ] ; then
>> >         echo "Remove: $f Arch: $a"
>> >         rm -f $f
>> >     fi
>> > done

I now also have two cases where I get precompiled Node.js module binaries:

- my own BR package
- when installing the modules via Node.js config option

Where should Martin's script reside? In a script before
support/scripts/check-bin-arch and handling only /usr/lib/node_modules
or inside support/scripts/check-bin-arch and handing all folders that
are not in the IGNORE list?

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
