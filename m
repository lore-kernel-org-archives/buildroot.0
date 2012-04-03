From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Apr 2012 23:05:48 +0200
Subject: [Buildroot] [PATCH 4/4] Fix installation of socketcand
In-Reply-To: <6ba987689f0509f25ac5fdffc3365c9287e97b92.1333443312.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Tue, 3 Apr 2012 10:55:32 +0200")
References: <cover.1333443312.git.maxime.ripard@free-electrons.com>
 <cover.1333443312.git.maxime.ripard@free-electrons.com>
 <6ba987689f0509f25ac5fdffc3365c9287e97b92.1333443312.git.maxime.ripard@free-electrons.com>
Message-ID: <878vicwmoj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Maxime> ---
 Maxime>  .../socketcand-replace-cp-by-install.patch         |   25 ++++++++++++++++++++
 Maxime>  1 files changed, 25 insertions(+), 0 deletions(-)
 Maxime>  create mode 100644 package/socketcand/socketcand-replace-cp-by-install.patch

 Maxime> diff --git a/package/socketcand/socketcand-replace-cp-by-install.patch b/package/socketcand/socketcand-replace-cp-by-install.patch
 Maxime> new file mode 100644
 Maxime> index 0000000..d66ed71
 Maxime> --- /dev/null
 Maxime> +++ b/package/socketcand/socketcand-replace-cp-by-install.patch
 Maxime> @@ -0,0 +1,25 @@
 Maxime> +From 9d2797ce08034aba0087e6fe45873c3ccd8db489 Mon Sep 17 00:00:00 2001
 Maxime> +From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Maxime> +Date: Tue, 3 Apr 2012 10:35:09 +0200
 Maxime> +Subject: [PATCH] Remove cp -n which might not exist on old system and rely on install instead
 Maxime> +
 Maxime> +Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Maxime> +---
 Maxime> + Makefile.in |    2 +-
 Maxime> + 1 files changed, 1 insertions(+), 1 deletions(-)
 Maxime> +
 Maxime> +diff --git a/Makefile.in b/Makefile.in
 Maxime> +index 40d8193..290a8dd 100644
 Maxime> +--- a/Makefile.in
 Maxime> ++++ b/Makefile.in
 Maxime> +@@ -38,6 +38,6 @@ install: socketcand
 Maxime> + 	mkdir -p $(DESTDIR)$(sysroot)$(mandir)
 Maxime> + 	cp $(srcdir)/socketcand.1 $(DESTDIR)$(sysroot)$(mandir)/
 Maxime> + 	mkdir -p $(DESTDIR)$(sysroot)/etc/
 Maxime> +-	cp -n $(srcdir)/etc/socketcand.conf $(DESTDIR)$(sysroot)/etc/
 Maxime> ++	install -D $(srcdir)/etc/socketcand.conf $(DESTDIR)$(sysroot)/etc/

install -D requires you to pass the full destination file name, but as
we have a mkdir -p ../etc just above, we can drop the -D option. It
would be good to add -m 0644 to not get the configuration file
executable though, so I adjusted the patch to do that.

Committed with that change, thanks.

-- 
Bye, Peter Korsgaard
