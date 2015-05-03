From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 May 2015 10:50:09 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150502063016.3950D100FB0@stock.ovh.net>
References: <20150502063016.3950D100FB0@stock.ovh.net>
Message-ID: <20150503105009.2b42c375@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 May 2015 08:30:16 +0200 (CEST), Thomas Petazzoni wrote:

>          arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/063d3c2649116e7a43774055df45926a38c7f088/

Musl build problem.

>      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/df8f87a34f59f81aa288c72673a80757f00ea6a2/

Weird C++ issue.

>         sh4a |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/ccd5c83963032ba49b1627b1dff39e34a9486943/
>       mipsel |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/66c3a868816dfe4bd4d0ffafec6988fd87a2c058/

Fixed by reverting to 1.57.


>        nios2 |               cryptsetup-1.6.6 | NOK | http://autobuild.buildroot.net/results/11bd680d7ad7994723826e4654dfb4993c91d058/

Infamous "undefined reference to symbol '_gp'" issue. I suggest to
simply disable this package on NIOS 2.

>      powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/f343d015b127f29d614e7ea38b173d3a5c270d84/

pthread static linking issue

>          arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/12fd2a248b121d9178406f3216e35c866d391667/
>          arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/b69dcc39847e927349c598a840caecfd14c36b87/
>       xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/971bd6e6b66f0c3c3fcd06a830d83b87a53f03b2/
>          arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/029cd2c19681445d38d76b7fcd8f939652e8fcf1/

libm missing when linking. Could some CMake person have a look?

>         bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/bb9d178902c1dcb65c2a0ccb943a02ddda68912f/

Since we removed the internal toolchain support for Blackfin, I believe
we should also disable gdb.

>          arm |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/a9092d01a71e2d799e5b7b3afb9fd3e304370d0c/

randutils.c:(.text+0x21c): undefined reference to `libintl_gettext'

Missing -lintl ?

>          arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/d44753dfe7e2aaa9fd803b4a69db65728f8301a8/
>          arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ac3391023b13f405ef633688f714a10c22dc2db2/

The dynamic linking issue.

>         i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/85d7fcda63d7bbba0eb4d0876c50a3f6d443f93d/
>         i686 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/8fa0a64422a96023a926412a033d9a4f01af5a71/
>       x86_64 |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/04ad18c48f38f8ca6f968b3e16af74729fca0d9e/

Fixed by http://git.buildroot.net/buildroot/commit/?id=884af65fd5ddc548f19a26162f905a32ef0b53b3.

>         sh4a |                host-qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/2af3954a9171d64dcca8f251ccd6e2ce19f88883/

We should disable sh4a, or handle it properly.

>         i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/083ddb8c96a30e0c3c443ffded27428f70870b85/

Missing symbols from OpenSSL ?

md2.o: In function `md2_sum':
md2.c:(.text+0x15): undefined reference to `EVP_md2'

>         bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/f7930231cadeef7ccb0df6acf41b62c2c6fd1e02/

Fixed by http://git.buildroot.net/buildroot/commit/?id=4cc236784e5783fef0fd7bf9437e55a38cc8c291.

>       xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/257d5d35ce18356829a36d8f5dd0e4f8dacfb810/
>         i686 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/306c9fc737ee76d4659e14bf3102b94a57ea45dd/

Being worked on by Romain.

>         i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fe72243a84a91b68ef3138847294674b36f16c58/

I had a look, I will submit a fix.

>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/20421cb8ef86b99ad9beef7056879ccf9edc188f/
>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/e42dd08ea5fe15ac8224f8ea2a96b6e2d3ea382d/
>         bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/12622a78b1482dfbdb1a197ca070de699c86c9f9/

Not sure what's going on.

>          arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/c64cb1874e6287da1942533d85d26b12192c73df/
>          arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/9f08353e94eadb914332aa80fc90c4315bfef7c2/

libtirpc fails to build on musl. I started working on this topic, but
it's not that simple...

>       x86_64 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/b2d7e1997f534cf93b845807342e33cfa6b8ec45/
>       xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/c8793d89e6fc609f02b73c6f20185d4a1b86edff/
>       xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/c65ac04797759b19c847376a2cf7adc5598fc0a1/

Fixed by http://git.buildroot.net/buildroot/commit/?id=4e99abc47511c2f0bc3b5a7da9e877aba6a84b9f.

>      powerpc |            libvncserver-0.9.10 | TIM | http://autobuild.buildroot.net/results/b8ebb345bd9122f151cd705c7d04d3a38f182838/

Ignore.

>     mips64el |                   lshw-B.02.16 | NOK | http://autobuild.buildroot.net/results/59fa68ac7f4cb88cdf26ad40dfd5bfcff643536d/

Spurious download problem.

>       x86_64 | make: *** [target-finalize]... | TIM | http://autobuild.buildroot.net/results/5ca9ed6701b56efd399649faaba9c9551eb4f7a7/
>          arm |                mongrel2-v1.9.1 | TIM | http://autobuild.buildroot.net/results/8cc256baf2f20f52d1f173176f8543c8f068832d/

Ignore.

>          arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/5ee7e83ebcfa43f6ee0a2a8b9f40f1ae84664aca/

This is with uclibc-ng. Not sure it's related.

In file included from src/task/context.c:3:0:
src/task/taskimpl.h:108:17: error: unknown type name 'mcontext_t'
 int getmcontext(mcontext_t*);

>          arm |                   monit-5.12.2 | TIM | http://autobuild.buildroot.net/results/fd2d611f95f7a3743312a720b39ec1fc57bfb6e4/
>          arm |                  musepack-r475 | TIM | http://autobuild.buildroot.net/results/6b4b7e0f4b911507bcb9f73adf4b893fa597c591/

Ignore.

>         i686 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/619339810617212a667fe72278ec727ee992ffbf/

Don't know:

checking for thread local storage (TLS) class... __thread
./configure: line 12681: syntax error near unexpected token `fi'
./configure: line 12681: `fi'

>       xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/36e5c81b87bf6eaf3e3cb52f59577640eeb1c2c6/

Should be fixed by http://patchwork.ozlabs.org/patch/453567/.

>          arc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/aade9a1d5864af1977f4bed03ed59b45e0ad873b/

Fixed by http://git.buildroot.net/buildroot/commit/?id=5b4d18dd1cc33c4cfd62a20704f4c48d2097c9c1.

>          sh4 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/7f54162747eee6b4a9017a7d5f3ec3ee1cf12085/

Ah, sh4 having an issue with the double/float thing.

>     mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/3c50ed4bb15ab35341c7682ce4706b7a05a6f702/
>     mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/07aca0c27a07761621d46fb690e3ccd50cbc2ef5/

error: redefinition of 'bool QTest::qCompare

Needs investigation.

>          arm |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/00fede225eea29d392f3c2cc67825616300ffdff/

Ignore.

>          arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/894a650b3f46fb57d2e57bead2d591817e6c24f7/

msg.c: In function 'MsgSetPropsViaJSON':
msg.c:4135:15: error: 'json_tokener_errors' undeclared (first use in this function)
      errMsg = json_tokener_errors[err];

>     mips64el |                   samba4-4.2.1 | TIM | http://autobuild.buildroot.net/results/8d227b36e9ab0a1b9f1094e52018835f8f096398/

Ignore.

>         bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/800de7c682b885e6fddebd390dc3c97eabe5f36c/

It's trying to build a shared library even in static only scenario.
Could a CMake person have a look?

>          arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/29bba97c253feba446808465cc2ede1b1e454956/
>          arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/aa98ff875ef39db1a20e144385219c5ced433b37/

Fixed by disabling the ARC toolchain.

>       xtensa |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/504cf78a08315e2fc6eaeb9a29ae791972753830/
>       xtensa |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/09280c5d63da9b8b58916c32e6040a98f7ff0ee8/

Fixed by http://autobuild.buildroot.net/results/09280c5d63da9b8b58916c32e6040a98f7ff0ee8/

>     mips64el |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/e8d92b8dfb666bbdda6799f2ea5c72fd8c491bf8/
>          arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/b802cc638a4b11d2a2098b82615f2c0ccadf8e3f/
>          arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/b188207df8b8618b536a67763a6c06f0d235ead0/
>      powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/4f4f4bbae4129822eb56aef23ae2885c2c455a16/
>      powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/fc182ff06ae42a1679827b2d924774649153a59d/
>          arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/bd120ada4830fda3db96da945513d4f6f7b2d419/
>          arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/a705ce4beac0bba08a93d8cf95080b67a395c715/

Fixed by http://git.buildroot.net/buildroot/commit/?id=2a4ece2ed3e3766c463ef8f61a3362ba86c8a6cf.

>          sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/b77596e12b78a88cc35d50f466100d320213f0e4/

src/client/main.cpp: In function 'int main(int, const char**)':
src/client/main.cpp:30:10: error: 'EXIT_FAILURE' was not declared in this scope
src/client/main.cpp:38:10: error: 'EXIT_FAILURE' was not declared in this scope

>        nios2 |                    zyre-v1.0.0 | NOK | http://autobuild.buildroot.net/results/4923039f57286653ec164809b9f0c37bf9e323b5/

checking for zmq_init in -lzmq... no
configure: error: cannot link with -lzmq, install libzmq.
make: *** [/home/buildroot/instance-0/output/build/zyre-v1.0.0/.stamp_configured] Error 1
make: Leaving directory `/home/buildroot/instance-0/buildroot'

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
