From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 1 Aug 2019 19:09:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/mosquitto: allow to build as
 static lib
In-Reply-To: <87sgqlyxov.fsf@dell.be.48ers.dk>
References: <20190718100636.27290-1-titouan.christophe@railnova.eu>
 <20190718100636.27290-2-titouan.christophe@railnova.eu>
 <871ry518wo.fsf@dell.be.48ers.dk> <87sgqlyxov.fsf@dell.be.48ers.dk>
Message-ID: <b1957631-ca8b-38ab-9b24-5549e8e13e23@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thank you for reviewing this series !

On 8/1/19 12:41 PM, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> Hi,
> 
>   >> +ifeq ($(BR2_STATIC_LIBS),y)
>   >> +MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=yes WITH_SHARED_LIBRARIES=no
>   >> +else
>   >> +MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=no WITH_SHARED_LIBRARIES=yes
>   >> +endif
> 
>   > We actually have 3 variants:
> 
>   > - static only (BR2_STATIC_LIBS)
>   > - shared only (BR2_SHARED_LIBS)
>   > - shared and static (BR2_SHARED_STATIC_LIBS)
> 
>   > So I reworked it to take that into consideration and committed, thanks.
> 
> Sorry, I will have to take that back. I did a test compilation with a
> completely static (BR2_STATIC_LIBS) setup, which failed:

Could you share the defconfig you have used to obtain that result ?

When I run test-pkg with BR2_PACKAGE_MOSQUITTO=y (and 
BR2_PACKAGE_MOSQUITTO_BROKER defaults to y), I see: 
"""br-arm-full-static [5/6]: OK""".

> 
> In file included from security.c:25:
> lib_load.h:23:11: fatal error: dlfcn.h: No such file or directory
>   # include <dlfcn.h>
>             ^~~~~~~~~
> compilation terminated.
> 
> The loadable plugin logic in security.c seems to be built
> unconditionally, so that cannot work in a completely static setup.
> 
> Care to bring up this issue upstream?

As soon as I understand the conditions to reproduce, I will do so.

> 
> In the mean time I have marked your patch as changes requested. For
> reference, the changes I did in mosquitto.mk look like this:
> 
> feq ($(BR2_SHARED_LIBS),y)
> MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=no
> else
> MOSQUITTO_MAKE_OPTS += WITH_STATIC_LIBRARIES=yes
> endif
> 
> ifeq ($(BR2_STATIC_LIBS),y)
> MOSQUITTO_MAKE_OPTS += WITH_SHARED_LIBRARIES=no
> else
> MOSQUITTO_MAKE_OPTS += WITH_SHARED_LIBRARIES=yes
> endif
> 

Thanks for sharing !

Best regards,
Titouan
