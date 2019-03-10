From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Mar 2019 19:17:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix build without fork
In-Reply-To: <20190310094627.20440-1-fontaine.fabrice@gmail.com>
References: <20190310094627.20440-1-fontaine.fabrice@gmail.com>
Message-ID: <20190310191758.7d1707e3@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 10 Mar 2019 10:46:27 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/8d6194982c1080e173fcef8212fb06e6dc275d58
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-amdgpu-basic_tests.c-check-for-fork.patch | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/libdrm/0004-amdgpu-basic_tests.c-check-for-fork.patch
> 
> diff --git a/package/libdrm/0004-amdgpu-basic_tests.c-check-for-fork.patch b/package/libdrm/0004-amdgpu-basic_tests.c-check-for-fork.patch
> new file mode 100644
> index 0000000000..806c0c0fb7buildroot at buildroot.org
> --- /dev/null
> +++ b/package/libdrm/0004-amdgpu-basic_tests.c-check-for-fork.patch
> @@ -0,0 +1,64 @@
> +From a5ba5f3c194aa68b1e944d6691ad5cbbb2766ba7 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 10 Mar 2019 09:44:11 +0100
> +Subject: [PATCH libdrm] amdgpu/basic_tests.c: check for fork
> +
> +amdgpu test program use fork since
> +https://cgit.freedesktop.org/mesa/drm/commit/tests/amdgpu/basic_tests.c?id=736ef0b61cab55378202c5f49d91799cc2b99091
> +
> +However, this function is not always available so add a check for it in
> +configure.ac and use it in tests/amdgpu/basic_tests.c

Will the test succeed without fork? Maybe better disable the whole test in case
fork is not available? Or simple wait for Upstream suggestions/opinion.... ;-)

Regards,
Peter

> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/8d6194982c1080e173fcef8212fb06e6dc275d58
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: sent to dri-devel at lists.freedesktop.org]
> +---
> + configure.ac               | 2 ++
> + tests/amdgpu/basic_tests.c | 4 ++++
> + 2 files changed, 6 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d72e84ad..6effb9a2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -193,6 +193,8 @@ AC_CHECK_FUNCS([open_memstream],
> +                [AC_DEFINE([HAVE_OPEN_MEMSTREAM], 1, [Have open_memstream()])],
> +                [AC_DEFINE([HAVE_OPEN_MEMSTREAM], 0)])
> + 
> ++AC_CHECK_FUNCS([fork])
> ++
> + dnl Use lots of warning flags with with gcc and compatible compilers
> + 
> + dnl Note: if you change the following variable, the cache is automatically
> +diff --git a/tests/amdgpu/basic_tests.c b/tests/amdgpu/basic_tests.c
> +index dbae4d53..c32a1351 100644
> +--- a/tests/amdgpu/basic_tests.c
> ++++ b/tests/amdgpu/basic_tests.c
> +@@ -1646,10 +1646,12 @@ static void amdgpu_userptr_test(void)
> + 	while (j++ < sdma_write_length)
> + 		pm4[i++] = 0xdeadbeaf;
> + 
> ++#ifdef HAVE_FORK
> + 	if (!fork()) {
> + 		pm4[0] = 0x0;
> + 		exit(0);
> + 	}
> ++#endif
> + 
> + 	amdgpu_test_exec_cs_helper(context_handle,
> + 				   AMDGPU_HW_IP_DMA, 0,
> +@@ -1675,7 +1677,9 @@ static void amdgpu_userptr_test(void)
> + 	r = amdgpu_cs_ctx_free(context_handle);
> + 	CU_ASSERT_EQUAL(r, 0);
> + 
> ++#ifdef HAVE_FORK
> + 	wait(NULL);
> ++#endif
> + }
> + 
> + static void amdgpu_sync_dependency_test(void)
> +-- 
> +2.20.1
> +
