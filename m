From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Jun 2017 22:02:28 +0200
Subject: [Buildroot] [PATCH] libupnpp: needs gcc >= 4.9
In-Reply-To: <20170607192539.14429-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 7 Jun 2017 21:25:39 +0200")
References: <20170607192539.14429-1-joerg.krause@embedded.rocks>
Message-ID: <87r2yvbm7f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > After bumping libupnpp from version 0.15.1 to 0.15.2 compilation fails
 > for toolchains using GCC 4.7:

 > ```
 > libupnpp/control/discovery.cxx: In constructor 'UPnPClient::UPnPDeviceDirectory::UPnPDeviceDirectory(time_t)':
 > libupnpp/control/discovery.cxx:338:5: error: 'yield' is not a member of 'std::this_thread'
 > ```

 > Before version 0.15.2, libupnpp used sched_yield() which was replaced by
 > `std::this_thread::yield()` in the new version.

 > Looking at the `<thread>` header file of the PowerPC toolchain [1] from
 > the autobuilder shows that `yield()` is only enabled if
 > `_GLIBCXX_USE_SCHED_YIELD` is defined:

 > ```
 >     /// yield
 >     inline void
 >     yield() noexcept
 >     { __gthread_yield(); }
 > ```

 > Note, that `__gthread_yield()` inlines to a call to `sched_yield()`:

 > ```
 > static inline int
 > __gthread_yield (void)
 > {
 >   return __gthrw_(sched_yield) ();
 > }
 > ```

 > This macro is only defined if GCC was built with `--enable-libstdcxx-time`,
 > which is obviously not the case for the affected toolchains. For GCC 4.7 and
 > below this option defaults to no, which means `sched_yield()` is not enabled
 > though it is be available.

 > The issue was discussed on stackoverflow [2]. In GCC 4.9.0 the issue has
 > been fixed, by automatically enabling `sched_yield()` on platforms that are
 > known to support them.

 > Therefore, we update the dependency to GCC 4.9.

 > Fixes:
 > http://autobuild.buildroot.net/results/506/50670d8119b4fbd26585d3d9bd646adb1d904dbe/
 > http://autobuild.buildroot.net/results/8b0/8b021648a073bde25dd6936ed1ea1e39977bf89b/
 > http://autobuild.buildroot.net/results/b6d/b6d7437e1cf8cf0b3726395401ac4ebd9af2833b/
 > http://autobuild.buildroot.net/results/0bf/0bf84f61a72a65a75c5fd0a787680f483cfead26/
 > .. and more.

 > [1] http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng_e500v2-linux-gnuspe.tar.xz
 > [2] https://stackoverflow.com/a/12961816

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
