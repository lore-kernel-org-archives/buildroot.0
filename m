From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 16:37:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: fix static linking with
 libatomic
In-Reply-To: <20170525071934.31057-1-bernd.kuhls@t-online.de>
References: <20170525071934.31057-1-bernd.kuhls@t-online.de>
Message-ID: <20170528163736.175ff4bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 May 2017 09:19:34 +0200, Bernd Kuhls wrote:

>  # Uses __atomic_fetch_add_4
> +# src/Makefile contains a wrong linking order which breaks linking
> +# for static builds. We need to add -latomic to FINAL_LIBS to provide

The Makefile doesn't really contain a "wrong linking" order, it's
simply that LDFLAGS are used before the list of object files. So I've
reworded a bit the comment here.

> +# -latomic at the correct place in the linking command.
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -REDIS_LIBATOMIC = -latomic

You forgot to adjust the place where REDIS_LIBATOMIC was used, so I've
adjusted that as well.

Applied to master with those two issues fixed.

Could you submit a patch upstream that adds something like
EXTRA_FINAL_LIBS:

FINAL_LIBS = -lm $(EXTRA_FINAL_LIBS)

This way we could nicely pass it from the environment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
