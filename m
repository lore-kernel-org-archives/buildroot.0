From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Dec 2015 19:27:39 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: Add version 5.2.0
In-Reply-To: <CAFGQKxe1NUGfL3kY-T2VQE0ShhUh5G+oQVZmmDJaEvQ-5NQbHQ@mail.gmail.com>
References: <1450122295-5311-1-git-send-email-martin@barkynet.com>
 <20151214210913.227563c9@free-electrons.com>
 <CAFGQKxfvQwA3v8W=OKEvNR6SE06DTng6PxQGj4q7o4zUWYbU2g@mail.gmail.com>
 <20151214214337.2933ea41@free-electrons.com>
 <20151214211045.GA4152@free.fr>
 <1450132540.4928.24.camel@embedded.rocks>
 <56714A65.80301@imgtec.com>
 <20151216144140.3b3224c5@free-electrons.com>
 <20151216163920.GB4309@free.fr>
 <CAFGQKxe1NUGfL3kY-T2VQE0ShhUh5G+oQVZmmDJaEvQ-5NQbHQ@mail.gmail.com>
Message-ID: <20151217182739.GB3653@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-12-17 17:29 +0000, Martin Bark spake thusly:
> On 16 December 2015 at 16:39, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Thomas, All,
> >
> > On 2015-12-16 14:41 +0100, Thomas Petazzoni spake thusly:
> >> On Wed, 16 Dec 2015 11:26:29 +0000, Vicente Olivert Riera wrote:
> >> > >> So, I think we have a few options here:
> >> > >>
> >> > >>  1) keep all the three existing versions, add 5.2
> >> > >>  2) keep 0.10 and 0.12, replace 4.2 with 5.2
> >> > >>  3) keep 0.10, ditch 0.12, replace 4.2 with 5.2
> >> > >>  4) dith 0.10 and 0.12, replace 4.2 with 5.2
> >> > >>
> >> > >> I would lean toward either 2 or 3.
> >> > >>
> >> > >> 3 is IMHO the best solution: 5.2 is the best choice when all the
> >> > >> conditions are met; 0.10 is the fallback, maybe not the optimum in
> >> > >> case 0.12 would have fit, but since that's a fallback I don't think
> >> > >> it matters much...
> >> > >>
> >> > >
> >> > > As 4.x is a LTS release I would not drop it for the 5.x release.
> >> > >
> >> > > I would keep all the three version we have - they are all still
> >> > > maintained and v0.12 and v4 are both even LTS releases.
> >> > >
> >> > > New versions are often not compatible with older versions of Node.js -
> >> > > it's similiar to Lua.
> >> > >
> >> > > So I would lean toward 1.
> >> >
> >> > I agree with you. Dropping a LTS version doesn't look good to me. We
> >> > could do it when it's not maintained anymore. Right now I vote for
> >> > keeping the three versions we already have plus adding the 5.2.0 because
> >> > is the new stable: option 1.
> >>
> >> I am personally not very happy with option (1). Keeping gazillions of
> >> versions means that we have potentially to test all those options. And
> >> the random testing done by the autobuilders does not work to randomize
> >> "choice" options, i.e we will never test the non-default versions.
> >
> > Not completey true, since the higher versions ahve dependencies not
> > always fulfilled (armv6+, gcc >= 4.8...) so, as we do randomize the CPU
> > from time to time, we would eventually have all versions being built.
> 
> One point to note, 5.x also adds the requirement for wchar too which
> 4.x did not need.

Well, is that really an issue? I would be quite a bit surprised if
people would really need to run nodejs on a system without wchar;
basically, only uClibc can lack wchar, glibc and musl always have it,
and I would contend that using nodejs on a uClibc system without wchar
is just not supported.

After all, if one disables wchar in a uClibc toolchain means that one is
vey tight on space on the target, and I doubt nodejs would even fit in
sch a target.

So I'd say we don't care, and we'd still have 0.10.x as a fallback for
that case.

> > But I do agree that this is not the best situation. I would prefer if we
> > could find a solution that does not imply having so many versions. I
> > deeply believe that we should limit ourselves to just having 0.10.x and
> > 5.2.x .
> >
> >> What is the motivation for keeping all those versions around? While I
> >> can understand that keeping 0.10.x around to have a fallback solution
> >> for ARMv5 platform is desired, I don't understand why we would keep
> >> 0.12.x and 4.2.x.
> >>
> >> The fact that 0.12.x and 4.2.x are still maintained upstream as LTS
> >> versions is completely irrelevant. There are other projects that may
> >> maintain older branches as LTS, and still we don't support all the
> >> possible maintained versions.
> >
> > Totally agreed. LTS status of uostream versions does not mean we should
> > have all of them.
> >
> >> Are there incompatibilities between 0.12.x, 4.2.x and 5.2.x that
> >> prevent a user from easily upgrading?
> >
> > Are all those versions API/ABI/whatevrer incompatible with each others?
> > Or is it possible to narrow down the set of versions?
> >
> > I.e. if 4.2.x and 5.2.x are compatible, there is no reason to keep
> > 4.2.x, since 5.2.x is enough and does not have requirements more
> > stringents than 4.2.x. And so on...
> 
> There are api changes between the main versions.  See
> https://github.com/nodejs/node/wiki/API-changes-between-v0.10-and-v0.12,
> https://github.com/nodejs/node/wiki/API-changes-between-v0.10-and-v4,
> https://nodejs.org/en/blog/release/v5.0.0/ for example.  Although
> these versions have some api changes you really need to keep up to
> date and are encouraged to upgrade.

So we should take thoe encouragements, and just upgrade. ;-)

> Note, 5.3.0 was just released hence this patch set is already outdated.

See, that's the issue. If we were to add all major and LTS nodejs
versions, we'd now get 5 versions: 0.10.x, 0.12.x, 4.2.x, 5.2.x and now
5.3.x . This is definitely not viable in the long run.

So, my position, and I guess Thomas will agree: please respin this patch
byt replacing 4.2 with 5.2, and a follow-up patch to get rid of 0.12.x.
In the meantime, I'll mark this one as "Changes Requested" in our
Patchwork.

Thanks! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
