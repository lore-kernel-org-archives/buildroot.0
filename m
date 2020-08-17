From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Mon, 17 Aug 2020 12:16:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcamera: disable werror
In-Reply-To: <20200816210336.GJ24264@scaer>
References: <20200816100656.979726-1-fontaine.fabrice@gmail.com>
 <20200816210336.GJ24264@scaer>
Message-ID: <0895ee7c-418a-9d15-247d-71934b4fb96f@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Out of interest, have you investigated to see if this has been fixed or
reported in upstream glib?

This looks like an issue in the specific glib version rather than
libcamera, so IMO disabling -Werror is just a workaround ... a viable
one of course ... but not solving the underlying fault.

Of course that is the peril of -Werror, we aim to keep warning free, but
the dependencies are out of our control so if they fail to do the same,
then that can cause these issues for packaging.

Anyway the -Werror=false is only at the buildroot packaging, so we can
still aim to be warning clear in libcamera of course ;-)

Thanks for keeping libcamera building successfully on buildroot!

--
Regards

Kieran


On 16/08/2020 22:03, Yann E. MORIN wrote:
> Fabrice, All,
> 
> On 2020-08-16 12:06 +0200, Fabrice Fontaine spake thusly:
>> This will fix the following build failure:
>>
>> ../src/gstreamer/gstlibcameraallocator.cpp: In static member function 'static GQuark FrameWrap::getQuark()':
>> /home/peko/autobuild/instance-1/output-1/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/glib-2.0/glib/gatomic.h:128:15: error: variable 'gapg_temp_atomic' set but not used [-Werror=unused-but-set-variable]
>>      gpointer *gapg_temp_atomic = (gpointer *)(atomic);                       \
>>                ^
>>
>> Fixes:
>>  - http://autobuild.buildroot.org/results/c28500d4cc55fbd2bac87f2c11759ddc9163bc91
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>  package/libcamera/libcamera.mk | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
>> index 9739f715a1..34911cee79 100644
>> --- a/package/libcamera/libcamera.mk
>> +++ b/package/libcamera/libcamera.mk
>> @@ -15,7 +15,8 @@ LIBCAMERA_DEPENDENCIES = \
>>  LIBCAMERA_CONF_OPTS = \
>>  	-Dandroid=false \
>>  	-Ddocumentation=false \
>> -	-Dtest=false
>> +	-Dtest=false \
>> +	-Dwerror=false
>>  LIBCAMERA_INSTALL_STAGING = YES
>>  LIBCAMERA_LICENSE = \
>>  	LGPL-2.1+ (library), \
>> -- 
>> 2.27.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Regards
--
Kieran
