From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 5 Mar 2015 14:19:08 +0100
Subject: [Buildroot] [PATCH v2] cmake: don't use any header available in
	$(HOST_DIR)/usr/include
In-Reply-To: <CAHXCMMKo+6a+0Vo+aNY8JhDRvv3PtTvSE-4Q_P7Cn6gSyo-W+w@mail.gmail.com>
References: <1425516333-3234-1-git-send-email-fabio.porcedda@gmail.com>
 <CAHXCMMKo+6a+0Vo+aNY8JhDRvv3PtTvSE-4Q_P7Cn6gSyo-W+w@mail.gmail.com>
Message-ID: <CAHkwnC81FqVQmcit7CEudX7Vnau65FJ0c6K3DGCDxSugT7GNmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 5, 2015 at 2:13 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Fabio,
>
> On Thu, Mar 5, 2015 at 1:45 AM, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
>> The -I<dir> options added to CMAKE_C_FLAGS are passed to the compiler
>> before the -I<dir> options of the cmake internal headers, so when the
>> host-xz package was already built, a #include <lzma.h> directive loads
>> the host-xz header instead of the cmake internal one.
>>
>> Because we don't want to use any header avaiable in -I$(HOST_DIR)/usr/include,
>> just get rid of the -I<dir> options in the HOST_CFLAGS.
>>
>> Fix build failure:
>> .../output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_buffer_decoder.c:17:1: error: conflicting types for 'lzma_block_buffer_decode'
>>  lzma_block_buffer_decode(lzma_block *block, lzma_allocator *allocator,
>>  ^
>> In file included from /home/tetsuya/buildroot/br2/output/host/usr/include/lzma.h:296:0,
>>                  from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/common.h:34,
>>                  from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_decoder.h:16,
>>                  from /home/tetsuya/buildroot/br2/output/build/host-cmake-3.1.3/Utilities/cmliblzma/liblzma/common/block_buffer_decoder.c:13:
>> /home/tetsuya/buildroot/br2/output/host/usr/include/lzma/block.h:577:27: note: previous declaration of 'lzma_block_buffer_decode' was here
>>  extern LZMA_API(lzma_ret) lzma_block_buffer_decode(
>>                            ^
>> Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/build.make:261: recipe for target 'Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/liblzma/common/block_buffer_decoder.c.o' failed
>> make[3]: *** [Utilities/cmliblzma/CMakeFiles/cmliblzma.dir/liblzma/common/block_buffer_decoder.c.o] Error 1
>>
>> Fixes:
>> http://autobuild.buildroot.org/results/4edf6e169dc4a00d8a8bd16a86eba2316cbbd9e5
>> http://autobuild.buildroot.org/results/a9ff38b22a36a2f8427d33085d3263a8cbfbd746
>> http://autobuild.buildroot.org/results/ecaa0227249207b5450519832a193c1585ac8177
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>
>> Notes:
>>     v2:
>>      - Instead of tring to use the system lzma library when avaiable, just
>>        always use the internal one.
>>
>>  package/cmake/cmake.mk | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
>> index 8c64b58..cadd1fd 100644
>> --- a/package/cmake/cmake.mk
>> +++ b/package/cmake/cmake.mk
>> @@ -12,13 +12,18 @@ CMAKE_LICENSE_FILES = Copyright.txt
>>
>>  HOST_CMAKE_DEPENDENCIES = host-pkgconf
>>
>> +# Get rid of -I* options to prevent that a header avaiable in
>> +# $(HOST_DIR)/usr/include is used instead of a cmake one, e.g. lzma*
>> +# headers of the xz package
>> +HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed s/-I[^\ ]*//)
>> +
>>  define HOST_CMAKE_CONFIGURE_CMDS
>>         (cd $(@D); \
>>                 LDFLAGS="$(HOST_LDFLAGS)" \
>> -               CFLAGS="$(HOST_CFLAGS)" \
>> +               CFLAGS="$(HOST_CMAKE_CFLAGS)" \
>>                 ./bootstrap --prefix=$(HOST_DIR)/usr \
>>                         --parallel=$(PARALLEL_JOBS) -- \
>> -                       -DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
>> +                       -DCMAKE_C_FLAGS="$(HOST_CMAKE_CFLAGS)" \
>>                         -DCMAKE_CXX_FLAGS="$(HOST_CXXFLAGS)" \
>
> C++ flags does not need the same treatment?

To fix the host-xz related build failure it's not needed.
Maybe we can do the same thing on CXX_FLAGS to prevent problems with
C++ dependency and also for conformance.

I don't know if cmake use any c++ library but doing the same thing on
the CXX_FLAGS doesn't harm.

>>                         -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
>>                         -DBUILD_CursesDialog=OFF \
>> --
>> 2.3.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Regards,
>
> --
> Samuel



-- 
Fabio Porcedda
