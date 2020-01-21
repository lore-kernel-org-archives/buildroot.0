From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Jan 2020 22:29:32 +0100
Subject: [Buildroot] [PATCH 1/3] package/xen: explicitly disable
 checkpolicy logic
In-Reply-To: <20200119170358.5408-1-peter@korsgaard.com>
References: <20200119170358.5408-1-peter@korsgaard.com>
Message-ID: <564b6b88-967f-f541-1368-2a515fc881af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/01/2020 18:03, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/14af2dc3219847a92c6ec2db14ba387159b61fde
> 
> The Xen build system builds and embeds a default XSM FLASK (Flux Advanced
> Security Kernel) security policy if it detects SELinux checkpolicy on the
> build machine.
> 
> If enabled, a gen-policy.py python script is used to convert the binary
> FLASK policy to a C array initialization list to embed it in the Xen binary.
> Depending on the python version and locale available on the host, this fails

 The more appropriate thing to do would be to:

- set this XEN_HAS_CHECKPOLICY=n if selinux is disabled;
- do not set it when selinux is enabled, and depend on host-checkpolicy
- depend on host-python
- set LC_ALL=C

 However, the latter two are already done. So except for incorrectly detecting
checkpolicy installed on the system, I wonder what is really triggering this
issue...

 Regards,
 Arnout


> with byte values outside the 0..255 range:
> 
> policy.c:7:10: error: unsigned conversion from 'int' to 'unsigned char' changes value from '56575' to '255' [-Werror=overflow]
>   0xdc8c, 0xdcff, 0x7c, 0xdcf9, 0x08, 0x00, 0x00, 0x00, 0x58, 0x65, 0x6e, 0x46, 0x6c,
> 
> To fix this and ensure a consistent build, pass XEN_HAS_CHECKPOLICY=n to
> disable the checkpolicy detection.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/xen/xen.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index b0dc2dfe4c..167f0ad638 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -26,6 +26,7 @@ XEN_MAKE_ENV = \
>  	XEN_TARGET_ARCH=$(XEN_ARCH) \
>  	CROSS_COMPILE=$(TARGET_CROSS) \
>  	HOST_EXTRACFLAGS="-Wno-error" \
> +	XEN_HAS_CHECKPOLICY=n \
>  	$(TARGET_CONFIGURE_OPTS)
>  
>  ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
> 
