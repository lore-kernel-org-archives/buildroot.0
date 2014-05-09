From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 09 May 2014 10:27:05 +0200
Subject: [Buildroot] [PATCH] cmake: forward HOST_{C,
 LD}FLAGS as cmake flags
In-Reply-To: <1399586335-22928-1-git-send-email-s.martin49@gmail.com>
References: <1399586335-22928-1-git-send-email-s.martin49@gmail.com>
Message-ID: <536C9159.9050900@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

Samuel Martin wrote:
> During the CMake bootstrap phase, the {C,LD}FLAGS set in the bootstrap
> environment are not forwarded/converted as CMake flags.
>
> The CMake build contains a bootstrap phase building a minimal CMake
> program using a standard Makfile, then reconfigures itself with this
> minimal program.
>
> On system with no ncurses installed, and because the prefix option
> points to $(HOST_DIR)/usr, if host-cmake was built after host-ncurses,
> then ncurses libraries and headers are correctly find (in the host tree)

s/find/found/.

> during the second configuration (because of the prefix). However, it
> fails at building ccmake (the curses interface) because the
> CMAKE_C_FLAGS, CMAKE_CXX_FLAGS and CMAKE_EXE_LINKER_FLAGS do not
> point to the host tree.
>
> Because these flags are needed when running the bootstrap script,
> this patch makes sure the same flags are set when running the second
> configuration.
>
> Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

In general I'm OK with this fix once it is, well... fixed according to
Fabio's comment.

But I still think disabling ccmake and other host tools that Buildroot
does not use would be a good idea. I agree with Thomas when he says
building host-cmake takes really long, although I am not sure we can
save a lot of time.

So I'd proceed quickly with this fix, and later disable unneeded tools
and see how much time we can save.

-- 
Luca
