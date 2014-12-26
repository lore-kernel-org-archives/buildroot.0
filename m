From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Dec 2014 11:20:29 +0100
Subject: [Buildroot] building fbtft framebuffer drivers into buildroot.
In-Reply-To: <CAFGceHGR2k7ARYDZqK0pskkNbd6wiguLkMdZ07zpPENW+NAZxw@mail.gmail.com>
References: <CAFGceHGR2k7ARYDZqK0pskkNbd6wiguLkMdZ07zpPENW+NAZxw@mail.gmail.com>
Message-ID: <20141226102028.GA3982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-12-25 14:09 -0600, thebestofall007 . spake thusly:
> Hello, I am new to buildroot and have been feeling my way around it, but I
> currently have a very fast bootable buildroot system for my raspberry pi
> system set up following various rpi setup tutorials, and I was wondering
> where I can start on building a package for the fbtft drivers from their
> source code located in the git repository located here:
> https://github.com/notro/fbtft/ that are used for driving small lcd
> displays, or has this already been done before?

I've had a look at this package, and unfortunately, it will be hard to
get it packaged in Buildroot.

The problem is that this kernel module does not compile as an
out-of-tree module, and their buildsystem is made so that it requires
the kernel be patched.

This is not posible with Buildroot.

However, it should be pretty easy (I hope) to adapt their Makefile so
that it behaves like an out-of-tree modules, as explained in the Linux
documentation:
    Documentation/kbuild/modules.txt

> I have went through the manual, and while it has a lot of info, this is an
> area that seems to be a little less self explanatory. I also gave info from
> this site a try, but I'm stuck at the making of the .mk file:
> http://free-electrons.com/~thomas/buildroot/manual/html/ch11.html

So, I would suggest you take this route:

  - first, build a Buildroot system with a Linux kernel (that's what you
    did so far, I guess);

  - second, adapt their Makefile as explained above, building manually
    with the Buildroot toolchain; see the Buildroot manual, chapter
    8.11.1. Using the generated toolchain outside Buildroot:
        http://nightly.buildroot.org/#_advanced_usage

  - once you made it build as an out-of-tree module, you can have a look
    at existing packages in Buildroot that also build kernel modules,
    like:
        package/lttng-modules/  (the simplest, I think)
        package/linux-fusion/   (a bit more complexe, with some ooptions)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
