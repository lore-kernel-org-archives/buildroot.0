From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 23:06:25 +0200
Subject: [Buildroot] [PATCH V2 1/2] package/c-periphery: bump version to
 2.2.0
In-Reply-To: <20200529142012.3869-1-offougajoris@gmail.com>
References: <20200529142012.3869-1-offougajoris@gmail.com>
Message-ID: <20200529230625.0a02d705@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joris,

On Fri, 29 May 2020 16:20:12 +0200
Joris Offouga <offougajoris@gmail.com> wrote:

> Since commit "cmake: add cmake build support"
> (https://github.com/vsergeev/c-periphery/commit/952e1e906a5d65b78932128af24b7dbb8cce2e9dvsergeev/c-periphery at d0a973c),
> c-periphery implement cmake build, so change generic-package instead of cmake-package

It's the opposite you're using: you' replacing generic-package by
cmake-package, so the wording here is confusing.

> + #include <unistd.h>
> + #include <fcntl.h>
> ++
> ++#define __USE_XOPEN

Defining a __<something> define from <features.h> is almost always
wrong.

According to man poll(2):

       When  compiling with _XOPEN_SOURCE defined, one also has the following,
       which convey no further information beyond the bits listed above:

       POLLRDNORM
              Equivalent to POLLIN.


So, you need to #define _XOPEN_SOURCE instead.

> -C_PERIPHERY_VERSION = 2.1.0
> +C_PERIPHERY_VERSION = 2.2.0
>  C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
>  C_PERIPHERY_INSTALL_STAGING = YES
>  # only a static library
> @@ -12,16 +12,4 @@ C_PERIPHERY_INSTALL_TARGET = NO

This is not longer true: with the CMake build system, a shared library
is built and installed. So with your change the package is broken: any
application that links against c-periphery will be linked against the
shared library, but the shared library is not installed in
$(TARGET_DIR).

Could you adjust this and send a new version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
