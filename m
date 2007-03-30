From: Zachary P. Landau <kapheine@gmail.com>
Date: Fri, 30 Mar 2007 16:16:03 -0400
Subject: [Buildroot] GCC version detection in toolchain/gcc/Makefile.in
In-Reply-To: <20070330183459.GB22338@aon.at>
References: <a04f56da0703290736x257e4f8aqb968db9a2402e06c@mail.gmail.com>
	<20070330183459.GB22338@aon.at>
Message-ID: <a04f56da0703301316g58268c11qe6a18ffba4929df3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >Inside of that file, it uses the line: "ifeq ($(findstring
> >3.4.,$(GCC_VERSION)),3.4.)" to detect gcc version 3.4.X.  But then a
> >few lines down, in a separate ifeq, it uses the line: "ifeq
> >($(findstring 4.,$(GCC_VERSION)),4.)".  I believe this is supposed to
> >detect version "4.X.X" of GCC.  But it also seems to match 3.4.X
> >(because that also has '4.' in it.
> >
> >Am I right that this is an issue, or am I missing something?
>
> That sounds plausible, yes.
> What do you suggest to distinguish between gcc version 4.4.9 and 3.4.6?

I don't particularly love this solution, we could parse the version
into its individual parts, and then match against those.  Something
like this:

  GCC_MAJOR:=$(shell echo $(GCC_VERSION) | cut -d'.' -f1)
  GCC_MINOR:=$(shell echo $(GCC_VERSION) | cut -d'.' -f2)
  GCC_SUB:=$(shell echo $(GCC_VERSION) | cut -d'.' -f3)

Then we could do the tests like this:

  ifeq ($(GCC_MAJOR).$(GCC_MINOR),3.4)
  SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
  else
  SOFT_FLOAT_CONFIG_OPTION:=--without-float
  endif

and so on, for the other GCC version tests.  That way we can make sure
we are testing the right part.  If you think this solution is okay, I
could make a patch for Makefile.in to use this scheme.

-- 
Zachary P. Landau <kapheine@gmail.com>
