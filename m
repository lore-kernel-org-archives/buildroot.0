From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 19 Jan 2007 20:10:53 +0100
Subject: [Buildroot] package makefile conventions
In-Reply-To: <200701191912.49618.claus.klein@arcormail.de>
References: <200701191912.49618.claus.klein@arcormail.de>
Message-ID: <20070119191053.GA19990@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 19, 2007 at 07:12:49PM +0100, Claus Klein wrote:
>Hallo,
>
>I found some packages which does not implement all needed targets.

Ah, excellent.

>Too, some of them use 'make' or 'sed' without the common make variable.

Those need fixing.

>
>Last, but not least, why is '$(MAKE1)' used in some package makefiles?

Some packages are broken wrt parallel builds. $(MAKE1) expands to
make -j 1

>claus at P3linux:~/src/buildroot> ./mklint
>package/gmp/gmp.mk lacks target gmp

The upstream package is called "gmp" but is really "libgmp".
Same for mpfr.

>package/gmp/gmp.mk lacks target gmp-source
>package/gmp/gmp.mk lacks target gmp-clean
>package/gmp/gmp.mk lacks target gmp-dirclean
>package/qte/qte.mk lacks target qte-source
>package/bash/bash.mk uses MAKE1 make var, why not $(MAKE) ?
>package/dash/dash.mk uses MAKE1 make var, why not $(MAKE) ?
>package/flex/flex.mk uses MAKE1 make var, why not $(MAKE) ?
>package/lzma/lzma.mk lacks target lzma

That one has lzma-host and lzma-target targets

>package/mpfr/mpfr.mk lacks target mpfr
>package/mpfr/mpfr.mk lacks target mpfr-source
>package/mpfr/mpfr.mk lacks target mpfr-clean
>package/mpfr/mpfr.mk lacks target mpfr-dirclean
>package/pppd/pppd.mk uses MAKE1 make var, why not $(MAKE) ?
>package/ipsec-tools/ipsec-tools.mk uses make without make var $(MAKE) /!\
>package/expat/expat.mk lacks target expat-dirclean
>package/pango/pango.mk uses MAKE1 make var, why not $(MAKE) ?
>package/slang/slang.mk uses MAKE1 make var, why not $(MAKE) ?
>package/wireless-tools/wireless-tools.mk uses sed without make var $(SED) :-(
>package/iptables/iptables.mk uses MAKE1 make var, why not $(MAKE) ?
>package/modutils/modutils.mk uses MAKE1 make var, why not $(MAKE) ?
>package/ltp-testsuite/ltp-testsuite.mk uses MAKE1 make var, why not $(MAKE) ?
>package/dmraid/dmraid.mk uses MAKE1 make var, why not $(MAKE) ?
>package/ncurses/ncurses.mk uses MAKE1 make var, why not $(MAKE) ?
>package/netsnmp/netsnmp.mk uses MAKE1 make var, why not $(MAKE) ?
>package/pciutils/pciutils.mk uses MAKE1 make var, why not $(MAKE) ?
>package/libelf/libelf.mk uses MAKE1 make var, why not $(MAKE) ?
>package/libusb/libusb.mk uses make without make var $(MAKE) /!\
>package/python/python.mk uses make without make var $(MAKE) /!\
>package/e2fsprogs/e2fsprogs.mk uses MAKE1 make var, why not $(MAKE) ?
>package/thttpd/thttpd.mk uses sed without make var $(SED) :-(
>package/openntpd/openntpd.mk lacks target openntpd
>package/openntpd/openntpd.mk lacks target openntpd-source
>package/openntpd/openntpd.mk lacks target openntpd-clean
>package/openntpd/openntpd.mk lacks target openntpd-dirclean

well:
$ grep -L dirclean package/*/*mk
package/customize/customize.mk
package/expat/expat.mk
package/gnuconfig/gnuconfig.mk

where customize and gnuconfig are ok, expat not (but i didn't look)

for the normal clean targets, we have about the same picture (all seems
to be well):
$ grep -L clean: package/*/*mk
package/customize/customize.mk
package/gnuconfig/gnuconfig.mk


>package/raidtools/raidtools.mk lacks target raidtools
>package/raidtools/raidtools.mk lacks target raidtools-source
>package/raidtools/raidtools.mk lacks target raidtools-clean
>package/raidtools/raidtools.mk lacks target raidtools-dirclean
>package/usbutils/usbutils.mk uses make without make var $(MAKE) /!\
>package/openssl/openssl.mk uses MAKE1 make var, why not $(MAKE) ?
>package/libevent/libevent.mk uses make without make var $(MAKE) /!\
>package/libfloat/libfloat.mk uses make without make var $(MAKE) /!\
>package/xfsprogs/xfsprogs.mk uses MAKE1 make var, why not $(MAKE) ?
>package/microperl/microperl.mk uses make without make var $(MAKE) /!\
>package/readline/readline.mk uses MAKE1 make var, why not $(MAKE) ?
>package/asterisk/asterisk.mk uses MAKE1 make var, why not $(MAKE) ?
>claus at P3linux:~/src/buildroot>            
