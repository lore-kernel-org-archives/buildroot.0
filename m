From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 24 Jun 2011 14:38:44 +0200
Subject: [Buildroot] cyrus-sasl in buildroot: apparent CFLAGS mismatch on
	saslauthd
In-Reply-To: <4E04828A.6030908@lucaceresoli.net>
References: <4E04828A.6030908@lucaceresoli.net>
Message-ID: <4E048554.4050602@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
the first issue I hit while trying to cross-compile cyrus-sasl within 
buildroot
is in the configure step.

Cyrus developers might be interested to know that buildroot, in the case of
the Cyrus packages, builds packages unpacking the source package (the 
released
tarball in thi case), optionally patches them, then executes ./configure 
with
suitable environment and options, then launches make and make install.

I instructed buildroot to unpack cyrus-sasl 2.1.24rc1 and run its 
./configure
script with most options disabled to make things simple. It ran fine 
until it
entered the saslauthd subdir with the following error (the full 
compilation log
is attached).

   $ pwd
   /home/murray/devel/buildroot
   $ make cyrus-sasl-dirclean
   rm -Rf /home/murray/devel/buildroot/output/build/cyrus-sasl-2.1.24rc1
   $ make cyrus-sasl 2>&1 | tee cyrus-sasl.log
   [...]
   configure: configuring in saslauthd
   configure: running /bin/bash './configure' --prefix=/usr  
'--target=arm-linux' '--host=arm-linux' '--build=i686-pc-linux-gnu' 
'--prefix=/usr' '--exec-prefix=/usr' '--sysconfdir=/etc' 
'--disable-gtk-doc' '--enable-static' '--enable-shared' 
'--disable-dependency-tracking' '--disable-sample' '--disable-checkapop' 
'--enable-login' '--disable-otp' '--disable-srp' '--disable-gssapi' 
'--disable-cram' '--disable-anon' '--disable-digest' '--disable-ntlm' 
'--disable-passdss' '--without-des' '--without-openssl' 
'CC=/home/murray/devel/buildroot/output/host/usr/bin/ccache 
/home/murray/devel/buildroot/output/host/usr/bin/arm-linux-gcc' 
'CFLAGS=-Os -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64' 
'CPP=/home/murray/devel/buildroot/output/host/usr/bin/arm-linux-cpp' 
'LDFLAGS=' 'build_alias=i686-pc-linux-gnu' 'host_alias=arm-linux' 
'target_alias=arm-linux' --cache-file=.././config.cache --srcdir=.
   configure: loading cache .././config.cache
   configure: error: `CFLAGS' has changed since the previous run:
   configure:   former value:  -Os -pipe -Os  -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
   configure:   current value: -Os -pipe -Os -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
   configure: error: changes in the environment can compromise the build
   configure: error: run `make distclean' and/or `rm .././config.cache' 
and start over
   configure: error: /bin/bash './configure' failed for saslauthd
   $

It is clear from the output that the "former" and "current" CFLAGS are
substantially identical, differing only in spacing.

After a quick look at the CFLAGS handling on both the buildroot and 
cyrus-sasl
side I gave up and, since I do not need saslauthd, I worked around with this
ugly patch:

  diff -u -r cyrus-sasl-2.1.24rc1-orig/configure 
cyrus-sasl-2.1.24rc1/configure
  --- cyrus-sasl-2.1.24rc1-orig/configure    2009-05-07 
16:24:25.000000000 +0200
  +++ cyrus-sasl-2.1.24rc1/configure    2011-05-02 15:10:36.793333728 +0200
  @@ -15542,8 +15542,10 @@
  -subdirs="$subdirs saslauthd"

  +if test "$with_saslauthd" != no; then
  +  subdirs="$subdirs saslauthd"
  +fi

and adding --disable-saslauthd to the ./configure options within buildroot's
cyrus-sasl.mk (which contains the buildroot instructions to build 
cyrus-sasl).

This leaves two questions open:
  - Why not adding a --disable-saslauthd option (the autoconf/automake 
way) thus
    allowing to build cyrus-sasl without this component?
  - How to solve the problem with the CFLAGS spacing handling, for those who
    might need saslauthd cross-compiled in buildroot?

The full compilation log is attached.

Thanks,
Luca

-------------- next part --------------
A non-text attachment was scrubbed...
Name: cyrus-sasl-saslauthd-cflags-mismatch.log.gz
Type: application/x-gzip
Size: 3481 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110624/cd235ed1/attachment.bin>
