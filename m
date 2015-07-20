From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:41:52 +0200
Subject: [Buildroot] [PATCH] autobuild - acpid does not build against
 musl
In-Reply-To: <1437417346-18621-1-git-send-email-brendanheading@gmail.com>
References: <1437417346-18621-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150720224152.11d13fa5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

The commit title should be:

	acpid: fix build against musl

On Mon, 20 Jul 2015 19:35:46 +0100, Brendan Heading wrote:
> Fixes http://autobuild.buildroot.net/results/33e/33ef25e4707a5b81083204e0f064570c11d88af6/

Generally, we prefer:

Fixes:
	http://autobuild.buildroot.net/results/33e/33ef25e4707a5b81083204e0f064570c11d88af6/

Please add your Signed-off-by line as well.

> ---
>  package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch | 76 +++++++++++++++++++++++++
>  package/acpid/0004-fix-warnings.patch           | 38 +++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch
>  create mode 100644 package/acpid/0004-fix-warnings.patch
> 
> diff --git a/package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch b/package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch
> new file mode 100644
> index 0000000..7d81b3c
> --- /dev/null
> +++ b/package/acpid/0003-fix-TEMP_FAILURE_RETRY.patch
> @@ -0,0 +1,76 @@
> +Add missing TEMP_FAILURE_RETRY.
> +
> +Some external toolchains using strange C libraries (eg MUSL) do not define
> +this macro.

musl is not "strange".

> +
> +Signed-off-by : Brendan Heading <brendanheading@gmail.com>

no space between Signed-off-by and colon.

> +
> +Index : b/acpid.h
> +===================================================================
> +--- a/acpid.h
> ++++ b/acpid.h
> +@@ -39,6 +39,18 @@
> + 
> + #define PACKAGE 		"acpid"
> + 
> ++/* Evaluate EXPRESSION, and repeat as long as it returns -1 with `errno'
> ++   set to EINTR.  */
> ++
> ++#ifndef TEMP_FAILURE_RETRY
> ++#define TEMP_FAILURE_RETRY(expression) \
> ++  (__extension__                                                             \
> ++    ({ long int __result;                                                    \
> ++       do __result = (long int) (expression);                                \
> ++       while (__result == -1L && errno == EINTR);                            \
> ++       __result; }))
> ++#endif
> ++
> + /*
> +  * acpid.c
> +  */
> +Index : b/kacpimon/libnetlink.h
> +===================================================================
> +--- a/kacpimon/libnetlink.h
> ++++ b/kacpimon/libnetlink.h
> +@@ -11,6 +11,18 @@
> + #define MSG_CMSG_CLOEXEC 0x40000000
> + #endif
> + 
> ++/* Evaluate EXPRESSION, and repeat as long as it returns -1 with `errno'
> ++   set to EINTR.  */
> ++
> ++#ifndef TEMP_FAILURE_RETRY
> ++#define TEMP_FAILURE_RETRY(expression) \
> ++  (__extension__							      \
> ++    ({ long int __result;						      \
> ++       do __result = (long int) (expression);				      \
> ++       while (__result == -1L && errno == EINTR);			      \
> ++       __result; }))
> ++#endif
> ++
> + struct rtnl_handle
> + {
> + 	int			fd;
> +Index : b/libnetlink.h
> +===================================================================
> +--- a/libnetlink.h
> ++++ b/libnetlink.h
> +@@ -11,6 +11,18 @@
> + #define MSG_CMSG_CLOEXEC 0x40000000
> + #endif
> + 
> ++/* Evaluate EXPRESSION, and repeat as long as it returns -1 with `errno'
> ++   set to EINTR.  */
> ++
> ++#ifndef TEMP_FAILURE_RETRY
> ++#define TEMP_FAILURE_RETRY(expression) \
> ++  (__extension__							      \
> ++    ({ long int __result;						      \
> ++       do __result = (long int) (expression);				      \
> ++       while (__result == -1L && errno == EINTR);			      \
> ++       __result; }))
> ++#endif

Is it really necessary to repeat that three times? Can we put that in
some common header?

> ++
> + struct rtnl_handle
> + {
> + 	int			fd;
> diff --git a/package/acpid/0004-fix-warnings.patch b/package/acpid/0004-fix-warnings.patch
> new file mode 100644
> index 0000000..3c6a89d
> --- /dev/null
> +++ b/package/acpid/0004-fix-warnings.patch

As Baruch said, not needed, except if you submit the patch upstream
directly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
