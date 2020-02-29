From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 19:22:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/qpdf: fix build without wchar
In-Reply-To: <20200229130130.2641591-1-fontaine.fabrice@gmail.com>
References: <20200229130130.2641591-1-fontaine.fabrice@gmail.com>
Message-ID: <20200229182241.GS8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-29 14:01 +0100, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/99c82d4775ed44bd04d0a48188ff590dcba73d69
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

It looks like upstream is dead-set against fixing the issue for
toolchains without wchar. I think it is simpler to just add a dependency
to wchar. The only user of qpdf, cups-filters, already depends on wchar
anyway.

I'll do so and push to master.

(Note that I commented on your upstream PR at the same time you did,
with roughly the same arguments! ;-) )

Regards,
Yann E. MORIN.

> ---
>  ...pdf-QUtil.cc-fix-build-without-wchar.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/qpdf/0002-libqpdf-QUtil.cc-fix-build-without-wchar.patch
> 
> diff --git a/package/qpdf/0002-libqpdf-QUtil.cc-fix-build-without-wchar.patch b/package/qpdf/0002-libqpdf-QUtil.cc-fix-build-without-wchar.patch
> new file mode 100644
> index 0000000000..32d61562a5
> --- /dev/null
> +++ b/package/qpdf/0002-libqpdf-QUtil.cc-fix-build-without-wchar.patch
> @@ -0,0 +1,44 @@
> +From 852fc293245ab5b85be5e45a4f034d65c0635aeb Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 29 Feb 2020 13:42:15 +0100
> +Subject: [PATCH] libqpdf/QUtil.cc: fix build without wchar
> +
> +Build on Linux toolchains without wchar fails since version 9.1.1 and
> +a44b5a34a07b9f2905d419d5571fd53832c1f6c0 on:
> +
> +libqpdf/QUtil.cc: In function 'int QUtil::call_main_from_wmain(int, wchar_t**, std::function<int(int, char**)>)':
> +libqpdf/QUtil.cc:2378:32: error: 'wcslen' was not declared in this scope
> +         for (size_t j = 0; j < wcslen(argv[i]); ++j)
> +                                ^~~~~~
> +
> +To fix this error, return -1 if WINDOWS_WMAIN is not defined
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/qpdf/qpdf/pull/405]
> +---
> + libqpdf/QUtil.cc | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/libqpdf/QUtil.cc b/libqpdf/QUtil.cc
> +index 1d29bcc..1c4ff2d 100644
> +--- a/libqpdf/QUtil.cc
> ++++ b/libqpdf/QUtil.cc
> +@@ -2366,6 +2366,7 @@ QUtil::possible_repaired_encodings(std::string supplied)
> + int
> + QUtil::call_main_from_wmain(int argc, wchar_t* argv[], std::function<int(int, char*[])> realmain)
> + {
> ++#ifdef WINDOWS_WMAIN
> +     // argv contains UTF-16-encoded strings with a 16-bit wchar_t.
> +     // Convert this to UTF-8-encoded strings for compatibility with
> +     // other systems. That way the rest of qpdf.cc can just act like
> +@@ -2396,4 +2397,7 @@ QUtil::call_main_from_wmain(int argc, wchar_t* argv[], std::function<int(int, ch
> +     argc = QIntC::to_int(utf8_argv.size());
> +     new_argv[argc] = 0;
> +     return realmain(argc, new_argv);
> ++#else
> ++    return -1;
> ++#endif
> + }
> +-- 
> +2.25.0
> +
> -- 
> 2.25.0
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
