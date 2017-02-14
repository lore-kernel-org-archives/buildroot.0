From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 23:29:12 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-13
In-Reply-To: <20170214142725.1b9e98ae@free-electrons.com>
References: <20170214072856.3AE8320B8C@mail.free-electrons.com>
 <20170214142725.1b9e98ae@free-electrons.com>
Message-ID: <20170214232912.42d8a2df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 14:27:25 +0100, Thomas Petazzoni wrote:

> >          arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/61bdfb7e0ff9628190d9eb86e40c4c90e768b8e2
> >          arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/b78c03b85aef845ff57d499b40f52b476f8a760c  
> 
> Musl compatibility issue.

We merged a patch to disable cbootimage on musl.

> >         i586 |                     cups-2.2.2 | NOK | http://autobuild.buildroot.net/results/486dea944d6ecba5c4e6e8ac664261c1909f4b4c  
> 
> The musl/i586/SSP issue.

I'm testing to simply disable SSP support with musl on i386. Will send
a patch shortly if that works.

> >      powerpc |                  ddrescue-1.22 | NOK | http://autobuild.buildroot.net/results/4ac0754f1cc5ea934d6437e89d1f4906fb3fd0a8  
> 
> Missing <stdio.h> include in block.h I believe. Peter (Seiderer), could
> you send a patch to fix this?

Peter has sent a patch, and it was merged.

> >         m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/2738e5fd446467b105f6dcca391500e3734e5a9b  
> 
> Missing magic gcc option, Waldemar will provide a fix.

Fixed by
https://git.buildroot.org/buildroot/commit/?id=82a935ae493b8159062c9c32b328c30ee130c5a8

> >         sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/908aef6c82d56060933713df217b6b2ba21a01b0  
> 
> error: 'SIZE_MAX' was not declared in this scope
> 
> Missing header include I believe.

This one is annoying.

So libraw optionally depends on jasper, and it's when both are enabled
that the problem occurs.

The issue is that the jas_math.h header uses SIZE_MAX and other
definitions of <stdint.h>, but those definitions are not visible to C++
code, unless you define __STDC_LIMIT_MACROS.

So one would think "just define __STDC_LIMIT_MACROS before including
<stdint.h> in jas_math.h". Expect that libraw, before including jasper
headers, includes other headers that already include <stdint.h>. So by
the time jas_math.h includes <stdint.h>, it has already been included,
and therefore, the definition of __STDC_LIMIT_MACROS in jas_math.h has
no effect.

I'm not sure how to fix this. Adding __STDC_LIMIT_MACROS to the build
of libraw would fix it, but it's rather weird to have this
implementation "detail" of jasper creep in all the way to users of the
library.

> >         i586 |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/b8b96c7bbf2147dacac62485cbfdbcfd758271a5  
> 
> ir-ctl.o: In function `parse_opt':
> ir-ctl.c:(.text+0xb06): undefined reference to `strndupa'
> ir-ctl.o: In function `lirc_record':
> ir-ctl.c:(.text+0xe01): undefined reference to `TEMP_FAILURE_RETRY'
> ir-ctl.o: In function `main':
> ir-ctl.c:(.text.startup+0x9a): undefined reference to `TEMP_FAILURE_RETRY'
> ir-ctl.c:(.text.startup+0xd7): undefined reference to `TEMP_FAILURE_RETRY'
> ir-ctl.c:(.text.startup+0x64a): undefined reference to `TEMP_FAILURE_RETRY'
> 
> Musl related, perhaps?

Fixed by Peter Seiderer.


> >          arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/6f197c643972e92f0b27b3afac7da7b4b1115f7e  
> 
> BR2_PACKAGE_PROVIDES_LIBGL="mesa3d"
> BR2_PACKAGE_PROVIDES_LIBEGL="rpi-userland"
> BR2_PACKAGE_PROVIDES_LIBGLES="rpi-userland"
> 
> This seems like a quite messy configuration: we have mesa3d as the
> OpenGL provider, and rpi-userland as the OpenGLES/EGL provider. Yann,
> what do you think about this?

Yann has submitted a proposal to fix this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
