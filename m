From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Dec 2018 08:04:55 +0100
Subject: [Buildroot] [PATCH 1/1] iptables: add patch to fix symlink path
 of iptables-xml
In-Reply-To: <20181221232959.27895-1-JoelsonCarl@gmail.com>
References: <20181221232959.27895-1-JoelsonCarl@gmail.com>
Message-ID: <20181222080455.6419ae8c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Dec 2018 16:29:59 -0700, Joel Carlson wrote:

> +diff --git a/iptables/Makefile.am b/iptables/Makefile.am
> +index f92cc4ff..fe5195d7 100644
> +--- a/iptables/Makefile.am
> ++++ b/iptables/Makefile.am
> +@@ -88,7 +88,7 @@ pkgconfig_DATA = xtables.pc
> + install-exec-hook:
> + 	-if test -z "${DESTDIR}"; then /sbin/ldconfig; fi;
> + 	${INSTALL} -dm0755 "${DESTDIR}${bindir}";
> +-	for i in ${vx_bin_links}; do ${LN_S} -f "${sbindir}/xtables-multi" "${DESTDIR}${bindir}/$$i"; done;
> ++	for i in ${vx_bin_links}; do ${LN_S} -f "${DESTDIR}${sbindir}/xtables-multi" "${DESTDIR}${bindir}/$$i"; done;

For the target installation, this looks wrong. It means you would have
on the target a link that points
to /the/original/path/to/where/buildroot/was/built/output/target/sbin/xtables-multi.
Doesn't sound good.

A relative symlink instead would fix the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
