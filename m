From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 18 Sep 2007 16:26:36 +0200
Subject: [Buildroot] AVR32 libiberty build failure
In-Reply-To: <20070918112636.GA2231@aon.at>
References: <46EF36B4.2000703@tait.co.nz>  <20070918112636.GA2231@aon.at>
Message-ID: <1190125596.4064.52.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-09-18 klockan 13:26 +0200 skrev Bernhard Fischer:
> On Tue, Sep 18, 2007 at 02:23:48PM +1200, Robin Gilks wrote:
> > At least I think thats the problem...
> >
> > gcc builds OK and at the next step on a default config build for a atngw100 
> > it fails.
> 

I think it is better to check against 4.1.2,
since there is no later port for AVR32.

The problem occurs in "gcc-*/libstdc++-v3/configure" if 
"gcc_no_link" is "yes".

This is set to "yes", if linking fails in "gcc-*/ltconfig".
For the AVR32 the linker fails because crt1.o is not found
(See log below)

I checked the staging dir, and there is no crt1.o there
when gcc-*-final is built

I searched for crt1.* in the gcc source tree,
only gcc/config/sh/crt1.asm exists.

IIRC, I have seen similar problems with ARM & C++

I build with c++,locale, gettext and libintl



Here is the config.log (after cleaning): 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ltconfig:1487:  $(BR)/$(GCC_FINAL)/./gcc/xgcc 
	-shared-libgcc 
	-B$(BR)/$(GCC_FINAL)/./gcc 
	-nostdinc++ 
	-L$(BR)/$(GCC_FINAL)/avr32-linux-uclibc/libstdc++-v3/src 
	-L$(BR)/$(GCC_FINAL)/avr32-linux-uclibc/libstdc++-v3/src/.libs 
	-B$(BR)/build_avr32/staging_dir/avr32-linux-uclibc/bin/ 
	-B$(BR)/build_avr32/staging_dir/avr32-linux-uclibc/lib/ 
	-isystem $(BR)/build_avr32/staging_dir/avr32-linux-uclibc/include 
	-isystem $(BR)/build_avr32/staging_dir/avr32-linux-uclibc/sys-include 
	-o conftest 
	-g 
	-Os 
	-fno-builtin 
	-fno-rtti 
	-fno-exceptions   
	conftest.cc 
	conftstm.o 
	1>&5
$(BR)/build_avr32/staging_dir/avr32-linux-uclibc/bin/ld: crt1.o: No such
file: No such file or directory
collect2: ld returned 1 exit status
ltconfig: failed program was:
#ifdef __cplusplus
extern "C" {
#endif

extern char nm_test_var;
extern char main;
extern char nm_test_func;
#if defined (__STDC__) && __STDC__
# define lt_ptr_t void *
#else
# define lt_ptr_t char *
# define const
#endif

/* The mapping between symbol names and symbols. */
const struct {
  const char *name;
  lt_ptr_t address;
}
lt_preloaded_symbols[] =
{
  {"nm_test_var", (lt_ptr_t) &nm_test_var},
  {"main", (lt_ptr_t) &main},
  {"nm_test_func", (lt_ptr_t) &nm_test_func},
  {0, (lt_ptr_t) 0}
};

#ifdef __cplusplus
}
#endif
--------------------------------------------------------------------------------------------

> Does this work with the current stable, buildroot gcc, i.e. our 4.2.1 with
> buildroot patches?
> It seems that you are using something like:
> toolchain_build_avr32/gcc-4.1.2-avr32-2.0
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
