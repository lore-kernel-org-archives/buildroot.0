From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2015 17:29:08 +0200
Subject: [Buildroot] [PATCH 3/3] packages: ensure linux supports modules
	even when not using kernel-module
In-Reply-To: <2af986ecd146d1dc6e7603bd93fac5420c459e41.1440418870.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 24 Aug 2015 14:27:43 +0200")
References: <cover.1440418870.git.yann.morin.1998@free.fr>
 <2af986ecd146d1dc6e7603bd93fac5420c459e41.1440418870.git.yann.morin.1998@free.fr>
Message-ID: <87d1yczovv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some packages build kernel modules without using the kernel-module infra
 > (because they use custom build systems); they do not automatically get
 > the kernel to support modules which is ensured when using the infra.

 > It must be done manually for all those packages.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: No? Rubinstein <nrubinstein@aldebaran.com>
 > Cc: Jan Viktorin <viktorin@rehivetech.com>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/linux-fusion/linux-fusion.mk     | 9 ++++++---
 >  package/nvidia-driver/nvidia-driver.mk   | 4 ++++
 >  package/racehound/racehound.mk           | 4 ++++
 >  package/rtai/rtai.mk                     | 4 ++++
 >  package/ti-gfx/ti-gfx.mk                 | 5 +++++
 >  package/xtables-addons/xtables-addons.mk | 4 ++++
 >  6 files changed, 27 insertions(+), 3 deletions(-)

 > +++ b/package/nvidia-driver/nvidia-driver.mk
 > @@ -91,6 +91,10 @@ ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_MODULE),y)
 
 >  NVIDIA_DRIVER_DEPENDENCIES += linux
 
 > +# We're building a kernel module without using the kernel-module infra,
 > +# so we need to tell we want module support in the kernel:
 > +LINUX_NEEDS_MODULES = y
 > +

Ehh, this should only be done if the package is enabled, E.G.

ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER),y)
LINUX_NEEDS_MODULES = y
endif

-- 
Bye, Peter Korsgaard
