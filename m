From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 12 Nov 2016 13:09:23 -0500
Subject: [Buildroot] [PATCH for-master] package/sane-backends: fix musl
	build issue
In-Reply-To: <1478900262-18239-1-git-send-email-romain.naour@gmail.com>
References: <1478900262-18239-1-git-send-email-romain.naour@gmail.com>
Message-ID: <CA+-urNSL3Ujm8q9x5HpKtEQnEKuOGQ+7U04nFzpNjm-8D6jc1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Fri, Nov 11, 2016 at 4:37 PM, Romain Naour <romain.naour@gmail.com> wrote:
> We should include config.h from sanei_backend.h in order to use the
> correct if/else HAVE_FOO.
>
> For some reason with Glibc or uClibc there is no problem but with musl
> we have the following weird issue:
>
> In file included from epsonds.h:41:0,
>                  from epsonds-jpeg.c:18:
> ../include/sane/sanei_backend.h:99:33: error: expected ';', identifier or '(' before 'int'
>
> ../include/sane/sanei_backend.h:99:33: warning: useless type name in empty declaration
>
> That's because HAVE_SIGPROCMASK is not defined although it's correctly
> detected by the configure script.
>
> $ grep config.log
> config.log:#define HAVE_SIGPROCMASK 1
>
> So, include config.h to avoid to redefine sigset_t.
>
> Fixes:
> http://autobuild.buildroot.net/results/9f1/9f1f1cb727b5c5407e69172280a3dee880e55cdf
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>

Thanks for looking into this. For some reason, I had thought I saw a
mention on the list that this was due to something else, but you're
completely right that it's a sane-backends issue. I took a look
upstream and found this patch:

https://anonscm.debian.org/cgit/sane/sane-backends.git/commit/?id=1dbabdce5d34e686608bb997245c49a823e19fb5

It looks functionally the same as yours except that they added the
#include to epsonds-jpeg.c instead. No other similar commits were made
at the same time, so presumably that's the only file that breaks due
to the missing config.h issue. Could you try the patch above? If it
works, it will be more obvious that the patch can be dropped on the
next sane-backends release.

Reviewed-by: Frank Hunleth <fhunleth@troodon-software.com>

Thanks,
Frank

> ---
>  .../0003-sane_backend-add-missing-config.h.patch   | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/sane-backends/0003-sane_backend-add-missing-config.h.patch
>
> diff --git a/package/sane-backends/0003-sane_backend-add-missing-config.h.patch b/package/sane-backends/0003-sane_backend-add-missing-config.h.patch
> new file mode 100644
> index 0000000..8e56b02
> --- /dev/null
> +++ b/package/sane-backends/0003-sane_backend-add-missing-config.h.patch
> @@ -0,0 +1,49 @@
> +From 13aadf79659dd238b618c8be7c1de44960bd5d50 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Fri, 11 Nov 2016 22:20:03 +0100
> +Subject: [PATCH] sane_backend: add missing config.h
> +
> +We should include config.h from sanei_backend.h in order to use the
> +correct if/else HAVE_FOO.
> +
> +For some reason with Glibc or uClibc there is no problem but with musl
> +we have the following weird issue:
> +
> +In file included from epsonds.h:41:0,
> +                 from epsonds-jpeg.c:18:
> +../include/sane/sanei_backend.h:99:33: error: expected ';', identifier or '(' before 'int'
> + # define sigset_t               int
> +                                 ^
> +../include/sane/sanei_backend.h:99:33: warning: useless type name in empty declaration
> +
> +That's because HAVE_SIGPROCMASK is not defined although it's correctly
> +detected by the configure script.
> +
> +$ grep config.log
> +config.log:#define HAVE_SIGPROCMASK 1
> +
> +So, include config.h to avoid to redefine sigset_t.
> +
> +Fixes:
> +http://autobuild.buildroot.net/results/9f1/9f1f1cb727b5c5407e69172280a3dee880e55cdf
> +
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + include/sane/sanei_backend.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/include/sane/sanei_backend.h b/include/sane/sanei_backend.h
> +index 1b5afe2..2a96532 100644
> +--- a/include/sane/sanei_backend.h
> ++++ b/include/sane/sanei_backend.h
> +@@ -8,6 +8,7 @@
> +  * @sa sanei.h sanei_thread.h
> +  */
> +
> ++#include "../include/sane/config.h"
> +
> + /*
> +  * Compiler related options
> +--
> +2.5.5
> +
> --
> 2.5.5
>



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
