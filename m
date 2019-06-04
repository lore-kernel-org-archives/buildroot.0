From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Jun 2019 15:47:12 +0200
Subject: [Buildroot] [PATCH 1/3] autobuild-run: do reproducible builds
 tests if BR2_REPRODUCIBLE=y
In-Reply-To: <20190603091808.2928-1-itsatharva@gmail.com>
References: <20190603091808.2928-1-itsatharva@gmail.com>
Message-ID: <c7f197ec-ca1d-7014-efcf-787e39c800ed@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Atharva,

On 03/06/2019 11:18, Atharva Lele wrote:
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index ef2f2a5..9f8aabb 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -652,7 +652,15 @@ def run_instance(**kwargs):
>              log_write(kwargs['log'], "WARN: failed to generate configuration")
>              continue
>  
> -        ret = do_build(**kwargs)
> +        # Check if the build test is supposed to be a reproducible test
> +        outputdir = os.path.abspath(os.path.join(idir, "output"))

 These path names get constructed over and over again in a few different places.
I think it would be worth to create a Builder class that has those common things
as fields, and that gets (almost?) all the preceding functions as members.

 However, that's a completely different refactoring, not really a blocking point
for merging this.


> +        with open(os.path.join(outputdir, ".config"), "r") as fconf:
> +            if "BR2_REPRODUCIBLE=y" in fconf.read():

 I would add a \n to the match string, but that's a minor nit of course.

> +                log_write(kwargs['log'], "INFO: Reproducible Build Test")
> +                ret = do_reproducible_build(**kwargs)

 The order of your patches is wrong: this patch calls a function that is only
defined by patch 2, so patch 2 should be first. But that one again calls a
function that is defined by patch 3, so patch 3 should be first.

 However, I don't think it's worth splitting this in three patches. The other
two just add two new functions that don't get called, so there's not much reason
to keep it separate.

 Regards,
 Arnout

> +            else:
> +                log_write(kwargs['log'], "INFO: Non Reproducible Build Test")
> +                ret = do_build(**kwargs)
>  
>          send_results(ret, **kwargs)
>  
> 
