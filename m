From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:23:30 +0200
Subject: [Buildroot] [PATCH] package/aircrack-ng: add dependency on !
 BR2_PREFER_STATIC_LIB
In-Reply-To: <1414138180-24607-1-git-send-email-jcmvbkbc@gmail.com>
References: <1414138180-24607-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20141025112330.6718e7c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Fri, 24 Oct 2014 12:09:40 +0400, Max Filippov wrote:
> Now that BR2_PREFER_STATIC_LIB means "do not build dynamic libs and
> build statically linked applications" this package just can't be built
> in case BR2_PREFER_STATIC_LIB is selected. Add that to dependencies and
> drop conditional LDFLAGS manipulations.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/aircrack-ng/Config.in      |    5 +++--
>  package/aircrack-ng/aircrack-ng.mk |    5 ++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

I'm not sure this is the correct fix, and I believe the current
situation is wrong due to a succession of mistakes. See below.

> diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
> index b3bc8f1..6df3e63 100644
> --- a/package/aircrack-ng/aircrack-ng.mk
> +++ b/package/aircrack-ng/aircrack-ng.mk
> @@ -13,15 +13,14 @@ AIRCRACK_NG_DEPENDENCIES = openssl
>  ifeq ($(BR2_PACKAGE_SQLITE),y)
>  	AIRCRACK_NG_MAKE_OPTS = sqlite=true
>  	AIRCRACK_NG_MAKE_OPTS += \
> -		LIBSQL="-lsqlite3$(if $(BR2_PREFER_STATIC_LIB), -ldl -lpthread)"
> +		LIBSQL="-lsqlite3"

This was added in commit 1141d99aae9e1b139509ad71c969e6705417a48b, from
August 2013. At the time, sqlite3 was indeed linked against libdl. But
following commit bd56cd6b4cc75511ffacfe020a8de3c1aad44fc9, from
November 2013, this is no longer the case: when BR2_PREFER_STATIC_LIB
is enabled, the dynamic library loading feature of sqlite is disabled,
so sqlite can be used in pure static library configurations.

> -AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz \
> -	$(if $(BR2_PREFER_STATIC_LIB),-ldl -lpthread)
> +AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz

This one was added in commit bed1490d0f58dc963d2144f2fe6b705f9f36d848,
in May 2013, to fix
http://autobuild.buildroot.net/results/2441d8b62323a00f32f2edb7cb781dda71ff7f68.
But the fix is wrong, because the -ldl and -lpthread dependencies only
come because of sqlite, not because of aircrack-ng itself.

I'm going to do some testing, but I believe that aircrack-ng can
continue to build in BR2_PREFER_STATIC_LIB configurations, and that
those -ldl flags are not necessary.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
