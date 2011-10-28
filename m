From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 28 Oct 2011 08:05:21 +0200
Subject: [Buildroot] [PATCH] Packages: download via NFS/Samba
In-Reply-To: <CA+hj=Mo42CvZQYWApH6sk0Q5E8NF2N3bnpNUCTqK5QaxrUJo+A@mail.gmail.com>
References: <CA+hj=Mo42CvZQYWApH6sk0Q5E8NF2N3bnpNUCTqK5QaxrUJo+A@mail.gmail.com>
Message-ID: <CAAXf6LUzq5ERKcitCJK3LFHeDeVS9s=edO_MtPA2fxbZ_gi21g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ivan,

Thanks for your contribution to buildroot. Some comments below, though.

On Thu, Oct 27, 2011 at 6:13 PM, Ivan Wagner <ivan.wagner@gmail.com> wrote:
> From 345659fe588de7b152a681bb94e50510f43f9fc8 Mon Sep 17 00:00:00 2001
> From: Ivan Wagner <ivan.wagner@ch.schindler.com>
> Date: Thu, 27 Oct 2011 18:05:56 +0200
> Subject: [PATCH] Packages: download via NFS/Samba
>
> This patch allows people to set the BR2_PRIMARY_SITE with a "file://"
> schema useful within corporate networks where i.e. NFS or Samba services
> are available. This gives a bit of flexibility not to force people
> (especially within corporate networks) to setup FTP or web-servers.
>
> Signed-off-by: Ivan Wagner <ivan.wagner@ch.schindler.com>
> ---
> ?package/Makefile.package.in | ? 20 ++++++++++++++++++++
> ?1 files changed, 20 insertions(+), 0 deletions(-)
>
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index b5ef57b..cd150ef 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -203,6 +203,19 @@ define SHOW_EXTERNAL_DEPS_LOCALFILES
> ? echo $($(PKG)_SITE)/$($(PKG)_SOURCE)
> ?endef
>
> +define DOWNLOAD_NFS
> + ? ? ? test -e $(DL_DIR)/$(1) || \
> + ? ? ? ? ? ? ? $(LOCALFILES) $(call qstrip,$(subst
> file://,,$(BR2_PRIMARY_SITE)))/$(1) $(DL_DIR)
> +endef

In which way is this different from the existing LOCALFILES download method?
Moreover, I think the name NFS is too restrictive (as you indicate it
can be used for Samba, or even a plain local file)

> +
> +define SOURCE_CHECK_NFS
> + ?test -e $(call qstrip,$(subst file://,,$(BR2_PRIMARY_SITE)))/$($(PKG)_SOURCE)
> +endef
> +
> +define SHOW_EXTERNAL_DEPS_NFS
> + ?echo $(BR2_PRIMARY_SITE)/$($(PKG)_SOURCE)
> +endef
> +
> ?################################################################################
> ?# DOWNLOAD -- Download helper. Will try to download source from:
> ?# 1) BR2_PRIMARY_SITE if enabled
> @@ -218,6 +231,13 @@ endef
>
> ?define DOWNLOAD
> ? ? ? ?$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
> + ? ? ? ? ? ? ? if [[ $(BR2_PRIMARY_SITE) == file://* ]] ; then \
> + ? ? ? ? ? ? ? ? ? ? ? if [[ -z $(2) ]]; then \
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? $(call
> $(DL_MODE)_NFS,$($(PKG)_SOURCE)) && exit; \
> + ? ? ? ? ? ? ? ? ? ? ? else \
> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? $(call $(DL_MODE)_NFS,$(2)) && exit; \
> + ? ? ? ? ? ? ? ? ? ? ? fi ; \
> + ? ? ? ? ? ? ? fi ; \
> ? ? ? ? ? ? ? ?$(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
> ? ? ? ?fi ; \
> ? ? ? ?if test -n "$(1)" ; then \

I have two patches waiting for being merged, that add support for scp
(secure-copy, copy over SSH) and Mercurial downloads. The scp patch
also allows the BR2_PRIMARY_SITE to be an scp-URI. I also added
functions like 'stripurischeme', 'geturischeme' that abstracts the
qstrip/subst patterns.
I think the addition of LOCALFILES/NFS to BR2_PRIMARY_SITE should be
based upon that patch.

http://lists.busybox.net/pipermail/buildroot/2011-October/047041.html
http://lists.busybox.net/pipermail/buildroot/2011-October/047042.html
http://lists.busybox.net/pipermail/buildroot/2011-October/047043.html

Best regards,
Thomas
