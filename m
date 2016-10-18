From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 18 Oct 2016 21:01:10 +0200
Subject: [Buildroot] [PATCH v1] motion: fix sdl-config detection
In-Reply-To: <20161018120252.2e27edf2@free-electrons.com>
References: <1476737088-1492-1-git-send-email-ps.report@gmx.net>
 <20161018120252.2e27edf2@free-electrons.com>
Message-ID: <20161018210110.0192f549@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 18 Oct 2016 12:02:52 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Mon, 17 Oct 2016 22:44:48 +0200, Peter Seiderer wrote:
> > Overwrite ac_cv_path_CONFIG_SDL in case sdl development is
> > installed on the host.
> > 
> > Fixes [1]:
> > 
> >   ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/SDL'
> > 
> > [1] http://autobuild.buildroot.net/results/459/4592eb83efa393f77f5ee014f93a271f2313bee6
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> I've applied to master, however, one question below.
> 
> 
> >  ifeq ($(BR2_PACKAGE_SDL),y)
> >  MOTION_DEPENDENCIES += sdl
> >  MOTION_CONF_OPTS += --with-sdl=$(STAGING_DIR)/usr
> 
> With the ac_cv_path_CONFIG_SDL, is this --with-sdl still really
> necessary?
> 
> If it uses the sdl-config script to get the SDL path, then it should
> theoretically no longer be needed.
> 

If I read the code from configure.ac right '--with-sdl' is needed, but the
given path could be omitted (as it is ignored in case a local/host
version of sdl-config is found first, therefore ac_cv_path_CONFIG_SDL is
needed):

 211 #
 212 # Check for sdl library
 213 #
 214 SDL_SUPPORT="no"
 215 AC_ARG_WITH(sdl,
 216 [  --with-sdl[=DIR]          Specify the prefix for the install path for
 217                           sdl-config to get stream in SDL window (optional).
 218 ],
 219 [],
 220 [withval="no"])
 221 if test "x$withval" = "xno"; then
 222         AC_MSG_CHECKING(for sdl)
 223         AC_MSG_RESULT(skipped)

...sdl skipped without '--with-sdl' option...

 224 else
 225         AC_PATH_PROG([CONFIG_SDL], [sdl-config], [], [${PATH}:${withval}:${withval}/bin])

...sdl-config from local path taken before the one from given path...

 226         if test -z "`($CONFIG_SDL --version) 2>/dev/null`" ;then
 227                 echo ""
 228                 echo "****************************************************"
 229                 echo "* sdl-config could not be found. Please install it *"
 230                 echo "* and remove the --with-sdl configure argument.    *"
 231                 echo "* libSDL can be found at http://www.libsdl.org     *"
 232                 echo "****************************************************"
 233                 echo ""
 234         else
 235                 SDL_SUPPORT="yes"
 236                 TEMP_LIBS="$TEMP_LIBS `${CONFIG_SDL} --libs`"
 237                 TEMP_CFLAGS="${TEMP_CFLAGS} `${CONFIG_SDL} --cflags`"
 238                 AC_DEFINE([HAVE_SDL],1,[Define to 1 if you have SDL support])
 239                 SDL_OBJ="sdl.o"
 240                 AC_SUBST(SDL_OBJ)
 241         fi
 242 fi


Regards,
Peter

> Thanks,
> 
> Thomas
