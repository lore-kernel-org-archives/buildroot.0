From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 1 Feb 2016 16:38:06 +0100
Subject: [Buildroot] [PATCH v2 00/17] Rework atomic handling
In-Reply-To: <20160201161926.3b2488f8@free-electrons.com>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160201144730.7ca660e9@pcviktorin.fit.vutbr.cz>
 <20160201161926.3b2488f8@free-electrons.com>
Message-ID: <20160201163806.33d566ba@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 1 Feb 2016 16:19:26 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Jan,
> 
> On Mon, 1 Feb 2016 14:47:30 +0100, Jan Viktorin wrote:
> 
> > recently, I was doing some tests on MicroBlaze and discovered that I
> > am missing the atomic operations there. Then I could see this patch
> > series. Thanks for that, however, I have still issues with this.  
> 
> Ah, so you're doing some Microblaze stuff? If so, some help would
> definitely be welcome to maintain this platform.

Unfortunately, this is just a single test on MicroBlaze after quite a
long time. We've moved on to Zynq...

> 
> > The libatomic_ops claims to not support MicroBlaze in its Config.in.  
> 
> Right.
> 
> > So it is not possible to use either __sync_* ones nor __atomic_* ones.  
> 
> This has nothing to do with libatomic_ops or not.
> 
> __sync and __atomic built-ins are provided by gcc, the compiler.
> 
> They are completely orthogonal to libatomic_ops. Programs/libraries
> using __sync* or __atomic* functions do not need libatomic_ops. 
> 
> > Even if I change this and enable it for BR2_microblaze, I am unable to
> > compile the libatomic_ops properly (with the Buildroot toolchain 4.9.x).  
> 
> There is no support for Microblaze in libatomic_ops, so this is not
> surprising. See src/atomic_ops/sysdeps/gcc/ in the libatomic_ops
> sources.
> 
> Maybe with generic.h / generic-small.h, libatomic_ops can rely on the
> __sync or __atomic built-ins, but I haven't tried this possibility.
> 
> > Moreover, I've read somewhere that the new GCC connects the __sync_*
> > interface to the __atomic_* interface internally. Is it true?  
> 
> I don't know how things are implemented internally in gcc.
> 
> > Is this done by the libatomic_ops library? I am confused by this
> > situation... I made some wrappers doing the __sync_* to __atomic_*
> > translation but still with no success.  
> 
> Are you use you are not confusing libatomic_ops and libatomic ?
> 
> libatomic_ops is a separate project, which has nothing to do with gcc.
> 
> libatomic is a library part of gcc, which exists since gcc 4.7, and
> provided as part of the gcc runtime on the target.

So, this the source of my confusion. Yes, I thought that libatomic and
libatomic_ops are related or same as I couldn't find libatomic anywhere in the
Buildroot. Thanks for clarification.

If I have a library that links with __atomic_* calls I just need to
link with libatomic when building for MicroBlaze, is that correct?

Regards
Jan

> 
> Best regards,
> 
> Thomas



-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech
   Brno, Czech Republic
