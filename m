From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jul 2015 23:22:59 +0200
Subject: [Buildroot] [PATCH v5 1/6] Makefile: save MAKE_VERSION
In-Reply-To: <1436902975-5004-2-git-send-email-gustavo@zacarias.com.ar>
References: <1436902975-5004-1-git-send-email-gustavo@zacarias.com.ar>
 <1436902975-5004-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <55A57DB3.4010806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/15 21:42, Gustavo Zacarias wrote:
> Save MAKE_VERSION as RUNNING_MAKE_VERSION since this is later clobbered
> by the make package.
> 
> It will be used by the webkitgtk24 package to check for older make
> versions which have a bug building it with parallel jobs (it hangs).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  Makefile | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 9a18853..06ca929 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -43,10 +43,13 @@ all:
>  # Set and export the version string
>  export BR2_VERSION := 2015.08-git
>  
> +# Save running make version since it's clobbered by the make package
> +RUNNING_MAKE_VERSION = $(MAKE_VERSION)

 Shouldn't this be := instead of = ? Otherwise it will still be clobbered, no?

 Otherwise:
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +
>  # Check for minimal make version (note: this check will break at make 10.x)
>  MIN_MAKE_VERSION = 3.81
> -ifneq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
> -$(error You have make '$(MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
> +ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
> +$(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
>  endif
>  
>  export HOSTARCH := $(shell uname -m | \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
