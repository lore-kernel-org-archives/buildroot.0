From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jun 2010 11:51:41 +0200
Subject: [Buildroot] On strip and debugging symbols
In-Reply-To: <87vd9a5bvy.fsf@macbook.be.48ers.dk>
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<87hbkv6sej.fsf@macbook.be.48ers.dk>
	<0D753D10438DA54287A00B027084269763715D651B@AUSP01VMBX24.collaborationhost.net>
	<87d3vi7qqq.fsf@macbook.be.48ers.dk> <20100623091224.266d1030@surf>
	<874ogu6vsv.fsf@macbook.be.48ers.dk> <20100623104613.78fe0d97@surf>
	<87vd9a5bvy.fsf@macbook.be.48ers.dk>
Message-ID: <20100623115141.0bf70116@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Jun 2010 11:36:17 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> As mentionned before, adding $(STAGING_DIR)/usr/bin to the
>  Thomas> path is just wrong. The possible solutions to this are :
> 
> True, but it's happening today, and adding target binaries to staging
> without a very clear notice to people is bound to be a support
> headache.

Even today there are a few target binaries being installed in
$(STAGING_DIR) together with some libraries for which we do
<pkg>_INSTALL_STAGING=YES. But, granted, it's not the general case.

Yes, we'll have to put a clear notice in the documentation and release
notes about this, but it doesn't seem impossible to me. We'll get some
support requests for sure, but they don't seem to be particularly
difficult to handle: as soon as we'll see someone with a failure saying
that "cannot execute binary file", we'll know what the problem is.

>  Thomas>  * Install the toolchain outside of $(STAGING_DIR) and then
>  Thomas> re-use what we do for external toolchains, and then tell
>  Thomas> people to not add $(STAGING_DIR)/usr/bin to their PATH, but
>  Thomas> rather the location where the toolchain was installed. This
>  Thomas> has the added benefit that $(STAGING_DIR) would not contain
>  Thomas> binaries compiled for the host, mixed with binaries compiled
>  Thomas> for the target.
> 
> That means that people have to start passing -sysroot options,
> otherwise the compiler cannot find the header files / libraries.

Yes, if we don't do the wrappers thing.

> Would these wrappers then set sysroot? That could perhaps work. I
> wonder if the shell overhead would be significant.

Yes, these wrappers would set sysroot.

I'm not sure the cost of a shell wrapper is significant compared to the
cost of the compilation process itself (which already does quite a few
forks to run the preprocessor, the compiler, the assembler, etc.).

So, what would be the conclusion of this ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
