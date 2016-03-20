From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:00:36 +0100
Subject: [Buildroot] [PATCH 1/3] package/kodi: fix segfault during
 playback of mpeg2 content using vaapi
In-Reply-To: <1458419136-9094-1-git-send-email-bernd.kuhls@t-online.de>
References: <1458419136-9094-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160320150036.4b9a1dde@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

I've applied, but there are still some minor issues in the way your
format patches.

On Sat, 19 Mar 2016 21:25:34 +0100, Bernd Kuhls wrote:
> diff --git a/package/kodi/0005-Jarvis-partly-backport-of-PR-9231-to-fix-segfault.patch b/package/kodi/0005-Jarvis-partly-backport-of-PR-9231-to-fix-segfault.patch
> new file mode 100644
> index 0000000..9b59b3b
> --- /dev/null
> +++ b/package/kodi/0005-Jarvis-partly-backport-of-PR-9231-to-fix-segfault.patch
> @@ -0,0 +1,204 @@
> +Patch sent upstream: https://github.com/xbmc/xbmc/pull/9388
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This should go *below* your SoB in the patch itself (see below).

> +From 6a9e2bf65a346a43caff06efbf6051318d11aa8e Mon Sep 17 00:00:00 2001

I.E this should be the *first* line of any Git patch. Otherwise it's no
longer a Git patch.

> +From: Bernd Kuhls <berndkuhls@hotmail.com>
> +Date: Sat, 19 Mar 2016 08:49:43 +0100
> +Subject: [PATCH 1/1] [Jarvis] partly backport of PR 9231 to fix segfault

The other detail is that 1/1 should not be there, please use "git
format-patch -N" when formatting patches.

> +This patch is a backport of
> +https://github.com/xbmc/xbmc/commit/a81208e3b53b84763fb9f20d8642ffc7bc63c9a7
> +to fix a segfault during playback of vaapi-accelerated mpeg2 content:
> +
> +terminate called after throwing an instance of 'std::logic_error'
> +  what():  basic_string::_S_construct null not valid
> +[New LWP 3743]
> +
> +Program received signal SIGABRT, Aborted.
> +[Switching to LWP 3743]
> +0xb5664a9b in raise () from /lib/libc.so.0
> +(gdb) bt full
> +#0  0xb5664a9b in raise () from /lib/libc.so.0
> +No symbol table info available.
> +#1  0xb5660520 in abort () from /lib/libc.so.0
> +No symbol table info available.
> +#2  0xb56e6536 in __gnu_cxx::__verbose_terminate_handler() () from /usr/lib/libstdc++.so.6
> +No symbol table info available.
> +#3  0xb56e4a1c in ?? () from /usr/lib/libstdc++.so.6
> +No symbol table info available.
> +#4  0xb56e4a80 in std::terminate() () from /usr/lib/libstdc++.so.6
> +No symbol table info available.
> +#5  0xb56e4cc9 in __cxa_throw () from /usr/lib/libstdc++.so.6
> +No symbol table info available.
> +#6  0xb5719d79 in std::__throw_logic_error(char const*) () from /usr/lib/libstdc++.so.6
> +No symbol table info available.
> +#7  0xb5722c41 in char* std::string::_S_construct<char const*>(char const*, char const*, std::allocator<char> const&, std::forward_iterator_tag) () from /usr/lib/libstdc++.so.6
> +No symbol table info available.
> +#8  0xb5722cc7 in std::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&) () from /usr/lib/libstdc++.so.6
> +No symbol table info available.
> +#9  0x0848fea3 in CDVDVideoCodec::IsCodecDisabled (map=0x9130420 <g_vaapi_available>, size=5, id=AV_CODEC_ID_MPEG4)
> +    at DVDVideoCodec.cpp:75
> +        index = <optimized out>
> +#10 0x08499d04 in VAAPI::CDecoder::Open (this=0xd09e5e8, avctx=0xd6a2ec0, mainctx=0xd6a2ec0, fmt=AV_PIX_FMT_VAAPI_VLD,
> +    surfaces=6) at VAAPI.cpp:503
> +        gpuvendor = {static npos = <optimized out>,
> +          _M_dataplus = {<std::allocator<char>> = {<__gnu_cxx::new_allocator<char>> = {<No data fields>}, <No data fields>}, _M_p = 0xceb267c "intel open source technology center"}}
> +        profile = <optimized out>
> +#11 0x08491bda in CDVDVideoCodecFFmpeg::GetFormat (avctx=0xd6a2ec0, fmt=0x986d9c0) at DVDVideoCodecFFmpeg.cpp:143
> +        dec = 0xd09e5e8
> +        ctx = <optimized out>
> +        cur = 0x986d9c0
> +#12 0xb61c8ced in ?? () from /usr/lib/libavcodec.so.56
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Your "Sent upstream ..." text should go here.

Applied with those minor nits fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
