From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Oct 2013 23:12:28 +0200
Subject: [Buildroot] [PATCH v8 RESEND 1/8] package: add base dependency
 to every package
In-Reply-To: <1382088860-30524-2-git-send-email-fabio.porcedda@gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <52683BBC.7070506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/13 11:34, Fabio Porcedda wrote:
> Move "dependencies" "dirs" "prepare" dependencies from "toolchain" to
> every package.
> This way we can build correctly every package right after the clean
> stage.
> As example with this commit we can build successfully the glibc right
> after the clean stage:
> 	make clean glibc
>
> This is also a step forward supporting top-level parallel make.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

  Although this is one of the most useful patches of the series, it is 
also the one that introduces the circular dependency. So although it 
looks good, I'm not ready to ack it.

> ---
>   package/pkg-generic.mk           | 2 ++
>   toolchain/toolchain/toolchain.mk | 3 +--
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 4bba4b5..1e7154e 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -385,6 +385,8 @@ $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
>   $(1)-build:		$(1)-configure \
>   			$$($(2)_TARGET_BUILD)
>
> +$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies dirs prepare

  Is there any reason why you changed the order here?


  Regards,
  Arnout

> +
>   ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>   # In the normal case (no package override), the sequence of steps is
>   #  source, by downloading
> diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
> index 44ed629..8559ac9 100644
> --- a/toolchain/toolchain/toolchain.mk
> +++ b/toolchain/toolchain/toolchain.mk
> @@ -14,5 +14,4 @@ endif
>
>   $(eval $(generic-package))
>
> -toolchain-source: prepare dirs dependencies $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
> -
> +toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
