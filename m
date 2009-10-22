From: Mark Constable <markc@renta.net>
Date: Fri, 23 Oct 2009 01:29:44 +1000
Subject: [Buildroot] perl depends miniperl
Message-ID: <4AE07A68.8090403@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the pursuit of a usable ar I thought I'd select Target options -> Generic
development system and see what happens but it stopped at this point where,
I presume, building perl requires ../../miniperl.

Any suggestion how to work around this one?

I really do not want perl at all. Certainly not on the target.

 
touch /home/sources/buildroot/build_i686/perl-5.8.8/.host_configured_and_fixed
/usr/bin/make -j1 -C /home/sources/buildroot/build_i686/perl-5.8.8              || echo "An error is expected on make"
make[1]: Entering directory `/home/sources/buildroot/build_i686/perl-5.8.8'
make[1]: *** No rule to make target `<command-line>', needed by `miniperlmain.o'.  Stop.
make[1]: Leaving directory `/home/sources/buildroot/build_i686/perl-5.8.8'
An error is expected on make
touch /home/sources/buildroot/build_i686/perl-5.8.8/.host_make
/usr/bin/make -j1 -C /home/sources/buildroot/build_i686/perl-5.8.8 test || echo "An error is expected on make test"
make[1]: Entering directory `/home/sources/buildroot/build_i686/perl-5.8.8'
make[1]: *** No rule to make target `<command-line>', needed by `miniperlmain.o'.  Stop.
make[1]: Leaving directory `/home/sources/buildroot/build_i686/perl-5.8.8'
An error is expected on make test
touch /home/sources/buildroot/build_i686/perl-5.8.8/.host_make_fixed
# we need to build a perl for the host just for Errno.pm
(cd /home/sources/buildroot/build_i686/perl-5.8.8; \
         chmod a+x ext/util/make_ext; \
         ext/util/make_ext nonxs Errno MAKE="/usr/bin/make" \
        )

        Making Errno (nonxs)
ext/util/make_ext: line 122: ../../miniperl: No such file or directory
Warning: No Makefile!
make[1]: Entering directory `/home/sources/buildroot/build_i686/perl-5.8.8/ext/Errno'
make[1]: *** No rule to make target `config'.  Stop.
make[1]: Leaving directory `/home/sources/buildroot/build_i686/perl-5.8.8/ext/Errno'
/usr/bin/make config failed, continuing anyway...
make[1]: Entering directory `/home/sources/buildroot/build_i686/perl-5.8.8/ext/Errno'
make[1]: *** No rule to make target `all'.  Stop.
make[1]: Leaving directory `/home/sources/buildroot/build_i686/perl-5.8.8/ext/Errno'
make: *** [/home/sources/buildroot/build_i686/perl-5.8.8/.configured] Error 2


--markc
