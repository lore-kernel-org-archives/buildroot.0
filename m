From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Sep 2014 15:36:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-09-27
In-Reply-To: <20140928063011.030551009E8@stock.ovh.net>
References: <20140928063011.030551009E8@stock.ovh.net>
Message-ID: <20140928133642.GE3994@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-28 08:30 +0200, Thomas Petazzoni spake thusly:
> Build statistics for 2014-09-27
>          arm |              bluez5_utils-5.21 | NOK | http://autobuild.buildroot.net/results/033198c594679b4520d6720884458d4371aa641f/

Static build, duplicate function definitions, from libdbus and bluez:

    [...]/sysroot/usr/lib/libdbus-1.a(libdbus_1_la-sd-daemon.o):
    In function `sd_listen_fds':
    sd-daemon.c:(.text+0x118): multiple definition of `sd_listen_fds'
    src/bluetoothd-systemd.o:systemd.c:(.text+0x0): first defined here
    [...]/sysroot/usr/lib/libdbus-1.a(libdbus_1_la-sd-daemon.o):
    In function `sd_notify':
    sd-daemon.c:(.text+0x728): multiple definition of `sd_notify'
    src/bluetoothd-systemd.o:systemd.c:(.text+0x8): first defined here

Investigating (but I'm not a fan of static, so feel free to pre-empt...)

>      powerpc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/ad7ade4c436d21cba930f40c613870fbadec840e/

Requires eventfd_{read,write}, not available on uClibc.
I have a fix.

>     mips64el |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/0f4bf2ffe764fc2605da469e2505680f6c2be519/

Needs host python development files, I think:
    checking for python2.6... no
    configure: error: python is missing or unusable

>      powerpc |                     ruby-2.1.2 | NOK | http://autobuild.buildroot.net/results/2625e507fddc11cc6d05a2898f64e9138639c8e1/

Configure error?
    compiling loadpath.c
    loadpath.c:30:2: error: #error RUBY_EXEC_PREFIX must be defined
    loadpath.c:41:50: error: 'RUBY_LIB_VERSION' undeclared here (not in a function)
    loadpath.c:59:33: error: 'RUBY_EXEC_PREFIX' undeclared here (not in a function)
    loadpath.c:68:5: error: invalid initializer
    loadpath.c:68:5: error: expected ',' or ';' before string constant

>          arm |     trace-cmd-trace-cmd-v2.3.2 | NOK | http://autobuild.buildroot.net/results/4d773e0738c1d5adada8c0a4bca312068132fd9b/

Can't work with static, uses dlopen().
I'm doing a fix...

>       mipsel |                     vde2-2.3.2 | NOK | http://autobuild.buildroot.net/results/f9d23455a138e2214546922486c03c9d3c35b04a/

Can't work static, uses dlopen():
      CCLD     vde_l3
    vde_l3.o: In function `getpolicy':
    vde_l3.c:(.text+0xba4): undefined reference to `dlopen'

I'll come up with a patch, too...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
