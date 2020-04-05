From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2020 09:06:22 +0200
Subject: [Buildroot] systemd 245 build issues with the old codesourcery
 ARM 2014.05 toolchain
In-Reply-To: <8e34eee5-6e6e-7aff-a0ab-bf86677b9313@smile.fr>
References: <dc50e1db-aead-b8f5-cfd8-6645e433429f@smile.fr>
 <20200404175305.GG22325@scaer>
 <8e34eee5-6e6e-7aff-a0ab-bf86677b9313@smile.fr>
Message-ID: <20200405070622.GI22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-04-04 21:19 +0200, Romain Naour spake thusly:
> Le 04/04/2020 ? 19:53, Yann E. MORIN a ?crit?:
> > On 2020-04-04 19:43 +0200, Romain Naour spake thusly:
> >> Since the last systemd bump to version 245, all our systemd based tests are
> >> failing to build:
> > [--SNIP--]
> >> This is due to the following build issue:
> >> ../src/shared/gpt.c:7:9: error: initializer element is not constant
> >>          { GPT_ROOT_X86,              "root-x86"              },
> > [--SNIP--]
> >> While searching for "error: initializer element is not constant" message, I
> >> noticed a note about gcc 5 change about "Initializing statics with compound
> >> literals":
> >>
> >> https://gcc.gnu.org/gcc-5/porting_to.html
> >>
> >> I'm not sure it's worth the effort to patch and try to upstream a patch to
> >> systemd for the sake of building systemd with such old compiler (gcc < 5.0).
> > 
> > What about this patch:
> > 
> >     diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> >     index bd638477a0..1280d82902 100644
> >     --- a/package/systemd/Config.in
> >     +++ b/package/systemd/Config.in
> >     @@ -19,6 +19,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
> >      	depends on !BR2_STATIC_LIBS # kmod
> >      	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> >      	depends on BR2_USE_MMU # dbus
> >     +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> >      	select BR2_PACKAGE_HAS_UDEV
> >      	select BR2_PACKAGE_DBUS # runtime dependency only
> >      	select BR2_PACKAGE_LIBCAP
> >     diff --git a/system/Config.in b/system/Config.in
> >     index c8c5be40e0..8c1d47f13f 100644
> >     --- a/system/Config.in
> >     +++ b/system/Config.in
> >     @@ -121,6 +121,7 @@ config BR2_INIT_SYSTEMD
> >      	depends on BR2_USE_MMU
> >      	depends on !BR2_STATIC_LIBS
> >      	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> >     +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> >      	select BR2_ROOTFS_MERGED_USR
> >      	select BR2_PACKAGE_SYSTEMD
> 
> I would restrict to BR2_TOOLCHAIN_GCC_AT_LEAST_5.

Yes, I just copy-pasted the first hit I found on GCC_AT_LEAST and forgot
to fix it to 5.

> But then, we have to update InitSystemSystemdBase to use another toolchain since
> the codesourcery ARM 2014.05 will not be usable.

Sure.

Regards,
Yann E. MORIN.

> I can provide patches if every one is ok to use a bootlin toolchain 2017.05 or
> later :)
> 
> Best regards,
> Romain
> 
> 
> >      
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
