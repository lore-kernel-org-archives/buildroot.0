From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:47:39 +0100
Subject: [Buildroot] [PATCH] qemu: Remove broken/unneeded PYTHONPATH
In-Reply-To: <20181227215246.14372-1-tpiepho@impinj.com>
References: <20181227215246.14372-1-tpiepho@impinj.com>
Message-ID: <20181228114739.5060f65c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Dec 2018 21:53:07 +0000, Trent Piepho wrote:
> Qemu uses the host-python when building, but the .mk file is pointing the
> host-python interpreter to the target python site-packages, which is both
> incorrect and also unneeded.
> 
> Qemu doesn't need any extra packages [1], so there's no need to provide
> this path.  And indeed qemu builds fine when setting the path to a
> non-existent directory.
> 
> Since target qemu neither depends on nor selects target python, it's
> quite possible to build qemu without a target python, in which case the
> supplied PYTHONPATH is a non-existent directory.
> 
> But even if qemu did want a python package, pointing the host-python to
> the target site-packages will not work.  The package could contain a
> compiled shared library for the target architecture that the host python
> can not load.  This can be tested by adding "import numpy" to one of
> qemu's python scripts and observing target python-numpy failing to load
> when the script is run at build time.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg01758.html
>   "Avoid third-party package dependencies - QEMU currently has none!"
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  package/qemu/qemu.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
