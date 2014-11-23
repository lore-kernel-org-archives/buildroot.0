From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 23 Nov 2014 12:30:37 +0100
Subject: [Buildroot] [PATCH] package/librtlsdr: fix build failure
In-Reply-To: <20141123104845.GJ2374@sapphire.tkos.co.il>
References: <1416739233-29442-1-git-send-email-s.martin49@gmail.com>
 <20141123104845.GJ2374@sapphire.tkos.co.il>
Message-ID: <CAHXCMM+-uQ5iP+sdVDpECCJwyf_fDuaxBkg4s9YCuRyLP4bBwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Sun, Nov 23, 2014 at 11:48 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Samuel,
>
> On Sun, Nov 23, 2014 at 11:40:33AM +0100, Samuel Martin wrote:
>> Disable run test for pthread detection.
>>
>> Fixes:
>>   http://autobuild.buildroot.org/results/26c/26cb8c2e5f867d49451f61304bf0a1a6f7b825d9/
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/librtlsdr/librtlsdr.mk | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
>> index 2c5cf1f..9f27aad 100644
>> --- a/package/librtlsdr/librtlsdr.mk
>> +++ b/package/librtlsdr/librtlsdr.mk
>> @@ -19,4 +19,8 @@ ifeq ($(BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER),y)
>>  LIBRTLSDR_CONF_OPTS += -DDETACH_KERNEL_DRIVER=1
>>  endif
>>
>> +# Prevent from configure failure because of TRY_RUN call (of course totally not
>> +# applicable in the cross-compilation context).
>> +LIBRTLSDR_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
>
> Does this disable use of pthreads?

Not at all, it just disables the TRY_RUN call (check the generated
TryRunResults.cmake).

It does not disable the header checks, nor the compile test (see the
build log [1] including this patch) in which rtlsdr link commands
still include "-pthreads".

> If so I'm not sure this is the right fix.
> The build failure seems to only happen when BR2_PREFER_STATIC_LIB is enabled.
> See http://autobuild.buildroot.net/?reason=librtlsdr-v0.5.3.

Right. But I'm not sure to get the relation between linking with
libpthread.a and disabling run tests.

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

[1] http://code.bulix.org/ajzd8z-87459

Regards,

-- 
Samuel
