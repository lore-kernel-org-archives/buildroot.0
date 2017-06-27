From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 27 Jun 2017 22:03:53 +0200
Subject: [Buildroot] [PATCH v2] pulseaudio: bump version to 10.0
In-Reply-To: <20170627211557.76aa88e6@gmx.net>
References: <20170626222558.20574-1-ps.report@gmx.net>
 <ku292ex3r1.ln2@ID-313208.user.individual.net>
 <20170627211557.76aa88e6@gmx.net>
Message-ID: <20170627220353.7624f94d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Tue, 27 Jun 2017 21:15:57 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Bernd,
> 
> 
> On Tue, 27 Jun 2017 06:19:00 +0200, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> 
> > Am Tue, 27 Jun 2017 00:25:58 +0200 schrieb Peter Seiderer:
> > 
> > > ToDo/FollowUp: pulseaudio uses now a built-in json parser (see [2]),
> > > drop the json-c (and maybe the BR2_TOOLCHAIN_HAS_SYNC_4) dependency.
> > 
> > Hi Peter,
> > 
> > in http://patchwork.ozlabs.org/patch/718184/ I tried that but the 
> 
> Ups, missed your patch, sorry for the noise...
> 
> > configure logic of pulseaudio seems not to be an easy one. Can you help 
> > here?
> 
> Did take a quick look today at it...yes seems tricky, no quick solution
> from my side...
> 

Did take a second look at the configure.ac file, I think the wanted (and
straight forward) solution is to to relay on the __sync_ built-ins (as
before Thomas Petazzoni patch 'pulseaudio: remove BR2_ARCH_HAS_ATOMICS dependency'
(see [1]), to avoid the special atomic-arm-linux-helpers/atomic-arm-memory-barrier
handling and/or the handling in the else case of the __sync_ test....

The solution would be a partly revert of Thomas commit with a change to BR2_TOOLCHAIN_HAS_SYNC_4
(or similar, not sure how to check which are needed)...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=7290dc1e87b23fe21c75c50b2238004273a0ec5c

	$ grep -R __sync_ pulseaudio-10.0/
pulseaudio-10.0/src/pulsecore/atomic.h:    __sync_synchronize();
pulseaudio-10.0/src/pulsecore/atomic.h:    __sync_synchronize();
pulseaudio-10.0/src/pulsecore/atomic.h:    return __sync_fetch_and_add(&a->value, i);
pulseaudio-10.0/src/pulsecore/atomic.h:    return __sync_fetch_and_sub(&a->value, i);
pulseaudio-10.0/src/pulsecore/atomic.h:    return __sync_bool_compare_and_swap(&a->value, old_i, new_i);
pulseaudio-10.0/src/pulsecore/atomic.h:    __sync_synchronize();
pulseaudio-10.0/src/pulsecore/atomic.h:    __sync_synchronize();
pulseaudio-10.0/src/pulsecore/atomic.h:    return __sync_bool_compare_and_swap(&a->value, (long) old_p, (long) new_p);

> Regards,
> Peter
> 
> > 
> > Regards, Bernd
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
