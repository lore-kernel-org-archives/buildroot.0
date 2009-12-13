From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sun, 13 Dec 2009 21:51:35 +0100
Subject: [Buildroot] *Tons* of BR warnings like
	"package/Makefile.autotools.in:179: warning: overriding
	commands for target `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <87vdgdttyp.fsf@macbook.be.48ers.dk>
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
	<4B221A6E.3090105@gmail.com>
	<5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
	<874onxvjyx.fsf@macbook.be.48ers.dk>
	<5f2b60912110514o79498b66lae1603f5f4fe6345@mail.gmail.com>
	<87zl5ptxv4.fsf@macbook.be.48ers.dk>
	<5f2b60912110653q3ad5824fpa86b07e38dab5a2@mail.gmail.com>
	<87vdgdttyp.fsf@macbook.be.48ers.dk>
Message-ID: <5f2b60912131251r647113bfj454cbf17c7bca57e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/12/11 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
> ?Bj?rn> and when building a non-working configuration, there is no other
> ?Bj?rn> output than the warnings and then full stop. Make quits before
> ?Bj?rn> running the 'test' target! See the log:
>
> Ahh yes, you never get that far with those warnings.
>
> I think your BASE_DIR and/or BUILD_DIR variables somehow gets an extra
> space appended/prepended.
>
> Could you change the BASE_DIR := line in the toplevel makefile to simply
> read:
>
> BASE_DIR:=home/bjornfor/dev/buildroot/output
>
> and try again?

I finally found the bug. (Thanks a lot for the hint, Peter.) BASE_DIR ends
up containing the Buildroot output directory *two* times (separated by a
space). And it happends because I use the CDPATH environment variable.

Let me demonstrate:

$ mkdir dir
$ (CDPATH= cd dir/)      # no output
$ (CDPATH=.:.. cd dir/)  # output!
/tmp/directory/dir

This means that when the top Makefile in BR says:

  BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)

both 'cd' and 'pwd' will print out the same path (when CDPATH is
non-empty), BASE_DIR will be containing two identical paths. Make freaks
out and BR fails.

So to fix this issue I thought it would be easy to remove CDPATH from
the Buildroot environment. But how? I tried:

export CDPATH:=
unexport CDPATH

in the top Makefile but neither worked.

It is also possible to use absolute paths when defining BASE_DIR. But I
don't know how to do that when the output variable O can be relative or
absolute:

  $ make O=/tmp/output
  $ make O=output

Any suggestions?

Best regards,
Bj?rn Forsman
