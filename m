From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Jul 2019 00:46:54 +0200
Subject: [Buildroot] [PATCH 23/27] autobuild-run: create reason file on
 build failures
In-Reply-To: <20190629050214.17852-23-itsatharva@gmail.com>
References: <20190629050214.17852-1-itsatharva@gmail.com>
 <20190629050214.17852-23-itsatharva@gmail.com>
Message-ID: <95d25c99-961d-16d2-1324-ee0cd118532f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/06/2019 07:02, Atharva Lele wrote:
> When a build fails, we calculate the reason of failure on
> the server side as well as client side. To solve this redundancy
> we only calculate on the client side and submit a file which
> contains the reason of failure.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
> Changes from reason-file-v2 series:
>   - Move to builder-class series
> ---
>  scripts/autobuild-run | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 3e29f1f..d26594a 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -595,6 +595,11 @@ class Builder:
>              # not found
>              return None
>  
> +        reason = get_failure_reason()
> +        if reason:
> +            with open(os.path.join(self.resultdir, "reason"), "w+") as reasonf:
> +                reasonf.write("-".join(reason))
> +
>          def extract_end_log(resultfile):
>              """Save the last part of the build log, starting from the failed package"""
>  
> @@ -603,7 +608,6 @@ class Builder:
>                                  (os.path.join(self.outputdir, "logfile"), resultfile)],
>                                  shell=True)
>  
> -            reason = get_failure_reason()
>              if not reason:
>                  extract_last_500_lines()
>              else:
> @@ -627,7 +631,6 @@ class Builder:
>          def copy_config_log_files():
>              """Recursively copy any config.log files from the failing package"""
>  
> -            reason = get_failure_reason()
>              if not reason:
>                  return
>  
> 
