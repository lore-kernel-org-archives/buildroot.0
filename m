From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Oct 2019 08:52:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] Strip binaries in the rootfs
 creation instead of in target-finalize
In-Reply-To: <20191001013654.22298-2-unixmania@gmail.com>
References: <20191001013654.22298-1-unixmania@gmail.com>
 <20191001013654.22298-2-unixmania@gmail.com>
Message-ID: <20191001085256.6118de95@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Sep 2019 22:36:53 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Since commit 118534fe54 the root filesystem image is generated from a
> temporary copy of TARGET_DIR, so we can strip the binaries in the copy,
> only.
> 
> This allows us to easily find the non-stripped executables to debug with
> gdbserver, as they are at the same relative path in TARGET_DIR as in the
> target device, rather than searching inside the build directory.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=10386
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I see Arnout reviewed-by this, and while I understand the goal, I am
not sure this is the real direction/solution we want for this problem.
I believe the real solution we have been talking about for a long time
is to install everything in STAGING_DIR (not just libraries). This way,
unstripped binaries with debugging symbols with all be in STAGING_DIR.

To me, the change being proposed here makes TARGET_DIR really different
from what ends up in the final rootfs image. While we admittely already
have a few differences, I personally like to keep the idea of
TARGET_DIR being really what's on the target root filesystem, with as
few differences as possible.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
