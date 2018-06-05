From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jun 2018 17:25:36 +0200
Subject: [Buildroot] [PATCHv2] linux: may fail to boot for binutils
 2.29+ even without armv7m
In-Reply-To: <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be>
References: <20180601180157.759-1-yann.morin.1998@free.fr>
 <b3672758-0d2b-51cd-7eac-cc06158a995b@mind.be>
Message-ID: <20180605152536.GA2503@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-06-05 00:10 +0200, Arnout Vandecappelle spake thusly:
> 
> 
> On 01-06-18 20:01, Yann E. MORIN wrote:
> > Commit f13477b (linux: config.in: add comment for Arm Cortex-M) added a
> > comment so that the user that the linux kernel may miscompile with
> > binutils 2.29+, when the target is an armv7m CPU.
> > 
> > However, the real trigger is a compilation in thumb2 mode, which happens
> > to be the only option for armv7m CPUs.
> > 
> > We can't know whether the kernel will be built in arm or thumb2 mode,
> > though, because we do not have that information: it is only available in
> > the Linux' .config file, which we don;t have access to at the time we
> > run our menuconfig.
> > 
> > So, relax the conditions under which the comment is made, so that it
> > appears as soon as binutils are >= 2.29 (i.e. not 2.28, which is the
> > oldest we support) for ARM CPUs.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
> > Cc: Laurent GONZALEZ <br22@gezedo.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > 
> > ---
> > Changes v1 -> v2:
> >   - only applicable to ARM CPUs.  (Peter)
> > ---
> >  linux/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/linux/Config.in b/linux/Config.in
> > index bffb52fd18..c29b1f6c88 100644
> > --- a/linux/Config.in
> > +++ b/linux/Config.in
> > @@ -9,7 +9,7 @@ config BR2_LINUX_KERNEL
> >  if BR2_LINUX_KERNEL
> >  
> >  comment "Linux kernel may fail to boot with binutils >= 2.29"
> > -	depends on BR2_ARM_CPU_ARMV7M
> > +	depends on BR2_arm || BR2_armeb
> 
>  I have a bit of a problem with this patch. IMO it's rather unlikely that people
> build the kernel in THUMB mode on non-M CPUs. But now we're always showing this
> warning. I think it will confuse a number of people, and I don't think it's very
> likely that it will actually help anyone.

You are wrong in saying that people are unlikely to build Thumb kernels,
even on Cortex-A CPUs I does happen. I do know quite a few cases, for
sure. I would not say that it is most people; I don't know. But it does
happen quite a bit, yes.

However, I am indeed not so sure that we do need the comment, but at
least it is there now. And for sure, the previous conditions, although
correct, were not entirely accurate, as they missed some quite common
cases as well.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >  	depends on !BR2_BINUTILS_VERSION_2_28_X
> >  
> >  # Packages that need to have a kernel with support for loadable modules,
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
