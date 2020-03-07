From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Mar 2020 21:43:59 +0100
Subject: [Buildroot] [git commit] package/meson: fix shebang in deep
 build trees
In-Reply-To: <20200203105752.84852886FC@busybox.osuosl.org> (Peter Korsgaard's
 message of "Mon, 3 Feb 2020 12:08:48 +0100")
References: <20200203105752.84852886FC@busybox.osuosl.org>
Message-ID: <87sgijx5dc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=62df914ced5adab3869c2ce6f9a41203802e6358
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The meson script includes the full path to the python interpreter. In
 > deep build trees, this path can be more than 128 characters long, which
 > is the limit for how long a shebang may be.

 > Notice that this has been bumped to 256 since kerel 5.1, but the issue still
 > persists:
 > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6eb3c3d0a52dca337e327ae8868ca1f44a712e02

 > In older kernels, this limit was silently ignored, leading to potential
 > bugs, but newer kernels enforce that limit, and refuse to execve() the
 > script, returning with NOEXEC.  Since the script is +x, the shell (any
 > bourne shell, as well as the C shell) will conclude from that situation that
 > they should interpret it as a shell script, which it obviously is not.

 > Fix the problem by replacing the shebang with a call to /usr/bin/env
 > which will redirect to the correct python3 interpreter found in the
 > PATH.

 > Note however that this means our meson installation can no longer be
 > called from outside of the meson-package infrastructure anymore (not
 > that we ever supported it before, but who knows what people may have
 > done in their br2-external), unless one does set the PATH to include
 > $(HOST_DIR)/bin/ earlier than a system-provided python3 would be found.

 > Fixes: #12331 #12461

 > Reported-by: Jean-pierre Cartal <jpcartal@free.fr>
 > Reported-by: Matthias Wei.?er <m.weisser.m@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
