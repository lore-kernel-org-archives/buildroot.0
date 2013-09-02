From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Sep 2013 22:58:04 +0200
Subject: [Buildroot] [PATCHv2 2/4] kmod: allow to build a host variant
In-Reply-To: <1377624514-10510-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 27 Aug 2013 19:28:32 +0200")
References: <1377624514-10510-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377624514-10510-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvtn7xgj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since module-init-tools is deprecated, we now want to use kmod instead
 Thomas> for the installation of modules during the kernel build process. In
 Thomas> order to do this, we need to be able to build a host variant of kmod,
 Thomas> which is want this patch allows to do.

 Thomas> Note that only the depmod tool is installed on the host, since that's
 Thomas> the only one likely to be used on the host in a cross-compilation
 Thomas> context.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/kmod/kmod.mk | 10 ++++++++++
 Thomas>  1 file changed, 10 insertions(+)

 Thomas> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
 Thomas> index 71a2632..4445fa8 100644
 Thomas> --- a/package/kmod/kmod.mk
 Thomas> +++ b/package/kmod/kmod.mk
 Thomas> @@ -54,4 +54,14 @@ else
 Thomas>  KMOD_CONF_OPT += --disable-tools
 Thomas>  endif
 
 Thomas> +# We only install depmod, since that's the only tool used for the
 Thomas> +# host.
 Thomas> +define HOST_KMOD_INSTALL_TOOLS
 Thomas> +	mkdir -p $(HOST_DIR)/sbin/
 Thomas> +	ln -sf ../usr/bin/kmod $(HOST_DIR)/sbin/depmod
 Thomas> +endef
 Thomas> +
 Thomas> +HOST_KMOD_POST_INSTALL_HOOKS += HOST_KMOD_INSTALL_TOOLS
 Thomas> +

We also need to set HOST_KMOD_AUTORECONF = YES because of the
configure.ac patch (arguably we should default HOST_<pkg>_AUTORECONF =
<pkg>_AUTORECONF).

-- 
Bye, Peter Korsgaard
