From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 11:04:33 +0100
Subject: [Buildroot] [PATCH v2 13/15] erlang-p1-iconv: new package.
In-Reply-To: <CAJtjsKYuoJLEcgf0f98ud6GDKDyu4qX8zHdXoQQhDos=+uAFQg@mail.gmail.com>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-14-git-send-email-johan.oudinet@gmail.com>
 <20141110163700.GE2466@free.fr> <20141110173012.GA22119@free.fr>
 <CAJtjsKYuoJLEcgf0f98ud6GDKDyu4qX8zHdXoQQhDos=+uAFQg@mail.gmail.com>
Message-ID: <20141111100433.GA4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-11-11 04:30 +0100, Johan Oudinet spake thusly:
> Yann, All,
> 
> On Mon, Nov 10, 2014 at 6:30 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> Compiling c_src/iconv.c
> >> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> >> cannot find -lerl_interface
> >> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> >> cannot find -lei
> >> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> >> cannot find -lerl_interface
> >> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> >> cannot find -lei
> >> collect2: error: ld returned 1 exit status
> >> ERROR: sh(/home/ymorin/dev/buildroot/O/host/usr/bin/armv6-rpi-linux-gnueabihf-gcc
> >> c_src/iconv.o
> >> -L/home/ymorin/dev/buildroot/O/target/usr/lib/erlang/lib/erl_interface-/lib
> >> -lerl_interface -lei  -shared
> >> -L/home/ymorin/dev/buildroot/O/target/usr/lib/erlang/lib/erl_interface-/lib
> >> -lerl_interface -lei -o priv/lib/iconv.so)
> >> failed with return code 1 and the following output:
> >> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> >> cannot find -lerl_interface
> >> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> >> cannot find -lei
> >> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> >> cannot find -lerl_interface
> >> /home/ymorin/x-tools/armv6-rpi-linux-gnueabihf/lib/gcc/armv6-rpi-linux-gnueabihf/4.9.1/../../../../armv6-rpi-linux-gnueabihf/bin/ld.bfd:
> >> cannot find -lei
> >> collect2: error: ld returned 1 exit status
> 
> I've seen this error few times when compiling several rebar packages.
> As a workaround, I run `make erlang-dirclean'.
> I'm not 100% sure of the reason for this error but I suspect that old
> versions of rebar remove such libraries after compiling, which leads
> to an error on the next compilation.

Well, that error happened from a completely clean build dir, so it is
not OK do have to rebuild erlang in this case (it might have been OK
when doing rebuilds, but even so, we'd prefer to avoid that).

And now I suspect I know why it hapenned: I am building out-of-tree, so
the comment I made on your patch 2/2 might be kicking in:

    ---8<---
    > +EI_VSN_FILE=output/build/erlang-$ERLANG_VSN/lib/erl_interface/vsn.mk

    That does not work for out-of-tree builds. You should use something
    like:
        EI_VSN_FILE="${O}/build/erlang-$ERLANG_VSN/lib/erl_interface/vsn.mk"
    ---8<---

Anyway, I'll continue investigating this series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
