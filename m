From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 14 Dec 2009 10:25:45 +0100
Subject: [Buildroot] *Tons* of BR warnings like
	"package/Makefile.autotools.in:179: warning: overriding
	commands for target `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <87pr6isgvb.fsf@macbook.be.48ers.dk>
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
	<4B221A6E.3090105@gmail.com>
	<5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
	<874onxvjyx.fsf@macbook.be.48ers.dk>
	<5f2b60912110514o79498b66lae1603f5f4fe6345@mail.gmail.com>
	<87zl5ptxv4.fsf@macbook.be.48ers.dk>
	<5f2b60912110653q3ad5824fpa86b07e38dab5a2@mail.gmail.com>
	<87vdgdttyp.fsf@macbook.be.48ers.dk>
	<5f2b60912131251r647113bfj454cbf17c7bca57e@mail.gmail.com>
	<87pr6isgvb.fsf@macbook.be.48ers.dk>
Message-ID: <5f2b60912140125s6568fb7i23eed7851de7266f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/12/13 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
>
> Hi,
>
> ?Bj?rn> I finally found the bug. (Thanks a lot for the hint, Peter.)
> ?Bj?rn> BASE_DIR ends up containing the Buildroot output directory *two*
> ?Bj?rn> times (separated by a space). And it happends because I use the
> ?Bj?rn> CDPATH environment variable.
>
> ?Bj?rn> Let me demonstrate:
>
> ?Bj?rn> $ mkdir dir
> ?Bj?rn> $ (CDPATH= cd dir/) ? ? ?# no output
> ?Bj?rn> $ (CDPATH=.:.. cd dir/) ?# output!
> ?Bj?rn> /tmp/directory/dir
>
> Ahh - I use zsh dir hashes for that kind of stuff instead.
>
> ?Bj?rn> This means that when the top Makefile in BR says:
>
> ?Bj?rn> ? BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
>
> ?Bj?rn> both 'cd' and 'pwd' will print out the same path (when CDPATH is
> ?Bj?rn> non-empty), BASE_DIR will be containing two identical paths. Make freaks
> ?Bj?rn> out and BR fails.
>
> ?Bj?rn> So to fix this issue I thought it would be easy to remove CDPATH from
> ?Bj?rn> the Buildroot environment. But how? I tried:
>
> ?Bj?rn> export CDPATH:=
> ?Bj?rn> unexport CDPATH
>
> ?Bj?rn> in the top Makefile but neither worked.
>
> It does work, but only for stuff running inside the make rules:
>
> cat Makefile
> export CDPATH:=
> all:
> ? ? ? ?set|grep CDPATH
>
> export CDPATH=.:~
> make
> set|grep CDPATH
> BASH_EXECUTION_STRING='set|grep CDPATH'
> CDPATH=
>
> sed -i 's/export/#export/' Makefile
> make
> set|grep CDPATH
> BASH_EXECUTION_STRING='set|grep CDPATH'
> CDPATH=.:/home/peko
>
> But if you instead have something using $(shell ) it won't work:
>
> cat Makefile
> export CDPATH:=
> DUMMY:=$(shell set|grep CDPATH >&2)
> all:
> ? ? ? ?set|grep CDPATH
>
> make
> BASH_EXECUTION_STRING='set|grep CDPATH >&2'
> CDPATH=.:/home/peko
> set|grep CDPATH
> BASH_EXECUTION_STRING='set|grep CDPATH'
> CDPATH=
>
> E.G. the export doesn't effect the environment of $(shell ).
>
> So the proper fix is to do:
>
> unset CDPATH:=
> and explicitly work around if for BASE_DIR, E.G.:
>
> BASE_DIR := $(shell mkdir -p $(O) && cd $(O) >/dev/null && pwd)
>
> I'll fix that in git.

I have just git pulled your fix and now it works. Thanks!

> ?Bj?rn> It is also possible to use absolute paths when defining BASE_DIR. But I
> ?Bj?rn> don't know how to do that when the output variable O can be relative or
> ?Bj?rn> absolute:
>
> ?Bj?rn> ? $ make O=/tmp/output
> ?Bj?rn> ? $ make O=output
>
> Well, that's the point of the 'cd $(O) >/dev/null && pwd' part (convert
> to absolute path).

Of course, silly me. What I should have said was that because $(O) may
be absolute,
one cannot just do something like this:

  cd $(PWD)/$(O)    # will not print anything even if CDPATH is set but it
                    # it only works for $(O) with relative paths

Best regards,
Bj?rn Forsman
