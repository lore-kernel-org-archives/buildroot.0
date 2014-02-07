From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Fri, 7 Feb 2014 12:34:17 -0200
Subject: [Buildroot] [PATCH 1/1] minidlna: Fix configure ffmpeg
 detection when OpenSSL support is enabled
In-Reply-To: <877g9k5s3m.fsf@dell.be.48ers.dk>
References: <BLU0-SMTP258246699D2172CA1E77C80D9BB0@phx.gbl>
 <877g9k5s3m.fsf@dell.be.48ers.dk>
Message-ID: <CAAEAJfAKqmRp_50ZCp-5dKEu0Oe9yB+1xaBu7gZjn2MnEejn2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 January 2014 07:16, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:
>
>  > Fixes http://autobuild.buildroot.net/results/c66/c663a518f65e786895d9ad8866193f70cbd6e96d//
>  > Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
>  > ---
>  >  package/minidlna/minidlna.mk |    7 ++++++-
>  >  1 file changed, 6 insertions(+), 1 deletion(-)
>
>  > diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
>  > index 94c2641..174f650 100644
>  > --- a/package/minidlna/minidlna.mk
>  > +++ b/package/minidlna/minidlna.mk
>  > @@ -13,13 +13,18 @@ MINIDLNA_DEPENDENCIES = \
>  >      ffmpeg flac libvorbis libogg libid3tag libexif libjpeg sqlite \
>  >      host-xutil_makedepend
>
>  > +ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  > +MINIDLNA_FFMPEG_SSL_LIBS=-lcrypto -lssl
>  > +endif
>
> I don't think that's the right fix. Looking at config.log I see:
>
> configure:9248: checking for avformat_open_input in -lavformat
> configure:9273: /home/peko/source/buildroot/output/host/usr/bin/nios2-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -L/usr/local/lib conftest.c -lavformat   >&5
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: warning: library search path "/usr/local/lib" is unsafe for cross-compilation
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: /home/peko/source/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
> /home/peko/source/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: note: '_gp' is defined in DSO /home/peko/source/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libssl.so.1.0.0 so try adding it to the linker command line
> /home/peko/source/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libssl.so.1.0.0: could not read symbols: Invalid operation
> collect2: error: ld returned 1 exit status
>
> I don't know anything about nios, but I believe _gp is a linker
> generated symbol:
>
> http://sourceware-org.1504.n7.nabble.com/PATCH-2-4-MIPS-Linux-LD-Correct-the-definition-of-gp-td125740.html
> https://lists.debian.org/debian-mips/2013/05/msg00018.html
>
> Ezequiel, can you help please?

I'm by no means a compiler expert, but the error does indeed seem
related to a compiler bug. Therefore, the proposed fix doesn't seem
related to it.

If the fix is needed for minidlna, that's a different issue.

Regarding compiler bugs (we have a few already spotted), problem is we can't do
much about these, as we're using an external toolchain provided by
Code Sourcery.

The nios2 support in gcc/binutils is being worked out (maybe it's ready now).
I plan to investigate that as soon as I finish with strace; once we
get an upstream
for gcc issues, we'll be able to report anything we find.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
