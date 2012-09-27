From: Valentine Barshak <gvaxon@gmail.com>
Date: Thu, 27 Sep 2012 16:25:36 +0400
Subject: [Buildroot] [PATCH 3/3] mplayer: Fix external libdvdread and
 libdvdnav support
In-Reply-To: <50636C68.5030601@gmail.com>
References: <20120926193155.GA3942@gmail.com>
 <20120926193451.GA3983@gmail.com> <20120926224604.2cb082f2@skate>
 <50636C68.5030601@gmail.com>
Message-ID: <506445C0.7010906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/27/2012 12:58 AM, vaxon wrote:
> On 09/27/2012 12:46 AM, Thomas Petazzoni wrote:
>> Dear Valentine Barshak,
>>
>> On Wed, 26 Sep 2012 23:34:51 +0400, Valentine Barshak wrote:
>>
>>> +ifeq ($(BR2_PACKAGE_LIBDVDREAD),y)
>>> +MPLAYER_CONF_OPTS +=  \
>>> +    --enable-dvdread \
>>> +    --disable-dvdread-internal \
>>> +    --with-dvdread-config=$(STAGING_DIR)/usr/bin/dvdread-config
>>> +MPLAYER_DEPENDENCIES += libdvdread
>>> +endif
>>
>> Don't we want a:
>>
>> else
>> MPLAYER_CONF_OPTS += --disable-dvdread --disable-dvdread-internal
>> endif
>
> Not really, these options are set to "auto" by default and will be
> disabled when mplayer fails to find libcdio which internal dvdread
> depends on.
>
> Thus, it builds fine with or without .
>
> I did not manually disable it in case libcdio is added later so that
> mplayer would use it for internal dvdread when libdvdread is disabled.
>
>>
>>> +ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
>>> +MPLAYER_CONF_OPTS +=  \
>>> +    --enable-dvdnav \
>>> +    --with-dvdnav-config=$(STAGING_DIR)/usr/bin/dvdnav-config
>>> +MPLAYER_DEPENDENCIES += libdvdnav
>>> +endif
>>
>> else
>> MPLAYER_CONF_OPTS += --disable-dvdnav
>> endif

Same here. I don't think disabling dvdnav would give us anything.

Why not let mplayer try other choices (like internal dvd libs)
and auto-disable dvd support if the checks fail.

Thomas, I can add this options if you like, but really don't see any 
gain in them.

Thanks,
Val.

>>
>> Thanks,
>>
>> Thomas
>>
>
