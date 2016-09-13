From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 13 Sep 2016 08:56:37 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-09-05
In-Reply-To: <20160911133437.GI6777@waldemar-brodkorb.de>
References: <7d9ec97a-00bf-a29b-7119-6a5304eb70d4@gmail.com>
 <9a18dc1c-25bd-0925-1a78-dc7a5612d465@gmail.com>
 <20160911133437.GI6777@waldemar-brodkorb.de>
Message-ID: <CANLo3JiyFZWqmjnxP09D_=j_DcmXL9Bo+cN+6p=GJ7m3ZMbaEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Le 11 sept. 2016 15:34, "Waldemar Brodkorb" <wbx@openadk.org> a ?crit :
>
> Hi ROmain,
> Romain Naour wrote,
>
> > Hi Waldemar,
> >
> > I'm not sure you get this email, I had a "Delivery Status Notification
(Failure)"
>
> I have the mail.
>
> > Hi Waldemar,
> >
> > Le 10/09/2016 ? 15:56, Waldemar Brodkorb a ?crit :
> > > Hi Romain,
> > > Romain Naour wrote,
> > >
> > >> Hi Thomas, Waldemar,
> > >>
> > >> Le 06/09/2016 ? 08:30, Thomas Petazzoni a ?crit :
> > >>> Hello,
> > >>>
> > >>> This is the list of Buildroot build failures that occured on
> > >>> 2016-09-05, and for which you are a registered architecture
developer
> > >>> or package developer. Please help us improving the quality of
> > >>> Buildroot by investigating those build failures and sending patches
to
> > >>> fix them. Thanks!
> > >>>
> > >>> Build failures related to your packages:
> > >>>
> > >>>         bfin |                  xenomai-2.6.4 |
http://autobuild.buildroot.net/results/fcae0611ac87204ab68d6828276b635d1a31a178
> > >>>
> > >>
> > >> I think it's an issue between uClibc-ng and Xenomai on Blackfin due
to
> > >> pthread_atfork(), shm_open() and shm_unlink() local definition in
Xenomai.
> > >>
> > >> Error:
> > >> bind.c:(.text+0x20): multiple definition of `pthread_atfork'
> > >> .libs/libxenomai_la-assert_context.o:assert_context.c:(.text+0x54):
first
> > >> defined here
> > >>
> > >> sem_heap.c:(.text+0xc): multiple definition of `shm_open'
> > >> .libs/libxenomai_la-bind.o:bind.c:(.text+0x2c): first defined here
> > >>
> > >> sem_heap.c:(.text+0x24): multiple definition of `shm_unlink'
> > >> .libs/libxenomai_la-bind.o:bind.c:(.text+0x44): first defined here
> > >>
> > >> It's because the Xenomai definition use declare these function as
"inline" and
> > >> not uClibc-ng
> > >>
> > >> Xenomai [1]:
> > >> /* uClibc does not provide pthread_atfork() for this arch; provide it
> > >>    here. Note: let the compiler decides whether it wants to actually
> > >>    inline this routine, i.e. do not force always_inline. */
> > >> inline __attribute__((weak)) int pthread_atfork(void
(*prepare)(void),
> > >>                                            void (*parent)(void),
> > >>                                            void (*child)(void))
> > >>
> > >> uClibc-ng:
> > >> extern int pthread_atfork (void (*__prepare) (void),
> > >>                       void (*__parent) (void),
> > >>                       void (*__child) (void)) __THROW;
> > >>
> > >> I guess those "inline" should be removed?
> > >> Weldemar what do you think?
> > >
> > > I am in the middle of reworking libpthread/librt support in
> > > uClibc-ng and found some problems in the way pthread_atfork is
> > > declared.
> > > I think the problems exist because of some backward compat support
> > > in Gnu libc, see here for a nice summary:
> > >
http://ryanarn.blogspot.de/2011/07/curious-case-of-pthreadatfork-on.html
> >
> > Is the same issue for shm_open() and shm_unlink() ?
>
> Unsure, what is the thingie about shm_open().
> I was just curious seeing pthread_atfork() problems while hacking on
> the function :)

Ok, some investigation are needed but it seems the same issue... remove
inline to fix the build...

>
> > >
> > > I think uClibc-ng should simply provide a usable pthread_atfork.
> > > pthread_atfork is internally used by librt right now.
> >
> > Actually, it seems a bit weird to speak about pthread_atfork() for
Blackfin
> > which doesn't have a MMU so fork() is not available.
> > I think that is why Xenomai try to define it on Blackfin, it doesn't
expect
> > pthread_atfork() to be provided by the libc.
> >
> > >
> > > I hope I get some patch out for review in the next days.
> >
> > ok great :)
> >
> > >
> > > I think uClibc-ng for NPTL and Linuxthreads should provide a usable
> > > pthread_atfork(). So Xenomai does not need to provide their own.
> >
> > So even on Blackfin ?
>
> You are right, I should stop smoking bad things ;)
> What should we do for noMMU targets? Provide a dummy or just do not
> export any pthread_atfork() function?

I'm far to be an expert on no-MMU platform but yes, it seems we not need to
export pthread_atfork function.

I'm not sure if we also need to do the same for shm_* functions...

Best regards,
Romain

>
> best regards
>  Waldemar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160913/b70bc04f/attachment.html>
