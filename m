From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 23:06:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: needs python3
In-Reply-To: <20200716205939.1965929-1-fontaine.fabrice@gmail.com>
References: <20200716205939.1965929-1-fontaine.fabrice@gmail.com>
Message-ID: <20200716230625.54fd0280@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jul 2020 22:59:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 09b94b1e8f94d1f49f7a2349b4c8cbfecefa73da forgot to propagate
> python3 dependency from host-setools to refpolicy
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fdeaa54355aa0741eccc7864b034a7b07ef0c4bc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/refpolicy/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
> index b50b2f09ff..e374ab1901 100644
> --- a/package/refpolicy/Config.in
> +++ b/package/refpolicy/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_REFPOLICY
>  	bool "refpolicy"
> +	depends on BR2_PACKAGE_PYTHON3 # host-setools

It is not possible for host-setools (a host package) to have a
dependency on python3, which is a target package.

However, what is possible is that when BR2_PACKAGE_PYTHON=y, the
default host Python version is Python 2.x, and therefore host-setools
gets installed for Python 2.x, but the refpolicy build uses
host-python3, so it does not find host-setools.

I think the correct fix is instead to set
HOST_SETOOLS_NEEDS_HOST_PYTHON = python3 since anyway it only works
with Python 3.x.

Antoine: any thoughts on this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
