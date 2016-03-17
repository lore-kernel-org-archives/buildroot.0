From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Mar 2016 09:10:08 +0100
Subject: [Buildroot] [PATCH 07/16] musl: build broken on Thumb,
 use ARM mode
In-Reply-To: <56E9E8B9.3060909@mind.be>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-8-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9E8B9.3060909@mind.be>
Message-ID: <20160317091008.3f74b283@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 00:14:01 +0100, Arnout Vandecappelle wrote:

> > +# Thumb build is broken, build in ARM mode
> 
>   The comment about all our thumb1 architectures supporting arm mode should be 
> repeated here IMHO.
> 
> > +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> 
>   So this one would also have to be changed if INSTRUCTIONS_THUMB2 is removed. 
> Hm, maybe not such a good idea after all... So instead, just add a depends on 
> !THUMB2 to BR2_ARM_INSTRUCTIONS_THUMB.

Aah, so you come to the same conclusion as me: keeping
BR2_ARM_INSTRUCTIONS_THUMB *and* BR2_ARM_INSTRUCTIONS_THUMB2 is
simpler :-)

The depends on !BR2_ARM_CPU_HAS_THUMB2 indeed needs to be added to
BR2_ARM_INSTRUCTIONS_THUMB if we change BR2_ARM_CPU_HAS_THUMB2 to make
it select BR2_ARM_CPU_HAS_THUMB. IMO, this is a rather useless change,
since in practice, you don't care that Thumb2 is a superset of Thumb:
you will only allow Thumb2 for Thumb2-capable cores, and only allow
Thumb for Thumb-capable cores.

But if you like it, I'm happy to do this useless change :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
