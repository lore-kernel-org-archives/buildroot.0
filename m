From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Jun 2016 00:39:14 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freeswitch: enable video
 support
In-Reply-To: <20160610003503.7ebe8f20@free-electrons.com>
References: <1461445358-32052-1-git-send-email-bernd.kuhls@t-online.de>
 <20160610003503.7ebe8f20@free-electrons.com>
Message-ID: <20160609223914.GB17968@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Thomas, All,

On 2016-06-10 00:35 +0200, Thomas Petazzoni spake thusly:
> On Sat, 23 Apr 2016 23:02:38 +0200, Bernd Kuhls wrote:
> > +# needed in addition for patch 0003 for cross-compiling libs/libvpx
> > +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> > +# host/opt/ext-toolchain/bin/ is not part of $PATH, instead of passing
> 
> And this is intentional, because you should never call binaries in
> host/opt/ext-toolchain/bin/.
> 
> > +# GNU_TARGET_NAME we need to pass TOOLCHAIN_EXTERNAL_CROSS which stores
> > +# the full path, needed to avoid build error with external toolchains,
> > +# quote from compile log:
> > +#    [AR] libvpx_g.a
> > +# make[3]: x86_64-buildroot-linux-musl-ar: Command not found
> > +# or
> > +# make[3]: sparc64-buildroot-linux-gnu-ar: Command not found
> > +FREESWITCH_MAKE_ENV += CROSS=$(TOOLCHAIN_EXTERNAL_CROSS)
> > +else
> > +FREESWITCH_MAKE_ENV += CROSS=$(GNU_TARGET_NAME)-
> > +endif
> 
> Have you tried replacing this complicated stuff with just:
> 
>    FREESWITCH_MAKE_ENV += CROSS=$(TARGET_CROSS)
> 
> $(TARGET_CROSS) is already defined properly depending on
> internal/external.
> 
> Could you check if that works and submit an updated version?

Alternatively, can't we jsut revert that upstream patch you pinted to:
    https://freeswitch.org/fisheye/changelog/freeswitch?cs=febe0f8dacea2d2a31902b3dc469be757f8c3c4d

to re-introduce support for an external libvpx?

At best, it would be nice if upstreamed offered the option to support an
external one, with a ./configure option:

    --with-libvpx={bunddled*,external,/path/to/libvpx/prefix}

Hopefully, they are not stubborn, and will listen if we come up with
good arguments... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
