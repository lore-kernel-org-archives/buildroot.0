From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Nov 2020 22:22:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcap: fix regression for
 static linking issue
In-Reply-To: <20201111081807.16075-1-heiko.thiery@gmail.com>
References: <20201111081807.16075-1-heiko.thiery@gmail.com>
Message-ID: <20201111212256.GA771438@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-11-11 09:18 +0100, Heiko Thiery spake thusly:
> 9c13e02c35c74eca56e69f2bbfde452b51860f5e already fixed the static linking
> issue for host-libcap on some distros (e.g. on Fedora32 and openSUSE).
> 
> This regression was introduced by 8d38eb052e7006b6e74e9453351d7f245144481e.
> 
> An upstream patch [1] is added to address this problem [2].
> 
> Fixes:
> Bug 13296
> 
> [1] https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=9b1c003748d4df78416d50fce139f0875224440b
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=210135
> 
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Dr I J Ormshaw <ian_ormshaw@waters.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ding-progs-tcapsh-static-to-sudotest.patch | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/libcap/0001-Migrate-building-progs-tcapsh-static-to-sudotest.patch
> 
> diff --git a/package/libcap/0001-Migrate-building-progs-tcapsh-static-to-sudotest.patch b/package/libcap/0001-Migrate-building-progs-tcapsh-static-to-sudotest.patch
> new file mode 100644
> index 0000000000..856b7b1bbf
> --- /dev/null
> +++ b/package/libcap/0001-Migrate-building-progs-tcapsh-static-to-sudotest.patch
> @@ -0,0 +1,79 @@
> +From 9b1c003748d4df78416d50fce139f0875224440b Mon Sep 17 00:00:00 2001
> +From: "Andrew G. Morgan" <morgan@kernel.org>
> +Date: Tue, 10 Nov 2020 20:47:45 -0800
> +Subject: [PATCH] Migrate building progs/tcapsh-static to sudotest
> +
> +This addresses:
> +
> +  https://bugzilla.kernel.org/show_bug.cgi?id=210135
> +  https://bugs.busybox.net/show_bug.cgi?id=13296
> +
> +Some notes on expectations:
> +
> +When building DYNAMIC=yes folk want to avoid depending on a
> +static libc.a file in their build tree. The best we can do is
> +to move building static test tool objects to sudotest.
> +
> +  make DYNAMIC=yes clean all test
> +
> +will build the progs binaries and run the tests with all dynamic
> +linking. It will, however, build the libcap.a etc libraries too
> +even though they are not used for linking.
> +
> +  make DYNAMIC=no clean all test
> +
> +will build the progs binaries and run the tests with all static
> +linking. It will, however, build the libcap.so etc libraries too
> +even though they are not used for linking.
> +
> +  make SHARED=no clean all test
> +
> +will build and link progs and test binaries statically against
> +libcap.a. No shared libraries (libcap.so etc) will be built.
> +
> +In all cases, whether linked against or not, libcap.a is built.
> +
> +Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
> +[Patch taken from upstream:
> +https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=9b1c003748d4df78416d50fce139f0875224440b]
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> + tests/Makefile | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/tests/Makefile b/tests/Makefile
> +index fc39fee..1e7039d 100644
> +--- a/tests/Makefile
> ++++ b/tests/Makefile
> +@@ -17,13 +17,13 @@ install: all
> + 
> + ifeq ($(DYNAMIC),yes)
> + LINKEXTRA=-Wl,-rpath,../libcap
> +-DEPS=../libcap/libcap.so ../progs/tcapsh-static
> ++DEPS=../libcap/libcap.so
> + ifeq ($(PTHREADS),yes)
> + DEPS += ../libcap/libpsx.so
> + endif
> + else
> + LDFLAGS += --static
> +-DEPS=../libcap/libcap.a ../progs/tcapsh-static
> ++DEPS=../libcap/libcap.a
> + ifeq ($(PTHREADS),yes)
> + DEPS +=  ../libcap/libpsx.a
> + endif
> +@@ -71,10 +71,10 @@ libcap_psx_test: libcap_psx_test.c $(DEPS)
> + 	$(CC) $(CFLAGS) $(IPATH) $< -o $@ $(LINKEXTRA) $(LIBCAPLIB) $(LIBPSXLIB) $(LDFLAGS)
> + 
> + # privileged
> +-run_libcap_launch_test: libcap_launch_test noop
> ++run_libcap_launch_test: libcap_launch_test noop ../progs/tcapsh-static
> + 	sudo ./libcap_launch_test
> + 
> +-run_libcap_psx_launch_test: libcap_psx_launch_test
> ++run_libcap_psx_launch_test: libcap_psx_launch_test ../progs/tcapsh-static
> + 	sudo ./libcap_psx_launch_test
> + 
> + libcap_launch_test: libcap_launch_test.c $(DEPS)
> +-- 
> +2.20.1
> +
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
