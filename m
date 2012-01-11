From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 11 Jan 2012 10:32:50 +0100
Subject: [Buildroot] [PATCH v3] Add pygame package
In-Reply-To: <87sjjmbpva.fsf@macbook.be.48ers.dk>
References: <1326266671-9161-1-git-send-email-julien.boibessot@free.fr>
 <87sjjmbpva.fsf@macbook.be.48ers.dk>
Message-ID: <4F0D5742.7060803@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/11/2012 09:33 AM, Peter Korsgaard wrote:
> Thanks, looks good. Unfortunately it doesn't work:
>
> building 'pygame.gfxdraw' extension
> creating build/temp.linux-x86_64-2.7
> creating build/temp.linux-x86_64-2.7/src
> creating build/temp.linux-x86_64-2.7/src/SDL_gfx
> /home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -pipe -Os -fPIC -D_GNU_SOURCE= -D_REENTRANT -I/home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/SDL -I/home/peko/source/buildroot/output/host/usr/include/python2.7 -c src/gfxdraw.c -o build/temp.linux-x86_64-2.7/src/gfxdraw.o
> In file included from /home/peko/source/buildroot/output/host/usr/include/python2.7/Python.h:8,
>                   from src/pygame.h:80,
>                   from src/gfxdraw.c:33:
> /home/peko/source/buildroot/output/host/usr/include/python2.7/pyconfig.h:1136:1: warning: "_GNU_SOURCE" redefined
> <command-line>: warning: this is the location of the previous definition
> In file included from /home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/limits.h:27,
>                   from /opt/br/arm926t-wchar/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/include-fixed/limits.h:122,
>                   from /opt/br/arm926t-wchar/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/include-fixed/syslimits.h:7,
>                   from /opt/br/arm926t-wchar/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.6/include-fixed/limits.h:11,
>                   from /home/peko/source/buildroot/output/host/usr/include/python2.7/Python.h:19,
>                   from src/pygame.h:80,
>                   from src/gfxdraw.c:33:
> /home/peko/source/buildroot/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/features.h:219:5:
> error: #error It appears you have defined
> _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without large file
> support enabled.
>
> Notice how it is looking at my host-python rather than target-python
> (where I don't have largefile support) includes.
>
> Any idea?

Oups. I missed that one because error seems to occur only when the Host 
is a 64bits architecture (I have a 32 bits Host).
Seems like a problem in distutils that adds 
"-I/home/peko/source/buildroot/output/host/usr/include/python2.7" when 
compiling, which isn't a problem when Host and Target python 
installations match.

You have the same problem (include added) in python-mad package. Does it 
compile on your Host ?

Trying to find a solution...

Regards,
Julien
