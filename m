From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jan 2012 09:33:13 +0100
Subject: [Buildroot] [PATCH v3] Add pygame package
In-Reply-To: <1326266671-9161-1-git-send-email-julien.boibessot@free.fr>
 (julien boibessot's message of "Wed, 11 Jan 2012 08:24:31 +0100")
References: <1326266671-9161-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87sjjmbpva.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 julien> From: Julien Boibessot <julien.boibessot@armadeus.com>
 julien> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
 julien> ---
 julien>  Changes since v2:
 julien>  As requested by Peter Korsgaard:
 julien>  - autoselect sdl_* libs instead of depending of them
 julien>  - removed movie/sndarray/surfarray config check (will be re-added when
 julien>    smpeg/numpy are integrated in BR)
 julien>  - remove doc only if !BR2_HAVE_DOCUMENTATION
 julien>  Other:
 julien>  - renamed PYTHON_PYGAME_CONFIGURE_* in PYTHON_PYGAME_UNCONFIGURE_* to better
 julien>    understand that we remove modules from default build config if dependancies
 julien>    are not available

Thanks, looks good. Unfortunately it doesn't work:

building 'pygame.gfxdraw' extension
creating build/temp.linux-x86_64-2.7
creating build/temp.linux-x86_64-2.7/src
creating build/temp.linux-x86_64-2.7/src/SDL_gfx
/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -pipe -Os -fPIC -D_GNU_SOURCE= -D_REENTRANT -I/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/SDL -I/home/peko/source/buildroot/output/host/usr/include/python2.7 -c src/gfxdraw.c -o build/temp.linux-x86_64-2.7/src/gfxdraw.o
In file included from /home/peko/source/buildroot/output/host/usr/include/python2.7/Python.h:8,
                 from src/pygame.h:80,
                 from src/gfxdraw.c:33:
/home/peko/source/buildroot/output/host/usr/include/python2.7/pyconfig.h:1136:1: warning: "_GNU_SOURCE" redefined
<command-line>: warning: this is the location of the previous definition
In file included from /home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/limits.h:27,
                 from /opt/br/arm926t-wchar/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/include-fixed/limits.h:122,
                 from /opt/br/arm926t-wchar/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/include-fixed/syslimits.h:7,
                 from /opt/br/arm926t-wchar/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/include-fixed/limits.h:11,
                 from /home/peko/source/buildroot/output/host/usr/include/python2.7/Python.h:19,
                 from src/pygame.h:80,
                 from src/gfxdraw.c:33:
/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/features.h:219:5:
error: #error It appears you have defined
_FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file
support enabled.

Notice how it is looking at my host-python rather than target-python
(where I don't have largefile support) includes.

Any idea?

-- 
Bye, Peter Korsgaard
