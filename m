From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 23:07:03 +0100
Subject: [Buildroot] [PATCH v6 17/28] core/pkg-infra: Fix package file
 statistics for parallel build
In-Reply-To: <20200217212350.29750-18-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-18-anaumann@ultratronik.de>
Message-ID: <20200311230703.37bf0b63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Feb 2020 22:23:39 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> When activating top level parallel build, multiple processes may
> try to modify the various *files-list* files in the common build/
> directory at the same time. This can cause racy build failures.
> 
> The fix here is to use flock to ensure exclusive execution of the
> statistics gathering code. For this to work it is assumed that the
> target/staging/host directories are isolated, which is true for
> per-package builds.
> For standard sequential builds, the locking is of course unnecessary
> but no conditional handling is implemented  since the runtime cost is
> expected to be next to nothing.
> 
> For flock to work, the statistics gathering code must be run in a
> single subshell. Otherwise the lockfile descriptor would be closed
> after the subshell (= the Makefile line where it was opened) ends
> and thus the lock would be released before even entering the critical
> code section.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

This is no longer needed: we have taken a different approach in commit
0e2be4db8ab01d479177a3a187c22525752195ae, where we make the logic
per-package, and collect the overall data in target-finalize.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
