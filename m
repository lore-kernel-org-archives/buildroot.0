From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 17:54:52 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-03-28
In-Reply-To: <20140329073011.D16F2101349@stock.ovh.net>
References: <20140329073011.D16F2101349@stock.ovh.net>
Message-ID: <20140329175452.5c711852@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aaron, Sonic, Anton, Waldemar, William, Spenser, Yegor, Gustavo, Baruch, Marcelo,

Below, some analysis of the build failures, amongst which certain
problems need your attention. Could you have a look at the list below
and look for your name?

Thanks!

On Sat, 29 Mar 2014 08:30:11 +0100 (CET), Thomas Petazzoni wrote:

>    aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/25cfb126c01aa70f4666709dddbff298813b5c69/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=3b44149a2251081d9180651ae5f8a184705e3835.

>       i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/06b4f2ee7fdd7cbd893c91c761270640b747a23b/
>        arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/1fe1f874b1d4dddd1139e62c125c80ad62298e76/
>   mips64el |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/bf82bc565985410445d9cea1db3f622bede5c1d1/

This is waiting on Samuel series:
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/79108/

>       bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/41cf01e1908ec820e3587454758fee5ca44f3a2d/

This is a Blackfin failure. Sonic, Aaron, can you have a look ?

{standard input}: Assembler messages:
{standard input}:4: Error: syntax error. Input text was _compat.elfutils_0.122.dwarf_bytesize.
{standard input}:4: Error: 
make[4]: *** [dwarf_bytesize.os] Error 1

>      nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/7da32ca8178aa6bada06dfaea38e9e693fba0db2/

fallocate64() problem. Ezequiel, can you have a look?

>     mipsel |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/1e3d486e7ad2a90bf116ba1879cfc6119fc5bec4/
>       i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/4113d2684b7991862f7dfa93d741891f295a5ad9/
>     x86_64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/e971d07f0f1ad32ba04f2784bc3cc0e5e541d130/

Samuel's series needed.

>        arc |            imagemagick-6.8.8-9 | NOK | http://autobuild.buildroot.net/results/2139bf93a528780904db4258c04636916931621c/

ARC compiler error. Anton?

  CC       magick/magick_libMagickCore_6_Q16_la-cipher.lo
magick/cipher.c: In function 'IncrementCipherNonce.constprop.2':
magick/cipher.c:535:1: internal compiler error: Segmentation fault
 }
 ^

>       bfin |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/65329510868baba49147c206d50c7f5b0c602806/

Aaron, Sonic, the build error is caused by the uClibc configuration in
Blackfin toolchain being different than the one used by default in
Buildroot. Possible options are:

 * You change the uClibc configuration in the Blackfin toolchain for
   the future releases, so that this problem will disappear.

 * We disable this package for Blackfin external toolchains.

cftoken.l: In function 'yycf_switch_buffer':
cftoken.l:729: error: 'GLOB_TILDE' undeclared (first use in this function)
cftoken.l:729: error: (Each undeclared identifier is reported only once
cftoken.l:729: error: for each function it appears in.)

>        arc |                  lcdproc-0.5.6 | NOK | http://autobuild.buildroot.net/results/a3a6cd0ce6bb48a5d9ef7c411630fea0014479df/

Anton ?

/home/test/test/2/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld: bayrad.so: hidden symbol `__fini_array_end' isn't defined
/home/test/test/2/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.0/../../../../arc-buildroot-linux-uclibc/bin/ld: final link failed: Bad value
collect2: error: ld returned 1 exit status

> microblazeel |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/025cca687e4a2f848d77031c2e50135f137b7767/

Waldemar, William, Spenser, can you help us fix this problem? The only
thing needed to fix it is to know whether the stack is growing downward
or upward on the Microblaze architecture.

>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/fd8fef776e079600ae0f8ded2763cd3fca39ebee/
>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/11c352d0f676fc7737ba3a35747474a93ff01d4b/
>     x86_64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/df805da50cdfea4ccee112f8b3c65655d1e5eee8/
>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/00532a8356143baa308c4f832775d8ee28e27e66/
>     x86_64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/f90465c77540308d7807dde4308e5ebff07ec9ba/
>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/497f31a2147cd7ce136ca86a4bdc033088b8272f/
>        arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/960cd673632fb4ae598ea6b278cb9664c6dc1ad0/

Yegor, can you have a look ?

>    powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/5aabc5e2e01a0b5dae04ec70727874553393a185/
>        arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/c028c74844bfc17466bbeba4f9a65e78e40473cc/
>        arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/750080c0fbcb67aaa058226861b85c8e4f9dd37f/

Samuel, can you have a look ?

>    powerpc |                     mpd-0.18.9 | NOK | http://autobuild.buildroot.net/results/8d0e312f2cdd700c42775404f93173606eb99161/

Gustavo, mpd is your stuff :)

>     xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/db06965d3984ab6ca5e039f0e35d4be8638c488b/

Baruch, this is a Xtensa specific failure, can you have a look ?

>        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/c4ce66fe2287dc4a8cc1235dc5a104d20b2e63df/

ARM floating point problem. A volunteer to look at it ?

>       bfin |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/91531e06646b7453248be5c7ca22101edd42d641/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=56e404bb883b0005ee834b2b252245051ea863a3.

>       mips |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/6b61f90d1a36ba43ff568933bb74975128380516/

-Werror should not be used. Marcelo, can you have a look ?

>        arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/c3fb5337a4bdf87baead64106427c4929241c58d/
>       i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/3c1456c190f2849fe08e2518b87947d775791784/
>       i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/77512853ec529ae96481c0b4c532ef9717c00257/
>    powerpc |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/6ae73040a4073ef4612a1c67723238625fad9d64/
>        arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/b25d17aa39756a33665369e7bfbbbd216b25f27d/
>       i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/94e0de9f4e89e0305c7c9ef1cc35b56c6b768728/
>        arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/dc38a71f860ea6b932cbf3c09da7a832796d1c24/
>       i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/39cd9e183a62c6f586f322167f84c38401eea5fc/
>       i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/0dfa1269e0e2e037df597a626928c58a781fd56d/

Fixed by Gustavo patches on newt and slang.

>       bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/ef25274b14688f51e1c0ae998b9cbc025584b9d8/
>       bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/b808cf4fdabb0382970c02b44bd22b84992047ba/

Another issue with the uClibc configuration of Blackfin toolchains.
Aaron, Sonic, what do you suggest?

./.libs/libpopt.so: undefined reference to `_glob_pattern_p'

>       bfin |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/c8f2f10eeac8014420e5dc9e2a22750d575f70eb/

Aaron, Sonic, can you have a look?

>      avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/711bea245c0da6c93e0313da8e1ef4ff0cac1abe/

Seems like the internal libffi of Python does not have AVR32 support?

>        arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/87b420f413104b23edfce5d921093dd2ef84579d/
>        arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/5dfa243548239378b2697b1fcce8cf612065cc9c/

Hopefully fixed by Gustavo patches.

>    aarch64 |                    systemd-212 | NOK | http://autobuild.buildroot.net/results/ad3b4003dc50582a493f1156234d83652104a6bf/

Recent kernel headers are needed for systemd. A patch is being worked
on by Eric Le Bihan.

>       i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/849a7167241f4fd4ea8bab1085c8fc3db5e4495d/
>       i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/6526c2392eba1b3f6193ec6c3e87af548dbbf8b0/
>       i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/23237d2f90d8ec0584a9eb4de8b9b785089053ac/

These problems exist since AUTORECONF has been enabled on wget, by
commit 84bf8f04c68074e7a3acee4018f2ddd63733b52e from Baruch.

Baruch, can you have a look?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
