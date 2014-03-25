From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Mar 2014 23:06:15 +0100
Subject: [Buildroot] [RFC 3/3] package: add a few needed host options
 for a few packages
In-Reply-To: <1395596582-7062-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1395596582-7062-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1395596582-7062-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5331FDD7.3090509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/03/14 18:43, Thomas Petazzoni wrote:
> This shows a few examples of what is needed to get the host package
> dependencies correct.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/expat/Config.in        | 2 ++
>  package/expat/Config.in.host   | 4 ++++
>  package/pkgconf/Config.in      | 2 ++
>  package/pkgconf/Config.in.host | 2 ++
>  package/python/Config.in       | 3 +++
>  package/python/Config.in.host  | 3 +++
>  6 files changed, 16 insertions(+)
>  create mode 100644 package/expat/Config.in.host
>  create mode 100644 package/pkgconf/Config.in.host
>  create mode 100644 package/python/Config.in.host
> 
> diff --git a/package/expat/Config.in b/package/expat/Config.in
> index 758fb7d..5b4bd39 100644
> --- a/package/expat/Config.in
> +++ b/package/expat/Config.in
> @@ -1,3 +1,5 @@
> +source "package/expat/Config.in.host"

 I think this should go into package/Config.in.host like the rest.


 Regards,
 Arnout

> +
>  config BR2_PACKAGE_EXPAT
>  	bool "expat"
>  	help
> diff --git a/package/expat/Config.in.host b/package/expat/Config.in.host
> new file mode 100644
> index 0000000..9d0b0af
> --- /dev/null
> +++ b/package/expat/Config.in.host
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_HOST_EXPAT
> +	bool
> +	select BR2_PACKAGE_HOST_PKGCONF
> +
> diff --git a/package/pkgconf/Config.in b/package/pkgconf/Config.in
> index f95847f..56c1c48 100644
> --- a/package/pkgconf/Config.in
> +++ b/package/pkgconf/Config.in
> @@ -1,3 +1,5 @@
> +source "package/pkgconf/Config.in.host"
> +
>  config BR2_PACKAGE_PKGCONF
>  	bool "pkgconf"
>  	help
> diff --git a/package/pkgconf/Config.in.host b/package/pkgconf/Config.in.host
> new file mode 100644
> index 0000000..e324360
> --- /dev/null
> +++ b/package/pkgconf/Config.in.host
> @@ -0,0 +1,2 @@
> +config BR2_PACKAGE_HOST_PKGCONF
> +	bool
> diff --git a/package/python/Config.in b/package/python/Config.in
> index a0c78c6..253f36b 100644
> --- a/package/python/Config.in
> +++ b/package/python/Config.in
> @@ -1,9 +1,12 @@
> +source "package/python/Config.in.host"
> +
>  config BR2_PACKAGE_PYTHON
>  	bool "python"
>  	depends on BR2_USE_WCHAR
>  	# uses fork()
>  	depends on BR2_USE_MMU
>  	select BR2_PACKAGE_LIBFFI
> +	select BR2_PACKAGE_HOST_PYTHON
>  	help
>  	  The python language interpreter.
>  
> diff --git a/package/python/Config.in.host b/package/python/Config.in.host
> new file mode 100644
> index 0000000..2eca521
> --- /dev/null
> +++ b/package/python/Config.in.host
> @@ -0,0 +1,3 @@
> +config BR2_PACKAGE_HOST_PYTHON
> +	bool
> +	select BR2_PACKAGE_HOST_EXPAT
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
