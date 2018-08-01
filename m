From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Aug 2018 22:20:40 +0200
Subject: [Buildroot] [RFC] [PATCH v2 2/2] support/kconfig: Bump to
 kconfig from Linux 4.17-rc2
In-Reply-To: <20180801194230.GC2294@scaer>
References: <20180520144141.GB3453@scaer> <20180520165009.56b44d9b@windsurf>
 <dcf8150e-1eb1-ba10-09e6-d3eb0bffaf2b@mind.be>
 <20180528203743.GK2965@scaer>
 <67a166b0-1466-8bd9-86be-3a8f3d7a4079@mind.be>
 <20180730150433.704e57ef@windsurf>
 <9ec69586-1154-f4e3-2fff-4f831263eef0@mind.be>
 <20180731100646.3221056f@windsurf>
 <785d0b36-933c-34a6-031d-c8201971c2ea@mind.be>
 <20180801194230.GC2294@scaer>
Message-ID: <20180801202040.GD2294@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On 2018-08-01 21:42 +0200, Yann E. MORIN spake thusly:
> On 2018-07-31 10:20 +0200, Arnout Vandecappelle spake thusly:
> > On 31-07-18 10:06, Thomas Petazzoni wrote:
> > > On Tue, 31 Jul 2018 09:55:42 +0200, Arnout Vandecappelle wrote:
> > >>>>> We're only talking about dropping the need for host-flex and host-bison
> > >>>>> for the kconfig stuff.

And currently, even though we have dependencies on host-flex and
host-bison, we are broke.

    $ make distclean
    $ make menuconfig
      --> enable the linux kernel, choose a defconfig, save, exit
    $ make linux-menuconfig
    [...]
      HOSTCC  scripts/basic/fixdep
      HOSTCC  scripts/kconfig/conf.o
      YACC    scripts/kconfig/zconf.tab.c
    /bin/sh: bison: command not found
      LEX     scripts/kconfig/zconf.lex.c
    scripts/Makefile.lib:196: recipe for target 'scripts/kconfig/zconf.tab.c' failed
    make[3]: *** [scripts/kconfig/zconf.tab.c] Error 127
    make[3]: *** Waiting for unfinished jobs....
    /bin/sh: flex: command not found
    scripts/Makefile.lib:188: recipe for target 'scripts/kconfig/zconf.lex.c' failed
    make[3]: *** [scripts/kconfig/zconf.lex.c] Error 127
    Makefile:528: recipe for target 'rpc_defconfig' failed
    make[2]: *** [rpc_defconfig] Error 2
    linux/linux.mk:511: recipe for target '/home/ymorin/dev/buildroot/buildroot/output/build/linux-4.17.11/.config' failed
    make[1]: *** [/home/ymorin/dev/buildroot/buildroot/output/build/linux-4.17.11/.config] Error 2
    Makefile:79: recipe for target '_all' failed
    make: *** [_all] Error 2

So we already need to add dependencies for the kconfig step...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
