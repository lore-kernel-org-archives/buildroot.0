From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Jun 2019 22:23:08 +0200
Subject: [Buildroot] [PATCH v3 3/3] autobuild-run: do reproducible
 builds tests if BR2_REPRODUCIBLE=y
In-Reply-To: <20190611123416.11533-3-itsatharva@gmail.com>
References: <20190611123416.11533-1-itsatharva@gmail.com>
 <20190611123416.11533-3-itsatharva@gmail.com>
Message-ID: <20190613202308.GM2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-06-11 18:04 +0530, Atharva Lele spake thusly:
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ---
> Changes v2 -> v3:
>   - use reproducible flag so that .config i snot kept open for the entire
>     build duration. (suggested by arnout)

Sorry, but that is still the case, see below...

>   - remove reduntant logging (suggested by arnout)
> 
> Changes v1 -> v2:
>   - add trailing newline character to BR2_REPRODUCIBLE=y (suggested by arnout)
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> ---
>  scripts/autobuild-run | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 5ba6092..4fbd507 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -727,7 +727,14 @@ def run_instance(**kwargs):
>              log_write(kwargs['log'], "WARN: failed to generate configuration")
>              continue
>  
> -        ret = do_build(**kwargs)
> +        # Check if the build test is supposed to be a reproducible test
> +        outputdir = os.path.abspath(os.path.join(idir, "output"))
> +        with open(os.path.join(outputdir, ".config"), "r") as fconf:
> +            reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
> +            if reproducible:
> +                ret = do_reproducible_build(**kwargs)
> +            else:
> +                ret = do_build(**kwargs)

This whole if reproducible block is still indented inside the with
block, so you'r still having .config opened during the whole build.

You need to do (basically):

    with open(os.path.join(outputdir, ".config"), "r") as fconf:
        reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
    build = do_reproducible_build if reproducible else do_build
    ret = build(**kwargs)

Regards,
Yann E. MORIN.

>  
>          send_results(ret, **kwargs)
>  
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
