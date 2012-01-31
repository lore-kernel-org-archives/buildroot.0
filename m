From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jan 2012 18:15:51 +0100
Subject: [Buildroot] [RFC 01/15] legal-info: new target to echo basic
	per-package legal info
In-Reply-To: <1327849908-15588-2-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <1327849908-15588-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <201201311815.51660.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 29 January 2012 16:11:34 Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  Makefile                    |    9 ++++++++-
>  package/Makefile.package.in |    6 ++++++
>  2 files changed, 14 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 912012f..507fd78 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -354,6 +354,11 @@ HOST_DEPS = $(sort $(foreach dep,\
>  		$($(dep))))
>  HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
>  
> +TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
> +		$(filter-out makedevs,\
> +		$(patsubst host-%,%,\
> +		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
> +
 Are we creating the legal info of the target or the SDK here?  If it is
for the target, the host-% are not needed since they are not distributed.
I think there should be a separate command for the SDK's legal info.

[snip]
> +$(1)-legal-info:	$(1)-source
> +			@echo -e "$(1)\t$$($(3)_VERSION)\t$$($(3)_LICENSE)"
> +
 Minor detail: if this patch is separate from the one that saves the source
tarball, the dependency on $(1)-source is unnecessary.

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
