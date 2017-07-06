From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 6 Jul 2017 12:14:46 +0300
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
 CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT for ARMv8
In-Reply-To: <407724d9-6ae3-b166-63df-7d1559d2160c@mind.be>
References: <20170705190840.22469-1-aperez@igalia.com>
 <20170705190840.22469-2-aperez@igalia.com>
 <407724d9-6ae3-b166-63df-7d1559d2160c@mind.be>
Message-ID: <20170706121446.GC21278@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for the reviewing :-)

On Wed, 5 Jul 2017 22:23:26 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 05-07-17 21:08, Adrian Perez de Castro wrote:
> > This is needed for correctly building some CMake-based packages which
> > use this variable. For example, this is needed for WebKitGTK+ 2.16.x
> > to build correctly when an ARMv8 target is configured.
> 
>  Well, it's needed for any cmake package on ARMv8...
> 
> 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> > ---
> >  package/pkg-cmake.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 401084fb12..914bda7482 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -219,6 +219,8 @@ else ifeq ($(BR2_ARM_CPU_ARMV6),y)
> >  CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv6
> >  else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
> 
>  I noticed that armv7m is also missing. Could you try to find the corresponding
> CMake architecture and add it?

Sure, I'll try and look into this.

>  Also, it could be useful to add
> 
> else
> $(error ARM CPU variant not set for CMake)
> endif
> 
>  Not *that* helpful for users, but better than the error you got :-)

I think that is a good idea. Even if for an user it is not so handy, it is
better to fail early. It took me a good while to figure out where was the root
of the issue was, and having an error message early would have been faster.
Even if a build succeeds without setting CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT,
not having a correct value here could potentially cause mysterious failures at
run-time. I'll be sending a patch for this later as well.

Cheers,

--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170706/4d9a046e/attachment.asc>
