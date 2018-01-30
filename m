From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 13:21:37 +0100
Subject: [Buildroot] [PATCH RFC] core/infra: fix build on toolchain
 without C++
In-Reply-To: <20180103173952.10834-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 3 Jan 2018 18:39:52 +0100")
References: <20180103173952.10834-1-yann.morin.1998@free.fr>
Message-ID: <87shan1qr2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Autotools-based packages that do not need C++ but check for it, and use
 > libtool, will fail to configure on distros that lack /lib/cpp.

 > This is the case for example on Arch Linux, where expat fails to build
 > with:

 >     configure: error: in `/home/dkc/src/buildroot/build/build/expat-2.2.4':
 >     configure: error: C++ preprocessor "/lib/cpp" fails sanity check

 > This is because libtool uses AC_PROC_CXXCPP, which can not be avoided,
 > and does require a cpp that passes some "sanity" checks (does not choke
 > on valid input, but does choke on invalid input). So we can use neither
 > /bin/false nor /bin/true...

 > We instead need something that can digest some basic C++ preprocessor
 > input. We can't use the target preprocessor: that does not work, because
 > it obviously has no C++ cupport:

 >     arm-linux-cpp.br_real: error: conftest.cpp: C++ compiler not
 >     installed on this system

 > We can however consider that the host machine does have a C++ compiler,
 > so we use the host' cpp, which is gcc's compiler wrapper that ends up
 > calling the host's C++ preprocessor.

 > That would give us a valid C++ preprocessor when we don't have one, in
 > fact. But autotools will then correctly fail anyway, because there is
 > indeed no C++ compiler at all, as we can see in this excerpt of a
 > configure log from expat:

 >     checking whether we are using the GNU C++ compiler... no
 >     checking whether false accepts -g... no
 >     checking dependency style of false... none
 >     checking how to run the C++ preprocessor... cpp
 >     checking whether the false linker (/home/ymorin/dev/buildroot/O/host/bin/arm-linux-ld) supports shared libraries... yes
 >     libtool.m4: error: problem compiling CXX test program
 >     checking for false option to produce PIC...  -DPIC
 >     checking if false PIC flag  -DPIC works... no
 >     checking if false static flag  works... no
 >     checking if false supports -c -o file.o... no
 >     checking if false supports -c -o file.o... (cached) no
 >     checking whether the false linker (/home/ymorin/dev/buildroot/O/host/bin/arm-linux-ld) supports shared libraries... yes

 > So, using the host's C++ preprocessor (by way of gcc's wrapper) leads to
 > a working situation, where the end result is as expected.

 > Reported-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Damien Riegel <damien.riegel@savoirfairelinux.com>
 > Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
