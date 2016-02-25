From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 13:54:36 +0100
Subject: [Buildroot] [PATCH 2/2] host-m4: fix build when -std=gnu99 and
 inline functions are used
In-Reply-To: <1456400230-4187-3-git-send-email-ltrimas@synopsys.com>
References: <1456400230-4187-1-git-send-email-ltrimas@synopsys.com>
 <1456400230-4187-3-git-send-email-ltrimas@synopsys.com>
Message-ID: <20160225135436.18a8385c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lada Trimasova,

On Thu, 25 Feb 2016 14:37:10 +0300, Lada Trimasova wrote:
> A lot of the glibc header files use extern inline, which causes
> GCC to emit a symbol for each extern inline functions and it causes
> functions multiple definition error when "-std=gnu99" is used.
> To fix this problem it's necessary to use "-fgnu89-inline" option which
> tells GCC to use the traditional GNU semantics for inline functions when
> in C99 mode.

I'm using gcc 5.x on my laptop, which I believe defaults to -std=gnu99,
and host-m4 builds fine for me. Could you describe more precisely in
which cases host-m4 doesn't build for you?

> diff --git a/package/m4/m4.mk b/package/m4/m4.mk
> index 9b5d2d1..2644bb1 100644
> --- a/package/m4/m4.mk
> +++ b/package/m4/m4.mk
> @@ -10,5 +10,6 @@ M4_SITE = $(BR2_GNU_MIRROR)/m4
>  M4_LICENSE = GPLv3+
>  M4_LICENSE_FILES = COPYING
>  HOST_M4_CONF_OPTS = --disable-static
> +HOST_M4_MAKE_OPTS = CFLAGS="-fgnu89-inline"

I think it's cleaner to pass this in the configure script environment,
i.e:

HOST_M4_CONF_ENV = \
	CFLAGS="$(HOST_CFLAGS) -fgnu89-inline"

(Same comments for the host-tar patch).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
