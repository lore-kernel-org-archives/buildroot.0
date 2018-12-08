From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 10:43:33 +0100
Subject: [Buildroot] [PATCH v2] pcm-tools: new package
In-Reply-To: <20181207012023.29474-1-casantos@datacom.com.br> (Carlos Santos's
 message of "Thu, 6 Dec 2018 23:20:23 -0200")
References: <20180123140324.20801-2-casantos@datacom.ind.br>
 <20181207012023.29474-1-casantos@datacom.com.br>
Message-ID: <87efas5p6i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:

 > Processor Counter Monitor (PCM) is an application programming interface
 > (API) and a set of tools based on the API to monitor performance and
 > energy metrics of Intel(R) Core(TM), Xeon(R), Atom(TM) and Xeon Phi(TM)
 > processors.

 > This package contains a patch on the pmu-query.py script to look for the
 > pcm-core program at the default path. It's not nice to have a Buildroot
 > specific patch but let's use one while we look for a solution that is
 > acceptable upstream.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > ---
 > Supersedes: https://patchwork.ozlabs.org/patch/864801/
 > CC: Romain Naour <romain.naour@gmail.com>
 > CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Changes v1->v2
 >   - Update to version 201812
 >   - Do not build the test daemon
 >   - Drop the patch on the test daemon, that we don't build
 >   - Drop a patch already applied upstream
 >   - Update the pmu-query.py patch
 >   - Make the changes suggested by Romain Naour and Thomas Petazzoni

 > +config BR2_PACKAGE_PCM_TOOLS
 > +	bool "pcm-tools"
 > +	depends on BR2_i386 || BR2_x86_64
 > +	select BR2_PACKAGE_HWDATA
 > +	select BR2_PACKAGE_HWDATA_PCI_IDS

It is written in C++, so I've added the BR2_INSTALL_LIBSTDCPP dependency
and a comment.


 > +	help
 > +	  Processor Counter Monitor (PCM) is an application programming
 > +	  interface (API) and a set of tools based on the API to monitor
 > +	  performance and energy metrics of Intel(R) Core(TM), Xeon(R),
 > +	  Atom(TM) and Xeon Phi(TM) processors.
 > +
 > +	  Requires a kernel with X86_MSR enabled.

It makes more sense to just forcible enable it in linux.mk if pcm-tools
is enabled, similar to how we do it for other packages.

Committed with these 2 fixes, thanks.

-- 
Bye, Peter Korsgaard
