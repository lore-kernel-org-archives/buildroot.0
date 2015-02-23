From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 23 Feb 2015 12:32:47 +0100
Subject: [Buildroot] [PATCH v2 0/2] sigrok fixes and pulseview package
Message-ID: <1424691169-14397-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> I am not really happy with this, because there are potentially plenty
> of external toolchains that support C++11. So I believe we really need
> to go ahead and add a:
> 
>         BR2_TOOLCHAIN_HAS_CXX11
> 
> And make sure it gets properly selected depending on whether the
> toolchain has C++11 support or not. You can look at how
> BR2_TOOLCHAIN_HAS_SSP or BR2_TOOLCHAIN_HAS_THREADS are implemented for
> example.
> 
> Moreover, you make this apparently depend on the selected C library.
> But isn't C++11 support purely a gcc problem ?
> 
> Thanks,
> 
> Thomas

Frankly I no longer know what the problem was. I'd swear libsigrok configure
was failing after not passing some C++11 support tests until I switched to
glibc, so I thought uClibc might not implement some features C++11 requires.
But today I ran a clean build against uClibc and it compiled fine - both
libsigrokcxx and pulseview.

So as much as you're right about BR2_TOOLCHAIN_HAS_CXX11 I would like to
propose merging these two patches in which I removed (E)GLIBC dependencies.

Both patches have been rebased against buildroot-next. Tested on a BeagleBone
Black with enlightenment window manager via vncviewer.

Best regards,
Bartosz Golaszewski

Bartosz Golaszewski (2):
  libsigrok: enable building C++ bindings
  pulseview: new package

 package/Config.in              |  1 +
 package/libsigrok/Config.in    | 12 ++++++++++++
 package/libsigrok/libsigrok.mk |  9 ++++++++-
 package/pulseview/Config.in    | 28 ++++++++++++++++++++++++++++
 package/pulseview/pulseview.mk | 24 ++++++++++++++++++++++++
 5 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 package/pulseview/Config.in
 create mode 100644 package/pulseview/pulseview.mk

-- 
2.1.4
