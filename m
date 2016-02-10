From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Feb 2016 16:57:00 +0100
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for
 PowerPC
In-Reply-To: <927354538.1864929.1455117949486.JavaMail.zimbra@datacom.ind.br>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
 <20160205000613.504940f9@free-electrons.com>
 <927354538.1864929.1455117949486.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160210165700.7f97a29c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Santos,

On Wed, 10 Feb 2016 13:25:49 -0200 (BRST), Carlos Santos wrote:

> > config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> >        bool
> >        default y if BR2_arm
> >        default y if BR2_i386
> >        default y if BR2_mipsel
> >        default y if BR2_x86_64
> 
> These architecture checks would be superseded by the BR2_TOOLCHAIN_HAS_ATOMIC boolean.

Indeed.

> >	default y if BR2_TOOLCHAIN_HAS_ATOMIC
> >        depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> > 
> > *and* ensure protobuf gets linked with -latomic.
> 
> Hum, this requires a patch on configure.ac that that would hardly be accepted upstream.

Why? If they use __atomic_*() built-ins, then they must link with
libatomic if it exists, since __atomic_*() built-ins are not guaranteed
to be available on all architectures if you don't link with libatomic.

Look for example at the Android NDK documentation, which says that you
should link with libatomic when using <atomic> in C++ :

  http://developer.android.com/ndk/guides/cpp-support.html

(search for "atomic support").

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
