From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 7 Mar 2015 09:41:31 +0100
Subject: [Buildroot] [PATCH v4] cmake: don't use any header available in
	$(HOST_DIR)/usr/include
In-Reply-To: <1425716875-7054-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425716875-7054-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHXCMMJzJZerq2YX0aoP__eU7ezhkxmFcQbePovw+Nd2-pL0ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio, all,

On Sat, Mar 7, 2015 at 9:27 AM, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> The -I<dir> options added to CMAKE_C_FLAGS are passed to the compiler
> before the -I<dir> options of the cmake internal headers, so when the
> host-xz package was already built, a #include <lzma.h> directive loads
> the host-xz header instead of the cmake internal one.
>
> Because we don't want to use any header avaiable in -I$(HOST_DIR)/usr/include,
s/avaiable/available/

> just get rid of the -I<dir> options in the HOST_CFLAGS.
>
> Fix build failure:
>   make host-xz host-cmake
>
> .../output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_buffer_decoder.c:17:1: error: conflicting types for 'lzma_block_buffer_decode'
>  lzma_block_buffer_decode(lzma_block *block, lzma_allocator *allocator,
>  ^
> In file included from /home/tetsuya/buildroot/br2/output/host/usr/include/lzma.h:296:0,
>                  from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/common.h:34,
>                  from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_decoder.h:16,
>                  from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_buffer_decoder.c:13:
> /home/tetsuya/buildroot/br2/output/host/usr/include/lzma/block.h:577:27: note: previous declaration of 'lzma_block_buffer_decode' was here
>  extern LZMA_API(lzma_ret) lzma_block_buffer_decode(
>                            ^
> Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/build.make:261: recipe for target 'Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/liblzma/common/block_buffer_decoder.c.o' failed
> make[3]: *** [Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/liblzma/common/block_buffer_decoder.c.o] Error 1
>
> Fixes:
> http://autobuild.buildroot.org/results/4edf6e169dc4a00d8a8bd16a86eba2316cbbd9e5
> http://autobuild.buildroot.org/results/a9ff38b22a36a2f8427d33085d3263a8cbfbd746
> http://autobuild.buildroot.org/results/ecaa0227249207b5450519832a193c1585ac8177
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Samuel Martin <s.martin49@gmail.com>
Tested-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
