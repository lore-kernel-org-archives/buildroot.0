From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 20:22:18 +0100
Subject: [Buildroot] [PATCH] kmod: disable --gc-sections ld option when
 building for xtensa
In-Reply-To: <1393960216-18633-1-git-send-email-jcmvbkbc@gmail.com>
References: <1393960216-18633-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140304202218.3396f4f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue,  4 Mar 2014 23:10:16 +0400, Max Filippov wrote:
> This is a workaround for the following ld issue exhibited by --gc-sections
> option, until a proper fix for binutils is ready:
> 
> ld: BFD (GNU Binutils) 2.22 internal error, aborting at elf32-xtensa.c line 3374 in elf_xtensa_finish_dynamic_sections
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/kmod/900-disable-gc-sections.patch.xtensa | 12 ++++++++++++

The patch should be named kmod-01-<description>.patch. We no longer
accept architecture-specific patches, so the .xtensa extension has to
go, and we have to ensure that the fix is usable on all architectures.

So either we simply remove --gc-sections on all architecture, or the
configure.ac test has to be made conditional on xtensa.

>  1 file changed, 12 insertions(+)
>  create mode 100644 package/kmod/900-disable-gc-sections.patch.xtensa
> 
> diff --git a/package/kmod/900-disable-gc-sections.patch.xtensa b/package/kmod/900-disable-gc-sections.patch.xtensa
> new file mode 100644
> index 0000000..2b7a9cb
> --- /dev/null
> +++ b/package/kmod/900-disable-gc-sections.patch.xtensa

The patch lacks a description. See
http://buildroot.org/downloads/manual/manual.html#patch-policy for more
details about the format of the patches.

> @@ -0,0 +1,12 @@
> +--- kmod-16/configure	2013-12-23 01:31:12.456202872 +0400
> ++++ kmod-16.mod/configure	2014-03-04 22:53:37.132241845 +0400
> +@@ -14511,8 +14511,7 @@

We normally prefer to patch configure.ac, and add KMOD_AUTORECONF = YES.

All that being said, I believe there is a much simpler solution. Don't
use any patch at all, and add:

# --gc-sections triggers a bug in the current Xtensa binutils
ifeq ($(BR2_xtensa),y)
KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=no
endif

to package/kmod/kmod.mk.

Can you test that it works for you, and submit the corresponding patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
