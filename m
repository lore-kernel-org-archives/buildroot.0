From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 17:51:33 +0200
Subject: [Buildroot] Bizarre things on the allyespackageconfig build
Message-ID: <20130510175133.13d3fc6f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Following the allyespackageconfig, I did explore the generated
output/target filesystem, and noticed a number of bizarre things that
probably should be fixed:

 * There is a usr/argus directory, which contains just an empty
   'archive' directory. Doesn't seem to make much sense. Probably
   something to fix in the argus package.

 * There is a usr/arm-buildroot-linux-gnueabi directory, which contains
   just a 'bin' subdirectory, which contains ar, as, ld, nm, etc.

   $ ls usr/arm-buildroot-linux-gnueabi/bin/
   ar  as  ld  ld.bfd  nm  objcopy  objdump  ranlib  strip

   That's a strange installation location for binutils.

 * There a usr/IDcheck.sh script. It comes from the LTP testsuite.

 * There a bunch of libraries that don't have the executable bit set in
   usr/lib. I don't think it's a big problem, but it makes them
   different from the others. libacl.so.1.1.0, libnettle.so.4.6,
   libhogweed.so.2.4, libattr.so.1.1.0, libesg.so,
   libicudata.so.48.1.1, libbind9.so.50.0.9, libisccc.so.50.0.3,
   libisccfg.so.50.0.6, libisc.so.57.1.0, liblwres.so.50.0.6,
   libmatroska.so.5, libucsi.so.libdns.so.110.1.2,
   lib_mp3_parser_arm11_elinux.so.3.1, lib_mp3_parser_arm9_elinux.so.1,
   libdvbapi.so, libdvbcfg.so, libdvben50221.so, libdvbsec.so,
   libproxychains4.so, nm-n.libdirect-1.6.so.0,
   nm-n.libdirectfb-1.6.so.0, nm-n.libfusion-1.6.so.0.

 * The gpsd-3.9 installs a libQgpsmm.prl file that isn't needed at
   execution time. It should be removed from the target.

 * The samba package installs a bunch of *.msg files (de.msg  en.msg
   fi.msg  fr.msg  it.msg  ja.msg  nl.msg  pl.msg  ru.msg  tr.msg).
   Note sure why those are in usr/lib directly.

 * There a bunch of *.sh scripts that look suspicious (tclConfig.sh
   xml2Conf.sh  xsltConf.sh).

 * The erlang installation in usr/lib/erlang/ looks strange. It has
   bin/, lib/, usr/ directories and a few others,
   usr/lib/erlang/usr/include contains some header files. Looks strange.

 * The usr/lib/valgrind contains some huge binaries (2.5 MB) that are
   statically linked. Does it make sense?

 * There is a usr/lib64 directory, which contains the libiscsi library.
   Seems like there's something wrong in the build procedure of this
   library, it should get installed in usr/lib.

 * For some reason, the "feh" package installs its stuff in usr/local
   rather than usr/. So, its documentation gets kept, its manpage gets
   kept, etc. The package should be fixed to install its stuff in usr/.

 * ltp-testsuite installs runalltests.sh, runltp and runltplite.sh
   directly in usr/. Not nice. And also a usr/runtest/ directory with a
   bunch of files in there.

 * Seems like the 'quota' package has some issues. It installs edquota,
   quotacheck and rpc.quotad in usr/sbin, but without execution
   permissions. It also installs a quotaoff -> quotaon symlink, but
   there's no quotaon file.

 * ltp-testsuite installs a usr/scenario_groups directory. And also
   usr/testcases and usr/testscripts.

 * The rt-tests package installs some source code in usr/src/backfire.
 
 * Some packages seem to confuse /var with /usr/var: cups, netatalk,
   squid, polkit-1, vtund, stunnel. Here's what I have in usr/var/ :

$ find usr/var/
usr/var/
usr/var/cache
usr/var/cache/squid
usr/var/cache/cups
usr/var/cache/cups/rss
usr/var/netatalk
usr/var/netatalk/CNID
usr/var/netatalk/CNID/README
usr/var/netatalk/README
usr/var/run
usr/var/run/squid
usr/var/run/cups
usr/var/run/cups/certs
usr/var/racoon
usr/var/logs
usr/var/log
usr/var/log/cups
usr/var/log/vtund
usr/var/lock
usr/var/lock/vtund
usr/var/lib
usr/var/lib/polkit-1
usr/var/lib/polkit-1/localauthority
usr/var/lib/polkit-1/localauthority/10-vendor.d
usr/var/lib/polkit-1/localauthority/30-site.d
usr/var/lib/polkit-1/localauthority/90-mandatory.d
usr/var/lib/polkit-1/localauthority/20-org.d
usr/var/lib/polkit-1/localauthority/50-local.d
usr/var/lib/stunnel
usr/var/spool
usr/var/spool/cups
usr/var/spool/cups/tmp

 * Again ltp-testsuite installs a file named usr/Version, and a binary
   called usr/ver_linux.

 * usr/share represents 428 MB, which includes 121 MB of locales (I
   didn't select the removal of locales in my configuration)

 * qt installs its demos and examples in usr/share/qt/{demos,examples},
   but it installs both the source code and binaries. It would probably
   make sense to get rid of the source code of the examples.

 * libatomic_ops installs some documentation in usr/share/libatomic_ops.

 * There is a usr/share/imx-mm/ directory, with a lot of example code,
   including the source code. Maybe not necessary.

 * Squid installs the translation of its error messages directly in
   usr/share/errors/<language>/, so it doesn't get purged as per the
   locale settings. And also usr/share/errors/ is very generic...

 * Sylpheed installs its manual and faq in usr/share/sylpheed.

 * gutenprint installs its documentation in usr/share/gutenprint/doc/

 * edje installs some examples with the source code in
   usr/share/edje/examples.

 * metacity installs a 'metacity.schemas' file at the root of the
   filesystem.

If people are interested in fixing some of those issues, reply to this
e-mail saying which issue you're going to have a look at.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
