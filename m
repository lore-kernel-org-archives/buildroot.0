From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 19:02:30 +0200
Subject: [Buildroot] [PATCH v2] gcc: explicitly use
 C{XX}FLAGS_FOR_TARGET instead of --enable-target-optspace
In-Reply-To: <1409230758-14548-1-git-send-email-abrodkin@synopsys.com>
References: <1409230758-14548-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140829190230.36493af3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Thu, 28 Aug 2014 16:59:18 +0400, Alexey Brodkin wrote:

> @@ -111,12 +111,15 @@ HOST_GCC_COMMON_CONF_ENV = \
>  # Workaround until it's fixed in 4.5.4 or later
>  ifeq ($(ARCH),powerpc)
>  ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
> -HOST_GCC_COMMON_CONF_OPT += --disable-target-optspace
> +TARGET_CFLAGS := $(subst -Os,,$(TARGET_CFLAGS))
> +TARGET_CXXFLAGS := $(subst -Os,,$(TARGET_CXXFLAGS))

No. Remember that the namespace of variables is global in Buildroot. A
given package is clearly *not* allowed to change global variables such
as TARGET_CFLAGS and TARGET_CXXFLAGS. If you want to remove -Os just
for gcc, you should do:

GCC_TARGET_CFLAGS = $(TARGET_CFLAGS)

ifeq (powerpc ... your condition ...)
GCC_TARGET_CFLAGS = $(filter-out -Os,$(GCC_TARGET_CFLAGS))
endif

HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_TARGET_CFLAGS)"

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
