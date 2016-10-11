From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 11 Oct 2016 17:05:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: backport upstream patch to
 fix compat function for static_assert
In-Reply-To: <20160924185502.16365-1-bernd.kuhls@t-online.de>
References: <20160924185502.16365-1-bernd.kuhls@t-online.de>
Message-ID: <CAJtjsKZe+kc10Kx9i6Hk=0nZYGq+cWpOzYM7pQD9GqTj+5UKDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sat, Sep 24, 2016 at 8:55 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Fixes
> http://autobuild.buildroot.net/results/3b9/3b9d15f226057706c185270788050dace7b7b535/
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/0009-static-assert.patch | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/vlc/0009-static-assert.patch
>
> diff --git a/package/vlc/0009-static-assert.patch b/package/vlc/0009-static-assert.patch
> new file mode 100644
> index 0000000..33cf054
> --- /dev/null
> +++ b/package/vlc/0009-static-assert.patch
> @@ -0,0 +1,29 @@
> +From: Thomas Guillem <thomas@gllm.fr>
> +Date: Mon, 14 Dec 2015 09:08:25 +0000 (+0100)
> +Subject: compat: fix static_assert
> +X-Git-Url: http://git.videolan.org/?p=vlc.git;a=commitdiff_plain;h=6faf9066670db6e0d241ead6a3926b2d9cc6a041
> +
> +compat: fix static_assert
> +
> +It was not possible to use it outside of functions.
> +
> +Signed-off-by: R?mi Denis-Courmont <remi@remlab.net>
> +(backported and re-based for vlc 2.2)
> + Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> +
> +diff --git a/include/vlc_fixups.h b/include/vlc_fixups.h
> +index 213d3f3..bd798d0 100644
> +--- a/include/vlc_fixups.h
> ++++ b/include/vlc_fixups.h
> +@@ -273,7 +273,9 @@ static inline locale_t newlocale(int mask, const char * locale, locale_t base)
> + #endif
> +
> + #if !defined (HAVE_STATIC_ASSERT)
> +-# define _Static_assert(x, s) ((void) sizeof (struct { unsigned:-!(x); }))
> ++# define STATIC_ASSERT_CONCAT_(a, b) a##b
> ++# define STATIC_ASSERT_CONCAT(a, b) STATIC_ASSERT_CONCAT_(a, b)
> ++# define _Static_assert(x, s) extern char STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct { unsigned:-!(x); })]
> + # define static_assert _Static_assert
> + #endif
> +

I've tested your patch:
Applying 0009-static-assert.patch using patch:
patching file include/vlc_fixups.h
Hunk #1 succeeded at 240 (offset -33 lines).


Unfortunately, I still have errors related to static_assert when compiling vlc:
------------8<------------8<------------8<------------8<------------
In file included from ../config.h:799:0,
                 from demux/sid.cpp:33:
../include/vlc_fixups.h:245:104: error: types may not be defined in
?sizeof? expressions
 # define _Static_assert(x, s) extern char
STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct {
unsigned:-!(x); })]

                                 ^
../include/vlc_fixups.h:245:124: error: storage class specified for
?static_assert_1094?
 # define _Static_assert(x, s) extern char
STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct {
unsigned:-!(x); })]

                                                     ^
../include/vlc_fixups.h:245:104: error: types may not be defined in
?sizeof? expressions
 # define _Static_assert(x, s) extern char
STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct {
unsigned:-!(x); })]

                                 ^
../include/vlc_fixups.h:245:124: error: storage class specified for
?static_assert_2082?
 # define _Static_assert(x, s) extern char
STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct {
unsigned:-!(x); })]

                                                     ^
[...]

In file included from
/home/johan/Documents/green/qolyester-buildroot/output-rpi2/host/usr/arm-buildroot-linux-uclibcgnueabihf/include/c++/6.1.0/tuple:40:0,
                 from
/home/johan/Documents/green/qolyester-buildroot/output-rpi2/host/usr/arm-buildroot-linux-uclibcgnueabihf/include/c++/6.1.0/bits/stl_map.h:63,
                 from
/home/johan/Documents/green/qolyester-buildroot/output-rpi2/host/usr/arm-buildroot-linux-uclibcgnueabihf/include/c++/6.1.0/map:61,
                 from ./stream_filter/dash/mpd/SegmentInfo.h:30,
                 from ./stream_filter/dash/mpd/Representation.h:31,
                 from
./stream_filter/dash/adaptationlogic/IAdaptationLogic.h:30,
                 from
stream_filter/dash/adaptationlogic/AdaptationLogicFactory.h:28,
                 from
stream_filter/dash/adaptationlogic/AdaptationLogicFactory.cpp:28:
/home/johan/Documents/green/qolyester-buildroot/output-rpi2/host/usr/arm-buildroot-linux-uclibcgnueabihf/include/c++/6.1.0/bits/uses_allocator.h:92:62:
error: macro "_Static_assert" passed 8 arguments, but takes just 2
    " an allocator must be possible if uses_allocator is true");


------------8<------------8<------------8<------------8<------------

Redefining static_assert in a header included by both C and C++ code
is a bad idea. It looks like HAVE_STATIC_ASSERT is not correctly set
for C++14. I solve the remaining errors by changing the condition to:
#if !defined (HAVE_STATIC_ASSERT) && (!defined(__cplusplus) ||
__cplusplus < 201103L)

Kind regards,
-- 
Johan
