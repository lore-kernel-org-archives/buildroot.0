From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Jan 2015 22:13:48 +0100
Subject: [Buildroot] [PATCH] spidev_test: use the one from the kernel we
 build
In-Reply-To: <1421696137-17377-1-git-send-email-vincent.stehle@freescale.com>
References: <1421696137-17377-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <20150119211348.GC4217@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,
On 2015-01-19 20:35 +0100, Vincent Stehl? spake thusly:
> Add a configuration option to use the spidev_test.c from the Linux kernel we
> build. This allows to be perfectly consistent between spidev_test and the
> kernel in use.

So, let me try to summarise: we want spidev_test to be exactly in line
with the code from the Linux kernel, because using an older spidev_test
on a newr kernel (or the other way around) is just pointless because it
would not run, right?

But looking at the code, it seems 3.15 seems to be the pivot. any combo
before it would work, every combo after would, not just mix before/after
3.15, right?

Finally, it seems we are (currently) only interested on the heders used
for the toolchain, not the actual kernel running (but that's just
looking at out spidev_test.mk). Is there really no run-time dependency?


Now, say I have a toolchain with 3.15-or-later headers: Buildroot would
build the 3.15-or-later spidev_test. But then what if Buildroot is *not*
building a kernel and I build it outside Buildroot and it is a 3.14
kernel? That would just break at runtime, no?

Or the other way around: my toolchain has 3.14-or-older headers
(plausible with a vendor-provided toolchain), but my kernel is a 3.15+.
So Buildroot would build a 3.14-or-older spidev_test, and that would
break on my 3.15-or-later kernel, no?


So I would say, just have our spidev_test package depend on a Linux
kernel being built, always; and copy spidev_test.c from the Linux source
tree, always.

If the user wants to build a kernel outside of Buildroot, it is their
responsibility to build the appropriate spidev_test.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
