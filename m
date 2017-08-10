From: Aseem Sharma <aseem.sharma19@gmail.com>
Date: Thu, 10 Aug 2017 15:27:26 +0530
Subject: [Buildroot] Compiling buildroot for Arm "Armada 166E" Target
In-Reply-To: <20170810092224.vxecvn22telonxns@tarshish>
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
 <20170810092224.vxecvn22telonxns@tarshish>
Message-ID: <CANK3ZEd0CtMCnFtSZQWesqGkguX4BVH=7myJOzw1ih0uvpc5DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

It still seems to be an issue with Gcc=v6.X :-(
In fact I have tried using all the available Gcc version from menuconfig
and its still fails. Following is the exact error message for your
reference:

In file included from lib/xmlparse.c:36:0:
lib/siphash.h: In function ?sip24_final?:
lib/siphash.h:247:1: error: unrecognizable insn:
 } /* sip24_final() */
 ^
(insn 78 77 79 11 (set (reg:DI 188)
        (xor:DI (reg:DI 189)
            (const_int 255 [0xff]))) lib/siphash.h:243 -1
     (nil))
lib/siphash.h:247:1: internal compiler error: in extract_insn, at
recog.c:2287
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://bugs.buildroot.net/> for instructions.
Makefile:213: recipe for target 'lib/xmlparse.lo' failed
make[1]: *** [lib/xmlparse.lo] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory '/home/administrator/Downloads/buildroot_2017/
buildroot-2017.02.5/output/build/expat-2.2.2'
package/pkg-generic.mk:216: recipe for target '/home/administrator/
Downloads/buildroot_2017/buildroot-2017.02.5/output/
build/expat-2.2.2/.stamp_built' failed
make: *** [/home/administrator/Downloads/buildroot_2017/
buildroot-2017.02.5/output/build/expat-2.2.2/.stamp_built] Error 2


Here is my config for your reference:

BR2_arm=y
BR2_iwmmxt=y
BR2_CCACHE=y
BR2_KERNEL_HEADERS_4_9=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
BR2_GCC_VERSION_6_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y
BR2_TARGET_GENERIC_ROOT_PASSWD="ASEEM"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5_VERSION_5_6=y
BR2_PACKAGE_QT5BASE_CONCURRENT=y
BR2_PACKAGE_QT5BASE_SQLITE_QT=y
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5BASE_TSLIB=y
BR2_PACKAGE_QT5IMAGEFORMATS=y
BR2_PACKAGE_QT5LOCATION=y
BR2_PACKAGE_QT5SVG=y
BR2_PACKAGE_QT5WEBCHANNEL=y
BR2_PACKAGE_QT5XMLPATTERNS=y
BR2_PACKAGE_QT_WEBKIT_KIOSK=y
BR2_PACKAGE_POSTGRESQL=y
BR2_PACKAGE_SQLITE_STAT3=y
BR2_PACKAGE_SQLITE_ENABLE_FTS3=y
BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY=y
BR2_PACKAGE_GIFLIB=y
BR2_PACKAGE_JPEG_TURBO=y
BR2_PACKAGE_OPENJPEG=y
BR2_PACKAGE_ANGULARJS=y
BR2_PACKAGE_ANGULAR_WEBSOCKET=y
BR2_PACKAGE_JQUERY=y
BR2_PACKAGE_JQUERY_DATETIMEPICKER=y
BR2_PACKAGE_JQUERY_SIDEBAR=y
BR2_PACKAGE_JSMIN=y
BR2_PACKAGE_JSON_JAVASCRIPT=y
BR2_PACKAGE_LIBMPEG2=y
BR2_TARGET_ROOTFS_JFFS2=y
BR2_TARGET_ROOTFS_TAR_XZ=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="ASEEM"
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

APPRECIATE YOUR HELP AND TIME ON THIS.
THANK YOU!

Best Regards,
Aseem

On Thu, Aug 10, 2017 at 2:52 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Aseem,
>
> On Thu, Aug 10, 2017 at 02:39:06PM +0530, Aseem Sharma wrote:
> > My config uses gcc v4.7. Will try and build with gcc v6.X and see if it
> > still fails.
>
> gcc v4.7 is most likely affected by bug #40836 as you noticed. The
> comments in
> that bug indicate that any version later than 4.7 should work.
>
> > Do you think generating a minimal config in defconfig file help in my
> > situation?
>
> No. It just make it easier to send to the mailing list as it discards the
> default values that make up 98% of the .config content.
>
> baruch
>
> > On Thu, Aug 10, 2017 at 2:20 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > >
> > > On Thu, Aug 10, 2017 at 02:16:59PM +0530, Aseem Sharma wrote:
> > > > The build passes with minimal defconfig on Latest stable release
> > > v2017.05.2
> > > > and also on latest long term support release v2017.02.5.
> > > > So the issue seems to be with my config settings. Is there any
> > > workarounds
> > > > to fix/avoid the issue?
> > >
> > > What is your config? Generate a minimal config in the file 'defconfig'
> with
> > >
> > >   make savedefconfig
> > >
> > > baruch
> > >
> > > > On Thu, Aug 10, 2017 at 1:44 PM, Aseem Sharma <
> aseem.sharma19 at gmail.com>
> > > > wrote:
> > > > > Another information that I may have missed is that I am currently
> using
> > > > > Ubuntu 16.4 system, i686 arch to build source for "iwmmxt"
> > > > >
> > > > > -Aseem
> > > > >
> > > > > On Thu, Aug 10, 2017 at 1:39 PM, Aseem Sharma <
> > > aseem.sharma19 at gmail.com>
> > > > > wrote:
> > > > >
> > > > >> Where will i find minimal defconfig?
> > > > >> Please note that the issue was orignally observed on latest long
> term
> > > > >> support release v2017.02.5.
> > > > >> However I would try the steps provided in your last email over
> Latest
> > > > >> stable release v2017.05.2.
> > > > >> Sorry about too many naive questions.
> > > > >>
> > > > >> -Aseem
> > > > >>
> > > > >> On Thu, Aug 10, 2017 at 12:58 PM, Baruch Siach <baruch@tkos.co.il
> >
> > > wrote:
> > > > >>
> > > > >>> Hi Aseem,
> > > > >>>
> > > > >>> On Thu, Aug 10, 2017 at 12:51:53PM +0530, Aseem Sharma wrote:
> > > > >>> > Sure. Can you please give me the exact steps to be carried out.
> > > > >>> > Also, I tried selecting other gcc versions from menuconfig but
> the
> > > > >>> > compilation seems to fail all the time with one issue or the
> other.
> > > > >>>
> > > > >>> Remove your current .config, copy the minimal defconfig below
> into
> > > > >>> .config,
> > > > >>> and then do
> > > > >>>
> > > > >>>   make olddefconfig
> > > > >>>   make clean
> > > > >>>   make
> > > > >>>
> > > > >>> This will automatically select the gcc version which as of
> current
> > > > >>> master is
> > > > >>> 6.4.0.
> > > > >>>
> > > > >>> baruch
> > > > >>>
> > > > >>> > On 10-Aug-2017 12:43 PM, "Baruch Siach" <baruch@tkos.co.il>
> wrote:
> > > > >>> >
> > > > >>> > On Thu, Aug 10, 2017 at 12:19:33PM +0530, Aseem Sharma wrote:
> > > > >>> > > Yes Baruch. I tried a couple of times with "make clean" &
> even
> > > "make
> > > > >>> > > distclean". However, the error is consistent.
> > > > >>> > > Found a similar issue here: https://gcc.gnu.org/bugzilla/
> > > > >>> > > show_bug.cgi?id=40836
> > > > >>> >
> > > > >>> > This issue seems to be fixed since gcc 4.8.
> > > > >>> >
> > > > >>> > I could not reproduce this ICE on current master with the
> following
> > > > >>> minimal
> > > > >>> > defconfig:
> > > > >>> >
> > > > >>> > BR2_arm=y
> > > > >>> > BR2_iwmmxt=y
> > > > >>> >
> > > > >>> > Can you give it a try?
> > > > >>> >
> > > > >>> > baruch
> > > > >>> >
> > > > >>> > > On Thu, Aug 10, 2017 at 12:06 PM, Baruch Siach <
> > > baruch at tkos.co.il>
> > > > >>> wrote:
> > > > >>> > > > On Thu, Aug 10, 2017 at 11:56:56AM +0530, Aseem Sharma
> wrote:
> > > > >>> > > > > *A follow-up question:*
> > > > >>> > > > > I selected 'iwmmxt' as per Baruch's suggestion and tried
> to
> > > run
> > > > >>> > "make".
> > > > >>> > > > > The build seems to be failing with following error
> message in
> > > > >>> > > > > "busybox-1.26.2" compilation:
> > > > >>> > > > >
> > > > >>> > > > > util-linux/mkfs_ext2.c: In function ?mkfs_ext2_main?:
> > > > >>> > > > > util-linux/mkfs_ext2.c:715:1: error: insn does not
> satisfy
> > > its
> > > > >>> > > > constraints:
> > > > >>> > > > >  }
> > > > >>> > > > >  ^
> > > > >>> > > > > (insn 1169 286 287 31 (set (reg:SI 0 r0)
> > > > >>> > > > >         (reg:SI 80 wr0)) util-linux/mkfs_ext2.c:344 426
> > > > >>> > > > {*iwmmxt_movsi_insn}
> > > > >>> > > > >      (nil))
> > > > >>> > > > > util-linux/mkfs_ext2.c:715:1: internal compiler error: in
> > > > >>> > > > > reload_cse_simplify_operands, at postreload.c:411
> > > > >>> > > > > Please submit a full bug report,
> > > > >>> > > > > with preprocessed source if appropriate.
> > > > >>> > > > > See <http://bugs.buildroot.net/> for instructions.
> > > > >>> > > > > scripts/Makefile.build:197: recipe for target
> > > > >>> 'util-linux/mkfs_ext2.o'
> > > > >>> > > > > failed
> > > > >>> > > > > make[2]: *** [util-linux/mkfs_ext2.o] Error 1
> > > > >>> > > > > Makefile:742: recipe for target 'util-linux' failed
> > > > >>> > > > > make[1]: *** [util-linux] Error 2
> > > > >>> > > > > make[1]: Leaving directory '/home/administrator/
> > > > >>> > > > Downloads/buildroot_2017/
> > > > >>> > > > > buildroot-2017.02.5/output/build/busybox-1.26.2'
> > > > >>> > > > > package/pkg-generic.mk:216: recipe for target
> > > > >>> '/home/administrator/
> > > > >>> > > > > Downloads/buildroot_2017/buildroot-2017.02.5/output/
> > > > >>> > > > > build/busybox-1.26.2/.stamp_built' failed
> > > > >>> > > > > make: *** [/home/administrator/Downloads/buildroot_2017/
> > > > >>> > > > > buildroot-2017.02.5/output/build/busybox-1.26.2/.stamp_
> > > built]
> > > > >>> Error 2
> > > > >>> > > > >
> > > > >>> > > > > It would be really helpful is you can provide some
> insight
> > > and
> > > > >>> > possibly a
> > > > >>> > > > > fix/workaround.
> > >
> > > --
> > >      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> > > Systems
> > > =}------------------------------------------------ooO--U--
> > > Ooo------------{=
> > >    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il
> -
> > >
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170810/25172d4b/attachment-0001.html>
