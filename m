From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 12 Apr 2015 10:57:40 +0200
Subject: [Buildroot] [PATCH] giflib: fix description about compatibility
 with libungif
In-Reply-To: <20150412084723.GH2279@tarshish>
References: <1428828185-19869-1-git-send-email-fabio.porcedda@gmail.com>
 <20150412084723.GH2279@tarshish>
Message-ID: <CAHkwnC8W0A+GTHiVuTo1D5ViNzbr8NjvZd-hO5+YGDAB+RhTHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 12, 2015 at 10:47 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Fabio,
>
> On Sun, Apr 12, 2015 at 10:43:05AM +0200, Fabio Porcedda wrote:
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  package/giflib/Config.in | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/giflib/Config.in b/package/giflib/Config.in
>> index 70368dc..bb5741a 100644
>> --- a/package/giflib/Config.in
>> +++ b/package/giflib/Config.in
>> @@ -1,7 +1,7 @@
>>  config BR2_PACKAGE_GIFLIB
>>       bool "giflib"
>>       help
>> -       giflib is a library for reading and writing gif images. It is API and
>> +       giflib is a library for reading and writing gif images. It was API and
>>         ABI compatible with libungif which was in wide use while the LZW
>>         compression algorithm was patented.
>
> So giflib is not compatible to libungif anymore?


Just comparing the gif_lib.h header you can see that the definition of
some functions changes:

git diff --no-index libungif-4.1.4/lib/gif_lib.h giflib-5.1.1/lib/gif_lib.h

 GifFileType *EGifOpenFileName(const char *GifFileName,
-                              int GifTestExistance);
-GifFileType *EGifOpenFileHandle(int GifFileHandle);
-GifFileType *EGifOpen(void *userPtr, OutputFunc writeFunc);
-
+                              const bool GifTestExistence, int *Error);
+GifFileType *EGifOpenFileHandle(const int GifFileHandle, int *Error);
+GifFileType *EGifOpen(void *userPtr, OutputFunc writeFunc, int *Error);
 int EGifSpew(GifFileType * GifFile);

For this reason in buildroot there are commits that switchs from libungif
to giflib that changes the source code to do that, e.g.:

commit bfb54898133210a40bafdfbca72d9186d65c1b66
Author: Bernd Kuhls <bernd.kuhls@t-online.de>
Date:   Mon Jan 26 20:24:19 2015 +0100

    package/efl/libevas: Switch to giflib

package/efl/libevas/0001-giflib.patch | 98
package/efl/libevas/Config.in         |  2 +-
package/efl/libevas/libevas.mk

BR
-- 
Fabio Porcedda
