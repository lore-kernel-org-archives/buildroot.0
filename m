From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Jan 2013 14:49:30 +0100
Subject: [Buildroot] [PATCH 1/6] pkg-infra: log current message
In-Reply-To: <7d5b13e61ca5941293be6d1402c87ca990510e1b.1358379198.git.yann.morin.1998@free.fr>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
 <7d5b13e61ca5941293be6d1402c87ca990510e1b.1358379198.git.yann.morin.1998@free.fr>
Message-ID: <50FBF5EA.5010303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/17/13 00:41, Yann E. MORIN wrote:
> In order to help the auto-builders (our own, or in-house ones),
> just log the current message in a file that contains:
>      Package: $($(PKG)_NAME)
>      Version: $($(PKG)_VERSION)
>      Action : Last '>>>' message displayed
>
> For example:
>      Package: host-fakeroot
>      Version: 1.18.2
>      Action : Configuring
>
> If there is no package, then the package name and version are
> empty, eg.:
>      Package:
>      Version:
>      Action : Generating root filesystem image rootfs.tar

  I'm a bit concerned because this is another blocker for top-level 
parallel build (the contents of last-action will be incorrect).

  Also:

> Also, all messages are logged to a file, one per line, with the
> date each message was generated at, as the number of seconds
> elapsed since Epoch.

  I think this one should be sufficient for the autobuilder. It's exactly 
what is displayed now. You could make it more structured and easily 
parseable with an extra colon:

echo "$$(date '+%s'): $($(PKG)_NAME) $($(PKG)_VERSION): $(1)"


  Note that this one is not an issue for parallel builds, because it will 
be done in a single write() call.


  Regards,
  Arnout

> This will hopefully help autobuilders extract the real reason for
> a failure, and take appropriate action (eg. bug-mail the last
> git-author of a package...)
>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
> ---
>   package/pkg-utils.mk |    9 ++++++++-
>   1 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 835c588..477be57 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -64,7 +64,14 @@ INFLATE.xz   = $(XZCAT)
>   INFLATE.tar  = cat
>
>   # MESSAGE Macro -- display a message in bold type
> -MESSAGE     = echo "$(TERM_BOLD)>>>  $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
> +define MESSAGE
> +	echo "$(TERM_BOLD)>>>  $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)";   \
> +	echo "$$(date '+%s'): $($(PKG)_NAME) $($(PKG)_VERSION) $(1)"                 \
> +	>>$(BUILD_DIR)/actions.log;                                             \
> +	printf "Package: %s\nVersion: %s\nAction : %s\n"                             \
> +	       "$($(PKG)_NAME)" "$($(PKG)_VERSION)" $(1)                             \
> +	>$(BUILD_DIR)/last-action
> +endef
>   TERM_BOLD  := $(shell tput smso)
>   TERM_RESET := $(shell tput rmso)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
