From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 16 Jan 2020 13:49:42 -0600
Subject: [Buildroot] [PATCH 1/4] core/pkg-infra: introduce download
 features concept
In-Reply-To: <20200116193852.17683-1-vfazio@xes-inc.com>
References: <20200116193852.17683-1-vfazio@xes-inc.com>
Message-ID: <CAMQcK5+-_N_Rwkx6E+w7eid5rKNVNjith7Feg8yYgzQX+dvtQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent,

Please see my few comments while just quickly looking over this patchset.

On Thu, Jan 16, 2020 at 1:39 PM Vincent Fazio <vfazio@xes-inc.com> wrote:
>

There should be more of a commit message which describe the feature
being added here. Initially I was unsure what was being proposed here
without looking at the changes.

Please also include updating the buildroot documentation as well to
describe the DL_FEATURES variable as well in this commit instead of
when deprecating the git submodules.

> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  package/pkg-download.mk     | 1 +
>  package/pkg-generic.mk      | 7 +++++++
>  support/download/dl-wrapper | 8 +++++---
>  3 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index de619ba90a..889ff57ded 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -108,6 +108,7 @@ define DOWNLOAD
>                 -n '$($(2)_BASENAME_RAW)' \
>                 -N '$($(2)_RAWNAME)' \
>                 -o '$($(2)_DL_DIR)/$(notdir $(1))' \
> +               -x '$($(2)_DL_FEATURES)' \
>                 $(if $($(2)_GIT_SUBMODULES),-r) \
>                 $(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
>                 $(QUIET) \
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 268d999efb..3ea818fc15 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -567,6 +567,13 @@ ifndef $(2)_DL_OPTS
>   endif
>  endif
>
> +ifndef $(2)_DL_FEATURES
> + ifdef $(3)_DL_FEATURES
> +  $(2)_DL_FEATURES = $$($(3)_DL_FEATURES)
> + endif
> +endif
> +
> +

Remove extra new line.

[...]

Thanks,
-Ryan

---
Ryan Barnett | Sr Systems Engineer | Commercial Avionics
COLLINS AEROSPACE
400 Collins Rd NE, Cedar Rapids, IA 52498 USA
ryan.barnett at collins.com | collinsaerospace.com

CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
