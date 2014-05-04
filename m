From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 04 May 2014 15:06:37 +0200
Subject: [Buildroot] [PATCH 8/8] xbmc: Fix TexturePacker compile
References: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
 <1398968277-9044-9-git-send-email-bernd.kuhls@t-online.de>
 <CAGduivyfTiuETZKFUuk5CXzVePeDi7jSx_PUMgjtg1YFWsGFRA@mail.gmail.com>
Message-ID: <tjqh3bxm9f.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote in
news:CAGduivyfTiuETZKFUuk5CXzVePeDi7jSx_PUMgjtg1YFWsGFRA at mail.gmail.com: 

> What was your issue exactly ?

Hi,

my patch fixes the compilation of TexturePacker for xbmc frodo/gotham.

use_texturepacker_native=yes

is needed because we abviously need a native-compiled binary, but the xbmc 
build system does enable this variable only for darwin, android and 
raspberry-pi targets.

USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"

is also needed because
USE_TEXTUREPACKER_NATIVE_ROOT="$TEXTUREPACKER_NATIVE_ROOT"
is only executed for raspberry-pi by xbmc/configure and only 
USE_TEXTUREPACKER_NATIVE_ROOT is used by tools/TexturePacker/Makefile.in.

To sum up, building for raspberry-pi and other archs works out-of-the-box, 
compiling for an Intel target, for example, fails:

In file included from SDL_anigif.cpp:23:0:
SDL_anigif.h:24:21: fatal error: SDL/SDL.h: No such file or directory
compilation terminated.
XBMCTex.cpp:34:21: fatal error: SDL/SDL.h: No such file or directory

Regards, Bernd
