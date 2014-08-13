From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Aug 2014 23:59:57 +0200
Subject: [Buildroot] [PATCH 1/1] fio: (bugfix) add libaio dependency
 (added description)
In-Reply-To: <1407956022-62199-1-git-send-email-Matthew.Weber@rockwellcollins.com>
References: <1407956022-62199-1-git-send-email-Matthew.Weber@rockwellcollins.com>
Message-ID: <20140813235957.10e71f41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Wed, 13 Aug 2014 13:53:42 -0500, Matt Weber wrote:
> The fio package at runtime (dlopen)links in the libaio library
> when the ioengine is selected as libaio. I.e. this isn't caught at
> build time since the link wouldn't occur.
> 
> Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>

Thanks for the explanation. However, this patch still isn't completely
correct. The first issue is that you have added a changelog information
("added description") in the commit title, which is preserved forever
in the Git history. The changelog information should go...

> ---

... here, so that it doesn't get preserved forever in the Git history.

Also, the (bugfix) part of your commit title is kind of strange. I
think a proper commit title would be:

	fio: add missing libaio dependency

Also, you say that libaio is needed when the ioengine is selected as
libaio. Are there other ioengine that could potentially be used, and
therefore make the libaio dependency optional?

>  package/fio/Config.in | 1 +
>  package/fio/fio.mk    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/fio/Config.in b/package/fio/Config.in
> index 8cbbf6c..b907fb9 100644
> --- a/package/fio/Config.in
> +++ b/package/fio/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_FIO
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_LARGEFILE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBAIO #ioengine libaio

This should be:

	# Runtime dependency: libaio is dlopen()ed by fio
	select BR2_PACKAGE_LIBAIO

Also, the libaio package is only available for a limited set of
architectures (see package/libaio/Config.in), and those dependencies
must be propagated to fio if libaio is indeed a mandatory dependency of
fio.

>  	# fio uses posix_madvise(), which is not part of any official
>  	# release of uClibc, but is part of uClibc Git, and backported
>  	# in Buildroot patch set of uClibc 0.9.33. Therefore, we
> diff --git a/package/fio/fio.mk b/package/fio/fio.mk
> index f9a690e..e0c79e8 100644
> --- a/package/fio/fio.mk
> +++ b/package/fio/fio.mk
> @@ -8,6 +8,7 @@ FIO_VERSION = fio-2.1.4
>  FIO_SITE = git://git.kernel.dk/fio.git
>  FIO_LICENSE = GPLv2 + special obligations
>  FIO_LICENSE_FILES = LICENSE
> +FIO_DEPENDENCIES = libaio

If libaio is only a runtime dependency of fio (and not a build time
dependency), then this line is not needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
