From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 10 Feb 2020 10:15:06 +0100
Subject: [Buildroot] [PATCH 1/2] package/libftdi1: fix unresolved symbol
 issue
In-Reply-To: <20200210091149.8584-1-yegorslists@googlemail.com>
References: <20200210091149.8584-1-yegorslists@googlemail.com>
Message-ID: <CAGm1_kt8K_9fSXgbgwumE8SVbwMDfuJbPVSF7EssYkxudx9k1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 10, 2020 at 10:11 AM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> GCC later than 5.x produce _fdti1.so file with an undefined
> symbol str2charp_size due to C99 inline semantics change. So
> remove this keyword.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...g-python-fix-unresolved-symbol-issue.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch
>
> diff --git a/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch b/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch
> new file mode 100644
> index 0000000000..bffaf12f91
> --- /dev/null
> +++ b/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch
> @@ -0,0 +1,30 @@
> +From e12e592e982fe71b2761da0de7b19e93f67ed22c Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Tue, 6 Aug 2019 13:42:06 +0200
> +Subject: [PATCH] swig: python: fix unresolved symbol issue
> +
> +GCC later than 5.x produce _fdti1.so file with an undefined
> +symbol str2charp_size due to C99 inline semantics change. So
> +remove this keyword.
> +
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + python/ftdi1.i | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/python/ftdi1.i b/python/ftdi1.i
> +index 93793f8..0d150cb 100644
> +--- a/python/ftdi1.i
> ++++ b/python/ftdi1.i
> +@@ -19,7 +19,7 @@ inline PyObject* charp2str(const char *v_, long len)
> + #endif
> + }
> +
> +-inline char * str2charp_size(PyObject* pyObj, int * size)
> ++char * str2charp_size(PyObject* pyObj, int * size)
> + {
> +   char * v_ = 0;
> + #if PY_MAJOR_VERSION >= 3
> +--
> +2.17.0

This error can be seen only at runtime. The patch is already upstream.
If everything is going to be as planned, the 1.5 release comes in
March. But at least we would have a testing infrastructure to catch
the possible errors.

Yegor
