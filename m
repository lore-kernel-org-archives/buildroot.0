From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 06:29:48 +0200
Subject: [Buildroot] [PATCHv2 2/4] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <52377A96.8080402@mind.be>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <52377A96.8080402@mind.be>
Message-ID: <20130917062948.6a0365a3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 16 Sep 2013 23:39:34 +0200, Arnout Vandecappelle wrote:

>   I would prefer this to be in package/Config.in, and source 
> $BR2_EXTERNAL/package/Config.in. I think 95% of the use cases will be
> for packages, and the other 5% are bootloaders which are the same as
> packages anyway. And even if it is not a proper generic package (e.g.
> it's a filesystem), putting it in the packages menu doesn't hurt that
> much. If you don't put it in the package subdirectory, then you
> either force users to create a oneline Config.in, or you end up with
> a messy looking directory mixing packages with the configs/ and
> board/ directories.
> 
> 
>   Also it is perhaps better to add to the Makefile:
> 
> ifeq ($(wildcard $(BR2_EXTERNAL)/package/Config.in,)
> EXTERNAL_PACKAGE_CONFIG_IN = support/dummy-external/Config.in
> else
> EXTERNAL_PACKAGE_CONFIG_IN = $(BR2_EXTERNAL)/package/Config.in
> endif
> 
> (and pass that to the config env as well).
> 
>   That way, you're not obliged to have a Config.in in your external
> tree, and it is still possible to use it for nothing more than the
> defconfigs etc.
> 
> > diff --git a/Makefile b/Makefile
> > index 13ad342..bea5ad5 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -348,6 +348,10 @@ include boot/common.mk
> >   include linux/linux.mk
> >   include system/system.mk
> >
> > +ifeq ($(BR2_EXTERNAL_USED),y)
> > +include $(BR2_EXTERNAL)/external.mk
> 
>   Here I'd
> 
> -include $(sort $(wildcard $(BR2_EXTERNAL)/package/*/*.mk))

Right, it's a question of vision on what BR2_EXTERNAL should allow. As
I already stated, I originally had the same idea as you, but then
thought that including the external Config.in at the top-level, and
including an external.mk was offering more customization possibilities.

But I agree with you that 'enforcing' the usage of BR2_EXTERNAL only
for packages might be a good idea. It provides a clear guideline on how
BR2_EXTERNAL should be used/organized, which is probably good.

Unless there is opposition from others, I believe I'll move in the
direction you're proposing.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
