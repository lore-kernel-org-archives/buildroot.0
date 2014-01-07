From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jan 2014 08:37:23 +0800
Subject: [Buildroot] [git commit] Makefile: expose 'graph-depends' to
 generate a graph of the dependency tree
In-Reply-To: <20131229111620.90FC09C227@busybox.osuosl.org>
References: <20131229111620.90FC09C227@busybox.osuosl.org>
Message-ID: <20140107083723.2cc506c5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, 29 Dec 2013 12:13:19 +0100, Thomas Petazzoni wrote:

> Generate the graph of the complete dependency tree by calling:
>     make graph-depends
> 
> It's also possible to generate the graph-depends for a single package:
>     make PKG-graph-depends

I just tested this in an out-of-tree situation... and it doesn't work.
It generates the dependency graph of the configuration that is in the
Buildroot source tree (I happened to have one) and not the one of the
Buildroot build tree.

To reproduce:

	cd buildroot-sources/
	make menuconfig
	# create some configuration 1
	mkdir ../buildroot-build
	cd ../buildroot-build
	make -C ../buildroot-sources O=$(pwd) menuconfig
	# create some configuration 2
	make graph-depends

The generated graph will correspond to "configuration 1" and not the
expected "configuration 2".

I suspect it's a problem in the graph-depends script itself rather than
the integration you made, but I haven't looked in detail.

Cheers,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
