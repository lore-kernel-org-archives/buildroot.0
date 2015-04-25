From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:18:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/dovecot: not available on
 static-only build
In-Reply-To: <1429816954-2529-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429816954-2529-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150425101835.1eafc258@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 23 Apr 2015 21:22:34 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/53f/53fd9003a4cf7d128f4d64d43209fe26d859a829/
> 
> http://autobuild.buildroot.net/results/53f/53fd9003a4cf7d128f4d64d43209fe26d859a829/dovecot-2.2.16/config.log
> shows this pthread related link error during configure
> 
> sqlite3.c:(.text+0x5106): undefined reference to `pthread_mutex_trylock'
> /home/test/autobuild/instance-2/output/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libsqlite3.a(sqlite3.o): In function `pthreadMutexAlloc':
> sqlite3.c:(.text+0x91fb): undefined reference to `pthread_mutexattr_init'
> sqlite3.c:(.text+0x9205): undefined reference to `pthread_mutexattr_settype'
> sqlite3.c:(.text+0x920e): undefined reference to `pthread_mutex_init'
> sqlite3.c:(.text+0x9216): undefined reference to `pthread_mutexattr_destroy'
> sqlite3.c:(.text+0x9234): undefined reference to `pthread_mutex_init'
> 
> Trying to fix it in dovecot.mk by
> 
> +# dovecot forgets to compile/link with -pthread breaking static linking
> +DOVECOT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -pthread" LIBS="-pthread"
> 
> results in a build error later on
> setresgid.c:(.text+0x0): multiple definition of `setresgid'
> 
> which might be fixed in uclibc by porting
> http://git.buildroot.net/buildroot/tree/package/uclibc/1.0.2/0001-fix-static-linking-of-pthread-apps.patch
> 
> but, at the end, I think it is better to not build Dovecot as a static
> binary since it is heavy modularized and not worth the effort. Therefore
> remove two patches fixing static linking, since they are not needed anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: rebased

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
