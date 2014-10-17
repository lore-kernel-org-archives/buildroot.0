From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Oct 2014 23:07:15 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-imx: add package
In-Reply-To: <543D901B.8010806@mind.be>
References: <1412545628-12153-1-git-send-email-bisson.gary@gmail.com>
 <543A9384.8050803@lucaceresoli.net> <543B52A0.6060007@gmail.com>
 <543BC031.60606@lucaceresoli.net> <543D33DF.8070005@mind.be>
 <CADCpmyO_-VD52UDJf5MpZGDnTtzJwxyXcOONYwG-rsd4K_7DLQ@mail.gmail.com>
 <543D901B.8010806@mind.be>
Message-ID: <20141017210715.GF3971@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-10-14 23:05 +0200, Arnout Vandecappelle spake thusly:
> On 14/10/14 19:16, Gary Bisson wrote:
> > On Tue, Oct 14, 2014 at 7:31 AM, Arnout Vandecappelle <arnout@mind.be
> > <mailto:arnout@mind.be>> wrote:
> > 
> >     [snip]
> >     > # Required by gpu-viv-bin-mx6q
> >     > comment "gst1-plugins-imx needs an (e)glibc toolchain"
> >     >     depends on BR2_arm
> >     >     depends on !BR2_TOOLCHAIN_USES_GLIBC
> > 
> >      That's not the right place for pointing to gpu-viv-bin-mx6q. It should be
> >     something like:
> > 
> >     config BR2_PACKAGE_GST1_PLUGINS_IMX
> >             bool "gst1-plugins-imx"
> >             depends on BR2_LINUX_KERNEL
> >             depends on BR2_arm # Only relevant for i.MX
> >             depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-viv-bin-mx6q
> >             select BR2_PACKAGE_GPU_VIV_BIN_MX6Q
> >             # Cannot select libfslvpuwrap because user must select the CPU
> >             depends on BR2_PACKAGE_LIBFSLVPUWRAP
> > 
> >     (I added that thing about libfslvpuwrap but I'm not sure of it...)
> > 
> >  
> > That is actually what I said in the first e-mail, I am not proud of all those
> > dependencies but I couldn't find a way to select GPU_VIV_MX6Q as it is only
> > selectable if  FREESCALE_IMX_PLATFORM is set to FREESCALE_IMX_PLATFORM_IMX6Q. A
> > select like above would give an error but I'm open to any other solution.
> 
>  Actually, you can do
> 	select BR2_PACKAGE_FREESCALE_IMX
> 	select BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q

No you can't do that, because BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
is part of a choice, and you can not select a choice entry.

So a 'depends on' it must be in this case.

Not sure what to do about the comment, though. We currently have no such
case documented in the manual; only comments about toolchain deps are
described...

I'm not against adding comments about dependencies on other packages,
but I think we should keep them to a minimal level, like dependencies on
biggish stuff (like X.org), or non-obvious stuff.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
