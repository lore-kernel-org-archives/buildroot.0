From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Jul 2017 23:45:18 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <CAGt4E5samrvKY5-kwVHuCh6KsoKnmGZsWiRNgT9xpDF=6fcbUg@mail.gmail.com>
References: <20170705072538.GE3499@scaer>
 <fc53112d-c7a3-64c9-74ad-277741161711@mind.be>
 <5c9f063f-5b5c-226d-ca25-6bcb8ebf7ced@mind.be>
 <CAGt4E5ueb6x_S4ff=dAeK-x9JnO1SmhnUGz+Q3XKUtj6s24L_Q@mail.gmail.com>
 <CAGt4E5s1qdysaU2dAeYFJL_16PLxwAYWyi6yhiKsRb6wADW-5A@mail.gmail.com>
 <20170709081346.GA3196@scaer>
 <855c5444-80f0-491b-5d70-aef7cd13b110@mind.be>
 <20170709124124.GC3196@scaer>
 <CAGt4E5tgfin2Y9tZTYsJR5XH_WwGGJqsdamiDX9m3HrfZrk13Q@mail.gmail.com>
 <CAGt4E5samrvKY5-kwVHuCh6KsoKnmGZsWiRNgT9xpDF=6fcbUg@mail.gmail.com>
Message-ID: <20170713214518.GB3002@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2017-07-13 13:16 -0700, Markus Mayer spake thusly:
[--SNIP--]
> I think I may need some help. I started implementing the suggested
> solution, but I have run into some unexpected problems.
> 
> Specifically, if I move the linux-tool-*.mk files into their own
> sub-directory, all linux-tools related targets disappear. It won't
> build any linux-tools during a regular run of 'make' and it will
> actually say "No rule..." when explicitly asked to build linux-tools:
> 
> $ make linux-tools
> umask 0022 && make -C /home/mmayer/Development/buildroot
> O=/home/mmayer/Development/output/arm64/. linux-tools
> make[1]: *** No rule to make target 'linux-tools'.  Stop.
> Makefile:16: recipe for target '_all' failed
> make: *** [_all] Error 2
> 
> Here's what I have done:
> 
> (mmayer at lbrmn-mmayer) ~/Development/buildroot$ l package/linux-tools/
> total 84
> drwxrwxr-x    3 mmayer mmayer  4096 Jul 13 11:38 .
> drwxrwxr-x 1843 mmayer mmayer 65536 Jul 10 12:28 ..
> -rw-rw-r--    1 mmayer mmayer  2577 Jul 10 11:02 Config.in
> -rw-rw-r--    1 mmayer mmayer  2049 Jul 13 11:20 linux-tools.mk
> drwxrwxr-x    2 mmayer mmayer  4096 Jul 13 11:20 tools

OK, I will attempt a wild gues here... Rename the 'tools' directory to
'linux-tools' and try again.

[--SNIP--]
> Does anybody have any pointers as to why this might be and what to do about it?

Yes, this is becasue the last line in package/linux-tools/linux-tools.mk
is calling to the generic-package infrastructure.

In turn, that line will at some place evaluate the $(pkgname) macro.
pkgname is defined as thus:

    pkgname = $(lastword $(subst /, ,$(pkgdir)))

And in turn, pkgdir is defined as:

    pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))

So, what this does is get the filename of the last included makefile,
keep the directopry part of it, and then extract the last component of
that, to get the package name.

By moving the tools to a sub-directory named 'tools' make that the last
makefile parsed is in that sub-directory by the time pkgname is called,
and it then gets 'tools' instead of 'linux-tools'.

We have a similar situation in linux/linux.mk, see line 425 where we
have an explanation about this:

  423 # Include all our extensions.
  424 #
  425 # Note: our package infrastructure uses the full-path of the last-scanned
  426 # Makefile to determine what package we're currently defining, using the
  427 # last directory component in the path. As such, including other Makefile,
  428 # like below, before we call one of the *-package macro is usally not
  429 # working.
  430 # However, since the files we include here are in the same directory as
  431 # the current Makefile, we are OK. But this is a hard requirement: files
  432 # included here *must* be in the same directory!
  433 include $(sort $(wildcard linux/linux-ext-*.mk))

So I would argue against the sub-directory, but in favour of renaming
the files.

Except that is not necessary, is it? IIRC, you confirmed that this was
in fact not a problem, right?

So, rather than try to fix a problem that does not exist, using fragile
heuristics, I would recommend we keep the status-quo.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
