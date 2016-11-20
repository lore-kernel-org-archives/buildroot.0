From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Nov 2016 15:50:22 +0100
Subject: [Buildroot] [PATCH 2/2] kvm-unit-tests: only enable for ARM on
 Cortex-A7 and A15
In-Reply-To: <20161120135006.19498-2-arnout@mind.be>
References: <20161120135006.19498-1-arnout@mind.be>
 <20161120135006.19498-2-arnout@mind.be>
Message-ID: <20161120155022.1970bd8c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 14:50:06 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The library uses the hypervisor instruction HVC, which is only
> available on ARMv7-A with Hypervisor extensions. According to [1],
> this is limited to Cortex-A7 and A15.
> 
> In addition the build unconditionally passes -marm so it also needs
> ARM instructions to be available, but that is already implied by
> the CPU selection.
> 
> Implicitly fixes
> http://autobuild.buildroot.net/results/53d109fd9055fd20387bb857aced5f89cf3086fd
> though it is still not clear why ld doesn't accept the -Ttext=...
> option there.
> 
> [1] https://en.wikipedia.org/wiki/Comparison_of_ARMv7-A_cores
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/kvm-unit-tests/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I've applied to master, but after adding A12 and A17 in the list of
supported cores. Indeed, your [1] reference is incomplete, and A12 and
A17 do have the hardware virtualization extensions, see:

  https://en.wikipedia.org/wiki/ARM_Cortex-A12
  https://en.wikipedia.org/wiki/ARM_Cortex-A17

I've also dropped the BR2_arm part of the condition: depending on
BR2_cortex_a7 || BR2_cortex_a12 || ... is sufficient.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
