From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 17 Jul 2015 13:34:42 -0300
Subject: [Buildroot] [RFC/PATCH] linux: remove the zImage before rebuild
In-Reply-To: <55A926DC.9010803@mentor.com>
References: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>
 <55A926DC.9010803@mentor.com>
Message-ID: <20150717163442.GA6466@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hollis,

On Fri, Jul 17, 2015 at 09:01:32AM -0700, Hollis Blanchard wrote:
> Hi Guido, I just ran across this discussion
> <http://patchwork.ozlabs.org/patch/394002/> in patchwork, and wanted
> to say I hit the same thing this week (and spent a few hours figuring
> out what had gone wrong). Has there been any activity on the problem
> recently?
No, not really. We thought of changing quite a bit of the linux.mk file
to avoid this problem but I never got around to it :(.

I'll try to work on it in the following days, however feel free to do so
before me and send the patch :).

In any case you can use this workaround in the mean time, I've been
doing exactly that.

Cheers!

> Hollis Blanchard
> Mentor Graphics Emulation Division
> 
> On 09/26/2014 04:22 PM, Guido Mart?nez wrote:
> > Currently, if we run "make linux-rebuild", the device tree blob gets
> > appended twice to the kernel image, rendering the latter append useless.
> >
> > Fix this by removing the zImage before building, so the DTB append runs
> > on a fresh kernel image. This is not optimal as the final Linux linking
> > step is run again, but at least we get sensible results.
> >
> > Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> > ---
> > Hi guys,
> >
> > Has anyone ran into the above problem? It was a small headache for me,
> > so I wrote this small patch.
> >
> > It's not great, the right thing to do would be copying the zImage out
> > of the kernel tree and appending the DTB there, but my attempt at doing
> > that broke some other builds. This should work every time.
> >
> >
> >  linux/linux.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 2fb7437..14c2b8e 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -263,6 +263,10 @@ endif
> >  # Compilation. We make sure the kernel gets rebuilt when the
> >  # configuration has changed.
> >  define LINUX_BUILD_CMDS
> > +	# Remove the previous image, if it exists, to prevent appending
> > +	# multiple DTBs
> > +	rm -f $(KERNEL_ARCH_PATH)/boot/zImage
> > +
> >  	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
> >  		cp $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
> >  	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
> 

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
