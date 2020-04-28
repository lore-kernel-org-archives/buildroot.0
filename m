From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Apr 2020 09:55:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: set correct
 pkgconfig for native dependencies
In-Reply-To: <20200428091022.4c613e80@windsurf.home>
References: <20200428040638.122494-1-james.hilliard1@gmail.com>
 <20200428072202.5889620f@windsurf.home>
 <d96ae071-26fa-25a4-a508-d52d82daafeb@mind.be>
 <20200428091022.4c613e80@windsurf.home>
Message-ID: <0f40c7ae-22d4-f9fa-80e5-5b81617e8d78@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/04/2020 09:10, Thomas Petazzoni wrote:
> On Tue, 28 Apr 2020 08:50:43 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>> On 28/04/2020 07:22, Thomas Petazzoni wrote:
>>> +++ b/package/pkg-meson.mk
>>> @@ -87,6 +87,7 @@ define $(2)_CONFIGURE_CMDS
>>>  		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
>>>  		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
>>>  		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
>>> +		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \  
>>
>>  This can't be right. Here you're setting the pkg_config_path to the one for
>> native build. It may work in the specific case of wayland-scanner where you
>> actually want the native one, but it will break anything that requires the cross
>> package config.
> 
> Isn't the "build." scoping of that property going to make it apply only
> for the native parts of the build ?

 Ah, silly me, of course!

 Thanks James and Thomas for correcting me.

 So in that case, this patch looks good. But the meson.mk change should be a
separate patch, of course.

 I also wonder: is the pkg_config_path in cross-compilation.conf that I added in
4e0bc29993376613d200e892d491e31ea5a49622 completely disfunctional? In that case,
it should be replaced with a -Dtarget.pkg_config_path instead.

 If it does function, how is it possible that it works with
cross-compilation.conf but not with native-compilation.conf?

 Regards,
 Arnout
