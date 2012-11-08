From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 8 Nov 2012 11:49:58 +0100
Subject: [Buildroot] problem building a SDL app with buildroot
In-Reply-To: <ec166773-a3e8-47b9-be33-ea05a0cfccab@zimbra2.corp.accelance.fr>
References: <18ba4b30-2ac3-44e7-ae59-5ca40d8137b3@zimbra2.corp.accelance.fr>
 <ec166773-a3e8-47b9-be33-ea05a0cfccab@zimbra2.corp.accelance.fr>
Message-ID: <CAHXCMMJjaafke3POAv04fdK80L_DWguu+UdbDrah9HSYPfwf-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy,

2012/11/8 Jeremy Rosen <jeremy.rosen@openwide.fr>:
> Hello everybody
>
> I am trying to compile and package an app that is using the sdl library and I have a problem
>
> the program uses cmake as its build system and uses a small script called "sdl-config" to find the compile time parameters for sdl.
>
> that script is provided by the sdl library, and when grepping the output/ directory I can find it installed in
>
> output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/bin/sdl-config
>
> however cmake seems not to be able to find it... I am not sure if the sysroot directory should be added to the path, and if not how I am supposed to have sdl apps find their configureation (I can probably overrid the path to sdl-config for my particual app, but I am wondering if there isn't a more generic problem with the way sdl is installed in the cross-compile environement)
>
> relevent lines from the cmake configuration file :
>
> CMakeCache.txt:SDL_CONFIG:STRING=sdl-config
> CMakeLists.txt: set(SDL_CONFIG "sdl-config" CACHE STRING "Path to sdl-config script")
> CMakeLists.txt: exec_program(${SDL_CONFIG} ARGS "--cflags" OUTPUT_VARIABLE SDL_CFLAGS)

As a quick fix, in your app *.mk file, you can try to add:
<your app prefix>_CONF_OPT += -DSDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"

You don't have to change anything in the sdl-config from the staging
area, it is already handled by the sdl package.


BTW, that an issue we are aware of, and we talked a bit about it
during the last Buildroot Dev Days.
We just need some time to work on and figure out the best way to fix this.


Regards,

-- 
Sam
