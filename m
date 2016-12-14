From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Dec 2016 17:41:28 +0100
Subject: [Buildroot] [PATCH 1/3] core: allow packages to declare a
	permission file
In-Reply-To: <87zijz1n1j.fsf@dell.be.48ers.dk>
References: <cover.1481665059.git.yann.morin.1998@free.fr>
 <548994759a3a6202962c0479c6602363d8814c2b.1481665059.git.yann.morin.1998@free.fr>
 <87zijz1n1j.fsf@dell.be.48ers.dk>
Message-ID: <20161214164128.GA3617@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-12-13 23:28 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Currently, packages can define a variable that holds all the permissions
>  > to set on the files it installs. This can be used to set various
>  > permissions, like ownership, mode, suid/sgid/sticky bits to individual
>  > files.
> 
>  > However, this variable has to contain entries that are known the moment
>  > we scan the .mk file; it is not possible to conditionally add permisions
>  > for files which presence depend on post-parse conditions.
> 
>  > This is the case for example for Busybox, for which we don't know whether
>  > a specific applet will be enabled or not until after the configure
>  > command has run.
> 
>  > Introduce a new variable that packages can set to point to a file that
>  > contains a permission table. That filewill only be used when a filesystem
>  > image is asembled, so the file can be generated, either at configure or
>  > build time, with no problem.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>  > ---
>  > Note: this will be usefull for Busybox, to properly handle the SELinux
>  > contexts of the individual applets.
>  > ---
>  >  fs/common.mk           | 1 +
>  >  package/pkg-generic.mk | 1 +
>  >  2 files changed, 2 insertions(+)
> 
>  > diff --git a/fs/common.mk b/fs/common.mk
>  > index 7515fdc..843f7ca 100644
>  > --- a/fs/common.mk
>  > +++ b/fs/common.mk
>  > @@ -90,6 +90,7 @@ ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
>  >  	$$(call PRINTF,$$(PACKAGES_DEVICES_TABLE)) >> $$(FULL_DEVICE_TABLE)
>  >  endif
>  >  	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(FULL_DEVICE_TABLE)
>  > +	cat $$(PACKAGES_PERMISSIONS_TABLE_FILES) >> $$(FULL_DEVICE_TABLE)
> 
> We need to protect against the case where this is empty, similar to how
> we do it for the rootfs table files.

Indeed.

> Notice that you called it PACKAGES_PERMISSIONS_TABLE_FILES here and
> PACKAGES_PERMISSIONS_FILES elsewhere.

Yup, but as I said in the cover-letter, it was just to show how we could
let packages specify a permissions table rather than a in-line value.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
