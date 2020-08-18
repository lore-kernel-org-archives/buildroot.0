From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 18 Aug 2020 12:08:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: bump to v1.6.11
In-Reply-To: <87imdh1gh2.fsf@dell.be.48ers.dk>
References: <20200817091055.203521-1-titouan.christophe@railnova.eu>
 <87imdh1gh2.fsf@dell.be.48ers.dk>
Message-ID: <6457cc97-7a3f-94e4-2350-acb220d69f7a@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On 17/08/20 16:42, Peter Korsgaard wrote:
>>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:
> 
>   > Mosquitto 1.6.11 is a bugfix release, read the whole announcement on
>   > http://mosquitto.org/blog/2020/08/version-1-6-11-released/
> 
>   > From the changelog of the client library:
>   > mosquitto_loop_start() now sets a thread name on Linux, FreeBSD, NetBSD,
>   > and OpenBSD. Closes #1777.
>   > This is done with pthread_setname_np; so mosquitto now requires
>   > BR2_TOOLCHAIN_HAS_THREADS_NPTL.
> 
>   > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
>   > ---
>   >  package/mosquitto/Config.in      | 4 ++++
>   >  package/mosquitto/mosquitto.hash | 4 ++--
>   >  package/mosquitto/mosquitto.mk   | 2 +-
>   >  3 files changed, 7 insertions(+), 3 deletions(-)
> 
>   > diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
>   > index b4effa36be..21cd56c492 100644
>   > --- a/package/mosquitto/Config.in
>   > +++ b/package/mosquitto/Config.in
>   > @@ -1,5 +1,6 @@
>   >  config BR2_PACKAGE_MOSQUITTO
>   >  	bool "mosquitto"
>   > +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL  # pthread_setname_np
> 
> We have logic to build mosquitto without threading support
> (WITH_THREADING=no), so this should normally not be needed. From a quick
> look, it does look like the pthread.h include in the new code isn't
> inside the WITH_THREADING conditional, but that is easy to fix.

I'll send a v2 with this patch 
https://github.com/eclipse/mosquitto/pull/1794.

> 
> For non-NPTL threads we could perhaps just build mosquitto without
> threading support rather than having to propagate the NPTL dependency
> (unless collectd/shairport-sync needs the threading API).
> 

Indeed, propagating the NPTL dependency is too restrictive. This should 
only be enforced when BR2_TOOLCHAIN_HAS_THREADS.

It looks like shairport-sync [1] and domoticz [2] are using 
mosquitto_loop_start from the threaded API, but I did not find it in 
collectd. However, both domoticz and shairport-sync already directly 
depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL anyway.

Best regards,

Titouan

[1] https://github.com/mikebrady/shairport-sync/blob/master/mqtt.c#L227-L229
[2] 
https://github.com/domoticz/domoticz/blob/master/main/mosquitto_helper.cpp#L344
