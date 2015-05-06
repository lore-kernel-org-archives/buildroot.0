From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 09:42:36 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20150506063017.6B6A61015C1@stock.ovh.net>
References: <20150506063017.6B6A61015C1@stock.ovh.net>
Message-ID: <20150506094236.114894a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 May 2015 08:30:17 +0200 (CEST), Thomas Petazzoni wrote:

>         success : 301
>        failures : 50 
>        timeouts : 1  

Seems like switching to a 8 hours timeout has helped reducing the
number of timeouts.

>      powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/b64fd94a8ccff7fa8c5e0ca0c4acb7254f9cddc3/

The infamous:

  error: no type named 'bits' in 'traits_type

If someone could start tackling this long standing problem, it would be
great.

>         bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/5f84d5696a52c75416c85f802278ee776053b4b9/
>       xtensa |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d971db839e84480a565c5b2970f13296700dbd51/
>          arc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/8126d59d06f5452a7ce2a4cdcda3103fb64046ee/
>         bfin |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/37009dda6344dcf25ca52878e9a5beb37f2a0a93/

Should be fixed by applying http://patchwork.ozlabs.org/patch/468487/.

>       x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/2bd48ed578a143749d4503aca96f661647afe525/

multiple definition of `__lll_lock_wait_private'
multiple definition of `__lll_unlock_wake_private'

This is a uClibc static linking problem. Waldemar, can you let us know
whether it was fixed upstream and/or in uClibc-ng ?

>        nios2 |               cryptsetup-1.6.6 | NOK | http://autobuild.buildroot.net/results/ff456344eb5bc8af619c1f5d88be0cb758dd5075/
>        nios2 |               cryptsetup-1.6.6 | NOK | http://autobuild.buildroot.net/results/a288b0c5b437c3d82dae4f3bf391c59236739c3a/

Should be "fixed" by http://patchwork.ozlabs.org/patch/468461/.

>       xtensa |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/4d3dea604da9a5a1e7fe20548813f8de474ae33f/

I'm not sure, but it smells like gcc is used instead of g++. Someone to
look into this?

>       xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/a4caf2b035ea5b7d5318635bf78373d6229aa496/
>          arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/88a4c76e3a48fae42f78eba8febfe4eb29fc9904/
>          arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/0889a99bc4092ab553889de458b534e4da2cbfd0/
>       xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/4c1a244db94dbd37e26a4fec5ba506f0525c1d00/
>          arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/50ad78fc35fa90cda5e0453b6867b3ce0dbf65be/
>          arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/e94cdc19a18c91eb851c007b833f0dfa08be5cc0/

Should be fixed by
http://git.buildroot.net/buildroot/commit/?id=5e701275d96ccebd69dbfceec5fb92e0b7049c71.

>      aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/c9f116443199dab708a18c23fcea3e623664d947/

Pascal asked the Google Breakpad developers about this breakage. We
might want to disable on AArch64 in the mean time.

>     mips64el |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/a23401c97a11636799b685d9eec8c96e5e202cd0/

mips64el-ctng_n64-linux-gnu-g++: error: /usr/lib/libopencv_ts.a: No
such file or directory

Samuel, this is an OpenCV related issue, can you have a look?

>         sh4a |                host-qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/40a47f11daa201c488519c0b1270cc2e71cc3116/

We need to tweak qemu.mk, since sh4a instead a valid architecture name:

ERROR: Unknown target name 'sh4a-linux-user'

I'll send a patch for this one.

>         i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/e0a198d88c746c6ad24916d723b5faa9024f8abd/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=ec45eb1619da40ea97fa39dfe60cee2a9b8e78c6.

>         bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/6c0225e109d87178e80cf7edfff1461b077629b2/

/home/test/autobuild/instance-0/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/.libs/libacl.a:
No such file or directory

Not sure. Someone interested?

>          arm |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/fee1e3a4eb7923d7ce166184323b908ed069b3b6/

fatal error: EGL/eglplatform.h: No such file or directory

Bernd?

>          arc |                 librsvg-2.26.3 | TIM | http://autobuild.buildroot.net/results/858daf884d04d56d37e3a2e481c45f7b9a2a88f8/

Ignore.

>          arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a144bc6024415a5272c3cbe60ff636d078d0a555/
>          arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/00195d89a115a314bf4916af127407f61cd1b418/

error: unknown type name 'ucontext_t'

Happens with uClibc-ng only it seems. Waldemar, can you have a look?

>         mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/2c7bd050917ab0a65a53f3516a7023cac5be078a/

lua-periphery is using an old version of c-periphery (and is doing the
Git clone itself, workarounding Buildroot download mechanism!). I've
started working on this issue yesterday night.

>       xtensa |                  mesa3d-10.5.4 | NOK | http://autobuild.buildroot.net/results/3e2e24f697e26c93d4d95782b1cb7799fa620a7a/

Linker bug, Max Filipov said he would have a look.

>       x86_64 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/c7d63606065b7c53545ba498493661e760647812/
>       x86_64 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/9c1088f1676474014c5977856e0bfb1dbdc121fb/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=1f55934c8adbf3146e622abfdab9173d63169347.

>       xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/1d9d11291d8e0591144f0652cd42615fd8993cd2/
>       xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/24253e3a9183a0bf0f8f021cf1eb59d631f27839/
>       xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/d2d1fc7ceb35b25ef68947b2cf0e219616313121/
>       xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/7d1e92b61431b83e7bc38da1bb211b5f2b3dd119/
>       xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/ebf2e54d0d6f08c57bf6d4946b1df8df4a84c422/

I think we should apply http://patchwork.ozlabs.org/patch/453567/. It's
not a very nice fix, but it's not really the fix that isn't nice, but
the original logic.

>          arc |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/4c694d715f66de49964ef36f7236c7575c3a0b5a/

relocation R_ARC_32 against `.text' can not be used when making a
shared object; recompile with -fPIC

Alexey, can you have a look?

>         sh4a |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/09302c153418c3af6dc4cdd12a0149505cfbca0b/
>          sh4 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/96f8a9758f0116aec999028fde1b9c983c143809/
>         sh4a |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/848b9433c09d6cbc81c8d1e22778ae68223b43f3/
>          arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/2062208c171207428c9121215971e00c52bf306a/
>          arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/57ef99b9dd0623e3e9b61e5964eb45e611b89cd5/

Some of these were due to the Qt coord patch that we reverted. However,
one of them,
http://autobuild.buildroot.org/results/848/848b9433c09d6cbc81c8d1e22778ae68223b43f3/,
appeared after the revert. So there is still a problem with python-pyqt
it seems. Gwenhael, can you have a look?

>         i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/50315ab70d313f40a0caeff51dc76354495a5cf9/

PostgreSQL testing issue:

PostgreSQL support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.

Maybe it's the same problem as the one affecting rsyslog when detecting
postgresql (missing -lpthread).

>     mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/0e2e877cb75a49d0560ab785c4afa51065fbd54f/

Most likely fixed by the revert of the Qt coord patch.

>          arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/b6d6e19cfe484afabcd392f6095e8425dd591540/

Compiler error, https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61207. Can
someone have a look at the conclusion of this bug and see if we can
backport the fix?

>      powerpc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/d9c388b15c20c934426400c8e85775ea1efcc007/

Postgresql detection problem. Should be fixed by
http://patchwork.ozlabs.org/patch/460332/, but this patch raised some
discussion.

>       xtensa |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/6f6f3aa826bc3521e29aa0755cbeb3f333f511ad/
>       xtensa |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/a27442aca5b2df58e37eff7209117c787673baf3/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=083ec2df6c38b444f0e76cd708f5600a9f149a83.

>       x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/45858c9754b8aa017a58f3f74463b28042fdf9cb/
>      powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/c479c9a9f1ba2271ece2f316cc7b6c2c9d39e60d/

Weird stuff happening:

libtool:   error: unrecognised option: '-DHAVE_CONFIG_H'
libtool:   error: unrecognised option: '-DHAVE_CONFIG_H'

>         bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/349c1ec8ee9f2e1e1f8f37b6e6823761cad5edc8/
>         bfin |                 tinyxml2-2.2.0 | NOK | http://autobuild.buildroot.net/results/c96e4bd3044c89df8e67d9c383886eb61c438e24/

Samuel, can you have a look at this one? This is CMake stuff, trying to
build a shared library when it should not.

>         sh4a |                   weston-1.7.0 | NOK | http://autobuild.buildroot.net/results/b4da4e9f0c85c9fb402cb5a1bb5a8d1d63b05b13/

undefined reference to symbol 'clock_gettime@@GLIBC_2.2'

Bernd, can you have a look?

>          sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/73e5b739887dd0d62fb215bd03b13a31e4a0d1fa/

src/client/main.cpp: In function 'int main(int, const char**)':
src/client/main.cpp:30:10: error: 'EXIT_FAILURE' was not declared in
this scope

This should be quite easy.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
