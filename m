From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:34:16 +0200
Subject: [Buildroot] [PATCH v2,
 1/3] boost: add BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
In-Reply-To: <20180625220237.15217-1-fontaine.fabrice@gmail.com>
References: <20180625220237.15217-1-fontaine.fabrice@gmail.com>
Message-ID: <20180630223416.30cce842@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jun 2018 00:02:35 +0200, Fabrice Fontaine wrote:
> Rework boost-context dependencies and manage them through the hidden
> BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/Config.in | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

I've applied the series, thanks! On PATCH 3/3, as discussed, I
refactored the Config.in comment about gcc bugs to have a single one. I
also updated the commit log to (I believe) clarify the explanation.

Regarding Boost, I noticed that the dependencies still don't see to be
correct. For example, if I enable just boost fiber, the boost fiber
library installed looks like this:

$ readelf -d output/target/usr/lib/libboost_fiber.so.1.67.0 

Dynamic section at offset 0x44ed0 contains 34 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libboost_context.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_filesystem.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [libboost_system.so.1.67.0]
 0x00000001 (NEEDED)                     Shared library: [librt.so.1]
 0x00000001 (NEEDED)                     Shared library: [libstdc++.so.6]
 0x00000001 (NEEDED)                     Shared library: [libm.so.6]
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x00000001 (NEEDED)                     Shared library: [ld-linux-armhf.so.3]
 0x0000000e (SONAME)                     Library soname: [libboost_fiber.so.1.67.0]

I.e, it uses boost context (which is fixed by your patch) but also
boost filesystem and boost system, which is not currently accounted by
our Config.in dependencies.

It seems like when we disable a library using --without-libraries, it
might still get built if we enable a library that uses it. Not nice to
catch mistakes in our Config.in selects/dependencies.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
