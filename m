From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Jan 2016 22:30:20 +0100
Subject: [Buildroot] [alternative PATCH] fakeroot: fix build when
 libcap-dev is installed
In-Reply-To: <1451932436-27742-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1451932436-27742-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <568AE46C.9040104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04-01-16 19:33, Ricardo Martincoski wrote:
> Fixes https://bugs.busybox.net/show_bug.cgi?id=8541
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (various cases with and without host- and system-libcap)

 In addition, this patch fixes the issue that the build of host-fakeroot will be
different depending on whether host-libcap was built before or not.

 Regards,
 Arnout

> ---
> Alternative patch to https://patchwork.ozlabs.org/patch/562348/
> 
> We don't need libcap for buildroot, as Gustavo Zacarias explained in the past.
> It seems reasonable to me to disable this detection too.
> 
> I can reproduce the original bug with libcap-dev in my Ubuntu 14.04.
> Using this patch I cannot reproduce the bug anymore.
> ---
>  package/fakeroot/fakeroot.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
> index 837c2b9..168cd13 100644
> --- a/package/fakeroot/fakeroot.mk
> +++ b/package/fakeroot/fakeroot.mk
> @@ -10,7 +10,10 @@ FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/
>  # Force capabilities detection off
>  # For now these are process capabilities (faked) rather than file
>  # so they're of no real use
> -HOST_FAKEROOT_CONF_ENV = ac_cv_func_capset=no
> +HOST_FAKEROOT_CONF_ENV = \
> +	ac_cv_header_sys_capability_h=no \
> +	ac_cv_func_capset=no
> +
>  FAKEROOT_LICENSE = GPLv3+
>  FAKEROOT_LICENSE_FILES = COPYING
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
