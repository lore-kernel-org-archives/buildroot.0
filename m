From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Sep 2013 15:58:18 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-09-28
In-Reply-To: <E69A5ED7-8837-4975-B209-CB92E817949A@layer-7.net>
References: <20130929063005.E848752C1A0@lolut.humanoidz.org>
 <E69A5ED7-8837-4975-B209-CB92E817949A@layer-7.net>
Message-ID: <20130929135818.GA3285@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2013-09-29 14:59 +0200, Michael Rommel spake thusly:
> I took the config file from: 
> 
>   http://autobuild.buildroot.net/results/9fb298d4e09a6f9b88207909d583dce05392048e/config
> 
> and reproduced the error. After some tinkering I found that the build
> option "prefer static libraries" causes aiccu and knock to not compile
> on the arm architecture. I am not expert enough to find out why this
> is the case, so I wanted to ask whether there is a way to specify for
> some programs that they are not compatible with this setting and maybe
> disable them from being shown in the menuconfig. 

    depends on !BR2_PREFER_STATIC_LIB

> Or if someone has an idea where I could start looking, please tell me.
> I have no clue, why static linking fails completely, even when the
> libraries are available in .../target/usr/lib, e.g. libgnutls.a and .la. 

If you look at yhe build.log, you'll see the link command is flawed:

/home/test/test/1/output/host/usr/bin/arm-none-linux-gnueabi-gcc
    [-- SNIP -D flags --]
    -D_LINUX -D HAS_IFHEAD -D AICCU_TYPE="\"linux\""  --static -lgnutls
    -lpthread -lresolv -o aiccu main.o ../common/tun.o ../common/aiccu.o
    ../common/hash_md5.o ../common/hash_sha1.o ../common/common.o
    ../common/heartbeat.o ../common/tic.o ../common/ayiya.o
    ../common/aiccu_test.o ../common/resolver.o ../common/aiccu_linux.o

From ld's man page:
    The linker will search an archive only once, at the location where
    it is specified on the command line. If the archive defines a symbol
    which was undefined in some object which appeared before the archive
    on the command line, the linker will include the appropriate file(s)
    from the archive. However, an undefined symbol in an object appearing
    later on the command line will not cause the linker to search the
    archive again.

Although all the interesting -l flags are present, they are before any
of the .o files, so the libs won;t be searched for unresolved symbols.

To confirm this, just have a look at how gcc calls the linker, by adding
    -v -Wl,--verbose

to the commandline above, and run it manually.

If I'm correct (which is still to be proven! ;-) ), we'll just have to
devise how to fix aiccu...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
