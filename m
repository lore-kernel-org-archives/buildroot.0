From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 30 Nov 2015 13:04:34 +0100
Subject: [Buildroot] [PATCH 1/2] help: add a way to document targets
	declared in local.mk/external.mk
In-Reply-To: <20151129202650.GI3630@free.fr>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
 <20151129202650.GI3630@free.fr>
Message-ID: <1691926.UbH5yYOTKg@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sunday 29 November 2015 21:26:50 Yann E. MORIN wrote:
> J?r?me, All,
> 
> On 2015-11-18 15:37 +0100, J?r?me Pouiller spake thusly:
> > It is handy to use local.mk or external.mk to add specific targets
> > for current project. However, until now, it not possible to add help
> > message these targets.
> > This patch add LOCAL_HELP variable. This variable is aimed to be
> > assigned from any .mk files. Its content is displayed with 'make
> > help'.> 
> > For exemple:
> >   LOCAL_HELP += "flash                  - Flash target"
> >   LOCAL_HELP += "chroot                 - Chroot into target/"
> >   LOCAL_HELP += "qemu                   - Run image with qemu"
> >   LOCAL_HELP += "install-nfs            - Extract rootfs in
> >   \$$NFSROOT (=$(NFSROOT))" LOCAL_HELP += "`printf '%-22s%s'
> >   '$(var)-feature' ' - Call $(var) feature'`" LOCAL_HELP += "Please
> >   contact support at company.com in case of problem."> 
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > ---
> > 
> >  Makefile | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index 80c264f..4322da9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -901,6 +901,11 @@ ifeq ($(BR2_TARGET_BAREBOX),y)
> > 
> >  	@echo '  barebox-menuconfig     - Run barebox menuconfig'
> >  	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
> >  
> >  endif
> > 
> > +ifneq ($(LOCAL_HELP),)
> > +	@echo
> > +	@echo 'Local targets:'
> > +	@for i in $(LOCAL_HELP); do echo "  $$i"; done
> > +endif
> 
> Well, for help from extenal.mk (or local.mk, but I'd arue that would
> be a bad idea, given that local.mk is supposedly short-lived), there
> is in my opinion a much better solution.
> 
> Change the 'help' rule to a double-colon make rule, like so:
> 
>     help::
>         echo Current Buildroot help
> 
> Then you can add as many such rules in as many places you want,
> especially in external.mk, and the will be appended one after the
> others.
Nice trick.


> We just have to ensure that our help comes before the external ones,
> so maybe you'll have to move our help block before inclusion of
> external.mk...

I have a slight preference for my proposal since I think it allows a 
finer control of the way extra help is handled. However, I have no 
problem to send a new patch using your trick.

Regards,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
