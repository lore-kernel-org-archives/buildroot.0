From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 22:44:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/cc-tool: link with libatomic
 when needed
In-Reply-To: <20170729203220.20024-1-bernd.kuhls@t-online.de>
References: <20170729203220.20024-1-bernd.kuhls@t-online.de>
Message-ID: <20170729224413.55980d76@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Jul 2017 22:32:20 +0200, Bernd Kuhls wrote:
> Detecting the boost program_options library is broken:
> 
> checking for the Boost program_options library... no
> configure: error: cannot find the flags to link with Boost program_options
> 
> config.log shows the reason, libatomic is missing:
> 
> conftest.o: In function `boost::detail::sp_counted_base::release()':
> conftest.cpp:(.text._ZN5boost6detail15sp_counted_base7releaseEv[_ZN5boost6detail15sp_counted_base7releaseEv]+0xc):
>  undefined reference to `__atomic_fetch_sub_4'
> conftest.cpp:(.text._ZN5boost6detail15sp_counted_base7releaseEv[_ZN5boost6detail15sp_counted_base7releaseEv]+0x38):
>  undefined reference to `__atomic_fetch_sub_4'
> /home/buildroot/br4/output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libboost_program_options.so:
>  undefined reference to `__atomic_fetch_add_4'
> 
> Please note that using LIBS=-latomic is not enough, although it fixes
> the configure check the bug reoccurs when linking cc-tool:
> 
>   CXXLD    cc-tool
> src/application/cc_flasher.o: In function `boost::detail::sp_counted_base::weak_release()':
> cc_flasher.cpp:(.text._ZN5boost6detail15sp_counted_base12weak_releaseEv[_ZN5boost6detail15sp_counted_base12weak_releaseEv]+0xc):
>  undefined reference to `__atomic_fetch_sub_4'
> 
> We need to add -latomic to CXXFLAGS to both fix configure and linking.
> 
> Fixes
> http://autobuild.buildroot.net/results/596/596f97364bb2c7598b0646da8160939356f0d2c6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/cc-tool/cc-tool.mk | 4 ++++
>  1 file changed, 4 insertions(+)

To be honest, this is not the ideal solution. Indeed, it's not cc-tool
itself that needs libatomic, but the libboost_program_options library.
So the dynamic linking situation would better be solved by having
libboost_program_options linked against libatomic. However, this
wouldn't solve the static linking situation. And since cc-tool doesn't
use pkg-config to detect boost, we're pretty much out of luck.

So, I've applied your patch, even if not ideal.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
