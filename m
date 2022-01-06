Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43B7C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 10:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C4B96FBCA;
	Thu,  6 Jan 2022 10:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRbkYtYUWE-v; Thu,  6 Jan 2022 10:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B7A06FBA7;
	Thu,  6 Jan 2022 10:32:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A25301BF47D
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CD7240139
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 10:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dP5RTznOLlki for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 10:32:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 849C7400C7
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 10:32:34 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 5BDB678031A;
 Thu,  6 Jan 2022 11:32:31 +0100 (CET)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtp (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1n5Q4N-0006eS-3D; Thu, 06 Jan 2022 11:32:31 +0100
Received: from ig by zenon.in.qult.net with local (Exim 4.94.2)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1n5Q4L-0068dh-Se; Thu, 06 Jan 2022 11:32:29 +0100
Date: Thu, 6 Jan 2022 11:32:29 +0100
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220106103229.brnw22bg5xb6sqpu@zenon.in.qult.net>
References: <20211215173432.r75invoe3ff6mthg@zenon.in.qult.net>
 <20220105203727.GH614810@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220105203727.GH614810@scaer>
Subject: Re: [Buildroot] [PATCH] package/fakedate: fix finding the right
 date executable
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Jan 05, 2022 at 09:37:27PM +0100, thus spake Yann E. MORIN:
> Ignacy, All,
> =

> On 2021-12-15 18:34 +0100, Ignacy Gaw=EAdzki spake thusly:
> > If the PATH initially contains host/bin, then the right date
> > executable is to be found after the *first* occurrence of fakedate in
> > normal (forward) PATH order.  Fix the wrapper so that that first
> > occurrence is found indeed.
> > =

> > Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.=
fr>
> =

> After discussing this with Arnout and Thomas, we concluded that Arnout's
> proposal, with my ltile amendment, was the proper solution. Except that
> the loop had to be broken on first hit, of course, so I added the proper
> break.
> =

> I also added a test that we actually did find a date executable.
> =

> Of course, if we missed something, then feel free to yel back! ;-)

With this code, fakedate is not usable without having its path in
PATH.  If that will never be a problem, then I have no reason to yell. =3D)

> =

> Applied to master, thanks.
> =

> Regards,
> Yann E. MORIN.
> =

> > ---
> >  package/fakedate/fakedate | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > =

> > diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
> > index 9bef113357..03a4f04079 100755
> > --- a/package/fakedate/fakedate
> > +++ b/package/fakedate/fakedate
> > @@ -21,13 +21,18 @@
> >  DATE_BIN=3Dfalse
> >  # Do not call any 'date' before us in the PATH, or that would create
> >  # an infinite recursion.
> > +last_date=3Dfalse
> >  for date in $(which -a date |tac); do
> >      if [ "${date}" -ef "$0" ]; then
> > -        break
> > +	DATE_BIN=3D$last_date
> >      fi
> > -    DATE_BIN=3D"${date}"
> > +    last_date=3D"${date}"
> >  done
> >  =

> > +if [ "$DATE_BIN" =3D false ]; then
> > +    DATE_BIN=3D$last_date
> > +fi
> > +
> >  if [ -n "$SOURCE_DATE_EPOCH" ]; then
> >      FORCE_EPOCH=3D1
> >      for i in "$@"; do
> > -- =

> > 2.32.0
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> =

> -- =

> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspi=
racy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___         =
      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspir=
acy.  |
> '------------------------------^-------^------------------^--------------=
------'
> =

> =


-- =

Ignacy Gaw=EAdzki
R&D Engineer
Green Communications
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
