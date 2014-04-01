From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Apr 2014 20:14:37 +0200
Subject: [Buildroot] [PATCH 3/6] package/mesa3d: is a full-openGL
 provider if X.org is present
In-Reply-To: <533A6F37.9050805@crapouillou.net>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <7b289a2d0fd88d16d66a9ce87db4a3a43821c630.1396302677.git.yann.morin.1998@free.fr>
 <533A6F37.9050805@crapouillou.net>
Message-ID: <20140401181437.GA3291@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2014-04-01 09:48 +0200, Paul Cercueil spake thusly:
> I don't see the "if X.org is present" part in your patch, what would prevent
> me from trying to enable OpenGL on a X11-less system?

Right, the commit log does not really match the changeset.

> You make BR2_PACKAGE_MESA3D_DRIVER select BR2_PACKAGE_HAS_OPENGL but that is
> wrong. Typically a X11-less system will enable a Gallium driver, while
> Mesa's OpenGL requires a DRI driver (hence the dependency on X11).

This is the same change Bernd did in his patch. I initially did:

    config BR2_PACKAGE_MESA3D
        bool "mesa3d"
        select BR2_PACKAGE_HAS_OPENGL if BR2_PACKAGE_XORG7

    if BR2_PACKAGE_MESA3D

    config BR2_PACKAGE_PROVIDES_OPENGL
        default "mesa3d" if BR2_PACKAGE_XORG7

    endif

(only quoting the relevant parts)

But as Bernd (who seems much more knowledgeable than I in mesa3d) made
than depend on BR2_PACKAGE_MESA3D_DRIVER, I eventually did the same.

> What I suggest is to select BR2_PACKAGE_HAS_OPENGL only from
> BR2_PACKAGE_MESA3D_DRI_DRIVER, and make BR2_PACKAGE_MESA3D_DRI_DRIVER
> available only if X11 is enabled, since it makes no sense building X11-only
> drivers in that case.

But MESA3D_DRI_DRIVE is a blind option that is selected by the various
Gallium or DRI drivers.

Of those drivers, only the i965 DRI driver depends on XORG7, the other
DRI drivers, as well as the Gallium drivers, do not depend on XORG7.

Here are all the drivers:
    nouveau (Gallium)
    vmware  (Gallium)
    swrast  (Gallium)
    swrast  (DRI)
    i965    (DRI) depends on XORG7
    radeon  (DRI)

So, taking your comment into account, only the i965 should provide
full-openGL, since it's the only one that guarantees X.org is present.

However, are the others missing a dependency on XORG7? Is it possible
(and meaningful) to build the nouveau Gallium driver without X.org? The
radeon driver? ...

I have to admit I am a bit lost in all this mess... :-(

So, here is basically what I propose for now:

  - move the select _HAS_OPENGL to BR2_PACKAGE_MESA3D_DRI_DRIVER
  - do the select only if XORG7 is selected
  - add missing dependencies on XORG7 based on your feedback on the
    above question.


BTW, there is a bug in the way BR2_PACKAGE_MESA3D_DRI_DRIVER is defined:

    config BR2_PACKAGE_MESA3D_DRI_DRIVER
        select BR2_PACKAGE_MESA3D_DRIVER
        depends on !BR2_PREFER_STATIC_LIB
        bool

None of the symbols that select BR2_PACKAGE_MESA3D_DRI_DRIVER do depend
on !BR2_PREFER_STATIC_LIB, so we can end-up in an unmet-dependency hell.

Basically, adding a 'depends on' to a no-prompt symbol is just wrong.

I'll fix that in my series.

> Also, the original Config.in has options to enable EGL/GLES, having an
> option to toggle OpenGL would be nice too, I think

Well, we can add such an option in a follow-up patch; I do not like to
mix fixes and enhancements in the same patch.

> (and OpenVG, but that's a
> separate issue).

Ditto, it can be in a follow-up patch.

Thank you for the review! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
