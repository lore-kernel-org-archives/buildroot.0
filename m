From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Mar 2014 20:56:23 +0100
Subject: [Buildroot] ccache directory not being created
In-Reply-To: <1395337089.65339451@apps.rackspace.com>
References: <1395337089.65339451@apps.rackspace.com>
Message-ID: <20140320205623.2f186675@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dan Moulding,

Thanks for your report and investigation! Some comments below.

On Thu, 20 Mar 2014 11:38:09 -0600 (MDT), Dan Moulding wrote:

> I have experienced a problem where, with ccache enabled, and the cache directory set to a subdirectory within the buildroot output directory, the build fails because ccache is trying to write files to the cache directory, but the cache directory doesn't exist. Well, more precisely, ccache will create the cache directory itself, but the cache directory's parent directory does not exist and ccache will not create that.
> 
> The error I get, during host-binutils 2.24 configuration, is:
> 
>   checking for C compiler default output file name...
>   configure: error: in `/home/dmoulding/rwi1/cai/buildroot/output/build/host-binutils-2.24':
>   configure: error: C compiler cannot create executables
>   See `config.log' for more details.
>   make: *** [/home/dmoulding/rwi1/cai/buildroot/output/build/host-binutils-  2.24/.stamp_configured] Error 77
> 
> Examining config.log I see this:
> 
>   configure:4258: checking for C compiler default output file name
>   configure:4280: /home/dmoulding/rwi1/cai/buildroot/output/host/usr/bin/ccache /usr/lib64/ccache/gcc -O2 -I/home/dmoulding/rwi1/cai/buildroot/output/host/usr/include -I/home/dmoulding/rwi1/cai/buildroot/output/host/usr/include -L/home/dmoulding/rwi1/cai/buildroot/output/host/lib -L/home/dmoulding/rwi1/cai/buildroot/output/host/usr/lib -Wl,-rpath,/home/dmoulding/rwi1/cai/buildroot/output/host/usr/lib conftest.c  >&5
>   ccache: failed to create /home/dmoulding/rwi1/cai/buildroot/output/build/toolchain-undefined/ccache-3.1.8/cache (No such file or directory)
>   configure:4284: $? = 1
>   configure:4321: result: 
>   configure: failed program was:
>   | /* confdefs.h */
>   | #define PACKAGE_NAME ""
>   | #define PACKAGE_TARNAME ""
>   | #define PACKAGE_VERSION ""
>   | #define PACKAGE_STRING ""
>   | #define PACKAGE_BUGREPORT ""
>   | #define PACKAGE_URL ""
>   | /* end confdefs.h.  */
>   | 
>   | int
>   | main ()
>   | {
>   | 
>   |   ;
>   |   return 0;
>   | }
>   configure:4327: error: in `/home/dmoulding/rwi1/cai/buildroot/output/build/host-binutils-2.24':
>   configure:4331: error: C compiler cannot create executables
>   See `config.log' for more details.
> 
> Note that ccache is complaining that it cannot create the "cache" directory (the parent directory does not exist).
>  
> Relevant Buildroot configuration:
> 
>   BR2_CCACHE=y
>   BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VERSION)/cache"
> 
> Looking way back in buildroot's history, I see that in 2010 (commit 17b66af), the way ccache is managed was reworked. Prior to this rework, the ccache makefile used to "mkdir -p" the cache directory. I don't see anywhere in the current revision where the equivalent is being done.

This is not done anywhere, because ccache creates the directory for its
cache, but it does not recursively creates the parent directories for
it. So as long as the parent directory of the specified cache directory
exists, then ccache will create it automatically.

> For now, I have patched my package/ccache/ccache.mk to add a hook that does the "mkdir -p" step. Is this the right way to solve this problem, or have I overlooked something else?

It does seem like a good idea to me to ensure that the cache directory
exists before actually using ccache, in order to properly support
custom BR2_CCACHE_DIR configurations, such as yours.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
