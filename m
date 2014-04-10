From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 10 Apr 2014 19:50:34 +0200
Subject: [Buildroot] [PATCH 1/2] systemd: Build legacy pc files when
 liblogging is
In-Reply-To: <1397145566-11243-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1397145566-11243-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140410175032.GA24213@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Thu, Apr 10, 2014 at 04:59:25PM +0100, Vicente Olivert Riera wrote:
[...]
> Passing the "--enable-compat-libs" option to the systemd configure
> script will install the separate libraries and ".pc" files, so we add
> that option just in case the liblogging package had been selected.  We
> can revert this change when liblogging upstream fixes it's configure
> script to check for "libsystemd.pc" instead of "libsystemd-journal.pc".

Maybe some other packages depend on these compatibility libraries, so instead
of referring to BR2_PACKAGE_LIBLOGGING in systemd.mk, it would be best to add
a generic configuration option to systemd, as done for berkeleydb with
BR2_PACKAGE_BERKELEYDB_COMPAT185. It could be named BR2_PACKAGE_SYSTEMD_COMPAT.

Then, in package/liblogging/Config.in, we would have:

  select BR2_PACKAGE_SYSTEMD_COMPAT if BR2_INIT_SYSTEMD

And this would be removed when liblogging is fixed upstream.

What do think of this?

Best regards,
ELB
