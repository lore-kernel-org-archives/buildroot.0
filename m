From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 22:41:29 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] toolchain/toolchain-wrapper: fix gcc -v with relro
In-Reply-To: <CAPi7W82na34kPhHGbO=CRBN3+tUNuVzYTQjnKWjQYsHV1nyeFw@mail.gmail.com>
References: <20201224101840.3428243-1-fontaine.fabrice@gmail.com>
 <20201225170955.GA1680670@scaer>
 <CAPi7W82na34kPhHGbO=CRBN3+tUNuVzYTQjnKWjQYsHV1nyeFw@mail.gmail.com>
Message-ID: <20201225214129.GG1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-12-25 22:16 +0100, Fabrice Fontaine spake thusly:
> Le ven. 25 d?c. 2020 ? 18:10, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
> > On 2020-12-24 11:18 +0100, Fabrice Fontaine spake thusly:
[--SNIP--]
> > > This build failure is raised because the toolchain-wrapper calls gcc with
> > > -Wl,-z,relro and as a result gcc wrongly assumes that some linking must
> > > be done.
> > Although I do undesrstand the problem, I am not sure this is a good
> > solution.
[--SNIP--]
> > But it might be simpler to "fix" rhash itself, with something like:
> >
> >     diff -durN rhash-1.4.0.orig/configure rhash-1.4.0/configure
> >     --- rhash-1.4.0.orig/configure2020-07-14 21:35: 11.000000000 +0200
> >     +++ rhash-1.4.0/configure2020-12-25 18:07:15.52 9581029 +0100
> >     @@ -513,8 +513,13 @@
> >        CC_TMP="$CC"
> >        test -n "$OPT_CC" && OTHER_CC= || OTHER_CC="gcc cc"
> >        for CC in "$CC_TMP" $OTHER_CC; do
> >     +    cc_name_tmp=
> >          if run_cmd "$CC -v"; then
> >            cc_name_tmp=$($CC -v 2>&1 | tail -n 1 | cut -d ' ' -f 1)
> >     +    elif run_cmd "$CC --version"; then
> >     +      cc_name_tmp=$($CC --version 2>&1 | head -n 1 | cut -d ' ' -f 1)
> >     +    fi
> >     +    if test "${cc_name_tmp}"; then
> >            if test "$cc_name_tmp" = "gcc"; then
> >              cc_name=$cc_name_tmp
> >              start_check "$CC version"
> >
> > This should also be hopefully accpetable upstream (too bad they do not
> > want to switch a common, well-known buildsystem, and that the cmake
> > suppot has languished without any comment for more than a year now...)
> I already sent a patch to "fix" rhash here:
> https://patchwork.ozlabs.org/project/buildroot/patch/20201203202853.616174-1-fontaine.fabrice at gmail.com/

Ah right, I see that patch now. It looks like you had a very similar
idea as mine, good. ;-)

Still, I think my proposal is less disuptive, and departs less from the
"inventive" buildsystem from upstream, and thus stands better chance at
being accepted... Well, of course:

> I'll send it to upstream as soon as I got an answer on a previous PR.

Hmm... Looks like that will take time... I know you can be very patient,
but this looks like a lost cause... :-/

Thanks!

Regards,
Yann E. MORIN.

> >
> > Regards,
> > Yann E. MORIN.
> >
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > Tested-by: Peter Seiderer <ps.report@gmx.net>
> > > ---
> > > Changes v1 -> v2 (after review of Peter Seiderer):
> > >  - Fix typos in commit log and update comment in source code
> > >
> > >  toolchain/toolchain-wrapper.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> > > index 0fb6064b1c..2a7dd61729 100644
> > > --- a/toolchain/toolchain-wrapper.c
> > > +++ b/toolchain/toolchain-wrapper.c
> > > @@ -453,10 +453,11 @@ int main(int argc, char **argv)
> > >                       *cur++ = "-pie";
> > >       }
> > >  #endif
> > > -     /* Are we building the Linux Kernel or U-Boot? */
> > > +     /* Are we building the Linux Kernel or U-Boot or displaying the programs invoked by the compiler? */
> > >       for (i = 1; i < argc; i++) {
> > >               if (!strcmp(argv[i], "-D__KERNEL__") ||
> > > -                 !strcmp(argv[i], "-D__UBOOT__"))
> > > +                 !strcmp(argv[i], "-D__UBOOT__") ||
> > > +                 !strcmp(argv[i], "-v"))
> > >                       break;
> > >       }
> > >       if (i == argc) {
> > > --
> > > 2.29.2
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> Best Regards,
> 
> Fabrice

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
