From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 16 Sep 2013 15:39:22 +0200
Subject: [Buildroot] [RFCv1 09/11] package: add a <pkg>_SOURCE_ADDONS
	variable
In-Reply-To: <1378416469-17708-10-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LVXRvw34-d5vq9Oh+tZXd2a4Dzy1mxzWLdOS2FPs59vVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Sep 5, 2013 at 11:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Converting the external toolchain logic into a package raises a very
> special use case that wasn't handled by the package infrastructure:
> the Blackfin toolchain is delivered as two tarballs instead of
> one. Unfortunately <pkg>_SOURCE only allows to pass one tarball name.
>
> However, we really want both tarballs to be known by the package
> infrastructure, so that the normal 'source' and 'external-deps'
> mechanism work fine.
>
> In order to achieve this, we add a <pkg>_SOURCE_ADDONS variable, which
> allows a package to list other stuff it would like to see downloaded,
> but that are otherwise not used by the package infrastructure itself:
> it is up to the package to do it by itself.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b6f0bdd..2ce615f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -40,6 +40,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
>         fi
>  endif
>         $(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
> +       $(foreach p,$($(PKG)_SOURCE_ADDONS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
>         $(foreach p,$($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
>         $(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
>  ifeq ($(DL_MODE),DOWNLOAD)
> --

What about allowing FOO_SOURCE to contain multiple words directly, and
thus not introducing a new variable? The package infrastructure can
download each word of FOO_SOURCE, but only extract (and otherwise use)
the first one. Any subsequent word has to be handled by the package
itself.

Best regards,
Thomas
