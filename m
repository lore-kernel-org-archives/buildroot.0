From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jan 2016 00:11:08 +0100
Subject: [Buildroot] [PATCH] core: fix setting of HOSTARCH
In-Reply-To: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
References: <1447095621-32080-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CACXmViZUX+KJREOxhJ-DpoDf2Tv49d7EszR0VbMuXmr0=o6GEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 9, 2015 at 8:00 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, we set HOSTARCH to the output of `uname -m`. This gives us
> the architecture as seen by the running kernel. For example, we would
> end up with 'x86_64' for a 64-bit kernel running on an x86_64 processor.
>
> We use that value to determine whether we can run some binary tools,
> like our pre-configured external toolchains.
>
> However, one may be running a userland in a different bitness than that
> of the running kernel. For example, one may run in a 32-bit chroot, even
> though the kernel is running in 64-bit.
>
> Up until recently, this was not an issue because the pre-configured
> external toolchains were all requiring an i386 (x86 in Buildroot
> parlance).
>
> But since w eintroduced the latest Linaro toolchains, we now have
> toolchains that require a 64-bit userland.
>
> So, when running on a 64-bit kernel, we believe those toolchains are
> available, even when the user is running a 32-bit userland. This causes
> build failures for our autobuilders, like so:
>
>     http://autobuild.buildroot.org/results/9cd/9cdf10ec5b31144b2e03ea09cf128702339895b3/
>
> with the following symptoms:
>
>     >>> toolchain-external undefined Configuring
>     Cannot execute cross-compiler '/home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bin/aarch64-linux-gnu-gcc'
>
> So, instead of relying on the output of `uname -r`, look for the host
> gcc and extract the target it was configured to generate code for.
>
> Fixes:
>     http://autobuild.buildroot.org/results/9cd/9cdf10ec5b31144b2e03ea09cf128702339895b3/  (aarch64)
>     http://autobuild.buildroot.org/results/888/8889aa7d9fb48370e4760a6edbc6d3ae945f02f2/  (arm)
>     and many more...
>
> Besides fixing those issues, it will also allow us to add the 64-bit
> variants of toolchains when they exist, like the upcoming Codescape
> MTI and IMG toolchains for MIPS from Imagination Technologies.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  Makefile | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)

Committed after changing it to use HOSTCC_NOCCACHE instead of 'gcc', thanks!

--
Bye, Peter Korsgaard
