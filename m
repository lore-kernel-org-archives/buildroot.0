From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 13 Aug 2014 21:24:00 -0500
Subject: [Buildroot] [PATCH 1/1] fio: (bugfix) add libaio dependency
 (added description)
In-Reply-To: <20140813235957.10e71f41@free-electrons.com>
References: <1407956022-62199-1-git-send-email-Matthew.Weber@rockwellcollins.com>
 <20140813235957.10e71f41@free-electrons.com>
Message-ID: <CANQCQpbAuSLcPDS6kTrxUv-AURrhSmPiMSPAwnKabfRsz2UCWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Aug 13, 2014 at 4:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matt Weber,
>
> On Wed, 13 Aug 2014 13:53:42 -0500, Matt Weber wrote:
>> The fio package at runtime (dlopen)links in the libaio library
>> when the ioengine is selected as libaio. I.e. this isn't caught at
>> build time since the link wouldn't occur.
>>
>> Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>
>
> Thanks for the explanation. However, this patch still isn't completely
> correct. The first issue is that you have added a changelog information
> ("added description") in the commit title, which is preserved forever
> in the Git history. The changelog information should go...
>
>> ---
>
> ... here, so that it doesn't get preserved forever in the Git history.
>
> Also, the (bugfix) part of your commit title is kind of strange. I
> think a proper commit title would be:
>
>         fio: add missing libaio dependency
Agree, I didn't scrub my commit before generating the path.  Sorry
about that I'll cleanup and submit v2.

>
> Also, you say that libaio is needed when the ioengine is selected as
> libaio. Are there other ioengine that could potentially be used, and
> therefore make the libaio dependency optional?
The code only has this one dlopen case.  Everything else is linked at
compile time.

>
>>  package/fio/Config.in | 1 +
>>  package/fio/fio.mk    | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/package/fio/Config.in b/package/fio/Config.in
>> index 8cbbf6c..b907fb9 100644
>> --- a/package/fio/Config.in
>> +++ b/package/fio/Config.in
>> @@ -3,6 +3,7 @@ config BR2_PACKAGE_FIO
>>       depends on BR2_USE_MMU # fork()
>>       depends on BR2_LARGEFILE
>>       depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     select BR2_PACKAGE_LIBAIO #ioengine libaio
>
> This should be:
>
>         # Runtime dependency: libaio is dlopen()ed by fio
>         select BR2_PACKAGE_LIBAIO
Agree, will update.

>
> Also, the libaio package is only available for a limited set of
> architectures (see package/libaio/Config.in), and those dependencies
> must be propagated to fio if libaio is indeed a mandatory dependency of
> fio.
The code doesn't (currently) seem to make the libaio optional. So I
agree at this point it would make the most sense to restrict fio to
the same build targets as libaio and enforce this dependency.

>
>>       # fio uses posix_madvise(), which is not part of any official
>>       # release of uClibc, but is part of uClibc Git, and backported
>>       # in Buildroot patch set of uClibc 0.9.33. Therefore, we
<snip>
>>  FIO_LICENSE_FILES = LICENSE
>> +FIO_DEPENDENCIES = libaio
>
> If libaio is only a runtime dependency of fio (and not a build time
> dependency), then this line is not needed.
True, we would have see build failures if this was required.

Thank you for the feedback,
-- 
Matthew L Weber / Sr Software Engineer / Platform Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
Phone: 319-295-7349
matthew.weber at rockwellcollins.com
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
