From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 09:57:54 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140302073008.028A91015DC@stock.ovh.net>
References: <20140302073008.028A91015DC@stock.ovh.net>
Message-ID: <20140302095754.13319d04@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Sun,  2 Mar 2014 08:30:07 +0100 (CET), Thomas Petazzoni wrote:

>       i686 |                       bash-4.3 | NOK | http://autobuild.buildroot.net/results/44a962623be757143a3d6d37fc6cd14964094f79/
>       i686 |                       bash-4.3 | NOK | http://autobuild.buildroot.net/results/9c16032f9630e09e3709a69ced6716de725c153d/
>     x86_64 |                       bash-4.3 | NOK | http://autobuild.buildroot.net/results/6902eee5e39d9fd79b1e78ccd54382299f1b25ea/F

Fixed by
http://git.buildroot.net/buildroot/commit/?id=7a95111e48f5fe387f592463effa233834c6fda1

>       bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/c421cde66d8d2d9bdf9ecbe531fb15b86f85d909/

To be fixed.

>    powerpc |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/87bfdc235ee441153c36489a0a1ec97266899d5a/
>    powerpc |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/d442f571f14758a4bdf7d694cecd5a34116be40a/

Issue when host-python3 is built before crda. The easiest solution is
probably to make the crda Python script Python 3 compatible and submit
the patch upstream.

>       bfin |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/b87b9397f4bf22579e7fca9763c9f099bb63bd8f/

Missing -l flags?

>       i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/f22ffbf62d4bc8a1f910269e06636181c324644f/
>    powerpc |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/5e6f3c45dd480ef2bed8515d6a48579642e28274/
>       i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/aa6334d89d47d91fdb696d9248036ec27b4b752a/
>       i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/95d0e3656d539258bffa9ca3637d98bc48876a40/
>       i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/177f027edd981ed2ec081d93a15993e51f408620/
>       i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/87909291c77a45b1fbe99f641ea8f7d4b8b50e13/
>    powerpc |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/4952e3a5bd6bac437b8b382dfa18f52eb17505da/
>        arm |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/b622fc14776f5a6c26ff0d1fb882f4ae6cccc5d8/
>       i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/91df531bb3bb57f9b562ed358d6e4a7a970d5e8a/
>    powerpc |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/5deb94ab960aa2f4428f7e9d2d5315ba79116ce1/
>       i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/11725dbff02b07096552a8c0f85d90d969a31fc9/
>    powerpc |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/1b4713983e9148408081ee432717cb9f6afa5ac9/
>        arm |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/b8a4c5dce70d6215945293cd6fd28282c3896a78/
>       i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/de0d965f2e1d6e70b234c2708d558273291f3a5f/
>    powerpc |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/05c721a141e698d0df49b2867a218d31e7acb311/
>       i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/b01f64c75e71fb4e5282f690ee76a2a49842e889/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=bec21dcfa7042d1f7065cf467c4f9c777f0fd072

>       i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/2a62de3247ba5ad273f03d01e690a3eeb11aa7b4/

Parallel installation issue with Python 3. Either we should make Python
3 entirely use MAKE1, or fix the problem. I have analyzed the problem,
and it is caused by the parallel installation of libpython into the
HOST_DIR and the execution of ./python in the Python source directory.

>        arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/1ee0d18f2a9e45b94e4db04fd5c54e6f7994b1be/
>    powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/d1421f2063ecfea9c4110414f481f779defa8ad5/

Scons is not compatible with Python 3. But host-scons is not a target
package, it's a host package, so we cannot add a Python 3 related
dependency to it. So the two solutions that I see are:

 * Change our host-python and host-python3 packages so that they are
   not exclusive from each other, and then find a way for host-scons to
   express the fact that it really needs host-python, and not the
   host-python version matching the selected target python version.
   Note that achieving this might be difficult.

 * Make the three target packages that actually need host-scons
   "depends on !BR2_PACKAGE_PYTHON3". This is a bit ugly, but the next
   version of SCons is supposed to support Python 3, so we could
   consider it as a temporary solution.

Suggestions?

>       i686 |           libmicrohttpd-0.9.34 | NOK | http://autobuild.buildroot.net/results/edb1b5ee1ffaa6a495b4d7c2976f618c8331b5d2/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=25c438bce1c02775f2c23d8878ab71c3022b0c95

>    powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/c13ef3757b90838549d6f396155a20890d163ff9/

Probably needs some kernel headers dependency. To be checked in detail.
Any taker?

>      nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/82dac744ce01c9ebb8c769aea02bf29bc7494aa6/

Needs a small patch to support NIOS 2. The only information needed is
to know whether the stack grows upward or downward on the architecture.

>        arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/dd5ceda4e3778a763d26b8a81a08391f13f02307/
>    powerpc |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/d6f4d388c62ec2137560aabbff46c4a30c584e18/
>       mips |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/bc9b84964667fd37155df97c35252d6b73be724f/
> microblaze |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/affded5ab5590e6f7313c59f511b81c1bb645c92/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=fb36a82a745e93afc92bb5aff29daea8daecb6d3.

>        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/ee409788bbf44434a53c14ede7928367ba8e1c85/

ARM floating point issue.

>        arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/87ee883d745fafd88fa446244cfe69659ff06f3c/
>        arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/1e90929bfaf617381d490dc0b99f333968624ce7/
>        arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/c4cb972758a58c4b62e600c14936af4fd559295b/
>       i686 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/4b5f5dc38a08f622992ea22fd58c1d82b80890c8/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=8d89fd2b7c09af47f2d1b81cfa4de45a421d8a83.

>       bfin |                 pciutils-3.2.1 | NOK | http://autobuild.buildroot.net/results/f5c6d4453d546001423244476adf2c6f40411e2c/

Blackfin specific issue related to the usage of _ as prefix for
assembly symbols.

>       i686 |                php-gnupg-1.3.3 | NOK | http://autobuild.buildroot.net/results/e3b2d68b22224fcda95174bd64803a58aae1606a/
>    powerpc |                php-gnupg-1.3.3 | NOK | http://autobuild.buildroot.net/results/fe26034ee29c7334d09cba8a80ae5bfd2787a552/
>       i686 |                php-gnupg-1.3.3 | NOK | http://autobuild.buildroot.net/results/df9f7c7c30d9cdba65b4f5c6d46c8aa91de4179a/
>    powerpc |                php-gnupg-1.3.3 | NOK | http://autobuild.buildroot.net/results/efbce29a2fa1d8561c10613d2145b9b382ddc83c/
>    powerpc |                php-gnupg-1.3.3 | NOK | http://autobuild.buildroot.net/results/757fb0b12af12de4f128d9c503d45b20776c2313/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=1188fcf1667ac316ea9df024b9346415a05b90db.

>        arm |              python-pyasn-0.17 | NOK | http://autobuild.buildroot.net/results/3c968459f6cc020a3c6bc77f49245d69ed92df20/
>        arm |              python-pyasn-0.17 | NOK | http://autobuild.buildroot.net/results/e009a9a5f8a311b5fcb41212d517a2d52ff2db9d/
>        arm |              python-pyasn-0.17 | NOK | http://autobuild.buildroot.net/results/c11893d19f5614236f1d30a5fca781b94d2f9f80/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=e025e49100565617715e0de986ba670532098b14.

>       bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/59182657d03ca48dc46c96d4ff14667324f4e4f6/

Compiler does not provide the right compiler intrinsics. We should
check if more recent versions of gcc do not provide the necessary
intrinsics.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
