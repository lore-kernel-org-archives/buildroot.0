From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 26 Nov 2014 21:19:07 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-22
In-Reply-To: <20141126220017.138c933c@free-electrons.com>
References: <20141123073011.CCE601014E6@stock.ovh.net>
 <CAHXCMM+JcRY090g3jcYGOzahveW2gYzKu_=QaDGmP2JTBXcRMQ@mail.gmail.com>
 <20141123182619.23fbfdba@free-electrons.com>
 <CAHXCMMKM4PHGDAD0SMZuXSX-ksB+j6tR_r1JPhoi7HNVGatuzA@mail.gmail.com>
 <1417033136.5064.8.camel@abrodkin-8560l.internal.synopsys.com>
 <CAHXCMM+odCUZoAWVJPuCOvf8ic1BMTZabBZDerwy9PqPs-mJUA@mail.gmail.com>
 <1417035454.5064.12.camel@abrodkin-8560l.internal.synopsys.com>
 <20141126220017.138c933c@free-electrons.com>
Message-ID: <1417036747.5064.19.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2014-11-26 at 22:00 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Wed, 26 Nov 2014 20:57:34 +0000, Alexey Brodkin wrote:
> 
> > For example in "radvd" I'm going to do it with simple inclusion of:
> > --->---
> > AC_CHECK_FUNCS(sysctl)
> > --->---
> > in "configure.ac".
> 
> Did you notice that this is already done?
> 
> See
> http://git.buildroot.net/buildroot/commit/?id=cb54da1b03f2e6d684416c614021735dfe276606.

No unfortunately I didn't noticed this change.
I don't follow mailing list regularly so it would be helpful if you add
me explicitly in Cc if I might be interested in stuff :)

And frankly I'm not sure if we need to check for a header still.
So in your patch I would simply replace HAVE_SYS_SYSCTL_H with
HAVE_SYSCTL in "device-linux.c".

So I would implement it like this:
--->---
diff --git a/configure.ac b/configure.ac
index 0556805..349e4c1 100644
--- a/configure.ac
+++ b/configure.ac
@@ -160,7 +160,6 @@ AC_CHECK_HEADERS( \
 	net/if_types.h \
 	sys/param.h \
 	sys/sockio.h \
-	sys/sysctl.h \
 	sys/time.h \
 	time.h \
 )
@@ -183,6 +182,7 @@ AC_MSG_RESULT(no))
 dnl Checks for library functions.
 AC_CHECK_FUNCS(getopt_long)
 AC_CHECK_FUNCS(ppoll)
+AC_CHECK_FUNCS(sysctl)
 
 CONDITIONAL_SOURCES="device-${arch}.${OBJEXT} ${CONDITIONAL_SOURCES}"
 if test x${arch} = xlinux ; then
diff --git a/device-linux.c b/device-linux.c
index 1ecaa6b..fa7d978 100644
--- a/device-linux.c
+++ b/device-linux.c
@@ -183,7 +183,7 @@ int check_ip6_forwarding(void)
 		value = -1;
 	}
 
-#ifdef HAVE_SYS_SYSCTL_H
+#ifdef HAVE_SYSCTL
 	int forw_sysctl[] = { SYSCTL_IP6_FORWARDING };
 	size_t size = sizeof(value);
 	if (!fp && sysctl(forw_sysctl, sizeof(forw_sysctl) /
sizeof(forw_sysctl[0]), &value, &size, NULL, 0) < 0) {
--
--->---

What do you think?

Also I was going to push my change upstream in radvd and already made a
pull-request https://github.com/reubenhwk/radvd/pull/37 but with your
help I realized that I forgot to modify "device-linux.c".

-Alexey
