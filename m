From: Carlos Santos <unixmania@gmail.com>
Date: Fri, 27 Sep 2019 08:29:45 -0300
Subject: [Buildroot] Error: could not find a working compiler
In-Reply-To: <d09905d0-4e12-a4fc-cc07-8a49767bb21f@studenti.polito.it>
References: <b3c196fd-725e-bc4c-1c6e-17c3de2520c9@studenti.polito.it>
 <CAJ4jsadoyKThB54wRAF1nODiAsF+6QmWdLxYWLnpTW72o3FHKw@mail.gmail.com>
 <d09905d0-4e12-a4fc-cc07-8a49767bb21f@studenti.polito.it>
Message-ID: <CAJ4jsacZZ7gPHDHBYKoGXccPARLzkNnUfoGND5NcQbu6O9CTpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 27, 2019 at 2:32 AM Davide Lava <s265361@studenti.polito.it> wrote:
>
>
> Il 27/09/19 04:03, Carlos Santos ha scritto:
> > On Wed, Sep 25, 2019 at 5:39 PM Davide Lava <s265361@studenti.polito.it> wrote:
> >> Hi everybody,
> >>
> >> I'm trying to install buildroot-2010.08 for the RD129 from elpa.
> > I suppose you are trying to build an OS for this board:
> >
> >      http://www.elpa.it/rd129it.html
> Exactly :-)
> >
> >> When I try to give the command "make" in the terminal it ends up with:
> >>
> >> checking compiler /usr/bin/gcc -I/home/davide/RD129/buildroot-2010.08/output/host/include -I/home/davide/RD129/buildroot-2010.08/output/host/usr/include ... no, long long reliability test 1
> >> configure: error: could not find a working compiler, see config.log for details
> >> package/gmp/gmp.mk:78: recipe for target '/home/davide/RD129/buildroot-2010.08/output/toolchain/gmp-4.2.4-host/.configured' failed
> >> make: *** [/home/davide/RD129/buildroot-2010.08/output/toolchain/gmp-4.2.4-host/.configured] Error 1
> > I suggest you to try Buildroot version 2019.02, at least. You will
> > unlikely be able to use 2010.08 on any current Linux-based OS. Is
> > there any particular reason to use a so old version?
> >
> I have tried to install buildroot-2019.02.5 but using the .config file
> given by elpa when I type >make menuconfig it replies ***Legacy
> detected: check the content of the menu below*** Legacy config options--->
>
> If I enter the Legacy config options menu:
>
[...]
>
> And then it starts with the legacy options.

If you navigate through the legacy menu and type "?" on each selected
item a short help message will be shown (e.g "qt package removed" for
BR2_PACKAGE_QT, which has been replaced by BR2_PACKAGE_QT5).

> My problem is that the .config file is given directly by elpa and I
> don't know if changing the configuration will cause something wrong.

I got the .config from http://www.elpa.it/data/buildroot.tar.bz2 and
gave it a try.

Most of the problems are self-explanatory: use BR2_PACKAGE_QT5 instead
of BR2_PACKAGE_QT and deselect
BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K.

The main problem is the toolchain, which must to be reconfigured to
match the ARM A9 CPU. It uses deprecated GCC, binutils and ARM ABI
(OABI, superseded by EABI). I'd also recommend selecting
BR2_PTHREADS_NATIVE after deselecting BR2_PTHREADS_OLD. Also, the
BR2_UCLIBC_CONFIG parameter is outdated.

I hope this helps.

-- 
Carlos Santos <unixmania@gmail.com>
