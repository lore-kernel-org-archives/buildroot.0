From: John Keeping <john@metanate.com>
Date: Sat, 8 May 2021 18:04:37 +0100
Subject: [Buildroot] [PATCH] package/cryptsetup: disable tmpfiles.d for
 host build
In-Reply-To: <87v97turcb.fsf@dell.be.48ers.dk>
References: <20210507152159.542208-1-john@metanate.com>
 <87v97turcb.fsf@dell.be.48ers.dk>
Message-ID: <20210508180437.1aef7d59.john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 08 May 2021 18:23:48 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "John" == John Keeping <john@metanate.com> writes:  
> 
>  > When building host-cryptsetup, if tmpfiles.d support is enabled then the
>  > install step tries to install /usr/lib/tmpfiles.d/cryptsetup.conf
>  > globally on the host system.  
> 
>  > Even if the tmpfiles.d config were installed correctly in the host
>  > directory, nothing would ever run these rules, so disable this feature
>  > via configure.  
> 
>  > Signed-off-by: John Keeping <john@metanate.com>  
> 
> Committed, thanks.
> 
> I see we also don't pass that configure flag for the target variant?

Good point.

For the target, DESTDIR is applied to the path so there's no obvious
failure.  But the location is discovered via pkg-config the behaviour
will change depending on whether cryptsetup is built before or after
systemd, so I think we need the patch below.

-- >8 --
Subject: [PATCH] package/cryptsetup: fix tmpfiles.d setup

The configure script uses pkg-config to detect the location of
tmpfiles.d but imposes an unspecified ordering dependency on systemd.
Instead of relying on systemd being built before cryptsetup, set the
directory path explcitly, and ensure it is not set when systemd-tmpfiles
is disabled.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/cryptsetup/cryptsetup.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index cd5883d0b4..eee84a7958 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -33,6 +33,12 @@ else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
+CRYPTSETUP_CONF_OPTS += --with-tmpfilesdir=/usr/lib/tmpfiles.d
+else
+CRYPTSETUP_CONF_OPTS += --with-tmpfilesdir=no
+endif
+
 HOST_CRYPTSETUP_DEPENDENCIES = \
 	host-pkgconf \
 	host-lvm2 \
-- 
2.31.1
