From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 20:40:03 +0200
Subject: [Buildroot] Fixing the build of Mono with musl
Message-ID: <20160526204003.6668392e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

Today, I took a look at this build failure:

  http://autobuild.buildroot.org/results/42d/42d9f34d04ac83a6602c387ec3754035a856bf8f/build-end.log

Which is a problem when building Mono with the musl C library.

According to
http://www.mono-project.com/docs/about-mono/releases/4.0.0/, it is
possible to build Mono for musl by passing --disable-boehm
--without-sigaltstack. So I did the following change:

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 0b9cb46..b23495c 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -26,6 +26,13 @@ MONO_CONF_OPTS = --disable-gtk-doc \
        --disable-mcs-build \
        --enable-static
 
+# As suggested by
+# http://www.mono-project.com/docs/about-mono/releases/4.0.0/ for musl
+# support.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+MONO_CONF_OPTS += --disable-boehm --without-sigaltstack
+endif
+
 # The libraries have been built by the host-mono build. Since they are
 # architecture-independent, we simply copy them to the target.
 define MONO_INSTALL_LIBS

It indeed allows the build to go further, but it fails for another
reason at the end of the build, with the following errors:

./.libs/libmini-static.a(libmini_static_la-mini-runtime.o): In function `mono_get_jit_tls_offset':
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/mini/mini-runtime.c:714: undefined reference to `mono_jit_tls'
./.libs/libmini-static.a(libmini_static_la-mini-runtime.o): In function `mono_get_lmf_tls_offset':
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/mini/mini-runtime.c:724: undefined reference to `mono_lmf'
./.libs/libmini-static.a(libmini_static_la-mini-runtime.o): In function `mono_get_lmf_addr_tls_offset':
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/mini/mini-runtime.c:735: undefined reference to `mono_lmf_addr'
./.libs/libmini-static.a(libmini_static_la-mini-runtime.o): In function `mono_get_jit_tls_offset':
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/mini/mini-runtime.c:714: undefined reference to `mono_jit_tls'
./.libs/libmini-static.a(libmini_static_la-mini-runtime.o): In function `mono_get_lmf_tls_offset':
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/mini/mini-runtime.c:724: undefined reference to `mono_lmf'
./.libs/libmini-static.a(libmini_static_la-mini-runtime.o): In function `mono_get_lmf_addr_tls_offset':
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/mini/mini-runtime.c:735: undefined reference to `mono_lmf_addr'
../../mono/metadata/.libs/libmonoruntimesgen-static.a(libmonoruntimesgen_static_la-threads.o): In function `mono_thread_get_tls_offset':
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/metadata/threads.c:263: undefined reference to `tls_current_object'
../../mono/metadata/.libs/libmonoruntimesgen-static.a(libmonoruntimesgen_static_la-domain.o): In function `mono_domain_get_tls_offset':
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/metadata/domain.c:159: undefined reference to `tls_appdomain'
../../mono/metadata/.libs/libmonoruntimesgen-static.a(libmonoruntimesgen_static_la-sgen-mono.o): In function `sgen_client_init':
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/metadata/sgen-mono.c:2770: undefined reference to `sgen_thread_info'
../../mono/sgen/.libs/libmonosgen-static.a(libmonosgen_static_la-sgen-alloc.o): In function `sgen_init_allocator':
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/sgen/sgen-alloc.c:552: undefined reference to `tlab_next_addr'
/home/thomas/projets/buildroot/output/build/mono-4.2.3.4/mono/sgen/sgen-alloc.c:553: undefined reference to `tlab_temp_end'
collect2: error: ld returned 1 exit status

I checked, those variables are really defined. They are all defined
with a special macro MONO_FAST_TLS_DECLARE() because they are
thread-local variables. But for some reason, gcc gets rid of them it
seems.

I have reported the issue upstream at
https://bugzilla.xamarin.com/show_bug.cgi?id=41340.

Interestingly, Alpine Linux has some patches to make Mono build for
Musl: http://git.alpinelinux.org/cgit/aports/tree/testing/mono, but
they are for an older version of Mono, and I don't see how any of them
can solve the above problem.

Do you have some time to investigate this issue ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
