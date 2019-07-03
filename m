From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 3 Jul 2019 23:28:59 +0200
Subject: [Buildroot] [PATCH] core/pkg-infra: really build all
 dependencies of foo with foo-depends
In-Reply-To: <20190702201250.31638-1-yann.morin.1998@free.fr>
References: <20190702201250.31638-1-yann.morin.1998@free.fr>
Message-ID: <4281e1c1-dda6-5af6-7f0c-4e29cd279922@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/07/2019 22:12, Yann E. MORIN wrote:
> Currently, foo-depends only builds build dependencies. This means that
> download and extract dependencies are not built.

 But also patch dependencies.

 Patch dependencies are special, because when used normally, they cause the
following chain (I'm simplifying, obviously):

FOO_PATCH_DEPENDENCIES = bar
foo-patch: bar-patch

while for all other types of dependencies it would be:

FOO_EXTRACT_DEPENDENCIES = bar
foo-extract: bar


 So, this patch can lead to circular dependencies, because bar could in turn
depend on foo (that's precisely why this construct was introduced).

 However, it turns out that we only use this _PATCH_DEPENDENCIES for Linux
extensions. In addition, most of them don't even depend back on linux. The only
one in that situation is RTAI. And even for that case, it's not really a
circular dependency. Instead, you have:

linux-depends: rtai <other linux deps>
rtai: ... linux ...
linux: linux-install
linux-install: linux-build
linux-build: linux-configure
linux-configure: linux-patch <other linux deps>
linux-patch: linux-extract rtai-patch
linux-extract: linux-source

So, not an actual circular dependency, because 'linux-depends' is not a target
that is used internally.

 Therefore, I've applied to master, thanks.

 I probably should have added the above explanation to the commit message :-(

 Regards,
 Arnout


> First, but a minor point, this is inconsistent with foo-show-depends,
> which does display all dependencies:
> 
>     $ make host-gzip-show-depends
>     host-skeleton host-tar
>     $ make host-gzip-depends
>         # Only host-skeleton is built and installed
> 
> Second, and more important, it makes it more difficult to preapre a
> debug build, like so:
> 
>     $ make foo-depends
>     $ tar cf output.tar output
>     $ make foo
>         # bummer, broken
>         # edit foo.mk to try and fix it
>     $ rm -rf output; tar xf output.tar
>         # rince and repeat
> 
> Change foo-depends so that it really builds all the dependencies for
> foo, bringing it on-par with foo-show-depends.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b00967c648..9620dec524 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -801,7 +801,7 @@ $(1)-extract:			$$($(2)_TARGET_EXTRACT)
>  $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
>  $$($(2)_TARGET_EXTRACT): | $$($(2)_FINAL_EXTRACT_DEPENDENCIES)
>  
> -$(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
> +$(1)-depends:		$$($(2)_FINAL_ALL_DEPENDENCIES)
>  
>  $(1)-source:		$$($(2)_TARGET_SOURCE)
>  $$($(2)_TARGET_SOURCE): | $$($(2)_FINAL_DOWNLOAD_DEPENDENCIES)
> 
