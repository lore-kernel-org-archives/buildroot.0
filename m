From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jun 2012 12:51:37 +0200
Subject: [Buildroot] [PATCH] sudo: fix install
In-Reply-To: <1340102153-22387-1-git-send-email-spdawson@gmail.com>
References: <1340102153-22387-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120619125137.3513cfee@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 19 Jun 2012 11:35:53 +0100,
spdawson at gmail.com a ?crit :

> diff --git a/package/sudo/sudo-fix-sudoers-plugin-install.patch b/package/sudo/sudo-fix-sudoers-plugin-install.patch
> new file mode 100644
> index 0000000..e85e5d8
> --- /dev/null
> +++ b/package/sudo/sudo-fix-sudoers-plugin-install.patch
> @@ -0,0 +1,19 @@
> +The installation of the sudoers plugin fails when cross compiling, because it
> +tries to run the cross-compiled visudo, rather than that of the host.
> +
> +The visudo invocation is only required in order to sanity check any existing
> +sudoers file in the target directory; this can safely be dispensed with.
> +
> +Signed-off-by: Simon Dawson <spdawson@gmail.com>
> +diff -Nurp a/plugins/sudoers/Makefile.in b/plugins/sudoers/Makefile.in
> +--- a/plugins/sudoers/Makefile.in	2012-05-15 17:22:02.000000000 +0100
> ++++ b/plugins/sudoers/Makefile.in	2012-06-19 11:24:00.322449438 +0100
> +@@ -239,7 +239,7 @@ sudoers: $(srcdir)/sudoers.in
> + pre-install:
> + 	@if test -r $(DESTDIR)$(sudoersdir)/sudoers; then \
> + 	    echo "Checking existing sudoers file for syntax errors."; \
> +-	    ./visudo -c -f $(DESTDIR)$(sudoersdir)/sudoers; \
> ++	    (echo "SKIPPED" || ./visudo -c -f $(DESTDIR)$(sudoersdir)/sudoers); \
> + 	fi
> + 
> + install: install-plugin install-binaries install-sudoers install-doc

Do you think you can turn this into a patch that can be submitted
upstream? I.e, if autoconf has detected that we're cross-compiling,
skip this install check?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
