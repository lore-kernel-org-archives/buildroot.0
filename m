From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Dec 2013 20:07:18 +0100
Subject: [Buildroot] [PATH 0/1] Fix GLES when a provider is defined in
	BR2_EXTERNAL
In-Reply-To: <52A730B0.3020104@orange.com>
References: <52A730B0.3020104@orange.com>
Message-ID: <1386702439-10093-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

> I have been testing BR2_EXTERNAL to generate a firmware for a target that
> provides proprietary egl and gles implementations.

Doh, that's a case we did not foresee. :-(

> I have created a custom userland package for my target that "provides" egl and
> gles, but I still need to specify a dependency towards it in libegl and
> libgles.
> 
> Before BR2_EXTERNAL, I used to patch buildroot's package/opengl/libgles.mk and
> package/opengl/libegl.mk directly:
> 
> ifeq ($(BR2_PACKAGE_XX_USERLAND),y)
> LIBGLES_DEPENDENCIES += xx-userland
> endif
> 
> Now, I would like to add these lines to my external.mk, but I fail on a
> LIBXX_CONFIGURE_CMDS that exits on error if LIBGLES_DEPENDENCIES are empty.
> 
> The thing is that since external.mk is included after all other makefiles, my
> modifications to LIBXX_DEPENDENCIES are applied only after the creation of the
> LIBXX_CONFIGURE_CMDS, thus causing the exit on error.
> 
> I managed to overcome this issue by moving the inclusion of external.mk before
> all other makefiles, but I have no idea if this is the right way to go: what
> do you think ?

I don't know what the actual solution will be, but I've done a quick-and-dirty
and completely untested patch that postpones the check until runtime (as a
follow-up):

    [PATCH] package/libgles: postpone the check for a missing GLES

That patch does not change package/opengl/libegl and others, so you'll have to
do it on your side if needed.

Can you check this works for you? If not, we'll have to find another solution.
(not this one is final, either).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
