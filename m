From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Aug 2017 12:22:24 +0300
Subject: [Buildroot] Compiling buildroot for Arm "Armada 166E" Target
In-Reply-To: <CANK3ZEc54MP4MMy57cYoLJHnC0UWt7Q7NYNLEQ9yqWX6wva50w@mail.gmail.com>
References: <20170810063631.e3jc22lsdjuchpbk@tarshish>
 <CANK3ZEeLMHhNYvt6dN45zf6QV5sTcw12FEyGf7h=CmQFqtX_4A@mail.gmail.com>
 <20170810071320.xvrhusojcw4dqxtu@tarshish>
 <CANK3ZEeJYeji_4Ds-kW6EXXRU3FcpXSgRaWeav96qQU6O5Jfkg@mail.gmail.com>
 <20170810072841.bs5ly52awzczejgz@tarshish>
 <CANK3ZEca7+iUwmK2Hxt60T1jAQ5eYWC9z2_XVZ+cKCLWQq=Ebg@mail.gmail.com>
 <CANK3ZEcwW1+xBazZB209PFnzpi1mmyfmEEac0CFPMYUBBmTRug@mail.gmail.com>
 <CANK3ZEeh3fd=TAKh4PB7huAh9FaBFVF9HgF_u=fAG90_saNzKg@mail.gmail.com>
 <20170810085044.3pqhvt25wlhvssna@tarshish>
 <CANK3ZEc54MP4MMy57cYoLJHnC0UWt7Q7NYNLEQ9yqWX6wva50w@mail.gmail.com>
Message-ID: <20170810092224.vxecvn22telonxns@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aseem,

On Thu, Aug 10, 2017 at 02:39:06PM +0530, Aseem Sharma wrote:
> My config uses gcc v4.7. Will try and build with gcc v6.X and see if it
> still fails.

gcc v4.7 is most likely affected by bug #40836 as you noticed. The comments in 
that bug indicate that any version later than 4.7 should work.

> Do you think generating a minimal config in defconfig file help in my
> situation?

No. It just make it easier to send to the mailing list as it discards the 
default values that make up 98% of the .config content.

baruch

> On Thu, Aug 10, 2017 at 2:20 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> >
> > On Thu, Aug 10, 2017 at 02:16:59PM +0530, Aseem Sharma wrote:
> > > The build passes with minimal defconfig on Latest stable release
> > v2017.05.2
> > > and also on latest long term support release v2017.02.5.
> > > So the issue seems to be with my config settings. Is there any
> > workarounds
> > > to fix/avoid the issue?
> >
> > What is your config? Generate a minimal config in the file 'defconfig' with
> >
> >   make savedefconfig
> >
> > baruch
> >
> > > On Thu, Aug 10, 2017 at 1:44 PM, Aseem Sharma <aseem.sharma19@gmail.com>
> > > wrote:
> > > > Another information that I may have missed is that I am currently using
> > > > Ubuntu 16.4 system, i686 arch to build source for "iwmmxt"
> > > >
> > > > -Aseem
> > > >
> > > > On Thu, Aug 10, 2017 at 1:39 PM, Aseem Sharma <
> > aseem.sharma19 at gmail.com>
> > > > wrote:
> > > >
> > > >> Where will i find minimal defconfig?
> > > >> Please note that the issue was orignally observed on latest long term
> > > >> support release v2017.02.5.
> > > >> However I would try the steps provided in your last email over Latest
> > > >> stable release v2017.05.2.
> > > >> Sorry about too many naive questions.
> > > >>
> > > >> -Aseem
> > > >>
> > > >> On Thu, Aug 10, 2017 at 12:58 PM, Baruch Siach <baruch@tkos.co.il>
> > wrote:
> > > >>
> > > >>> Hi Aseem,
> > > >>>
> > > >>> On Thu, Aug 10, 2017 at 12:51:53PM +0530, Aseem Sharma wrote:
> > > >>> > Sure. Can you please give me the exact steps to be carried out.
> > > >>> > Also, I tried selecting other gcc versions from menuconfig but the
> > > >>> > compilation seems to fail all the time with one issue or the other.
> > > >>>
> > > >>> Remove your current .config, copy the minimal defconfig below into
> > > >>> .config,
> > > >>> and then do
> > > >>>
> > > >>>   make olddefconfig
> > > >>>   make clean
> > > >>>   make
> > > >>>
> > > >>> This will automatically select the gcc version which as of current
> > > >>> master is
> > > >>> 6.4.0.
> > > >>>
> > > >>> baruch
> > > >>>
> > > >>> > On 10-Aug-2017 12:43 PM, "Baruch Siach" <baruch@tkos.co.il> wrote:
> > > >>> >
> > > >>> > On Thu, Aug 10, 2017 at 12:19:33PM +0530, Aseem Sharma wrote:
> > > >>> > > Yes Baruch. I tried a couple of times with "make clean" & even
> > "make
> > > >>> > > distclean". However, the error is consistent.
> > > >>> > > Found a similar issue here: https://gcc.gnu.org/bugzilla/
> > > >>> > > show_bug.cgi?id=40836
> > > >>> >
> > > >>> > This issue seems to be fixed since gcc 4.8.
> > > >>> >
> > > >>> > I could not reproduce this ICE on current master with the following
> > > >>> minimal
> > > >>> > defconfig:
> > > >>> >
> > > >>> > BR2_arm=y
> > > >>> > BR2_iwmmxt=y
> > > >>> >
> > > >>> > Can you give it a try?
> > > >>> >
> > > >>> > baruch
> > > >>> >
> > > >>> > > On Thu, Aug 10, 2017 at 12:06 PM, Baruch Siach <
> > baruch at tkos.co.il>
> > > >>> wrote:
> > > >>> > > > On Thu, Aug 10, 2017 at 11:56:56AM +0530, Aseem Sharma wrote:
> > > >>> > > > > *A follow-up question:*
> > > >>> > > > > I selected 'iwmmxt' as per Baruch's suggestion and tried to
> > run
> > > >>> > "make".
> > > >>> > > > > The build seems to be failing with following error message in
> > > >>> > > > > "busybox-1.26.2" compilation:
> > > >>> > > > >
> > > >>> > > > > util-linux/mkfs_ext2.c: In function ?mkfs_ext2_main?:
> > > >>> > > > > util-linux/mkfs_ext2.c:715:1: error: insn does not satisfy
> > its
> > > >>> > > > constraints:
> > > >>> > > > >  }
> > > >>> > > > >  ^
> > > >>> > > > > (insn 1169 286 287 31 (set (reg:SI 0 r0)
> > > >>> > > > >         (reg:SI 80 wr0)) util-linux/mkfs_ext2.c:344 426
> > > >>> > > > {*iwmmxt_movsi_insn}
> > > >>> > > > >      (nil))
> > > >>> > > > > util-linux/mkfs_ext2.c:715:1: internal compiler error: in
> > > >>> > > > > reload_cse_simplify_operands, at postreload.c:411
> > > >>> > > > > Please submit a full bug report,
> > > >>> > > > > with preprocessed source if appropriate.
> > > >>> > > > > See <http://bugs.buildroot.net/> for instructions.
> > > >>> > > > > scripts/Makefile.build:197: recipe for target
> > > >>> 'util-linux/mkfs_ext2.o'
> > > >>> > > > > failed
> > > >>> > > > > make[2]: *** [util-linux/mkfs_ext2.o] Error 1
> > > >>> > > > > Makefile:742: recipe for target 'util-linux' failed
> > > >>> > > > > make[1]: *** [util-linux] Error 2
> > > >>> > > > > make[1]: Leaving directory '/home/administrator/
> > > >>> > > > Downloads/buildroot_2017/
> > > >>> > > > > buildroot-2017.02.5/output/build/busybox-1.26.2'
> > > >>> > > > > package/pkg-generic.mk:216: recipe for target
> > > >>> '/home/administrator/
> > > >>> > > > > Downloads/buildroot_2017/buildroot-2017.02.5/output/
> > > >>> > > > > build/busybox-1.26.2/.stamp_built' failed
> > > >>> > > > > make: *** [/home/administrator/Downloads/buildroot_2017/
> > > >>> > > > > buildroot-2017.02.5/output/build/busybox-1.26.2/.stamp_
> > built]
> > > >>> Error 2
> > > >>> > > > >
> > > >>> > > > > It would be really helpful is you can provide some insight
> > and
> > > >>> > possibly a
> > > >>> > > > > fix/workaround.
> >
> > --
> >      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> > Systems
> > =}------------------------------------------------ooO--U--
> > Ooo------------{=
> >    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> >

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
