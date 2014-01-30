From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Jan 2014 19:03:11 +0100
Subject: [Buildroot] [PATCH 2/3] package/wayland: build a host variant
In-Reply-To: <52E9FC37.5080401@mind.be>
References: <cover.1391033178.git.yann.morin.1998@free.fr>
 <a1289845ae3d28db8bdae6f02adced5db4613bcd.1391033178.git.yann.morin.1998@free.fr>
 <52E9FC37.5080401@mind.be>
Message-ID: <20140130180311.GA7072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-01-30 08:16 +0100, Arnout Vandecappelle spake thusly:
> On 29/01/14 23:07, Yann E. MORIN wrote:
[--SNIP--]
> >diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
> >index a823d2b..dc64cf4 100644
> >--- a/package/wayland/wayland.mk
> >+++ b/package/wayland/wayland.mk
> >@@ -11,7 +11,8 @@ WAYLAND_LICENSE = MIT
> >  WAYLAND_LICENSE_FILES = COPYING
> >
> >  WAYLAND_INSTALL_STAGING = YES
> >-WAYLAND_DEPENDENCIES = libffi host-pkgconf expat host-expat
> >+WAYLAND_DEPENDENCIES = libffi host-pkgconf host-wayland expat host-expat
> >+HOST_WAYLAND_DEPENDENCIES = host-libffi host-pkgconf host-expat
> 
>  The automatic dependencies work here, right? So this is redundant.

I don't know what you mean by "automatic dependencies". Did you mean that
host dependencies are automatically inherited from the target variant?

Looking at the manual, there is not such indication. Looking at the code,
it seems like it is the case, indeed.

Will fix.

> >  # wayland needs a wayland-scanner program to generate some of its
> >  # source code. By default, it builds it with CC, so it doesn't work with
> >@@ -19,14 +20,22 @@ WAYLAND_DEPENDENCIES = libffi host-pkgconf expat host-expat
> >  # that the tool is already available.
> >  WAYLAND_CONF_OPT = --disable-scanner
> 
>  Seems to me that this entire comment has become redundant. Instead, you can
> say
> 
> # wayland-scanner is only needed for building, not on the target
> WAYLAND_CONF_OPT = --disable-scanner

Right, will fix.

> >-define WAYLAND_BUILD_SCANNER
> >-	(cd $(@D)/src/; \
> >-		$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
> >-			-o wayland-scanner scanner.c wayland-util.c -lexpat; \
> >-	 	$(INSTALL) -m 0755 -D wayland-scanner \
> >-			$(HOST_DIR)/usr/bin/wayland-scanner)
> >+# And we must provide a specialy-crafted wayland-scanner .pc file
> 
>  With my comment above, the "And" is no longer correct.

Right. Will fix.

> >+# which we vampirise and adapt from the host-wayland copy
> >+define WAYLAND_SCANNER_PC
> >+	$(INSTALL) -m 0644 -D $(HOST_DIR)/usr/share/pkgconfig/wayland-scanner.pc \
> >+	              $(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner.pc
> >+	$(SED) 's:^prefix=.*:prefix=/usr:' \
> >+	    -e 's:^wayland_scanner=.*:wayland_sanner=$(HOST_DIR)/usr/bin/wayland-scanner:' \
> 
>  wayland-sanner?

Good catch. Although it does build... :-/

Thanks for the comments!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
