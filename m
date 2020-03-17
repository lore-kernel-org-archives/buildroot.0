From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Mar 2020 06:02:31 +0200
Subject: [Buildroot] Build issue: ncurses 6.1 on Buildroot 2020.02
In-Reply-To: <CAN34fozVsNZEcKXkZpPyQSG_YD0LBvjmx4DrkvoKrq7yx7vwMQ@mail.gmail.com>
References: <CAN34foxALY06a4n75WhjeKQ=ZATngRt4YEm=YKGzsTH6t+M6kA@mail.gmail.com>
 <20200316220606.78381e17@gmx.net>
 <CAN34fozVsNZEcKXkZpPyQSG_YD0LBvjmx4DrkvoKrq7yx7vwMQ@mail.gmail.com>
Message-ID: <878sjziq7c.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephen,

>> On Mon, 16 Mar 2020 15:54:43 -0400, Stephen Beckwith <
>> embeddedsteve at gmail.com> wrote:
>>
>> >   I'm having an issue building this package (required) using the 2020.02
>> > Buildroot setup.  The target is an ARM (cortex-A9) system.  The host
>> > system is Ubuntu 10.04.1 running in a VM.

Not sure whether this is the cause of your problem, but please note that
Buildroot currently requires host gcc version 4.8 or newer:

  https://buildroot.org/downloads/manual/manual.html#requirement-mandatory

Ubuntu 10.04 (lucid) comes with gcc 4.4. So unless you installed a newer
gcc version, you are likely to hit many other build issues, especially
with host (native) packages.

baruch

On Tue, Mar 17 2020, Stephen Beckwith wrote:

> Greetings Peter;
>    This will be difficult.  Please bear with me.
> 1) we currently use Buildroot 2015.08.01 as the basis for building 4
> different products (all out of tree builds) based upon 2 different ARM CPU
> architectures.  We drive this from a top level makefile (written by someone
> no longer with the company).
> 2) This  exercise I'm doing is to "upgrade" from the old buildroot to the
> latest 2020.02 version.  The reason for this is to update gcc and glibc to
> newer versions to overcome a  list of CVE's against gcc/glibc that the
> company has directed to be fixed.  So yes, this is a "heavy lift" operation
> with many moving parts Chief of which are are the requirement to use a
> specific kernel version (3.14.17) and U-Boot that supports a 3rd party
> package we use.
> 3) yes, our external tree was "converted" per directions in the manual
> based upon the updates in 2016.
>
> I can provide you with the .config file (compressed) for your review, as
> I'm having an issue currently with the top level makefile not merging our
> defconfig properly with the defconfig from this new buildroot (maybe there
> are too many changes/delta's?) - when I run our make "as is" the .config
> file doesn't get updated completely and the target is the default i386.
> (not arm).  The process I used to get here was:
> 1) make extraclean
> 2) make target=mendo - break out at start - check .sp* files present
>  -  the .sp* files contain information for: target, environment and
> toolchain.
> 3) make menuconfig
>  - Load the mendo_plat_defconfig
>  - verify kernel, compiler
>  - ?blank? the global patches directory
>  - save it - verify .config is setup for ARM target
> 4) make  - stops @ ncurses 6.1
>
>  - as stated, the current issue the "merge" of the target specific
> defconfig isn't working from the makefile, I can do this "manually" and
> that seems to work just fine, however, with the same results (same error,
> same place as above).
>
> Please let me know what other information you may require to assist.  Thank
> you for your time and expertise very much.
>
> Regards,
> Stephen Beckwith
>
> On Mon, Mar 16, 2020 at 5:06 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
>> Hello Stephen,
>>
>> On Mon, 16 Mar 2020 15:54:43 -0400, Stephen Beckwith <
>> embeddedsteve at gmail.com> wrote:
>>
>> > Greetings,
>> >   I'm having an issue building this package (required) using the 2020.02
>> > Buildroot setup.  The target is an ARM (cortex-A9) system.  The host
>> system
>> > is Ubuntu 10.04.1 running in a VM.
>> > Any suggestions/pointers would be greatly appreciated.
>> >
>> > Regards,
>> > Stephen Beckwith
>> >
>> > linking
>> >
>> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libform.so.6.1
>> >
>> /home/sbeckwit/sp_dev/bowie_dev/output/host/bin/arm-buildroot-linux-gnueabi-gcc
>> >  -Os --param max-inline-insns-single=1200 -shared -Wl,-soname,`basename
>> >
>> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libform.so.6.1
>> > .6.1`.6,-stats,-lc -o
>> >
>> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libform.so.6.1
>> > ../obj_s/fld_arg.o ../obj_s/fld_attr.o ../obj_s/fld_current.o
>> > ../obj_s/fld_def.o ../obj_s/fld_dup.o ../obj_s/fld_ftchoice.o
>> > ../obj_s/fld_ftlink.o ../obj_s/fld_info.o ../obj_s/fld_just.o
>> > ../obj_s/fld_link.o ../obj_s/fld_max.o ../obj_s/fld_move.o
>> > ../obj_s/fld_newftyp.o ../obj_s/fld_opts.o ../obj_s/fld_pad.o
>> > ../obj_s/fld_page.o ../obj_s/fld_stat.o ../obj_s/fld_type.o
>> > ../obj_s/fld_user.o ../obj_s/frm_cursor.o ../obj_s/frm_data.o
>> > ../obj_s/frm_def.o ../obj_s/frm_driver.o ../obj_s/frm_hook.o
>> > ../obj_s/frm_opts.o ../obj_s/frm_page.o ../obj_s/frm_post.o
>> > ../obj_s/frm_req_name.o ../obj_s/frm_scale.o ../obj_s/frm_sub.o
>> > ../obj_s/frm_user.o ../obj_s/frm_win.o ../obj_s/fty_alnum.o
>> > ../obj_s/fty_alpha.o ../obj_s/fty_enum.o ../obj_s/fty_generic.o
>> > ../obj_s/fty_int.o ../obj_s/fty_ipv4.o ../obj_s/fty_num.o
>> > ../obj_s/fty_regex.o -L../lib -lncurses
>> >
>> /home/sbeckwit/sp_dev/sp_archives/toolchains/arm9.2-toolchain/lib/gcc/arm-buildroot-linux-gnueabi/9.2.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
>> > total time in link: 0.020083
>> > cd
>> >
>> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib
>> > && (ln -s -f libform.so.6.1 libform.so.6; ln -s -f libform.so.6
>> libform.so;
>> > )
>> > installing ./form.h in
>> >
>> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include
>> > cd misc && /usr/bin/make - -j --jobserver-fds=3,4 --no-print-directory --
>> >
>> DESTDIR=/home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot
>> >
>> DESTDIR="/home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot"
>> > RPATH_LIST="/usr/lib" install
>> >
>> DESTDIR=/home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot
>> > \
>> > prefix=/usr \
>> > exec_prefix=/usr \
>> > bindir=/usr/bin \
>> > top_srcdir=.. \
>> > srcdir=. \
>> > datadir=/usr/share \
>> > ticdir=/usr/share/terminfo \
>> > source=terminfo.tmp \
>> > cross_compiling=yes \
>> > /bin/bash ./run_tic.sh
>> > ** Building terminfo database, please wait...
>> > Running tic to install
>> >
>> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/share/terminfo
>> > ...
>> >
>> > You may see messages regarding extended capabilities, e.g., AX.
>> > These are extended terminal capabilities which are compiled
>> > using
>> > tic -x
>> > If you have ncurses 4.2 applications, you should read the INSTALL
>> > document, and install the terminfo without the -x option.
>> >
>> > t*ic: symbol lookup error: tic: undefined symbol: _nc_find_user_entry*
>> > ? tic could not build
>> >
>> /home/sbeckwit/sp_dev/bowie_dev/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/share/terminfo
>> > Makefile:92: recipe for target 'install.data' failed
>> > make[4]: *** [install.data] Error 1
>> > Makefile:117: recipe for target 'install' failed
>> > make[3]: *** [install] Error 2
>> > package/pkg-generic.mk:306: recipe for target
>> >
>> '/home/sbeckwit/sp_dev/bowie_dev/output/build/ncurses-6.1/.stamp_staging_installed'
>> > failed
>> > make[2]: ***
>> >
>> [/home/sbeckwit/sp_dev/bowie_dev/output/build/ncurses-6.1/.stamp_staging_installed]
>> > Error 2
>> > Makefile:23: recipe for target '_all' failed
>> > make[1]: *** [_all] Error 2
>> > make[1]: Leaving directory '/home/sbeckwit/sp_dev/bowie_dev/output'
>> > Makefile:50: recipe for target 'all' failed
>> > make: *** [all] Error 2
>> > sbeckwit at ubuntu:~/sp_dev/bowie_dev$
>>
>> Please try to provide a (at best minimal as possible) .config or defconfig
>> file which reproduces the failure for you for a complete build (make clean
>> && make)...
>>
>> Regards,
>> Peter

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
