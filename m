From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Wed, 23 Nov 2016 19:59:11 -0200
Subject: [Buildroot] [PATCH] stella: fix bug when compiling with PPC
 altivec vectorization
In-Reply-To: <20161122233337.GA2566@tungsten.ozlabs.ibm.com>
References: <1479404832-11783-1-git-send-email-sergio.prado@e-labworks.com>
 <20161119105927.57bd516a@free-electrons.com>
 <20161122233337.GA2566@tungsten.ozlabs.ibm.com>
Message-ID: <CANu7NGu=fPj30W2A596uyn=+kaYkK07M3U-So7RLmMhk41Vvrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

Thanks for reviewing the patch.

> This seems fine to me. I assume you're using this method so that the
> change has minimal chance to break other arches, but it would be much
> simpler if you could just change it globally so let's consider it:
>
> What seems to be happening before this patch, is:
>
> The configure script selects a compiler that supports -std=c++11 (see
> configure around line 805).
>
> Then the Makefile wll add -std=c++11 if the compiler is GCC, like this:
>
> ifdef HAVE_GCC
>   CXXFLAGS+= -Wno-multichar -Wunused -fno-rtti -Woverloaded-virtual
-Wnon-virtual-dtor -std=c++11
> endif
>
> (But it looks like non-gcc compilers that do support -std=c++11 will be
> used but they won't get -std=c++11... odd. I think the proposed patch,
above,
> would change this slightly so that -std=c++11 is always used but I
> suspect that is a good thing!)
>
> If we can rely on c++11 support in gcc implying gnu++11 support (which
> seems reasonable), we could just patch the Makefile to:
>
> ifdef HAVE_GCC
>   CXXFLAGS+= -Wno-multichar -Wunused -fno-rtti -Woverloaded-virtual
-Wnon-virtual-dtor -std=gnu++11
> endif
>
> What do you think?

Your solution is simpler and seems reasonable to just change from c++11 to
gnu++11. I will do some tests on x86 and ARM and let you know the results.

Best regards,

Sergio Prado

>
> Cheers,
> Sam.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161123/a28e20ac/attachment.html>
