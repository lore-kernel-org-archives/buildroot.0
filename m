From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Nov 2015 22:20:34 +0100
Subject: [Buildroot] [PATCH 07/21 RFC] package/gcc: handle licensing
 information
In-Reply-To: <20151117123100.16fb8915@free-electrons.com>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <f3b2a1958ec5d8edccfdb0b2af7e351bbf3575c0.1447713615.git.yann.morin.1998@free.fr>
 <20151117123100.16fb8915@free-electrons.com>
Message-ID: <20151117212034.GD3703@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-17 12:31 +0100, Thomas Petazzoni spake thusly:
> On Mon, 16 Nov 2015 23:47:02 +0100, Yann E. MORIN wrote:
> > We currently install no licensing information for gcc. But the way we
> > build gcc makes it tricky to add licensing information:
> > 
> >   - we do not build host-gcc; rather, we build host-gcc-initial and
> >     host-gcc-final,
> > 
> >   - we do not want to save licensing information for host-gcc-initial
> >     and host-gcc-final, because what really makes sense from a user's
> >     point of view is really host-gcc.
> > 
> > So, we make gcc a real host-generic-package for which we do not define
> > any configure, build or install command, but for which we do have
> > licensing information.
> > 
> > Then for both host-gcc-initial and host-gcc-final, we fake them to be
> > non-redistributable, because the licensing information for them is not
> > needed, nor is it needed to save their archives.
> > 
> > Finally, we make both host-gcc-initial and host-gc-final depend on
> > host-gcc, so that host-gcc is handled by the legal-info framework.
> > 
> > Thus, legal-info will now save the gcc source and licensing information,
> > and ignore host-gcc-initial and host-gcc-final.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This I dislike very much. host-gcc is not a package, and it doesn't
> exist. package/gcc/gcc.mk just contains common definitions to both
> gcc-initial and gcc-final. Making 'gcc' a package is more confusing
> than anything else.

OK.

> I believe a much better approach is to simply add the licensing
> informations to the gcc-final package, and leave gcc-initial with no
> licensing information. If having a package named "gcc-final" in the
> licensing report is really shocking for you, then we can rename
> gcc-final to just "gcc", and have something like:
> 
>  + package/
>    + gcc/
>      + gcc-common.mk
>      + gcc-initial/
>        + gcc-initial.mk
>      + gcc/
>        + gcc.mk

I have to admit this looks good to me. So, I'll be working with that new
goal in mind. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
