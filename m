From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jan 2016 18:32:07 +0100
Subject: [Buildroot] [PATCH 1/1] mongodb: new package
In-Reply-To: <1450010438-10933-1-git-send-email-sergio.prado@e-labworks.com>
 (Sergio Prado's message of "Sun, 13 Dec 2015 10:40:38 -0200")
References: <1450010438-10933-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <87fuyhtdd4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio Prado <sergio.prado@e-labworks.com> writes:

 > Compiled and tested on arm (beaglebone black), aarch64 (qemu),
 > i386 (qemu) and x86_64 (qemu).

 > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
 > ---
 >  package/Config.in            |  1 +
 >  package/mongodb/Config.in    | 20 ++++++++++++++
 >  package/mongodb/mongodb.hash |  2 ++
 >  package/mongodb/mongodb.mk   | 64 ++++++++++++++++++++++++++++++++++++++++++++
 >  4 files changed, 87 insertions(+)
 >  create mode 100644 package/mongodb/Config.in
 >  create mode 100644 package/mongodb/mongodb.hash
 >  create mode 100644 package/mongodb/mongodb.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 00aedad84395..9f4457d0810c 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -783,6 +783,7 @@ menu "Database"
 >  	source "package/gdbm/Config.in"
 >  	source "package/kompexsqlite/Config.in"
 >  	source "package/leveldb/Config.in"
 > +	source "package/mongodb/Config.in"
 >  	source "package/mysql/Config.in"
 >  	source "package/postgresql/Config.in"
 >  	source "package/redis/Config.in"
 > diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
 > new file mode 100644
 > index 000000000000..31f5f7459395
 > --- /dev/null
 > +++ b/package/mongodb/Config.in
 > @@ -0,0 +1,20 @@
 > +config BR2_PACKAGE_MONGODB
 > +	bool "mongodb"
 > +	depends on BR2_TOOLCHAIN_USES_GLIBC # needs glibc malloc_usable_size
 > +	depends on BR2_USE_WCHAR
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	depends on BR2_INSTALL_LIBSTDCPP
 > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11

mongodb contains this code in src/mongo/platform/bits.h:

#if defined(__x86_64__) || defined(__amd64__) || defined(_WIN64) || defined(__aarch64__) || \
    defined(__powerpc64__)
#define MONGO_PLATFORM_64
#elif defined(__i386__) || defined(_WIN32) || defined(__arm__)
#define MONGO_PLATFORM_32
#else
#error "unknown platform"
#endif

So I've added a BR2_PACKAGE_MONGODB_ARCH_SUPPORTS variable like we do
elsewhere to ensure mongodb is only available on those archs.

It also builds with -Werror by default, which was causing compilation
errors for me, so I've added --disable-warnings-as-errors.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
