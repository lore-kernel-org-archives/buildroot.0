From: Will Newton <will.newton@gmail.com>
Date: Wed, 28 Mar 2012 14:01:56 +0100
Subject: [Buildroot] [PATCH 2/2] microperl: install host-microperl in
	$(HOST_DIR)/opt/perl
In-Reply-To: <20120328145211.470f0fc3@skate>
References: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
 <87fwctb4gn.fsf@macbook.be.48ers.dk>
 <20120328095532.71abc612@skate>
 <87bonhax4p.fsf@macbook.be.48ers.dk>
 <CAFbHwiQUZKJeD-F2z_EnPC=QE-FhuRDb3bZUenEjmprJE6MPGw@mail.gmail.com>
 <20120328125547.6873d986@skate> <20120328145211.470f0fc3@skate>
Message-ID: <CAFbHwiQyqFR_S4XE7jT==e3waOzQQDBg=7bm+Kb500QK=Gvskw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 28, 2012 at 1:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 28 Mar 2012 12:55:47 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
>
>> In the past, we had the problem that when we were building target
>> packages that required host utilities installed in $(HOST_DIR)/usr/bin,
>> those utilities were not able to find their libraries in
>> $(HOST_DIR)/usr/lib. We tried using LD_LIBRARY_PATH, but libtool used
>> it as the search path for libraries when compiling target stuff. So, we
>> decided to hardcode the correct rpath in all binaries built and
>> installed in $(HOST_DIR)/usr/bin.
>
> I had a quick look at this, and here the Perl dynamic module that
> depends on libexpat.so.1 is built with the correct RPATH:
>
> $ arm-linux-gnueabi-readelf -a host/usr/lib/perl/auto/XML/Parser/Expat/Expat.so | grep RPATH
> ?0x000000000000000f (RPATH) ? ? ? ? ? ? ?Library rpath: [/opt/outputs/perl/host/usr/lib]
>
> So normally, when this Expat.so library is dlopen'ed by Perl, it should
> use the RPATH of Expat.so to find where libexpat.so.1 is located. And
> on my system, it does:
>
> $ PERLLIB=/opt/outputs/perl/host/usr/lib/perl/ LD_DEBUG=libs perl -e 'require XML::Parser;'
> ? ? ?9529: ? ? find library=libperl.so.5.10 [0]; searching
> ? ? ?9529: ? ? ?search cache=/etc/ld.so.cache
> ? ? ?9529: ? ? ? trying file=/usr/lib/libperl.so.5.10
> ? ? ?9529:
> ? ? ?9529: ? ? find library=libdl.so.2 [0]; searching
> ? ? ?9529: ? ? ?search cache=/etc/ld.so.cache
> ? ? ?9529: ? ? ? trying file=/lib/x86_64-linux-gnu/libdl.so.2
> ? ? ?9529:
> ? ? ?9529: ? ? find library=libm.so.6 [0]; searching
> ? ? ?9529: ? ? ?search cache=/etc/ld.so.cache
> ? ? ?9529: ? ? ? trying file=/lib/x86_64-linux-gnu/libm.so.6
> ? ? ?9529:
> ? ? ?9529: ? ? find library=libpthread.so.0 [0]; searching
> ? ? ?9529: ? ? ?search cache=/etc/ld.so.cache
> ? ? ?9529: ? ? ? trying file=/lib/x86_64-linux-gnu/libpthread.so.0
> ? ? ?9529:
> ? ? ?9529: ? ? find library=libc.so.6 [0]; searching
> ? ? ?9529: ? ? ?search cache=/etc/ld.so.cache
> ? ? ?9529: ? ? ? trying file=/lib/x86_64-linux-gnu/libc.so.6
> ? ? ?9529:
> ? ? ?9529: ? ? find library=libcrypt.so.1 [0]; searching
> ? ? ?9529: ? ? ?search cache=/etc/ld.so.cache
> ? ? ?9529: ? ? ? trying file=/lib/x86_64-linux-gnu/libcrypt.so.1
> ? ? ?9529:
> ? ? ?9529:
> ? ? ?9529: ? ? calling init: /lib/x86_64-linux-gnu/libpthread.so.0
> ? ? ?9529: ? ? calling init: /lib/x86_64-linux-gnu/libc.so.6
> ? ? ?9529: ? ? calling init: /lib/x86_64-linux-gnu/libcrypt.so.1
> ? ? ?9529: ? ? calling init: /lib/x86_64-linux-gnu/libm.so.6
> ? ? ?9529: ? ? calling init: /lib/x86_64-linux-gnu/libdl.so.2
> ? ? ?9529: ? ? calling init: /usr/lib/libperl.so.5.10
> ? ? ?9529:
> ? ? ?9529:
> ? ? ?9529: ? ? initialize program: perl
> ? ? ?9529: ? ? transferring control: perl
> ? ? ?9529:
> ? ? ?9529: ? ? find library=libexpat.so.1 [0]; searching
> ? ? ?9529: ? ? ?search path=/opt/outputs/perl/host/usr/lib/tls/x86_64:/opt/outputs/perl/host/usr/lib/tls:/opt/outputs/perl/host/usr/lib/x86_64:/opt/outputs/perl/host/usr/lib ? ? ? ? ?(RPATH from file /opt/outputs/perl/host/usr/lib/perl//auto/XML/Parser/Expat/Expat.so)
> ? ? ?9529: ? ? ? trying file=/opt/outputs/perl/host/usr/lib/tls/x86_64/libexpat.so.1
> ? ? ?9529: ? ? ? trying file=/opt/outputs/perl/host/usr/lib/tls/libexpat.so.1
> ? ? ?9529: ? ? ? trying file=/opt/outputs/perl/host/usr/lib/x86_64/libexpat.so.1
> ? ? ?9529: ? ? ? trying file=/opt/outputs/perl/host/usr/lib/libexpat.so.1
> ? ? ?9529:
> ? ? ?9529: ? ? calling init: /opt/outputs/perl/host/usr/lib/libexpat.so.1
> ? ? ?9529: ? ? calling init: /opt/outputs/perl/host/usr/lib/perl//auto/XML/Parser/Expat/Expat.so
> ? ? ?9529: ? ? calling fini: perl [0]
> ? ? ?9529: ? ? calling fini: /usr/lib/libperl.so.5.10 [0]
> ? ? ?9529: ? ? calling fini: /lib/x86_64-linux-gnu/libdl.so.2 [0]
> ? ? ?9529: ? ? calling fini: /lib/x86_64-linux-gnu/libm.so.6 [0]
> ? ? ?9529: ? ? calling fini: /lib/x86_64-linux-gnu/libpthread.so.0 [0]
> ? ? ?9529: ? ? calling fini: /lib/x86_64-linux-gnu/libcrypt.so.1 [0]
> ? ? ?9529: ? ? calling fini: /opt/outputs/perl/host/usr/lib/perl//auto/XML/Parser/Expat/Expat.so [0]
> ? ? ?9529: ? ? calling fini: /opt/outputs/perl/host/usr/lib/libexpat.so.1 [0]
> ? ? ?9529: ? ? calling fini: /lib/x86_64-linux-gnu/libc.so.6 [0]
>
> As you can see here, it clearly looks in the RPATH encoded into
> Expat.so to find where libexpat.so.1 is located. In my
> case /opt/outputs/perl/ in the Buildroot output directory, and it
> clearly uses the libexpat.so.1 from this output directory, and not the
> one from my system.
>
> Are you sure you don't have any value set in your LD_LIBRARY_PATH
> environment variable (outside of Buildroot)? Can you try the commands
> above (check the RPATH of Expat.so and check the resolution of
> libraries when asking Perl to require the XML::Parser module, when
> PERLLIB points to the Perl modules built by Buildroot), and post the
> results?

I haven't got any LD_LIBRARY_PATH set, but it looks like there is no
rpath set. I wonder if this is some perl Makefile issue.

[win at lemeta01 buildroot]$ env | grep LD_LIBRARY
[win at lemeta01 buildroot]$ ./output/host/usr/bin/arm-linux-readelf -a
./output/host/usr/lib/perl/auto/XML/Parser/Expat/Expat.so | grep RPATH
[win at lemeta01 buildroot]$

Although the makefiles do mention rpath, but that one does not seem to
be getting used either:

[win at lemeta01 host-libxml-parser-perl-2.36]$ grep -ri rpath *
Expat/Makefile:CCDLFLAGS = -Wl,-E
-Wl,-rpath,/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/CORE
Makefile:CCDLFLAGS = -Wl,-E
-Wl,-rpath,/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/CORE
