From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 21:45:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/supertux: fix debug build on
 uclibc/musl
In-Reply-To: <20190526191814.3942-1-fontaine.fabrice@gmail.com>
References: <20190526191814.3942-1-fontaine.fabrice@gmail.com>
Message-ID: <20190526214536.479b9db9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Arnout in Cc.

On Sun, 26 May 2019 21:18:14 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Always set CMAKE_BUILD_TYPE to Release otherwise supertux will be built
> with -pg since:
> https://github.com/SuperTux/supertux/commit/afd5f1b33c110104a7f286d6d7854157919a0a52
> 
> This will result in the following build failure on uclibc or musl:
> [ 77%] Linking C executable sq_static
> CMakeFiles/sq_static.dir/sq.c.o: In function `quit':
> /home/buildroot/autobuild/instance-3/output/build/supertux-0.6.0/external/squirrel/sq/sq.c:42: undefined reference to `__gnu_mcount_nc'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b0b2e25af198d01713d1e2bcf38c77ae8ffbd7de
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

So, it really seems like we want to stop using -DCMAKE_BUILD_TYPE=Debug
when BR2_ENABLE_DEBUG=y, like Arnout suggested in another thread.
Packages are adding random flags when -DCMAKE_BUILD_TYPE=Debug, it is
not really usable, as BR2_ENABLE_DEBUG should only mean "add -g to
CFLAGS".

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
