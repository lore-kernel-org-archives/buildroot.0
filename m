From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 5 Jul 2015 11:10:49 +0200
Subject: [Buildroot] [PATCH v7 2/7] package/opencv: add gstreamer-1.x
	support
In-Reply-To: <20150705084538.GB3647@free.fr>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
 <1436036821-10073-3-git-send-email-s.martin49@gmail.com>
 <20150705084538.GB3647@free.fr>
Message-ID: <CAHXCMML-zo0nzcxdyu_c1DS19hKkQbG9z-ij6x45taAkjFzy8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Jul 5, 2015 at 10:45 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2015-07-04 21:06 +0200, Samuel Martin spake thusly:
>> Starting with the 2.4.10 release, OpenCV supports both Gstreamer-0.10
>> and Gstreamer-1, but only one can be enabled at the same time (OpenCV
>> chooses Gstreamer-1 over Gstreamer-0.10 when both are available).
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> [--SNIP--]
>> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
>> index c3b7535..92a1306 100644
>> --- a/package/opencv/Config.in
>> +++ b/package/opencv/Config.in
>> @@ -194,6 +194,19 @@ comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads"
>>       depends on BR2_USE_MMU
>>       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>>
>> +config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
>> +     bool "gstreamer-1.x"
>> +     depends on BR2_USE_MMU # libglib2
>> +     depends on BR2_USE_WCHAR # libglib2
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>
> I would have used the "gst -> libglib2" trail in the comment because,
> again, we're not selecting libglib2, but gst-1, so it's weid to see the
> dependency being explained because of libglib2...

done.

>
> [--SNIP--]
>> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
>> index 633c2bf..6b1a139 100644
>> --- a/package/opencv/opencv.mk
>> +++ b/package/opencv/opencv.mk
>> @@ -222,11 +222,18 @@ else
>>  OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
>>  endif
>>
>> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER)$(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),)
>> +OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
>> +endif
>
> Why do you split this out, rather than have each be defined in the else
> clause of each if-block?
>
> AFAICS, GST and GST_0_10 are mutually exclusive (i.e. when one is ON,
> the other is OFF) :
>
>>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
>> -OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=ON
>> +OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=ON
>
> ... here: GST=OFFF and GST_0_10=ON ...
>
>>  OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
>> -else
>> -OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),y)
>> +OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=OFF
>
> ... and here GST=ON and GST_0_10=OFF

You're right! Just letf-over stuff from previous bump in which, to get
gst-0.10 support, one has to do GST=ON and GST_0_10=ON.
I'm fixing this.

>
>> +OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
>>  endif
>
> So, I'd have written something like:
>
>     ifeq ($(BR2_PKG_OCV_GST_0_10),y)
>     OCV_CONF_OPTS += -DWITH_GST_0_10=ON
>     OVC_DEPS += gst gst-plugins-base
>     else
>     OCV_CONF_OPTS += -DWITH_GST_0_10=OFF
>     endif
>
>     ifeq ($(BR2_PKG_OCV_GST),y)
>     OCV_CONF_OPTS += -DWITH_GST=ON
>     OVC_DEPS += gst-1 gst-1-plugins-base
>     else
>     OCV_CONF_OPTS += -DWITH_GST=OFF
>     endif
>
> (Sorry, I forgot to say so in my previous review... :-( )
no pb ;)

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Thanks,

-- 
Samuel
