From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 14:34:35 +0200
Subject: [Buildroot] [PATCH v2 1/3] python-pyqt: fix PyQt_qreal_double
 enabling/disabling
In-Reply-To: <1429958478-29114-1-git-send-email-gwenj@trabucayre.com>
References: <1429958478-29114-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150425143435.7d1b3ea7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Sat, 25 Apr 2015 12:41:16 +0200, Gwenhael Goavec-Merou wrote:

> +# PyQt_qreal_double must be disabled on ARM or when QT_NO_FPU is set
> +# QT_NO_FPU is set for ARM, SH4 and SH4A
> +ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_sh4)$(BR2_sh4a)$(BR2_sh4aeb),y)
> +PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
> +endif
> +
> +# QT_NO_FPU is also set for QWS on misp
> +ifeq ($(BR2_PACKAGE_QT_EMBEDDED)x$(BR2_mipsel)$(BR2_mips),yxy)
> +PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
> +endif

Can we introduce a hidden Config.in option instead, like:

BR2_PYTHON_PYQT_ARCH_USES_QREAL_FLOAT
	bool
	default y if BR2_arm || BR2_armeb
	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
	default y if (BR2_mipsel || BR2_mips) && BR2_PACKAGE_QT_EMBEDDED

And then:

ifeq ($(BR2_PYTHON_PYQT_ARCH_USES_QREAL_FLOAT),y)
PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
