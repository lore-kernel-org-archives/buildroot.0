From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 14 Dec 2020 23:14:33 +0100
Subject: [Buildroot] [PATCH 2/2] package/bind: fix mdig library
 dependencies
In-Reply-To: <20201212091306.222405-2-bernd.kuhls@t-online.de>
References: <20201212091306.222405-1-bernd.kuhls@t-online.de>
 <20201212091306.222405-2-bernd.kuhls@t-online.de>
Message-ID: <20201214231433.6cbf6aab@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat, 12 Dec 2020 10:13:06 +0100, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/bc6/bc61b07591188d49d41a7914b4dd1e985c4a3b4b/
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-mdig-fix-library-dependencies.patch  | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/bind/0002-mdig-fix-library-dependencies.patch
>
> diff --git a/package/bind/0002-mdig-fix-library-dependencies.patch b/package/bind/0002-mdig-fix-library-dependencies.patch
> new file mode 100644
> index 0000000000..4a786edf5e
> --- /dev/null
> +++ b/package/bind/0002-mdig-fix-library-dependencies.patch
> @@ -0,0 +1,34 @@
> +From ba00ed93f3bd021b06c9f9b1c0d9ff10931f2617 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 12 Dec 2020 10:09:55 +0100
> +Subject: [PATCH] mdig: fix library dependencies
> +
> +Fixes buildroot build error:
> +http://autobuild.buildroot.net/results/bc6/bc61b07591188d49d41a7914b4dd1e985c4a3b4b/build-end.log
> +
> +ld: warning: libisccfg.so.163, needed by ../../lib/bind9/.libs/libbind9.so,
> + not found (try using -rpath or -rpath-link)
> +
> +Upstream status: pending upload

What does 'pending upload' mean?

> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + bin/tools/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/bin/tools/Makefile.in b/bin/tools/Makefile.in
> +index b12f80a334..e672f6bc87 100644
> +--- a/bin/tools/Makefile.in
> ++++ b/bin/tools/Makefile.in
> +@@ -96,7 +96,7 @@ genrandom at EXEEXT@: genrandom. at O@
> +
> + mdig at EXEEXT@: mdig. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS} ${BIND9DEPLIBS}

Dependency entry '${ISCCFGDEPLIBS}' missing?

Regards,
Peter


> + 	export BASEOBJS="mdig. at O@"; \
> +-	export LIBS0="${DNSLIBS} ${BIND9LIBS}"; \
> ++	export LIBS0="${DNSLIBS} ${ISCCFGLIBS} ${BIND9LIBS}"; \
> + 	${FINALBUILDCMD}
> +
> + dnstap-read at EXEEXT@: dnstap-read. at O@ ${ISCDEPLIBS} ${DNSDEPLIBS}
> +--
> +2.29.2
> +
