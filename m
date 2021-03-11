From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Thu, 11 Mar 2021 07:42:26 +0100
Subject: [Buildroot] [PATCH] support/download: make the svn backend more
 reproducible
In-Reply-To: <20210310225937.3155075-1-yann.morin.1998@free.fr>
References: <20210310225937.3155075-1-yann.morin.1998@free.fr>
Message-ID: <f8637dc33b5860b2a5375afb6a6276b87e0d794f.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

thanks for looking into this!
I'll keep an eye on the scarce avrdude releases so that the package
could be eventually scwitched from an SVN revision to a release.

On Wed, 2021-03-10 at 23:59 +0100, Yann E. MORIN wrote:
> So we also update the hash for avrdude.
> 
> Fixes:
> ??? http://autobuild.buildroot.org/results/e3b/e3b0508047f32008ebfa83c5255ec5994b6af120/?(time issue)
> ??? http://autobuild.buildroot.org/results/48e/48e78e84b425e79cdb98c16ab40247a0fa7e9676/?(keyword expansion issue)
> 
> Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> ?package/avrdude/avrdude.hash | 2 +-
> ?package/pkg-download.mk????? | 2 +-
> ?support/download/svn???????? | 6 ++++--
> ?3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
> index c7b4bf85bc..ec43355451 100644
> --- a/package/avrdude/avrdude.hash
> +++ b/package/avrdude/avrdude.hash
> @@ -1,3 +1,3 @@
> ?# Locally computed
> -sha256? a74532a61d07e43fc598ade4202e9a8c8697bce3e6031c5be6f51da651595f99? avrdude-r1450-br1.tar.gz
> +sha256? 2a09913450c6457c3fe8d43d5141de579d4e57d67e593e7399a4cd3768cc60f9? avrdude-r1450-br2.tar.gz
> ?sha256? 201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2? avrdude/COPYING
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index c0fb810205..4d97ef9a31 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -20,7 +20,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
> ?# Version of the format of the archives we generate in the corresponding
> ?# download backend:
> ?BR_FMT_VERSION_git = -br1
> -BR_FMT_VERSION_svn = -br1
> +BR_FMT_VERSION_svn = -br2
> ?
> ?DL_WRAPPER = support/download/dl-wrapper
> ?
> diff --git a/support/download/svn b/support/download/svn
> index 839dccaf62..75bf9ab3b2 100755
> --- a/support/download/svn
> +++ b/support/download/svn
> @@ -43,14 +43,16 @@ _svn() {
> ???? eval ${SVN} "${@}"
> ?}
> ?
> -_svn export ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
> +_svn export --ignore-keywords ${verbose} "${@}" "'${uri}@${rev}'" "'${basename}'"
> ?
> ?# Get the date of the revision, to generate reproducible archives.
> ?# The output format is YYYY-MM-DDTHH:MM:SS.mmmuuuZ (i.e. always in the
> ?# UTC timezone), which we can feed as-is to the --mtime option for tar.
> ?# In case there is a redirection (e.g. http -> https), just keep the
> ?# last line (svn outputs everything on stdout)
> -date="$( _svn info --show-item last-changed-date "'${uri}@${rev}'" |tail -n 1 )"
> +date="$( _svn info "'${uri}@${rev}'" \
> +??????? |sed -r -e '/^Last Changed Date: /!d; s///'
> +?????? )"
> ?
> ?# Generate the archive.
> ?# We did a 'svn export' above, so it's not a working copy (there is no .svn

-- 
Alexander Sverdlin.
