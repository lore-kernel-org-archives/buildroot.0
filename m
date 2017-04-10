From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Apr 2017 10:28:02 +0200
Subject: [Buildroot] [PATCH/autobuild 5/8] autobuild-run: check that
 toolchain config lines are still present
In-Reply-To: <20170409205128.11560-5-arnout@mind.be>
References: <20170409205128.11560-1-arnout@mind.be>
 <20170409205128.11560-5-arnout@mind.be>
Message-ID: <20170410102802.4b804b67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 9 Apr 2017 22:51:25 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Some lines from the toolchain config may be removed due to dependency
> issues. Currently this is covered by explicit conditions in the
> autobuild-run script, e.g. checking that libc is not glibc before
> enabling BR2_STATIC_LIBS. However, that binds this script pretty
> tightly to the logic in Buildroot itself.

Seems like a good idea!

> +    # Check that the toolchain configuration is still present
> +    # Report all the missing ones
> +    toolchaincomplete = True
> +    for toolchainline in kwargs['config']:
> +        if toolchainline not in configlines:
> +            log_write(log, "WARN: missing toolchain config line: %s" % toolchainline[:-1])

We should remove this warning, it's not a warning at all. It is
a perfectly normal situation that a configuration gets rejected here,
for example when glibc+static is used. So having a warning everytime a
completely regular situation occurs doesn't seem like a good idea.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
