From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 00:53:30 +0200
Subject: [Buildroot] [PATCH] pkg-cmake: Skip compilation in installation
 step
In-Reply-To: <1429733516-4466-1-git-send-email-cedric.marie@openmailbox.org>
References: <1429733516-4466-1-git-send-email-cedric.marie@openmailbox.org>
Message-ID: <5538266A.1070006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 22:11, C?dric Marie wrote:
> With CMake build system, the "make install" command always compiles
> before installing, to make sure that everything is up-to-date.
> 
> In Buildroot environment, this is quite useless, because the package
> has always already been compiled, either at first build, or when
> invoking "make <package>-rebuild".
> In all cases, when it comes to staging or target installation step, the
> package has just been compiled.
> 
> Using "make install/fast" - in order to skip the compilation step - is
> therefore more appropriate, more consistent with what other build
> systems do, and saves time when you need to rebuild your package.
> 
> Signed-off-by: C?dric Marie <cedric.marie@openmailbox.org>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Doing it for host-cmake itself can be a separate patch. And not very important
either, I can't measure the time difference...

 Regards,
 Arnout

> ---
>  package/pkg-cmake.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 2262012..f17a883 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -57,8 +57,8 @@ $(2)_MAKE			?= $$(MAKE)
>  $(2)_MAKE_ENV			?=
>  $(2)_MAKE_OPTS			?=
>  $(2)_INSTALL_OPTS		?= install
> -$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
> -$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install
> +$(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install/fast
> +$(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR) install/fast
>  
>  $(2)_SRCDIR			= $$($(2)_DIR)/$$($(2)_SUBDIR)
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
