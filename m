From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 23:05:14 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/mariadb: bump version to
 10.3.9
In-Reply-To: <20180825204403.11324-2-bernd.kuhls@t-online.de>
References: <20180825204403.11324-1-bernd.kuhls@t-online.de>
 <20180825204403.11324-2-bernd.kuhls@t-online.de>
Message-ID: <20180825230514.1f0264dd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Aug 2018 22:44:03 +0200, Bernd Kuhls wrote:
> From: Peter Seiderer <ps.report@gmx.net>
> 
> Release notes: https://mariadb.com/kb/en/mariadb-1039-release-notes/
> Changelog: https://mariadb.com/kb/en/mariadb-1039-changelog/
> 
> - change WITH_SSL for host build from bundled to system (and add
>   host-openssl dependency) to avoid the following configure failure:
> 
>   CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>     Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
>     (Required is at least version "3.3.24")
>   Call Stack (most recent call first):
>     /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
>     /usr/share/cmake/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>     libmariadb/CMakeLists.txt:298 (FIND_PACKAGE)

We changed from -DWITH_SSL=bundled to -DWITH_SSL=OFF very recently, in
commit 9276747defdd4f91ec21ba0930afdf6d947730b6. Do we really need SSL
support in the host mariadb build ?

The move to -DWITH_SSL=OFF in 9276747defdd4f91ec21ba0930afdf6d947730b6
was also done to fix exactly the same build issue, according to the
commit log.

> This bump also fixes broken atomic support for
> BR2_TOOLCHAIN_HAS_LIBATOMIC=y with mariadb-10.2:
> 
> [ 59%] Linking CXX executable mariabackup
> ../../storage/innobase/libinnobase.a(handler0alter.cc.o): In function `my_atomic_add64':
> /home/bernd/buildroot/output/build/mariadb-10.2.17/include/my_atomic.h:274: undefined reference to `__sync_fetch_and_add_8'

Is it the bump that fixes the atomic issue, or the fact that this patch
adds the logic to link against libatomic when needed ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
