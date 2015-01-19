From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Jan 2015 22:32:58 +0100
Subject: [Buildroot] [PATCH] spidev_test: use the one from the kernel we
 build
In-Reply-To: <20150119211348.GC4217@free.fr>
References: <1421696137-17377-1-git-send-email-vincent.stehle@freescale.com>
 <20150119211348.GC4217@free.fr>
Message-ID: <20150119213258.GD4217@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2015-01-19 22:13 +0100, Yann E. MORIN spake thusly:
> Vincent, All,
> On 2015-01-19 20:35 +0100, Vincent Stehl? spake thusly:
> > Add a configuration option to use the spidev_test.c from the Linux kernel we
> > build. This allows to be perfectly consistent between spidev_test and the
> > kernel in use.
> 
> So, let me try to summarise: [...]

After discussing on IRC with Gustavo, I decided to further reply with
some clarifications.

I'll use a table, that should much easier to understand (hopefully).

We need to have spidev_test buildable, so it needs to be aligned with
the kernel headers from the toolchain.

toolchain headers:  3.14-   3.15+
spidev_test:
    3.14-            OK      OK*
    3.15+            KO      OK

* builds but is missing new features.

Ten at runtime we need a similar table:

spidev_test:   3.14-    3.15+
kernel:
    3.14-       OK       KO
    3.15+       OK*      OK

[*] builds and runs, but missing extra features.

The only broken case is when using toolchain headers 3.15+ with a 3.14-
kernel, becuse currently, we'd build a 3.15+ spidev_test, and that would
break at runtime.

Al other cases are supposed to build and run, albeit with restricted
features in one cae: using 3.14- toolchain headers with a 3.15+ Linux
kernel.

(Note: by "toolchain headers X.Y", I really mean "toolchain with kernel
headers version X.Y").

So, we're currently screwed with a too-recent toolchain that builds an
ancient kernel.

Is that all correct?

So, if we want to be bullet-proof, we can *not* build spidev_test if we
do not know both the toolchain headers version *and* the running kernel
version. Otherwise, all we can do is build the largest common
denominator, which is a spidev_test 3.14- (that is, a 3.0 in our current
code).

Anything I missed?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
