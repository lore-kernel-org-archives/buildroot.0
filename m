From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2013 18:05:20 +0100
Subject: [Buildroot] [PATCH 1/1] trace-cmd: overwrite CFLAGS
In-Reply-To: <526D9ED3.4000401@openwide.fr>
References: <526D9ED3.4000401@openwide.fr>
Message-ID: <526FEAD0.7090908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/10/13 00:16, Romain Naour wrote:
>
> Ptrace support detection is ignored when CFLAGS is set by buildroot.
>
> Use override in Makefile to add -DWARN_NO_PTRACE and -DNO_PTRACE in CFLAGS
> if ptrace is not available.
>
> Fixes:
> http://autobuild.buildroot.net/results/60e/60ed317d52d93ba2c087aa6ff4f422d760806d89//
>
>
> Signed-off-by: Romain <romain.naour@openwide.fr>

  Looks good, but I didn't test it.

  However, we should also add NO_PTRACE to TRACE_CMD_MAKE_OPTS if 
BR2_PACKAGE_PTRACE is not selected, and add ptrace to the dependencies if 
it is.

  Regards,
  Arnout

> ---
>   .../trace-cmd-0002-Makefile-overwrite-CFLAGS.patch | 33
> ++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>   create mode 100644
> package/trace-cmd/trace-cmd-0002-Makefile-overwrite-CFLAGS.patch
>
> diff --git
> a/package/trace-cmd/trace-cmd-0002-Makefile-overwrite-CFLAGS.patch
> b/package/trace-cmd/trace-cmd-0002-Makefile-overwrite-CFLAGS.patch
> new file mode 100644
> index 0000000..f4afa53
> --- /dev/null
> +++ b/package/trace-cmd/trace-cmd-0002-Makefile-overwrite-CFLAGS.patch
> @@ -0,0 +1,33 @@
> +
> +Ptrace support detection is ignored when CFLAGS is set in command
> arguments.
> +
> +Use override in Makefile to add -DWARN_NO_PTRACE and -DNO_PTRACE in CFLAGS
> +if ptrace is not available.
> +
> +Signed-off-by: Romain <romain.naour@openwide.fr>
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 2f862ec..51b0df3 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -229,12 +229,12 @@ CFLAGS += -D_GNU_SOURCE
> + ifndef NO_PTRACE
> + ifneq ($(call try-cc,$(SOURCE_PTRACE),),y)
> +     NO_PTRACE = 1
> +-    CFLAGS += -DWARN_NO_PTRACE
> ++    override CFLAGS += -DWARN_NO_PTRACE
> + endif
> + endif
> +
> + ifdef NO_PTRACE
> +-CFLAGS += -DNO_PTRACE
> ++override CFLAGS += -DNO_PTRACE
> + endif
> +
> + # Append required CFLAGS
> +--
> +1.8.1.4
> +


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
