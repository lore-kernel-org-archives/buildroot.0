From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 12 Jun 2013 09:22:38 +0100
Subject: [Buildroot] [PATCH] wvstreams: Build bundled argp library with
	-fPIC
In-Reply-To: <CAG2jQ8ibG-WBUGbaSyWKefdjZZ0aS2U3NRBY-x7h4QzYiNLi9g@mail.gmail.com>
References: <1370440956-8000-1-git-send-email-markos.chandras@gmail.com>
 <CAG2jQ8ibG-WBUGbaSyWKefdjZZ0aS2U3NRBY-x7h4QzYiNLi9g@mail.gmail.com>
Message-ID: <CAG2jQ8jhJbSd0GdkONA5EpS+EpPp-zTztaYAq_5GYAk=QG5Vjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 June 2013 14:09, Markos Chandras <markos.chandras@gmail.com> wrote:
> On 5 June 2013 15:02, Markos Chandras <markos.chandras@gmail.com> wrote:
>> From: Markos Chandras <markos.chandras@imgtec.com>
>>
>> Fixes linking problems on MIPS.
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>>  package/wvstreams/wvstreams-0006-argp-fpic.patch | 28 ++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>  create mode 100644 package/wvstreams/wvstreams-0006-argp-fpic.patch
>>
>> diff --git a/package/wvstreams/wvstreams-0006-argp-fpic.patch b/package/wvstreams/wvstreams-0006-argp-fpic.patch
>> new file mode 100644
>> index 0000000..b4cf1d2
>> --- /dev/null
>> +++ b/package/wvstreams/wvstreams-0006-argp-fpic.patch
>> @@ -0,0 +1,28 @@
>> +Build argp object files with -fPIC.
>> +
>> +The argp bundled dependency is linked to the libwvutils.so shared library.
>> +MIPS will refuce to link a non-PIC library with a shared one.
>> +
>> +We fix this problem by building the argp source files using -fPIC since
>> +the libargp static library will only be used to link to libwvutils.so
>> +as instructed by the following rule in the root Makefile:
>> +
>> +ifeq ($(USE_WVSTREAMS_ARGP),1)
>> +  utils/wvargs.o-CPPFLAGS += -Iargp
>> +  libwvutils.so-LIBS += -Largp -largp
>> +
>> +Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> +
>> +Index: wvstreams-4.6.1/argp/Makefile.in
>> +===================================================================
>> +--- wvstreams-4.6.1.orig/argp/Makefile.in
>> ++++ wvstreams-4.6.1/argp/Makefile.in
>> +@@ -137,7 +137,7 @@ AUTOMAKE = @AUTOMAKE@
>> + AWK = @AWK@
>> + CC = @CC@
>> + CCDEPMODE = @CCDEPMODE@
>> +-CFLAGS = @CFLAGS@
>> ++CFLAGS = @CFLAGS@ -fPIC
>> + CPP = @CPP@
>> + CPPFLAGS = @CPPFLAGS@
>> + CYGPATH_W = @CYGPATH_W@
>> --
>> 1.8.2.1
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Hi all,
>
> After the relevant discussion in the bzip2 static/shared lib patch, I
> believe this patch is safe to be applied as is, since the argp static
> library is only a dependency for the shared libwvutils.so. In my
> opinion, it is fine to build argp with -fPIC since it's only going to
> be used
> in a shared library.
>
> --
> Regards,
> Markos Chandras

Hi,

ping? :)

--
Regards,
Markos Chandras
