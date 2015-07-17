From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2015 00:23:54 +0200
Subject: [Buildroot] [PATCH] ARC: update tools to arc-2015.06 release
In-Reply-To: <55A8EAF7.5060506@openwide.fr>
References: <1436964678-24352-1-git-send-email-abrodkin@synopsys.com>
 <55A8EAF7.5060506@openwide.fr>
Message-ID: <20150717222354.GE3637@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-07-17 13:45 +0200, Romain Naour spake thusly:
[--SNIP--]
> Your patch looks good, but I have a build failure with uclibc:
> 
> make O=test/arc/ toolchain 2>&1 | tee build-arc-toolchain.log
> 
> >>> uclibc arc-2015.06 Patching
> support/kconfig/merge_config.sh -m -O /home/naourr/git/buildroot/test/arc/build/uclibc-arc-2015.06 package/uclibc/uClibc-snapshot.config 
> Using package/uclibc/uClibc-snapshot.config as base
> #
> # merged configuration written to /home/naourr/git/buildroot/test/arc/build/uclibc-arc-2015.06/.config (needs make)
> #
>   MKDIR include/config
>   MKDIR include/generated
>   MKDIR extra/config/lxdialog
>   HOSTCC-o extra/config/conf.o
>   GEN extra/config/zconf.tab.c
>   GEN extra/config/zconf.lex.c
>   GEN extra/config/zconf.hash.c
> /bin/sh: test/arc//extra/config/zconf.hash.c: No such file or directory
> Makefile:70: recipe for target 'test/arc//extra/config/zconf.hash.c' failed
> make[3]: *** [test/arc//extra/config/zconf.hash.c] Error 1
> make[3]: *** Waiting for unfinished jobs....
> /bin/sh: test/arc//extra/config/zconf.tab.c: No such file or directory
> /bin/sh: test/arc//extra/config/zconf.lex.c: No such file or directory
> Makefile:70: recipe for target 'test/arc//extra/config/zconf.tab.c' failed
> make[3]: *** [test/arc//extra/config/zconf.tab.c] Error 1
> Makefile:70: recipe for target 'test/arc//extra/config/zconf.lex.c' failed
> make[3]: *** [test/arc//extra/config/zconf.lex.c] Error 1
> Assembler messages:
> Fatal error: can't create test/arc//extra/config/conf.o: No such file or directory
> Makefile:64: recipe for target 'test/arc//extra/config/conf.o' failed
> make[3]: *** [test/arc//extra/config/conf.o] Error 1
> Makefile.in:465: recipe for target 'test/arc//extra/config/conf' failed
> make[2]: *** [test/arc//extra/config/conf] Error 2
> package/uclibc/uclibc.mk:485: recipe for target '/home/naourr/git/buildroot/test/arc/build/uclibc-arc-2015.06/.config' failed
> make[1]: *** [/home/naourr/git/buildroot/test/arc/build/uclibc-arc-2015.06/.config] Error 2
> Makefile:36: recipe for target 'toolchain' failed
> make: *** [toolchain] Error 2

OK, I was able to reproduce the error. Here it goes (all done from the
Buildroot top dir, path:  /home/ymorin/dev/buildroot/buildroot ):

Attempt #1:

    $ mkdir ../O
    $ cd ../O
    $ make -C ../buildroot O=$(pwd) defconfig
    $ make uclibc
    # Success!

Attempt #2:

    $ mkdir test/O
    $ make O=test/O defconfig
    $ make O=test/O uclibc
    # Bummer, failure.

So, it all happens because of the origin of $(O), it seems.

Guido and I have been discussing that on IRC, and I'm testing to
"unexport O" in the path where umask is wrong.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
