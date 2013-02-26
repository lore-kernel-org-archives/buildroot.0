From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Feb 2013 21:29:46 +0100
Subject: [Buildroot] [PATCH v6] wireshark: new package
In-Reply-To: <e64c965f3221d977b9bd2edf99405efd7405f848.1361167992.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 18 Feb 2013 08:18:11 +0200")
References: <e64c965f3221d977b9bd2edf99405efd7405f848.1361167992.git.baruch@tkos.co.il>
Message-ID: <87wqtu7r9h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 Baruch> This is only the bare minimum needed to build the textual
 Baruch> tshark utility.  Support for more options, including the
 Baruch> wireshark GUI, can be added later.

I was going to commit this to next, but a small test build fails as it
ends up using system includes:

libtool: compile:  /home/peko/source/buildroot/outf2fs/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I../.. -I../.. -I/usr/include -DG_DISABLE_DEPRECATED -DG_DISABLE_SINGLE_INCLUDES -D_FORTIFY_SOURCE=2 "-D_U_=__attribute__((unused))" -I/home/peko/source/buildroot/outf2fs/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -DPLUGIN_DIR=\"/usr/lib/wireshark/plugins/1.8.5\" -pipe -Os -Wall -W -Wextra -Wdeclaration-after-statement -Wendif-labels -Wpointer-arith -Wno-pointer-sign -Warray-bounds -Wcast-align -Wformat-security -Wold-style-definition -Wno-error=unused-but-set-variable -fexcess-precision=fast -pthread -I/home/peko/source/buildroot/outf2fs/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/peko/source/buildroot/outf2fs/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -MT packet-asn1.lo -MD -MP -MF .deps/packet-asn1.Tpo -c packet-asn1.c  -fPIC -DPIC -o .libs/packet-asn1.o
In file included from /usr/include/errno.h:29:0,
                 from packet-asn1.c:66:
/usr/include/features.h:323:26: fatal error: bits/predefs.h: No such file or directory
compilation terminated.
make[5]: *** [packet-asn1.lo] Error 1

This is with a basic internal ARM toolchain:

cat defconfig
BR2_arm=y
BR2_arm926t=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_WIRESHARK=y

Looking closer at it, I see it is caused by a bunch of Makefile.am files
having:

INCLUDES = -I$(top_srcdir) -I$(includedir)

E.G. look in srcdir + /usr/include. A quick workaround is to pass
--includedir=$(STAGING_DIR)/usr/include to configure. If wireshark
itself would install any headers, this would cause problems, but in this
case it seems ok, so I think it's the best approach.

Alternatively we could patch all the Makefile.am files to drop
-I$(includedir) and autoreconf the package.


-- 
Bye, Peter Korsgaard
