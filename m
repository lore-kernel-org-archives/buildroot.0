From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:21:35 +0200
Subject: [Buildroot] [PATCH 1/4] android-tools: fix dependency on
 libselinux
In-Reply-To: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160515212135.4d85f193@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 May 2016 16:17:11 +0200, Thomas Petazzoni wrote:
> The fastboot sub-option of android-tools did not properly replicate the
> dependency of libselinux, which it is selecting. Due to this, an invalid
> configuration could be generated, with fastboot selected while thread
> support is not available for example (and therefore libselinux is not
> available). This problem was causing the following build failure:
> 
>  http://autobuild.buildroot.net/results/21e45cee04fd983c85c6702595ee3f7ed8470931/
> 
> This is fixed by replicating the selinux dependencies in the fastboot
> sub-option and adding the relevant Config.in comment.
> 
> In addition, the main android-tools option had some logic to make sure
> at least one of its sub-option is enabled: adbd by default on systems
> with MMU, and fastboot by default on systems without MMU (because
> fastboot is the only part that builds on noMMU systems).
> 
> However, with the new dependencies in the fastboot sub-option, this
> logic would have become a lot more complicated. Since fastboot is very
> unlikely to be used on noMMU systems, we simply make the whole package
> not available on noMMU systems.
> 
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> Cc: Antoine Tenart <antoine.tenart@free-electrons.com>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/android-tools/Config.in | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)

Applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
