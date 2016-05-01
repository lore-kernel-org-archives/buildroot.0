From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 14:39:31 +0200
Subject: [Buildroot] [PATCH] ccache: fix explicit build 'make clean
 host-ccache'
In-Reply-To: <1461952973-20054-1-git-send-email-patrickdepinguin@gmail.com>
References: <1461952973-20054-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160501143931.7f767fb8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 20:02:53 +0200, Thomas De Schampheleire wrote:

> To build host-ccache we need to call the bare compiler. With a standard
> 'make', this is guaranteed because host-ccache is built as part of the
> dependencies, and a target-specific variable sets HOSTCC/HOSTCXX to the
> no-ccache version (see ).
> However, this is not the case when using 'make host-ccache' explicitly
> from a clean build.

I think this means that the CC/CXX assignments in
support/dependencies/dependencies.mk are useless, no? If you do "make
clean host-tar", or "make clean host-xz" or "make clean host-sstrip",
it will fail the same way, no? Doesn't this mean that those "special"
package should be fixed to define CC=$(HOSTCC_NOCCACHE)
CXX=$(HOSTCXX_NOCCACHE) in their environment ?

> +# To build host-ccache we need to call the bare compiler. With a standard
> +# 'make', this is guaranteed because host-ccache is built as part of the
> +# dependencies, and a target-specific variable sets HOSTCC/HOSTCXX to the
> +# no-ccache version (see support/dependencies/dependencies.mk).
> +# However, this is not the case when using 'make host-ccache'.
> +HOST_CCACHE_CONF_ENV += CC=$(HOSTCC_NOCCACHE) CXX=$(HOSTCXX_NOCCACHE)

Double quotes around the variable value?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
