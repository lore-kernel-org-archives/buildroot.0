From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 23:04:07 +0200
Subject: [Buildroot] thread debugging with target gdb
In-Reply-To: <5059E846.8070000@basystemes.fr>
References: <5059E846.8070000@basystemes.fr>
Message-ID: <505A3347.9010503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 17:44, Thierry Bultel wrote:
> Hi,
> I am using buildroot 2012.08 , configured for ARM cortex A9, crosstools and glibc-2.11.
> The glibc has been built with 2.6.38.8 headers, my running kernel is 3.2.21, in qemu for versatile express.
>
> The issue is that thread debugging does not work, first because /lib/libthread_db.so.1 was not pushed on the 'target'
> directory
> I 'solved' this by adding it:
>
> CTNG_LIBS_LIB := ld*.so libc.so libcrypt.so libdl.so libgcc_s.so libm.so \
> libnsl.so libpthread.so libresolv.so librt.so libutil.so \
> libthread_db.so

  It should probably be:

ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
CTNG_LIBS_LIB += libthread_db.so
endif

  But indeed, it looks like this is missing in crosstools-ng.mk.

  Yann?

>
> ... in crosstools-ng.mk
>
> but is is maybe not the right way.
>
> I have activated some debug log in gdb, and I am falling into those issues.
>
> Reading symbols from /root/ihm...done.
> (gdb) r
> Starting program: /root/ihm
> Trying host libthread_db library: libthread_db.so.1.
> Host libthread_db.so.1 resolved to: /lib/libthread_db.so.1.

  Are you running full gdb on the target?  You may have more luck with
gdbserver on the target and output/host/usr/bin/arm-*-gdb on the host.
Don't forget to do 'set sysroot .../output/staging' in gdb.

[snip]

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
