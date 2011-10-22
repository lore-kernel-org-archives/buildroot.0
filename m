From: Damian Kaczmarek <damian@veritymedical.co.uk>
Date: Sat, 22 Oct 2011 05:05:30 +0200
Subject: [Buildroot] Request for comments on packages for TI's OMAP3 and
	DM365 processors
Message-ID: <201110220505.31561.damian@veritymedical.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Friday 17 September 2010 19:59:45, Pierre-Luc Simard wrote:
> > Hello All,
> > 
> > I'd like some comment on the packages I've made to support TI's gstreamer 
> > plugin for the OMAP3 and DM365 processors. All packages compile using 
> > crosstool-ng and glibc, I have not yet tested them with BR's own internal 
> > toolchain and the uclibc at the moment. If anybody wants to test these > 
package
> > I'll provide as much assistance as I can. I've publish my working branch > 
at 
> > http://github.com/Admetric/buildroot

>  Reviving a year-old thread...

>  It seems these patches were never commented upon and also weren't
> accepted.  I'm going to pick them up again.

>  Although these patches still apply cleanly against the current master, 
there is probably some duplication with the TI things that were merged earlier 
this year.  I will probably not find them all myself, so I hope there is 
someone on the list who can keep an eagle eye on such duplicates.

Yes, the patches have applied cleanly and after doing fixes here and there
most of them built cleanly. However, some things fail to work for me.
I have no idea how to fix the below error which shows up during building
of ti-codec-engine examples. The problem is that the binary is a static 
executable trying to call a rename syscall across filesystem boundaries.
This obviously fails. There is no way to override it since LD_PRELOAD will not 
work (static executable). I have thought of a wrapper around this executable.
Maybe not important but nice to have.

<<<<<<<<<<<<<<<<< LOG START
rush@rushpod:~/Programowanie/swiftlite/buildroot/output/build/ti-codec-
engine-2.25.05.16/examples/ti/xdais/dm/examples/viddec1_copy> 
/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/cgt6x-6.1.12/bin/cl6x -c  -qq -pdsw225 -pden -pds=195  
-mv64p -eo.o64P -ea.s64P  -Dxdc_target_name__=C64P -
Dxdc_target_types__=ti/targets/std.h -Dxdc_bld__profile_whole_program_debug -
Dxdc_bld__vers_1_0_6_1_12 -oe --symdebug:dwarf -mo  -I. -
I/home/rush/Programowanie/swiftlite/buildroot/output/build/ti-codec-
engine-2.25.05.16/examples/ti/sdo/ce/examples/codecs/viddec1_copy/../../../../../.. 
-I/home/rush/Programowanie/swiftlite/buildroot/output/build/ti-codec-
engine-2.25.05.16/packages -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/xdai-6.25.02.11/packages -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/linuxutils-2.25.05.11/packages -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/framework-components-2.25.02.06/packages -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/biosutils-1.02.02.02/packages -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/local-power-manager-1.24.02.09/packages -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/edma3lld-01.11.00.03/packages -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/dspbios-5.41.04.18/packages -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/dsplink-1.65.00.03/packages -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/xdctools-3.20.01.51/packages -I../../../../.. -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/cgt6x-6.1.12/include -
fs=./package/lib/lib/whole_program_debug/viddec1_copy/package -
fr=./package/lib/lib/whole_program_debug/viddec1_copy/package -fc 
package/package_ti.xdais.dm.examples.viddec1_copy.c
>>   error: unable to rename /tmp/17342rJDaJD to
                        ./package/lib/lib/whole_program_debug/viddec1_copy/package/package_ti.xdais.dm.examples.viddec1_copy.o64P:  
Invalid cross-device link

>> Compilation failure
<<<<<<<<<<<<<<<<< LOG END

Another problem is the ti-codecs-omap3 and hence I am unable to test ti-gst-
plugin. It fails on God knows what. Any ideas?

<<<<<<<<<<<<<<<<< LOG START
-I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/dspbios-5.41.04.18/packages/ti/bios/include -
I/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/cgt6x-6.1.12/include
rm -f bin/cs.x64P
#
# lnk64P bin/cs.x64P ...
rm -f package/cfg//bin/cs.x64P.map
/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/cgt6x-6.1.12/bin/lnk6x -w -q -u _c_int00 -l link.cmd 
-q -o bin/cs.x64P package/cfg/bin/cs/main.o64P package/cfg/bin/cs_x64P.o64P 
package/cfg/bin/cs_x64Pcfg_c.o64P package/cfg/bin/cs_x64Pcfg.o64P  
package/cfg/bin/cs_x64P.xdl  -c -m package/cfg//bin/cs.x64P.map -l 
/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-gnueabi/sysroot/ti/cgt6x-6.1.12/lib/rts64plus.lib

 undefined    first referenced                                                                                                                                                                                                 
  symbol          in file                                                                                                                                                                                                      
 ---------    ----------------                                                                                                                                                                                                 
 _RingIO_init 
/home/rush/Programowanie/swiftlite/buildroot/output/host/usr/arm-unknown-
linux-
gnueabi/sysroot/ti/dsplink-1.65.00.03/packages/dsplink/dsp/export/BIN/DspBios/OMAP3530/OMAP3530_0/RELEASE/dsplink.lib<dsplink.obj>

error: unresolved symbols remain
error: errors encountered during linking; "bin/cs.x64P" not built
gmake[1]: *** [bin/cs.x64P] Error 1
gmake: *** [packages/ti/sdo/server/cs,.executables] Error 2
make[1]: *** [.all-packages] B??d 2
make[1]: Opuszczenie katalogu 
`/home/rush/Programowanie/swiftlite/buildroot/output/build/ti-codecs-
omap3-1.01.00'

<<<<<<<<<<<<<<<<< LOG END

My patches are here: http://rushbase.net/buildroot/
One is an addition to the patch series from the original submitter made by me 
and other is a whole lot including my fixes.
There is also a mirror of some files (including TI stuff) 

Anybody wants to try their magic?

Best Regards,
Damian Kaczmarek

Btw. I have DM3730 / OMAP3530.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111022/b3e94bff/attachment.asc>
