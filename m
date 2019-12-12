From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 12 Dec 2019 09:23:04 +0000
Subject: [Buildroot] uClibc building fails: was [RE: [arc-buildroot]
 [autobuild.buildroot.net] Your daily results for 2019-12-11]
Message-ID: <CY4PR1201MB0120A08931AEE94D5DC5F8BEA1550@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

>     arc      |         uclibc-1.0.32          | http://autobuild.buildroot.net/results/d1b45b78b94387a7b15be7caec64847bd04af0f1/

That uClibc failure seem to be due to missing en_US.UTF-8 locale on the host.
We faced this while trying to build uClibc in Docker container with Ubuntu 18.04,
see https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/207.

What really happens is:
------------------------------------>8--------------------------------
$ install -d libubacktrace/arc
make -C extra/locale locale_headers
gcc ../../extra/locale/gen_wc8bit.c  -o ../..//extra/locale/gen_wc8bit    -Os  -D__UCLIBC_GEN_LOCALE -I../..// -DCTYPE_PACKED=1 -DDO_WIDE_CHAR=1
echo "/home/auto_user/arc_gnu/uclibc-ng/extra/locale/../../extra/locale/charmaps/ASCII.pairs" > ../..//extra/locale/codesets.txt
echo ".../uclibc-ng/extra/locale/../../extra/locale/charmaps/ISO-8859-1.pairs" >> ../..//extra/locale/codesets.txt
../..//extra/locale/gen_wc8bit `cat ../..//extra/locale/codesets.txt` > ../..//extra/locale/c8tables.h
Makefile.in:163: recipe for target '../..//extra/locale/c8tables.h' failed
make[1]: *** [../..//extra/locale/c8tables.h] Error 1
Makefile.in:185: recipe for target 'headers' failed
make: *** [headers] Error 2
------------------------------------>8--------------------------------

This happens because on a previous step gen_wc8bit didn't create proper c8tables.h:
------------------------------------>8--------------------------------
$ ./gen_wc8bit cat codesets.txt
could not find a UTF8 locale ... please enable en_US.UTF-8

$ cat ./extra/locale/c8tables.h
could not find a UTF8 locale ... please enable en_US.UTF-8
------------------------------------>8--------------------------------

And the solution is as simple as installation of the locale.
On Debian/Ubuntu this could be done this way:
------------------------------------>8--------------------------------
$ sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
$ locale-gen
------------------------------------>8--------------------------------

From here http://autobuild.buildroot.net/results/d1b45b78b94387a7b15be7caec64847bd04af0f1/submitter
it looks like that's some Bootlin owned machine:
------------------------------------>8--------------------------------
Thomas Petazzoni (Bootlin server)
------------------------------------>8--------------------------------

Any possibility to check what's wrong with locales there?

-Alexey
