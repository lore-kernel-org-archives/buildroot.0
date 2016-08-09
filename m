From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:49:14 +0200
Subject: [Buildroot] [PATCH 1/2] webrtc-audio-processing: fix build on
 ARM Cortex-M
In-Reply-To: <1470477765-9014-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470477765-9014-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160809154914.1a0398cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Aug 2016 12:02:44 +0200, Thomas Petazzoni wrote:
> The webrtc-audio-processing configure script assumes that if the
> host_cpu part of the tuple is "arm", then ARM instructions are
> available. This is obviously incorrect for ARM Cortex-M platforms, which
> only support the Thumb-2 instruction set.
> 
> In order to address this, we add a patch,
> 0001-configure.ac-fix-architecture-detection.patch, which changes how
> webrtc-audio-processing detects the architecture: instead of relying on
> the host_cpu part of the tuple, it relies on the built-in definitions of
> the compiler.
> 
> Not only it fixes the Cortex-M detection, but it also enables ARMv7
> optimizations on ARMv7-A: until now they were only enabled when the
> host_cpu part of the tuple was armv7, which is never the case in
> Buildroot.
> 
> However, once this issue is fixed for Cortex-M, the build nonetheless
> fails later due to the usage of NPTL-only functions. So we change the
> thread dependency to a NPTL dependency.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/4933082cd7cc5781404c77ccef5c2b9333c5f714/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...1-configure.ac-fix-architecture-detection.patch | 84 ++++++++++++++++++++++
>  package/webrtc-audio-processing/Config.in          |  7 +-
>  .../webrtc-audio-processing.mk                     |  2 +
>  3 files changed, 90 insertions(+), 3 deletions(-)
>  create mode 100644 package/webrtc-audio-processing/0001-configure.ac-fix-architecture-detection.patch

I've applied both patches to master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
