From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Jan 2017 09:17:05 +0100
Subject: [Buildroot] [PATCH] linux-headers: Account for
 LINUX_OVERRIDE_SRCDIR
In-Reply-To: <20170111195611.837-1-andrew.smirnov@gmail.com>
References: <20170111195611.837-1-andrew.smirnov@gmail.com>
Message-ID: <ecec3824-31cc-bcc0-ff85-bd7415cfee4e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-01-17 20:56, Andrey Smirnov wrote:
> Use the value of LINUX_OVERRIDE_SRCDIR as override directory when
> BR2_KERNEL_HEADERS_AS_KERNEL is specified.

 Good catch! However, I'm not entirely convinced that we really want this.

 A typical workflow would be to start from an upstream kernel, build a toolchain
and userspace with it, and then begin with hacking on the kernel to e.g. add a
driver. In that case it's rather unlikely that we really want to rebuild the
toolchain, because the headers don't change.

 That said, another possible scenario is that you don't configure any kernel
version but just use the OVERRIDE_SRCDIR to point to a local directory. Since we
removed the BR2_LINUX_KERNEL_CUSTOM_LOCAL, it's the only way to support that
scenario. In addition, the principle of least surprise would suggest that
BR2_KERNEL_HEADERS_AS_KERNEL would really work all the time, even if
LINUX_OVERRIDE_SRCDIR is set.

 In short, I'm not really sure what is the best thing to do here. On thing though...


> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  package/linux-headers/linux-headers.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index 0900778..197efb4 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -10,6 +10,7 @@
>  ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
>  
>  LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
> +LINUX_HEADERS_OVERRIDE_SRCDIR = $(LINUX_OVERRIDE_SRCDIR)

 ... At least we should use ?= here so it is still possible to override each one
separately.

 If you resubmit, please include the pros and cons in the commit message for
future reference.

 Regards,
 Arnout

>  # Compute LINUX_HEADERS_SOURCE and LINUX_HEADERS_SITE from the configuration
>  ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
