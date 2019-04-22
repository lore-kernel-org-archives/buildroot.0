From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:24:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/lynx: fix build with latomic
In-Reply-To: <20190422104821.16807-1-fontaine.fabrice@gmail.com>
References: <20190422104821.16807-1-fontaine.fabrice@gmail.com>
Message-ID: <20190422222421.50c771ea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 22 Apr 2019 12:48:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Help lynx finding openssl dependencies by giving it a path in --with-ssl
> and using pkg-config to directly pass the correct libraries in LIBS.
> 
> This will disable the call to pkg-config and CF_ADD_LIBS which has the
> sad behavior of removing duplicates ...

Could this issue be reported upstream ?

> As a result, build fails because, the following correct dependencies:
> 
> configure:14170: testing adding -L/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -L/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lz -pthread -latomic -lcrypto -lz -pthread -latomic  to LIBS ...
> 
> is replaced by:
> 
> -L/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lssl -lz -pthread -latomic -lcrypto
> 
> As a result, static linking fails on crypto because the second -latomic
> has been removed ...
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2c28426253014d93e86e3ba6ed578e84317a9f19
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lynx/lynx.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
