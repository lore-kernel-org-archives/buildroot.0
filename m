From: vbr vbr <vvvg77@gmail.com>
Date: Mon, 16 Jan 2012 16:00:26 -0800
Subject: [Buildroot] __tls_get_addr compilation issue
In-Reply-To: <CAOrAeo=gMDLMBaHrTaxWa0z98Ym_kt-DpVOzSZc5W3XPEdzyCg@mail.gmail.com>
References: <CAOrAeo=gMDLMBaHrTaxWa0z98Ym_kt-DpVOzSZc5W3XPEdzyCg@mail.gmail.com>
Message-ID: <CAOrAeon=h3sVxakTz9P3FT7VuvHuHO2_sLZ+Dgxi7+EHrXsSrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case someone else hits this, I worked around the problem by disabling
tls when compiling gcc. This is from crosstool ng config:

grep disable .config
CT_CC_EXTRA_CONFIG_ARRAY="--disable-tls"

Thanks
Vincent


On Wed, Dec 21, 2011 at 3:46 PM, vbr vbr <vvvg77@gmail.com> wrote:

> Hi,
>
> I am seeing an issue while compiling the pcre library (and a few other
> packages) with buildroot-2011.08, using an external ct-ng toolchain. Target
> arch is x86_64.
>
> x86_64-foo-linux-uclibc/lib/../lib64/libstdc++.so: undefined reference to
> `__tls_get_addr'
>
> It seems people usually fix this by adding TLS support, but my config
> already enables that:
>
> uClibc config:
>
> $ grep TLS ../crosstool-ng-1.12.3/uClibc-0.9.32.config
> UCLIBC_HAS_TLS=y
> $ grep THREAD ../crosstool-ng-1.12.3/uClibc-0.9.32.config
> # HAS_NO_THREADS is not set
> # LINUXTHREADS_OLD is not set
> # LINUXTHREADS_NEW is not set
> UCLIBC_HAS_THREADS_NATIVE=y
> UCLIBC_HAS_THREADS=y
> # PTHREADS_DEBUG_SUPPORT is not set
>
> crosstool-ng config:
>
> $ grep THREAD ../crosstool-ng-1.12.3/.config
> CT_LIBC_SUPPORT_THREADS_ANY=y
> CT_LIBC_SUPPORT_LINUXTHREADS=y
> CT_LIBC_SUPPORT_THREADS_NONE=y
> CT_THREADS="linuxthreads"
> CT_THREADS_LINUXTHREADS=y
> # CT_THREADS_NONE is not set
>
> buildroot config:
>
> $ grep THREAD .config
> BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS=y
> BR2_TOOLCHAIN_HAS_THREADS=y
>
> Any idea how to fix this?
>
> Thanks
> Vincent
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120116/68c4c8a8/attachment.html>
