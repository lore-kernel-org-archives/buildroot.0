From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 19:36:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with python
 3.8
In-Reply-To: <20191109202648.16533-1-fontaine.fabrice@gmail.com>
References: <20191109202648.16533-1-fontaine.fabrice@gmail.com>
Message-ID: <20191110183651.GZ3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-11-09 21:26 +0100, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/7790f4726d1fca3e5c0630f71f15417eeb7bf02a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ayedLink.h-fix-build-with-python-3-8.patch | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch
> 
> diff --git a/package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch b/package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch
> new file mode 100644
> index 0000000000..5b9abffabd
> --- /dev/null
> +++ b/package/domoticz/0004-DelayedLink.h-fix-build-with-python-3-8.patch
> @@ -0,0 +1,66 @@
> +From e9bd383ceb63db7cfe8a284014f0cdf8c2bfe4f0 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 1 Nov 2019 10:54:11 +0100
> +Subject: [PATCH] DelayedLink.h: fix build with python 3.8
> +
> +Fix build with python 3.8 by copy/pasting the vim workaround from
> +https://github.com/vim/vim/commit/13a1f3fb0c9d08bba6109fe2131c9524e6ba7e15
> +
> +Fix 3703
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/domoticz/domoticz/commit/e9bd383ceb63db7cfe8a284014f0cdf8c2bfe4f0]
> +---
> + hardware/plugins/DelayedLink.h | 38 ++++++++++++++++++++++++++++++++++
> + 1 file changed, 38 insertions(+)
> +
> +diff --git a/hardware/plugins/DelayedLink.h b/hardware/plugins/DelayedLink.h
> +index 4bf1973281..c90a7d8e69 100644
> +--- a/hardware/plugins/DelayedLink.h
> ++++ b/hardware/plugins/DelayedLink.h
> +@@ -14,6 +14,44 @@
> + #include <frameobject.h>
> + #include "../../main/Helper.h"
> + 
> ++#if PY_VERSION_HEX >= 0x030800f0
> ++static inline void
> ++py3__Py_DECREF(const char *filename, int lineno, PyObject *op)
> ++{
> ++	(void)filename; /* may be unused, shut up -Wunused-parameter */
> ++	(void)lineno; /* may be unused, shut up -Wunused-parameter */
> ++	_Py_DEC_REFTOTAL;
> ++	if (--op->ob_refcnt != 0)
> ++	{
> ++#ifdef Py_REF_DEBUG
> ++	if (op->ob_refcnt < 0)
> ++	{
> ++		_Py_NegativeRefcount(filename, lineno, op);
> ++	}
> ++#endif
> ++	}
> ++	else
> ++	{
> ++		_Py_Dealloc(op);
> ++	}
> ++}
> ++
> ++#undef Py_DECREF
> ++#define Py_DECREF(op) py3__Py_DECREF(__FILE__, __LINE__, _PyObject_CAST(op))
> ++
> ++static inline void
> ++py3__Py_XDECREF(PyObject *op)
> ++{
> ++	if (op != NULL)
> ++	{
> ++		Py_DECREF(op);
> ++	}
> ++}
> ++
> ++#undef Py_XDECREF
> ++#define Py_XDECREF(op) py3__Py_XDECREF(_PyObject_CAST(op))
> ++#endif
> ++
> + namespace Plugins {
> + 
> + #ifdef WIN32
> -- 
> 2.23.0
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
