From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 20:50:39 +0200
Subject: [Buildroot] [PATCH] core: detect and reject build paths which
 contain an '@'
In-Reply-To: <20180820204953.29566-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 20 Aug 2018 22:49:53 +0200")
References: <20180820204953.29566-1-yann.morin.1998@free.fr>
Message-ID: <87r2gk8nb4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > gcc does not build when the srcdir path contains a '@', because that
 > path is then substitued in a texi file as argument to an @include
 > directive. But then, the '@' in the path will start a command evaluation
 > of its own, thus breaking the build. For example, with a $(O) path set
 > to /home/ymorin/dev/buildroot/O/to at ti :

 >     perl ../../gcc/../contrib/texi2pod.pl ../../gcc/doc/invoke.texi > gcc.pod
 >     ../../gcc/doc/invoke.texi:1678: unknown command `ti'
 >     ../../gcc/doc/invoke.texi:1678: @include: could not find /home/ymorin/dev/buildroot/O/to/build/host-gcc-initial-7.3.0/build/gcc/../../gcc/../libiberty/at-file.texi

 > Reported-by: c32 on IRC
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  Makefile | 5 +++++
 >  1 file changed, 5 insertions(+)

 > diff --git a/Makefile b/Makefile
 > index d1ee9293a2..8a2b614b81 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -60,6 +60,11 @@ override O := $(patsubst %/,%,$(patsubst %.,%,$(O)))
 >  # avoid empty CANONICAL_O in case on non-existing entry.
 >  CANONICAL_O := $(shell mkdir -p $(O) >/dev/null 2>&1)$(realpath $(O))
 
 > +# gcc fails to build when the srcdir contains a '@'
 > +ifneq ($(CANONICAL_O),$(subst @,,$(CANONICAL_O)))

I find findstring easier to read, so I've changed it to:

ifneq ($(findstring @,$(CANONICAL_O)),)

And committed, thanks.

-- 
Bye, Peter Korsgaard
