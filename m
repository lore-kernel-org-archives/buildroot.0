From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Dec 2011 21:14:51 +0100
Subject: [Buildroot] [PATCH 1/3] fluxbox: add xsession profile
In-Reply-To: <1318238520-16580-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 10 Oct 2011 11:21:58
 +0200")
References: <1318238520-16580-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <8739cwcf5w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> add .xsession profile to get fluxbox being started automatically
 yegorslists> by XDM

Committed with some fixes, thanks.

 yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> ---
 yegorslists>  package/fluxbox/.xsession  |    1 +
 yegorslists>  package/fluxbox/fluxbox.mk |    6 ++++++
 yegorslists>  2 files changed, 7 insertions(+), 0 deletions(-)
 yegorslists>  create mode 100644 package/fluxbox/.xsession

 yegorslists> diff --git a/package/fluxbox/.xsession b/package/fluxbox/.xsession
 yegorslists> new file mode 100644
 yegorslists> index 0000000..3775bad
 yegorslists> --- /dev/null
 yegorslists> +++ b/package/fluxbox/.xsession

I prefer to call it xsession, so it isn't hidden.

 yegorslists> @@ -0,0 +1 @@
 yegorslists> +exec startfluxbox

.xsession scripts afaik should be executable shell scripts.

 yegorslists> diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
 yegorslists> index 85a8eae..e0f6e4e 100644
 yegorslists> --- a/package/fluxbox/fluxbox.mk
 yegorslists> +++ b/package/fluxbox/fluxbox.mk
 yegorslists> @@ -13,4 +13,10 @@ FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 
 yegorslists>  FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 yegorslists> +define FLUXBOX_INSTALL_XSESSION_FILE
 yegorslists> +	$(INSTALL) -m 0644 package/fluxbox/.xsession $(TARGET_DIR)/root/.xsession

We should only install this if it isn't available in the fs skeleton, so
you can provide a custom version. Also use 0755 permissions so it
becomes executable and lastly use install -D so it doesn't fail if
skeleton doesn't have /root/.

-- 
Bye, Peter Korsgaard
