From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Nov 2015 23:15:45 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-11-06
In-Reply-To: <20151107073016.DCC83100931@stock.ovh.net>
References: <20151107073016.DCC83100931@stock.ovh.net>
Message-ID: <20151107221545.GA3676@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-07 08:30 +0100, Thomas Petazzoni spake thusly:
> Detail of failures
> ===================
>          arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8184a96d046a0f03f23bc2d028404ecf6ff98abd/
>      aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/904b8e509660a6da592a4f6f983417daec4a613b/
>          arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f51a6b8a03110a9391b9e6665d52f713a3aa703c/
>      aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/fe99583fcaa45c5e9fef5aa63028f951ea632b33/
>          arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c955eb9fafcc02e5e4aa2d62e7a1e58e325f6338/

I know what's going on with those.

We have a single kconfig option to select the Linaro toolchain.
Depending on the host (ix86 or x86_64), different toolchains are used.

So, on an ix86 host, the old 2014.09 toolchain is used, while on an
x86_64 host, the new 2015.08 toolchain is used.

The way we decide which toolchain to used is based on the result of
`uname -m`.

However, what we should really be checking for is whether the host
_system_ is 32-bit or 64-bit.

For example, on a x86_64 host, one run a pure 32bit userland, even with
a 64-bit kernel. That's the case in a ix86 chroot, like our
autobuilders.

Note that I did test this situation, and did not have the issue, because
I run my 32-bit chroot via setarch, like so;

    setarch i386 -B chroot blabla...

So, I believe the way we fill-in $(HOSTARCH) is ultimately wrong. We
should not be checking if the kernel is running in 32- or 64-bit mode,
but we should really be checking if the userland is 32- or 64-bit.

I'll cook up a patch...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
