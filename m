From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 22:28:34 +0100
Subject: [Buildroot] [PATCH] autossh: honour LDFLAGS
In-Reply-To: <20161125180016.GA360@waldemar-brodkorb.de>
References: <20161125180016.GA360@waldemar-brodkorb.de>
Message-ID: <20161128222834.37958cd9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Nov 2016 19:00:16 +0100, Waldemar Brodkorb wrote:
> Fixes:
>  http://autobuild.buildroot.net/results/08a458572a2e9c599dd32b837b1e5c02a6721973
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> It is indeed a change from uClibc-ng 1.0.18 and upward, but I think
> it is the fault of the package not respecting LDFLAGS and so not
> passing -static. I am unsure why it just worked in the past.
> When it fails linker is doing following:
> -lnsl -lgcc -lc -lgcc
> When -static is used, following is passed:
> -lnsl --start-group -lgcc -lc --end-group 

Applied to master.

The difference in the gcc behavior is due to gcc/config/gnu-user.h:

#define LINK_GCC_C_SEQUENCE_SPEC \
  "%{static:--start-group} %G %L %{static:--end-group}%{!static:%G}"

So, when you're linking dynamic, you have:

	-lgcc -lc -lgcc

And when you're linking statically, you have:

	--start-group -lgcc -lc --end-group

The --start-group/--end-group ask the linker to loop between -lgcc and
-lc until all unresolved symbols have been resolved. So
dl_iterate_phdr() being defined in the C library, but used in libgcc, I
guess the dynamic way (-lgcc -lc -lgcc) doesn't work.

However, this interestingly doesn't happen for other architectures such
as ARM. Maybe dl_iterate_phdr is not used?

In any case, could you try to send your patch upstream to the autossh
developers?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
