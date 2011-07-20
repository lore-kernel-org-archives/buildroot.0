From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 20 Jul 2011 08:29:26 +0200
Subject: [Buildroot] [PATCH 05/12] package: implement a 'local' site
	method
In-Reply-To: <867549f5fef1c44afbe437119feac731f6757833.1311141087.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <867549f5fef1c44afbe437119feac731f6757833.1311141087.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LVGd8MQaLLjeEbz4e4gENwYV_gCN7SxS1N6ugjWvAdunw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Jul 20, 2011 at 7:52 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The new override source directory mechanism allows to tell Buildroot
> to use a particular directory as the source directory for a
> package. However, this mechanism works with a local override makefile
> and not directly within the package recipe itself.
>
> For some use cases, it might be desirable to write a package recipe
> which always refers to a local source directory (and not a http, git,
> svn or bazaar download). This commit makes this possible by adding the
> 'local' site method. It allows to write package recipes as follows:
>
> MYPKG_SITE = /tmp/mypkg-source-code
> MYPKG_SITE_METHOD = local

You could auto-detect the site-method if you add support for the
file:// prefix in _SITE. Auto-detection currently already occurs for
git, bzr, http, etc. so I think it makes sense to do it here as well.

The patches I sent some time ago actually do that:
[Buildroot] [PATCH 0 of 3] Add support for local package downloads
(file://)   Thomas De Schampheleire
http://lists.busybox.net/pipermail/buildroot/2011-March/041993.html
    [Buildroot] [PATCH 1 of 3] Add file:// helpers to package download
infrastructure   Thomas De Schampheleire
http://lists.busybox.net/pipermail/buildroot/2011-March/041994.html
    [Buildroot] [PATCH 2 of 3] Allow BR2_PRIMARY_SITE and
BR2_BACKUP_SITE to be a file:// URL   Thomas De Schampheleire
http://lists.busybox.net/pipermail/buildroot/2011-March/041995.html
    [Buildroot] [PATCH 3 of 3] Update documentation to mention file://
support   Thomas De Schampheleire
http://lists.busybox.net/pipermail/buildroot/2011-March/041996.html

>
> [...]
>
> $(eval $(call GENTARGETS,package,mypkg))
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> ?package/Makefile.package.in | ? ?6 ++++++
> ?1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index 96ed9a7..37fc969 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -438,6 +438,12 @@ ifndef $(2)_SITE_METHOD
> ?endif
> ?endif
>
> +ifeq ($$($(2)_SITE_METHOD),local)
> +ifeq ($$($(2)_OVERRIDE_SRCDIR),)
> +$(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
> +endif
> +endif
> +
> ?$(2)_DEPENDENCIES ? ? ? ? ? ? ??=
> ?$(2)_INSTALL_STAGING ? ? ? ? ? ?= NO
> ?$(2)_INSTALL_IMAGES ? ? ? ? ? ??= NO
> --

Best regards,
Thomas
