From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 06 Jan 2014 06:35:30 +0100
Subject: [Buildroot] [PATCH 20/36] xorg: xlib_libXpm depends on libiconv
	& gettext if appropriate
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP4422A4B5DD408695FF2D014D9B50@phx.gbl>
 <87k3eeyris.fsf@dell.be.48ers.dk>
Message-ID: <2urppaxa0n.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> wrote in
news:87k3eeyris.fsf at dell.be.48ers.dk: 

>>>>>> "Bernd" == Bernd Kuhls
>>>>>> <berndkuhls@hotmail.com> writes: 
> 
> > Signed-off-by: Bernd Kuhls
> > <berndkuhls@hotmail.com> 
> 
> What issue exactly are you trying to fix? I don't seem to be able to
> trigger it here?
> 
> Some more detailed commit message would be good, please.
> 

Hi,

I need this kind of patch for a lot of packages due to link failures 
regarding libiconv and, sometimes, libgettext, for example gnupg 
(http://patchwork.ozlabs.org/patch/305819/):

buildroot/output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a 
buildroot/output/target/usr/bin/gpg | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libbz2.so.1.0]
 0x00000001 (NEEDED)                     Shared library: [libreadline.so.6]
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Here is a patch snippet of the uClibc .config currently in use, I hope this 
will help you triggering the problem:

@@ -179,67 +172,65 @@
 #
 # String and Stdio Support
 #
-# UCLIBC_HAS_STRING_GENERIC_OPT is not set
+UCLIBC_HAS_STRING_GENERIC_OPT=y
 UCLIBC_HAS_STRING_ARCH_OPT=y
 UCLIBC_HAS_CTYPE_TABLES=y
 UCLIBC_HAS_CTYPE_SIGNED=y
 # UCLIBC_HAS_CTYPE_UNSAFE is not set
 UCLIBC_HAS_CTYPE_CHECKED=y
 # UCLIBC_HAS_CTYPE_ENFORCED is not set
-# UCLIBC_HAS_WCHAR is not set
+UCLIBC_HAS_WCHAR=y
 # UCLIBC_HAS_LOCALE is not set

The full version can be found here:
https://ssl.nettworks.org/repo/browse/fli4l/branches/testing/src/src/fbr/bu
ildroot/package/uclibc/uclibc.config?r=28674

Regards, Bernd
