From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Jan 2015 12:56:39 +0100
Subject: [Buildroot] wrap Buildroot compilation for static analysis
In-Reply-To: <CAG--3ku7jZbAiiueUH6ukXwZG4dJQ+XBr9TEiafG3SOt2cRwVQ@mail.gmail.com>
References: <CAG--3ku7jZbAiiueUH6ukXwZG4dJQ+XBr9TEiafG3SOt2cRwVQ@mail.gmail.com>
Message-ID: <20150123115639.GC8089@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug, All,

On 2015-01-23 07:55 +0000, spam at douglasheld.net spake thusly:
> I have some commercial software called Fortify SCA that wraps a compiler
> command, to build an analysis model of the code.  I would like to analyze
> OpenWRT and I see that it implements Buildroot.

Well, although it's true that OpenWRT is a fork of Buildroot, the fork
occured a looong time ago, and the two are now completely different.
OpenWRT is now its own build system in its own right, and is no longer
correlated to Buildroot.

I would suggest that you direct OpenWRT related questions to the OpenWRT
support channels.

> But I am finding the Buildroot build sequence a
> little incomprehensible.
> 
> For example, a shortcut I tried is:
> 
> #i.e., build the toolchain and then the product
> make
> # find and remove selected object files
> find ./package/libnl-tiny | egrep '\.o$|\.so$' | xargs rm
> # try my wrapper on limited number of files
> sourceanalyzer <sca args> make
> 
> But the final command doesn't detect the missing .o files and rebuild
> them.  Instead it indicates a fatal error in libnl-tiny.so not existing as
> expected.

I don't know how OpenWRT behaves in this respect, but Buildroot does not
detect such changes.

What happens is that, after each step: configure, build install...,
Buildroot will create a stamp file in the package build directory, like;
    build/PKG-NAME-VERSION/.stamp_downloaded
    build/PKG-NAME-VERSION/.stamp_extracted
    build/PKG-NAME-VERSION/.stamp_configured
    build/PKG-NAME-VERSION/.stamp_built
and so on...

Then, Buildroot uses those files to detect whether the package needs
configuring, building, etc... So, as long as those files are present,
Buildroot would believe it has nothing to do about that package.

What you want to do is use one of the re-do targets, like:
    make PKG-reconfigure
    make PKG-rebuild

But I don't know how that would translate for OpenWRT...

> Any indication where I should be looking? I didn't imagine the OpenWRT guys
> would be able to answer questions about the underlying build system.

I guess they would, since OpenWRT is no longer related to Buildroot
nowdays...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
