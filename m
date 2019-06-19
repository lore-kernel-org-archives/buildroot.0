From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 14:46:47 +0200
Subject: [Buildroot] [PATCH 07/27] package/bullet: re-enable package
 when gcc bug 85180 is present
In-Reply-To: <20190614210346.121013-8-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-8-giulio.benetti@micronovasrl.com>
Message-ID: <20190619144647.2a2954a6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:26 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> With Microblaze Gcc version < 8.x the build hangs due to gcc bug 85180:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This package has
> been excluded from building if the toolchain is affected by gcc bug
> 85180. To be consistent with how we deal with this issue in other
> packages, we re-enable the package and instead work around the issue
> by building with -O0, since gcc bug 85180 manifests itself only when
> optimization is enabled.
> 
> To achieve this pass -O0 to CMAKE_CXX_FLAGS in CONF_OPT and remove
> 'depends on !BR2_microblaze' and its comment if not available from
> Config.in.
> 
> Note that the comment was talking about gcc bug 68476, but this gcc
> bug is a duplicate of 85180. Since all Buildroot packages now use the
> reference to gcc bug 85180 and the option is named
> BR2_TOOLCHAIN_HAS_GCC_BUG_85180, we use this naming as well for
> bullet.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

I've applied after doing one change, see below.

> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
> +BULLET_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O0"
> +endif

Like the previous patch series, I really prefer this:

BULLET_CXXFLAGS = $(TARGET_CXXFLAGS)

ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
BULLET_CXXFLAGS += -O0
endif

BULLET_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(BULLET_CXXFLAGS)"

Indeed, it will help avoiding mistakes in the future. So I fixed this
up before applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
