From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 May 2015 09:33:05 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/harfbuzz: disable test
 programs
In-Reply-To: <555A5C32.1030209@openwide.fr>
References: <1431467484-14459-1-git-send-email-romain.naour@openwide.fr>
 <20150518230346.4c8a9a45@free-electrons.com>
 <555A5C32.1030209@openwide.fr>
Message-ID: <20150519093305.78a0e85d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon, 18 May 2015 23:40:02 +0200, Romain Naour wrote:

> > I was almost going to apply this one, but I'm not entirely happy in
> > fact. I really works around the real problem, and does not fix it:
> > imagine a real program now links statically to harfbuzz using harfbuzz
> > pkg-config file. This pkg-config file does not advertise the dependency
> > on libstdc++ in its Libs.private, so the link would also fail, just
> > like it currently fails for the test programs.
> 
> -lstdc++ is only needed by libharfbuzz-icu.la which use the icu package.
> So maybe -lstdc++ is missing in Libs.private from icu-uc.pc ?

Yes, might be. It's weird: harfbuzz uses .cc as the extension for its
source files, but it seems to be only pure C, not C++. And to add to
the confusion, it also uses AC_PROG_CXX in its configure.ac, which
would also indicate it's in C++.

But obviously, icu is implemented in C++, so the icu-uc pkg-config file
should have the corresponding -lstdc++ Libs.private flag.


> You would said ;)
> test_unicode_LDADD += $(top_builddir)/src/libharfbuzz-icu.la -lstdc++
> 
> With that fixed, Harbuzz build fine.

Sounds good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
