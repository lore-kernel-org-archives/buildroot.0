From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Aug 2016 00:29:25 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-18
In-Reply-To: <20160820000709.0ceef3cd@free-electrons.com>
References: <20160819063024.55AF4101904@stock.ovh.net>
 <20160820000709.0ceef3cd@free-electrons.com>
Message-ID: <20160819222925.GD6096@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Now I won the beer, the serious reply...

On 2016-08-20 00:07 +0200, Thomas Petazzoni spake thusly:
> >          arm | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/6e91cfb1a0a55d1e816de66353bf6a4053af05a5/
> 
> [ 41%] Linking CXX static library ../lib/libkms++.a
> Error running link command: No such file or directory
> 
> Yann ?

I was not able to reproduce after ~10 successive builds, all repeated on
three different systems: my laptop (Ubuntu 16.04), my server (Ubuntu
14.04) or my autobuilder instance (Ubuntu 12.04 IIRC).

There is another type of issues for kmsxx:

    http://autobuild.buildroot.org/results/5e9/5e9963c1f11af40a6349da524fc128116a1d9e6e/build-end.log

    [ 81%] Linking CXX executable ../bin/fbtestpat
    /tmp/ccvhwy4u.ltrans0.ltrans.o: In function `main':
    <artificial>:(.text.startup+0xa4): undefined reference to `kms::ExtCPUFramebuffer::ExtCPUFramebuffer(unsigned int, unsigned int, kms::PixelFormat, unsigned char*, unsigned int)'
    <artificial>:(.text.startup+0xd4): undefined reference to `kms::draw_test_pattern(kms::IMappedFramebuffer&)'
    <artificial>:(.text.startup+0x10c): undefined reference to `kms::RGB::RGB(unsigned char, unsigned char, unsigned char)'
    <artificial>:(.text.startup+0x128): undefined reference to `kms::draw_text(kms::IMappedFramebuffer&, unsigned int, unsigned int, std::string const&, kms::RGB)'
    <artificial>:(.text.startup+0x188): undefined reference to `kms::ExtCPUFramebuffer::~ExtCPUFramebuffer()'
    <artificial>:(.text.startup+0x2a8): undefined reference to `kms::ExtCPUFramebuffer::~ExtCPUFramebuffer()'
    collect2: error: ld returned 1 exit status
    make[3]: *** [bin/fbtestpat] Error 1

And I was not able to reproduce it either... :-/

> >      aarch64 |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/279591190dd7676ff4bcbb6017a109af7b7d67e9/
> >       x86_64 |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/6b92fa15853bfeca8dd1dff15fcc57bef81194cc/
> 
> The libbsd issue. I'm not sure how to solve without fixing pkg-config.
> What do we do for the release? Take the not-so-nice patch proposed by
> Yann to work around the problem?
> 
> Secondary question: other packages are using libbsd, why aren't we
> seeing other occurrences of this problem?

Because none is using libbsd-overlay.pc, just libbsd.pc.

The underlying issue, that pkconf does not munge -isystem, is being
investigated by the pkconf guys:
    https://github.com/pkgconf/pkgconf/issues/94

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
