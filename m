From: Andreas Naumann <dev@andin.de>
Date: Wed, 27 Mar 2019 23:08:20 +0100
Subject: [Buildroot] [PATCH v4 1/6] qt5base: Do not build shared libs if
 BR2_STATIC_LIBS is chosen
In-Reply-To: <4d310445-b8fe-1c37-07d7-989fe9ee1270@mind.be>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-2-anaumann@ultratronik.de>
 <4d310445-b8fe-1c37-07d7-989fe9ee1270@mind.be>
Message-ID: <3abfba4d-b0c8-7467-af49-70854b956c67@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 25.03.19 um 23:13 schrieb Arnout Vandecappelle:
> 
> 
> On 22/03/2019 19:38, Andreas Naumann wrote:
>> Traditionally we configured qt5 to always build shared libraries. 
>> This resulted in many conditionals when setting buildroot to 
>> static-libs only, because each module's target install had to be 
>> guarded. So to avoid this and simplify target install in a 
>> subsequent commit, configure qt to build (and install) only the 
>> type of libs which the buildroot defconfig is set to. Unfortunately
>> it seems that Qt does not support building both dynamic and static
>> libs at the same time, so we still set it shared if buildroot asks
>> for both.
>> 
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de> --- 
>> package/qt5/qt5base/qt5base.mk | 9 +++++++-- 1 file changed, 7 
>> insertions(+), 2 deletions(-)
>> 
>> diff --git a/package/qt5/qt5base/qt5base.mk 
>> b/package/qt5/qt5base/qt5base.mk index 14536980a8..a8bec84123 
>> 100644 --- a/package/qt5/qt5base/qt5base.mk +++ 
>> b/package/qt5/qt5base/qt5base.mk @@ -24,8 +24,13 @@ 
>> QT5BASE_CONFIGURE_OPTS += \ -no-iconv \ -system-zlib \ -system-pcre
>> \ -	-no-pch \ -	-shared +	-no-pch + +ifeq 
>> ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y) 
>> +QT5BASE_CONFIGURE_OPTS += -shared +else ifeq 
>> ($(BR2_STATIC_LIBS),y) +QT5BASE_CONFIGURE_OPTS += -static +endif
> 
> For cmake-package, we do the equivalent of
> 
> ifeq ($(BR2_STATIC_LIBS),y) QT5BASE_CONFIGURE_OPTS += -static else 
> QT5BASE_CONFIGURE_OPTS += -shared endif
> 
> which is IMO both correct and readable.

True. Same thing, simpler code. I take it.

Regards,
Andreas

> 
> Regards, Arnout
> 
> 
>> 
>> ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y) QT5BASE_DEPENDENCIES += 
>> pcre
>> 
> 
