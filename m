From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 30 Jul 2015 09:06:07 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-29
In-Reply-To: <20150730063016.85822101F90@stock.ovh.net>
References: <20150730063016.85822101F90@stock.ovh.net>
Message-ID: <1438247167.5763.13.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2015-07-30 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-07-29
> ===============================
> 
>         success : 4  
>        failures : 6  
>        timeouts : 0  
>           TOTAL : 10 
> 
> Classification of failures by reason
> ====================================
> 
>              libselinux-2.1.13 | 2 
>                    sudo-1.8.13 | 1 
>                       atf-0.21 | 1 
>                   bonnie-1.03e | 1 
>                   boost-1.58.0 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |                       atf-0.21 | NOK | 
> http://autobuild.buildroot.net/results/1a5861da3fb6628c872f3635118bd1f5c7707893/
>          arc |                   bonnie-1.03e | NOK | 
> http://autobuild.buildroot.net/results/c2af14c4096424e41449c094666ffa0262f4e9f2/

Still pre-fixes toolchain is used:
BR2_TOOLCHAIN_EXTERNAL_URL="
http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2015.05-1014-g5ccde01.tar.bz2"

>          arc |                   boost-1.58.0 | NOK | 
> http://autobuild.buildroot.net/results/ea427b22dc541aafcefae09710d9b30c0fa5fae2/

Waiting for reply from Boost guys on how should we fix this properly.
Probably that's not a question to you but we may change uClibc's __GLIBC_MINOR__ from 2 to anything >= 8
and see how it goes. At least in boost proper eventfd() will be used.

>          arc |              libselinux-2.1.13 | NOK | 
> http://autobuild.buildroot.net/results/9c2f09fb7b2a594c7d22fe413e8bae843e8d227c/
>          arc |              libselinux-2.1.13 | NOK | 
> http://autobuild.buildroot.net/results/3835eeaec5b81885d5b99dcc8c0df2b30acd9ac8/

Hm, I was under impression we had that fixed:
------------------------->8--------------------
/tmp/ccucQq2P.s: Assembler messages:
/tmp/ccucQq2P.s:475: Error: internal error: fixup not contained within frag
------------------------->8--------------------

Will reiterate this one.

>          arc |                    sudo-1.8.13 | NOK | 
> 
> http://autobuild.buildroot.net/results/1b77539d08ffd950317a58cef8e2a4ce624c4710/
------------------------->8--------------------
/home/test/autobuild/instance-0/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getenv.os): In
function `__GI_getenv':
getenv.c:(.text+0x0): multiple definition of `getenv'
env_hooks.o:env_hooks.c:(.text+0x11c): first defined here
------------------------->8--------------------

I believe something similar to the issue Vincente fixed for Bash, see
http://git.buildroot.net/buildroot/commit/?id=9623ff651f83a350819719f10705552da9793205

Will look into that and prepare a patch.

-Alexey
