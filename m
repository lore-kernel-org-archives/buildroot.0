From: Ryan Coe <bluemrp9@gmail.com>
Date: Tue, 21 Apr 2015 21:32:03 -0700
Subject: [Buildroot] [PATCH v2] heimdal: explicitly set -lpthread
In-Reply-To: <20150421093509.0cdd1240@free-electrons.com>
References: <1429581853-24749-1-git-send-email-bluemrp9@gmail.com>
 <20150421093509.0cdd1240@free-electrons.com>
Message-ID: <55372443.909@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/21/2015 12:35 AM, Thomas Petazzoni wrote:
> Dear Ryan Coe,
>
> On Mon, 20 Apr 2015 19:04:13 -0700, Ryan Coe wrote:
>> fixes the following build error:
>>
>> output/build/host-heimdal-1.5.3/lib/sqlite/.libs/libheimsqlite.a(sqlite3.o): In function `pthreadMutexTry':
>> sqlite3.c:(.text+0x5795): undefined reference to `pthread_mutex_trylock'
>> output/build/host-heimdal-1.5.3/lib/sqlite/.libs/libheimsqlite.a(sqlite3.o): In function `pthreadMutexAlloc':
>> sqlite3.c:(.text+0xbf84): undefined reference to `pthread_mutexattr_init'
>> sqlite3.c:(.text+0xbf91): undefined reference to `pthread_mutexattr_settype'
>> sqlite3.c:(.text+0xbfa4): undefined reference to `pthread_mutexattr_destroy'
>> output/build/host-heimdal-1.5.3/base/.libs/libheimbase.a(heimbase.o): In function `init_ar_tls':
>> heimbase.c:(.text+0x4f): undefined reference to `pthread_key_create'
>> output/build/host-heimdal-1.5.3/base/.libs/libheimbase.a(heimbase.o): In function `autorel_tls':
>> heimbase.c:(.text+0x263): undefined reference to `pthread_getspecific'
>> heimbase.c:(.text+0x291): undefined reference to `pthread_setspecific'
>> collect2: error: ld returned 1 exit status
>> make[3]: *** [verify_krb5_conf] Error 1
>> make[3]: Leaving directory `output/build/host-heimdal-1.5.3/lib/krb5'
>> make[2]: *** [all-recursive] Error 1
>> make[2]: Leaving directory `output/build/host-heimdal-1.5.3/lib'
>> make[1]: *** [all-recursive] Error 1
>> make[1]: Leaving directory `output/build/host-heimdal-1.5.3'
>> make: *** [output/build/host-heimdal-1.5.3/.stamp_built] Error 2
>>
>> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> Ok, now I understand better. It's because host-heimdal picks up
> host-sqlite, which we most likely don't need. Can you try instead
> something like this:
>
> diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
> index 972f15c..5d27f77 100644
> --- a/package/heimdal/heimdal.mk
> +++ b/package/heimdal/heimdal.mk
> @@ -9,7 +9,19 @@ HEIMDAL_SITE = http://www.h5l.org/dist/src
>   HEIMDAL_DEPENDENCIES = host-e2fsprogs host-pkgconf
>   HEIMDAL_INSTALL_STAGING = YES
>   # static because of -fPIC issues with e2fsprogs on x86_64 host
> -HOST_HEIMDAL_CONF_OPTS = --with-x=no --disable-shared --enable-static
> +HOST_HEIMDAL_CONF_OPTS = \
> +       --disable-shared \
> +       --enable-static \
> +       --without-openldap \
> +       --without-capng \
> +       --without-sqlite3 \
> +       --without-libintl \
> +       --without-openssl \
> +       --without-berkeley-db \
> +       --without-readline \
> +       --without-libedit \
> +       --without-hesiod \
> +       --without-x
>   HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
>   HEIMDAL_MAKE = $(MAKE1)
>   # For heimdal-0004-compile_et.patch
>
> Thanks,
>
> Thomas
Thomas,

I still get a build failure relating to a missing -lpthread with this 
method.
