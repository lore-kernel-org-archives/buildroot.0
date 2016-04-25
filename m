From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 00:05:23 +0200
Subject: [Buildroot] [PATCH] wf111: fix overwriting module files during
 install
In-Reply-To: <1446569533-25368-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1446569533-25368-1-git-send-email-antoine.tenart@free-electrons.com>
Message-ID: <20160426000523.06d9b9aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Nov 2015 17:52:13 +0100, Antoine Tenart wrote:
> From: Matthew Starr <mstarr@hedonline.com>
> 
> When installing the WF111 modules, the module.* files generated
> during the kernel compilation were overrided. This ended up having
> the wrong information about the modules compiled in a given image
> (and only the one about the WF111 module). This could be verified
> using the "modprobe -l" command, with only the wf111 module showing
> up.
> 
> This patch fixes this, by removing the manual copy of the generated
> files (in WF111_INSTALL_TARGET_CMDS) and by instead using the build
> command to populate our target directory, containing the module.*
> files. This way the files are not overrided but instead updated
> with the additional WF111 informations.
> 
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> Tested-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  package/wf111/wf111.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Sorry for the long delay. I've applied this patch, after changing it so
that the entire process takes place in the install-target step rather
than the build step. The rationale is mainly that for statistics
reasons, we do some tracking of which package installs what, and this
tracking is done around the install-target step, so it is quite
important that the build step doesn't install anything.

Also, I've done two other commits:

 - One that makes a proper use of the WF111_VERSION variable
   https://git.buildroot.net/buildroot/commit/?id=4389b88695ae01d0fd9e0ec69680b69c3d565095

 - One that updates the wf111 package to version 5.2.2-r2, which is
   needed for the driver to build with a modern kernel.
   https://git.buildroot.net/buildroot/commit/?id=47b9c8ae2265179bd215742fda5f572e1b1aa394

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
