From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Feb 2020 22:11:24 +0100
Subject: [Buildroot] Analysis of build results
In-Reply-To: <b9b88aef-7173-9746-95cb-b9ea6a9718fb@micronovasrl.com>
References: <20200219074844.F3D6C85D78@fraxinus.osuosl.org>
 <20200220034343.2370e4e4@windsurf>
 <94c8edad-773d-2b36-5daf-b6ee60dd747f@micronovasrl.com>
 <3e7b016b-eca6-b768-3fca-8fd7e44d0299@micronovasrl.com>
 <20200220190807.505b4fb2@windsurf>
 <00751b5d-ca05-fe42-0e9b-6a1005a09e6d@micronovasrl.com>
 <20200220192344.03785f04@windsurf>
 <bcc10a0e-c54e-5b75-9b77-8922b85a925a@micronovasrl.com>
 <fe7d07df-71a0-e317-6b91-ade479545ec4@smile.fr>
 <28258465-4f79-3f47-189d-bb066b0aa9f7@micronovasrl.com>
 <54468015-dded-6cd7-e36d-67553a54455e@smile.fr>
 <b9b88aef-7173-9746-95cb-b9ea6a9718fb@micronovasrl.com>
Message-ID: <CAPi7W83PUi3H3+G6-Drk=-nWe+7j_Ffn7nkT4WvXj5jYwbcHWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

Le sam. 22 f?vr. 2020 ? 20:44, Giulio Benetti
<giulio.benetti@micronovasrl.com> a ?crit :
>
> Hi Romain,
>
> +Cc me @benettiengineering.com and...
>
> Il 22/02/2020 20:10, Romain Naour ha scritto:
> > Hi Giulio,
> >
> > CC: buildroot <buildroot@buildroot.org>
> >
> > Le 22/02/2020 ? 19:57, Giulio Benetti a ?crit :
> >> Hi Romain,
> >>
> >> Il 22/02/2020 19:18, Romain Naour ha scritto:
> >>> Hi Giulio,
> >>>
> >>> Le 21/02/2020 ? 00:09, Giulio Benetti a ?crit :
> >>>> Hi Thomas,
> >>>>
> >>>> Il 20/02/2020 19:23, Thomas Petazzoni ha scritto:
> >>>>> On Thu, 20 Feb 2020 19:16:37 +0100
> >>>>> Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> >>>>>
> >>>>>> So something like:
> >>>>>> # while true; do make foo && make foo-dirclean; done
> >>>>>>
> >>>>>> but please do you have a 'standard' form where it escapes on error?
> >>>>>
> >>>>> while true; do make foo && make foo-dirclean || break ; done
> >>>>
> >>>> Unfortunately the problem doesn't show up, I've also accelerated the building
> >>>> launching a local script in build/libsvgtiny-xxx/ that call make -j17 && make
> >>>> clean with all the arguments Buildroot provides to accelerate, but nothing. I've
> >>>> tried on my Workstation, my laptop and 1 of my autobuilders.
> >>>>
> >>>> Romain, have you had the chance to try that patch? Can I do something to ease
> >>>> the thing? Also, which specific distro(Distro name, kernel version) do you have?
> >>>
> >>> This a a Fedora 31 disto regularly updated.
> >>>
> >>> This is weird since we already disabled parallel build [1]
> >>
> >> Ah good finding, with this I've also found that [1] is wrong, since this is a
> >> generic package, so need to build with $(MAKE1) instead of $(MAKE) without
> >> LIBSVGTINY_MAKE = $(MAKE1)
> >> but maybe the patch i've sent you could work.
> >>
> >> Can you give a try?
> >
> > I tried to reproduce the issue but libsvgtiny still build fine here...
> >
> >>
> >> If it still fails, since this package contains 4 source files, I could send a
> >> patch that really avoid parallel build. And it must sent anyway a patch to fix
> >> that error.
> >
> > Maybe we can just fix the patch [1] ?
> > Can you send the patch ?
>
> ...yes, I'm going to send it soon.
>
> > BTW, who is using libsvgtiny? There is no package using it, no DEVELOPERS entry,
> > a fragile build system and the version we use is out of date (2011-03-21).
> > Maybe we can drop it?
>
> Yes, it should at least be bumped, I could take care of it, but I don't
> know if someone uses this package. Anyway I've seen that tags are set
> per year, so my effort would be very few to bump it and keep it up to date.
It should be noted that to bump it, you'll also have to bump
netsurf-buildsystem as well as add libdom package which is used
instead of libxml2 since
https://source.netsurf-browser.org/libsvgtiny.git/commit/?id=d03a7471001c4701e1fea976aee162b0de375f52
libdom depends on libparserutils and libwapcaplet which also need to
be added to buildroot.
So that's probably a lot of work for a package that is not used
currently by any package.
>
> Thomas, please let me know if it is a good idea or better drop it.
>
> --
> Giulio Benetti
>
> > Best regards,
> > Romain
> >
> >>
> >> Please let me know
> >> Thank you
> >>
> >> Best regards!
> >
>
Best Regards,

Fabrice
