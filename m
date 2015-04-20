From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 23:07:36 +0200
Subject: [Buildroot] [PATCH 1/3] python-pyqt: fix compile on x86
In-Reply-To: <1429543759-32207-1-git-send-email-gwenj@trabucayre.com>
References: <1429543759-32207-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150420230736.489bfd99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Mon, 20 Apr 2015 17:29:17 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> fix :
> http://autobuild.buildroot.net/results/e2a/e2ab7e2e61aaa5758a3a572ae25a047e802fdcc0/
> 
> According to configure-ng.py, PyQt_qreal_double must be disabled only for ARM
> target.

The situation seems unfortunately to be a bit more complicated. From
the configure-ng.py code:

#if defined(QT_NO_FPU) || defined(QT_ARCH_ARM) || defined(QT_ARCH_WINDOWSCE) || defined(QT_ARCH_SYMBIAN) || defined(QT_ARCH_VXWORKS)
    out << "PyQt_qreal_double\\n";
#endif

We indeed don't care about Windows CE, Symbian or VxWorks. QT_ARCH_ARM
is handled by your patch. But not QT_NO_FPU. QT_NO_FPU is defined by Qt
in the following situation:

#if defined(QT_ARCH_ARM) || defined(QT_ARCH_ARMV6) || defined(QT_ARCH_AVR32) || (defined(QT_ARCH_MIPS) && (defined(Q_WS_QWS) || defined(Q_WS_QPA) || defined(Q_OS_WINCE))) || defined(QT_ARCH_SH) || defined(QT_ARCH_SH4A)
#define QT_NO_FPU
#endif

So it's not only ARM, but also SH, SH4A and MIPS in QWS apparently.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
