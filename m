From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 01 Dec 2015 21:17:28 +0100
Subject: [Buildroot] [PATCH] musl: add a sys/queue.h implementation
In-Reply-To: <1448924535-8093-1-git-send-email-sergio.prado@e-labworks.com>
References: <1448924535-8093-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <1449001048.1893.30.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mo, 2015-11-30 at 21:02 -0200, Sergio Prado wrote:
> Musl does not provide a 'sys/queue.h' implementation, and this has
> been
> a problem for packages that depend on it.
> 
> So lets create a package called sys-queue that will install
> 'sys/queue.h'
> in the staging directory when enabled.
> 
> Musl toolchain and external toolchain packages will depend on this
> package, so that 'sys/queue.h' will be always installed when
> compiling
> with a musl based toolchain.
> 

Maybe we can handle this similiar to the gettext integration and define
a BR2_NEEDS_SYS_QUEUE for toolchains not providing a queue library.

Packages that need a queue implementation can use 'select
BR2_PACKAGE_NETBSD_QUEUE if BR2_NEEDS_SYS_QUEUE' in their Config.in
file and add a '$(if $(BR2_NEEDS_SYS_QUEUE),netbsd-queue)' to their
dependencies in the .mk file.?

This means we have a package 'netbsd-queue' with the sources of the
NetBSD project you proposed. Note, there exists more implementations of
the queue library, e.g. OpenBSD, Apple, so I would prefer to use the
name of the implementation as there is no *the* sys/queue.h.

Furthermore, we allow a package to use, for whatever reasons, to select
a different queue implementation.

On the other hand, maybe it is to confusing for the package maintainer
to have different options for a queue library, so we just provide a
default package named 'sys-queue' using the sources of NetBSD?

Best regards
J?rg Krause
