From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 9 Apr 2017 06:32:15 +0200
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable wordexp
	functionality
In-Reply-To: <20170321170614.161e8eec@free-electrons.com>
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
 <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
 <20170321170614.161e8eec@free-electrons.com>
Message-ID: <20170409043215.GT5361@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Tue, 21 Mar 2017 18:02:36 +0200, Andy Shevchenko wrote:
> 
> > The commit d7c54cb0c0cf ("bluez5_utils: not available with uClibc")
> > disables bluez5_utils (most of them) to be built with uClibc. Looking to
> > the development of BlueZ user space support that commit basically makes
> > the bluez5_utils package somewhat piece of junk.
> 
> Not sure I understand what you mean here.
> 
> > Since bluez5_utils 5.44
> > deprecates all previously used tools and focuses on btmgmt and
> > bluetoothctl we need to restore status quo.
> 
> Same here, I don't understand.
> 
> > diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
> > index 528bce965..91082975e 100644
> > --- a/package/uclibc/uClibc-ng.config
> > +++ b/package/uclibc/uClibc-ng.config
> > @@ -32,6 +32,7 @@ UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
> >  UCLIBC_HAS_PRINTF_M_SPEC=y
> >  # UCLIBC_HAS_REGEX_OLD is not set
> >  # UCLIBC_HAS_FNMATCH_OLD is not set
> > +UCLIBC_HAS_WORDEXP=y
> >  UCLIBC_HAS_NFTW=y
> >  UCLIBC_HAS_FTW=y
> >  UCLIBC_HAS_GNU_GLOB=y
> 
> Could you comment on the size impact of enabling this option? I.e the
> size of uClibc without/with this option enabled, for example on ARM?

For mips64:
diff --git a/package/uclibc/uClibc-ng.config
b/package/uclibc/uClibc-ng.config
index 528bce9..9108297 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -32,6 +32,7 @@ UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
 # UCLIBC_HAS_REGEX_OLD is not set
 # UCLIBC_HAS_FNMATCH_OLD is not set
+UCLIBC_HAS_WORDEXP=y
 UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GNU_GLOB=y
wbx at helium:~/buildroot$ ls -la t1/lib/libu*
-rwxr-xr-x 1 wbx wbx 655320 Apr  8 22:00 t1/lib/libuClibc-1.0.23.so
wbx at helium:~/buildroot$ ls -la t2/lib/libu*
-rwxr-xr-x 1 wbx wbx 672280 Apr  8 23:08 t2/lib/libuClibc-1.0.23.so
wbx at helium:~/buildroot$ bc
bc 1.06.95
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006 Free Software
Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'. 
672280-655320
16960

16960 Bytes. Can we enable it by default?

best regards
 Waldemar
