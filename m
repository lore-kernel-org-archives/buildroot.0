From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 13:23:29 +0100
Subject: [Buildroot] wavpack/iconv link issue
In-Reply-To: <530DCD22.2080609@st.com> (Julien DELACOU's message of "Wed, 26
 Feb 2014 12:16:50 +0100")
References: <530DCD22.2080609@st.com>
Message-ID: <87zjledpvi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien DELACOU <julien.delacou@st.com> writes:

 > Hi,
 > I'm trying to enable wavpack within an already compiled buildroot.

 > After having enabled BR2_PACKAGE_WAVPACK using make menuconfig, I ran 
 > 'make clean all' (since it is recommended after adding some libraries to 
 > the package selection).

 > When I do so, I face the following error at link:
 > /local/frq08628/views/a2_evb_1.1/toolchains/elf-fdpic-v7/bin/../lib/gcc/arm-v7-linux-uclibceabi/4.7.4/../../../../arm-v7-linux-uclibceabi/bin/ld: 
 > wavpack-wavpack.o: undefined reference to symbol 'libiconv_open'
 > ...
 > /local/frq08628/views/a2_evb_1.1/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libiconv.so.2: 
 > could not read symbols: Invalid operation

 > Even after a make distclean/make, problem still persists.

 > I checked my defconfig, BR2_PACKAGE_LIBICONV is set, libiconv.so is 
 > correctly generated. Moreover, the ./configure found it (I suppose using 
 > --with-iconv):
 > checking iconv.h usability... yes
 > checking iconv.h presence... yes
 > checking for iconv.h... yes
 > checking for iconv... no
 > checking for iconv in -liconv... yes

 > The only problem seems to be that the -liconv directive is not added to 
 > linker command.
 > Problem seems to be solved by patching as follow:

 > -wavpack_LDADD = $(AM_LDADD) $(top_builddir)/src/.libs/libwavpack.la 
 > $(LIBM)
 > +wavpack_LDADD = $(AM_LDADD) $(top_builddir)/src/.libs/libwavpack.la 
 > $(LIBM) $(ICONV)
 >   wvunpack_SOURCES = wvunpack.c utils.c md5.c
 >   wvunpack_CFLAGS = $(AM_CFLAGS) -I$(top_srcdir)/include
 > -wvunpack_LDADD = $(AM_LDADD) $(top_builddir)/src/.libs/libwavpack.la 
 > $(LIBM)
 > +wvunpack_LDADD = $(AM_LDADD) $(top_builddir)/src/.libs/libwavpack.la 
 > $(LIBM) $(ICONV)

 > Nevertheless, I'm wondering if it is a proper way to do (and do not 
 > patch the Makefile) ?

Normally you can pass LIBS=-liconv to configure, E.G.

WAVPACK_CONF_OPT += LIBS=-liconv

But strangely enough, our autobuilders haven't triggered this
issue. What buildroot version are you using?

-- 
Bye, Peter Korsgaard
