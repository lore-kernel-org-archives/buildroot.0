From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Sep 2012 09:30:25 +0200
Subject: [Buildroot] Host xmllint dynamic link failure
In-Reply-To: <50624463.1000200@mind.be>
References: <50624463.1000200@mind.be>
Message-ID: <20120926093025.0ba0c3d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 26 Sep 2012 01:55:15 +0200, Arnout Vandecappelle wrote:
>   During one of my test builds, I ran into a dynamic linker failure
> when running xmllint:
> 
> /usr/bin/xmllint: relocation error: /usr/bin/xmllint: symbol
> xmlShell, version LIBXML2_2.4.30 not defined in file libxml2.so.2
> with link time reference
> 
>   The problem is that we compile with
> LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:", so that our host-libxml2 is
> used instead of the one in /usr/lib.  Or, the problem is
> that /usr/bin/xmllint is used instead of
> $(HOST_DIR)/usr/bin/xmllint.  The path is hardcoded in xmlto...
> 
>   Possible solutions:
> 
> - Build host-xmlto.  This will require updating all packages using
> xmlto to add host-xmlto to the dependencies.

I am not sure to understand. Aren't we already building xmllint for the
host? I don't follow your explanation entirely here. Anyway, if there
is something from the host that we're using and that isn't part of the
mandatory Buildroot dependencies, then it should definitely be built as
a dependency, yes.

> - Remove LD_LIBRARY_PATH and rely on rpath to find the libraries.
> This may require patching some of the host packages.  At first sight,
> it doesn't look too bad, however.

Normally yes, I think we should remove LD_LIBRARY_PATH. The idea is to
build all binaries installed in $(HOST_DIR)/usr/bin with a rpath, and
that is normally sufficient to let them find the libraries.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
