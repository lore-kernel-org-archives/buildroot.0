From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2020 09:44:06 +0100
Subject: [Buildroot] [PATCH v8 19/20] package/kodi-visualisation-*: mass
 version bump
In-Reply-To: <frdcfgxnh9.ln2@ID-313208.user.individual.net>
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
 <20200118200620.3967240-20-bernd.kuhls@t-online.de>
 <20200118220358.GI32369@scaer>
 <frdcfgxnh9.ln2@ID-313208.user.individual.net>
Message-ID: <20200119084406.GL32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-01-18 23:35 +0100, Bernd Kuhls spake thusly:
> Am Sat, 18 Jan 2020 23:03:58 +0100 schrieb Yann E. MORIN:
> > On 2020-01-18 21:06 +0100, Bernd Kuhls spake thusly:
> >> Rebased
> >> package/kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-
> for-egl-with-pkg-config.patch
> > You said "rebased" but you removed it altogether. It has however never
> > been upstreamed, AFAICS... Care to comment/explai, please?
> > 
> > Note: if onlt the commit log needes to be fixed, no need to respin the
> > series, I can fix locally before applying.
> 
> Hi Yann,
> 
> you are right, the commit log needs to be rephrased:
> 
> Removed patch kodi-visualisation-shadertoy/0001-FindOpenGLES2-also-search-
> for-egl-with-pkg-config.patch because upstream removed glesv2 support:
> 
> https://github.com/xbmc/visualization.shadertoy/commit/
> d880b98b932efc0c57670ec3f2def947664b60b0

Actualy, they did not remove gles2 support at all, as far as I can see
in that comit log; exceprts:

      find_path(OPENGLES_INCLUDE_DIR GLES2/gl2.h
                                     PATHS ${PC_OPENGLES_INCLUDEDIR})
      find_library(OPENGLES_gl_LIBRARY NAMES ${_brcmprefix}GLESv2
                                       PATHS ${PC_OPENGLES_LIBDIR})
    [...]
    if(OPENGLES_FOUND)
      set(OPENGLES_LIBRARIES ${OPENGLES_gl_LIBRARY})
      if(OPENGLES3_INCLUDE_DIR)
        set(OPENGLES_INCLUDE_DIRS ${OPENGLES_INCLUDE_DIR} ${OPENGLES3_INCLUDE_DIR})
        set(OPENGLES_DEFINITIONS -DHAS_GLES=3)
        mark_as_advanced(OPENGLES_INCLUDE_DIR OPENGLES3_INCLUDE_DIR OPENGLES_gl_LIBRARY)
      else()
        set(OPENGLES_INCLUDE_DIRS ${OPENGLES_INCLUDE_DIR})
        set(OPENGLES_DEFINITIONS -DHAS_GLES=2)
        mark_as_advanced(OPENGLES_INCLUDE_DIR OPENGLES_gl_LIBRARY)
      endif()
    endif()

So they still support gles2, and they additionally added support for
gles3.

But OK, they rewrote the code. However, looking at the [atch you remove,
and looking at the new code, I am not sure what we tried to fix is not
broken again. For example, the pkg-config check was changed (in our
patch):

    -pkg_check_modules(OpenGLES2 glesv2)
    +pkg_check_modules(OpenGLES2 glesv2 egl)

And their new code does something that is equivalent to the original
line we patched:

    pkg_check_modules(PC_OPENGLES ${_brcmprefix}glesv2 QUIET)

So I wonder if we do not still need something similar to our patch...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
