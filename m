From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 May 2014 18:29:00 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
In-Reply-To: <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
 <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
Message-ID: <20140518162900.GA3631@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On 2014-05-18 13:58 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:20140517205500.GL3459 at free.fr: 
> 
> >> -comment "xbmc requires an OpenGL ES and EGL backend"
> >> -     depends on BR2_arm || BR2_i386 || BR2_x86_64
> >> -     depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
> >> +comment "xbmc needs an OpenGL backend"
> >> +     depends on (!BR2_arm && (BR2_i386 || BR2_x86_64)) && \
> >> +          !BR2_PACKAGE_HAS_LIBGL && !(BR2_PACKAGE_HAS_LIBEGL &&
> >> BR2_PACKAGE_HAS_LIBGLES) +
> >> +comment "xbmc needs EGL & GLES support"
> > 
> > Please keep the original comment. Besides, this change makes the two
> > comments incoherent:
> > 
> >     comment "xbmc needs an OpenGL backend"
> >     comment "xbmc needs EGL & GLES support"
> 
> as I already stated ARM depends on EGL/GLES

Yep, now I saw the light.

> so my plan was to display
> 
> comment "xbmc needs EGL & GLES support"
> 
> on ARM, so users know what to enable, and
> 
> comment "xbmc needs an OpenGL backend"
> 
> on BR2_i386 || BR2_x86_64 only, here EGL/GLES or GL are accepted by xbmc.

Something like:

    comment "xbmc needs an OpenGL ES and EGL backend"
        depends on BR2_arm
        depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES

    comment "xbmc needs an OpenGL backend"
        depends on BR2_i386 || BR2_x86_64
        depends on !BR2_PACKAGE_HAS_LIBGL

should do the trick.

There's no need to play tricks with mutiple archs on the same depends:
        (i386 || x86_64) && !arm

is exactly the same of
        i386 || x86_64

since arm can't be set when either i386 or x86_64 are set: it's the
architecture, only one can be set at any one time. ;-)

[--SNIP--]
> >> +XBMC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) $(shell
> >> $(PKG_CONFIG_HOST_BINARY) --cflags egl)" \ +    
> >> CXXFLAGS="$(TARGET_CXXFLAGS) $(shell $(PKG_CONFIG_HOST_BINARY) --cflags
> >> egl)" 
> > 
> > He! This XBMC_CONF_ENV did not pre-exist, and did not seem to be needed.
> 
> For Gotham it fixes a build error, this section will be a preparatory patch 
> in v9.

OK, good.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
