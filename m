From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 22:44:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/ruby: disable use of stack
 protector when not available
In-Reply-To: <1442347019-28368-1-git-send-email-brendanheading@gmail.com>
References: <1442347019-28368-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150916224451.45bbe561@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Tue, 15 Sep 2015 20:56:59 +0100, Brendan Heading wrote:
> Fixes:
> http://autobuild.buildroot.net/results/22e/22eced2dc9ca1bc90ef193b4dc40891c47157e89/
> 
> ruby, by default, attempts to use the stack protector if configure detects
> that it exists. The stack protector detection does not attempt to link
> libssp, which can cause a false positive.
> 
> Instead, check if the stack protector is enabled in the buildroot
> toolchain config, and set the stack_protector=no environment variable to
> force the stack protector off.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>

I have the same concern/question for this patch as the one for the sudo
patch. With an ARM uClibc toolchain that is pre-built
(http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config),
Ruby builds just fine because:

checking whether -fstack-protector is accepted as CFLAGS... yes
checking whether -fstack-protector is accepted as LDFLAGS... no

So it knows that SSP support is not available.

However, with the PowerPC toolchain of the autobuilder failure you're
pointing to:

checking whether -fstack-protector is accepted as CFLAGS... yes
checking whether -fstack-protector is accepted as LDFLAGS... yes

So same as for the sudo patch: I'm fine with applying your patches, but
I'd prefer first to understand why we see this difference in behavior.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
