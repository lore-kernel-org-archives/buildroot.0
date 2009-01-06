From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 13:50:36 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <87y6xpv7fl.fsf@macbook.be.48ers.dk>
References: <20090105161237.034D977404@busybox.osuosl.org>
	<1231179121.8886.225.camel@linux-yrgm.site>
	<87y6xpv7fl.fsf@macbook.be.48ers.dk>
Message-ID: <1231246236.32308.68.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-05 klockan 21:12 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  Ulf> The "complex" file name is needed, unless you only
>  Ulf> work with a single board.
> 
> I don't get it - Isn't that why we have binaries/<project>? 

YOu copy things to binaries/PROJECT to have a single directory
which you can compress, but if you copy the stuff to
the tftp directory then you have a mess.
You have to manually rename this.

> 
> Even so,
> isn't that the same problem with the other files? (file system images,
> kernels)?

The kernel is already doing this in the "advanced" makefile.

The rootfs should be doing it. and in this case PROJECT Is definitely
the right one to use.

>  Ulf> We obviously need to find  a way that does not break the build of
>  Ulf> course.
> 
>  Ulf> Many targets define BR2_BOARD_NAME in their Config.in's
>  Ulf> and it may make sense to have a common BR2_BOARD_NAME
>  Ulf> Then it will be always be defined.
>  Ulf> Default to "uclibc" is probably OK.
> 
> Isn't that what we have BR2_PROJECT for?
> 


Yes and no,

You can use BR2_PROJECT, but if you:

make XXXX_config 
when building u-boot-<VERSION>, it also makes sense to name the binary

<XXXX>-u-boot-<VERSION>-<DATE>.bin

because regardless of which project you are building,
the binary should end up the same.

<DATE> is there to give you some kind of revision information
so you do not overwrite older working results.
It is not perfect, but I think it is good enough.

If you are building several projects where the U-Boot differs
I.E: if a header file is first copied to "include/configs" 
then it would make sense to call it:

?<PROJECT>-u-boot-<VERSION>-<DATE>.bin

The difference is minor, so I guess we go with PROJECT for now.

BR
Ulf Samuelsson
