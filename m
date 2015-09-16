From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 12:39:43 +0200
Subject: [Buildroot] [PATCH] libselinux: use correct definition of ARCH
In-Reply-To: <1442398203-46701-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1442398203-46701-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150916123943.16869e63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 16 Sep 2015 11:10:03 +0100, Vicente Olivert Riera wrote:
> The Makefile of libselinux performs the following check:
> 
> ARCH := $(patsubst i%86,i386,$(shell uname -m))
> ifneq (,$(filter i386,$(ARCH)))
> TLSFLAGS += -mno-tls-direct-seg-refs
> endif
> 
> Which means that if the host machine is an x86, then TLSFLAGS will
> contain -mno-tls-direct-seg-refs. That command line option causes
> libselinux to fail when building it for target architectures where the
> compiler doesn't support that option, i.e. MIPS:
> 
> mips-img-linux-gnu-gcc: error: unrecognized command line option
> ?-mno-tls-direct-seg-refs?
> 
> So to fix that problem we can set the ARCH variable to $(KERNEL_ARCH),
> and then append it to the LIBSELINUX_MAKE_OPTS.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Looks good to me:

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I'm surprised we never caught this through the autobuilder testing, but
I guess all autobuilder machines are x86_64 based, which will not
exhibit the problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
