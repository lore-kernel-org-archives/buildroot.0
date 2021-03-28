From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:52:48 +0200
Subject: [Buildroot] [PATCH 1/1] linux: support uncompressed kernel
In-Reply-To: <87zgyph67r.fsf@dell.be.48ers.dk>
References: <20210324114522.285121-1-egorenar@linux.ibm.com>
 <87zgyph67r.fsf@dell.be.48ers.dk>
Message-ID: <20210328225248.77bb3de4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 26 Mar 2021 23:59:20 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> It looks like this is a s390-specific option:
> 
> commit 89b5202e81df9f0f0f0a11cf8c78bc8bfdc52a21
> Author: Vasily Gorbik <gor@linux.ibm.com>
> Date:   Wed Jun 13 00:00:25 2018 +0200
> 
>     s390/decompressor: support uncompressed kernel
> 
> 
> So it should depend on BR2_s390x.

This is true... but in fact also applies to our other compression
options. For example, if you enable BR2_LINUX_KERNEL_LZMA on arm64, it
does nothing, because this is not supported on arm64.

Or if you use BR2_LINUX_KERNEL_ZSTD, it will only work on mips and x86,
none of the other CPU architectures support that.

And of course, since this is changing from one version of the kernel to
another, we can't really add such dependencies in Buildroot. I've done
so for the uncompressed/s390 case because it felt a bit "special", but
in the general case, it doesn't work :-/

The only way would be some kind of build-time verification that the
option was really taken into account, to at least abort the build if
the option doesn't do anything.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
