From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 25 Oct 2014 15:04:44 +0400
Subject: [Buildroot] [git commit] aircrack-ng: don't use -ldl in a
 static lib configuration
In-Reply-To: <20141025103325.1719C9D831@busybox.osuosl.org>
References: <20141025103325.1719C9D831@busybox.osuosl.org>
Message-ID: <CAMo8Bf+qhWGvZ3xaB+2YhQd8hwFWzTLGt5XdCCt6vSCCwyeR9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 25, 2014 at 2:32 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=68e8a10f97ffed4525c5a14b74679c682e8cbf61
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> This commit gets rid of the -ldl flag used when
> BR2_PREFER_STATIC_LIB=y. First because it does not make sense: when
> you use a pure static library configuration, you don't have shared
> library support, so you don't have libdl.
>
> The occurences of -ldl were added in commit
> 1141d99aae9e1b139509ad71c969e6705417a48b ("aircrack-ng: fix static
> build") and commit bed1490d0f58dc963d2144f2fe6b705f9f36d848
> ("aircrack-ng: fix statically linked build"), at a time were sqlite
> indeed was linked against libdl even in static library
> configurations. But this is no longer the case since
> bd56cd6b4cc75511ffacfe020a8de3c1aad44fc9 ("sqlite: Disable dynamic
> extention if static library is seleted").
>
> This means we can now get rid of the -ldl flag when building
> aircrack-ng, which means it can build properly in a pure static
> library configuration.
>
> Fixes:
>
>   http://autobuild.buildroot.org/results/bfd/bfd1ca4afdd32e3cc251aab7ee2ae5e5293ced1c/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/aircrack-ng/aircrack-ng.mk |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
> index b3bc8f1..720c144 100644
> --- a/package/aircrack-ng/aircrack-ng.mk
> +++ b/package/aircrack-ng/aircrack-ng.mk
> @@ -13,7 +13,7 @@ AIRCRACK_NG_DEPENDENCIES = openssl
>  ifeq ($(BR2_PACKAGE_SQLITE),y)
>         AIRCRACK_NG_MAKE_OPTS = sqlite=true
>         AIRCRACK_NG_MAKE_OPTS += \
> -               LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -ldl -lpthread)"
> +               LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB),-lpthread)"

Missing space gives me the following build error here:

/home/dumb/ws/tensilica/buildroot/build-20141024-reproduce-aircrack/host/usr/bin/xtensa-buildroot-linux-uclibc-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-mlongcalls -mtext-section-literals -pipe -Os  -static
-D_FILE_OFFSET_BITS=64 -D_REVISION=0  -I/usr/local/include
-DHAVE_SQLITE -D_FILE_OFFSET_BITS=64 -D_REVISION=0
-I/usr/local/include -DHAVE_SQLITE -Iinclude aircrack-ng.o crypto.o
common.o uniqueiv.o aircrack-ptw-lib.o sha1-sse2.S -o aircrack-ng
-lpthread -lssl -lcrypto -static -lz -lpthread -lsqlite3-lpthread
/home/dumb/ws/tensilica/buildroot/build-20141024-reproduce-aircrack/host/usr/lib/gcc/xtensa-buildroot-linux-uclibc/4.8.3/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
cannot find -lsqlite3-lpthread
collect2: error: ld returned 1 exit status

-- 
Thanks.
-- Max
