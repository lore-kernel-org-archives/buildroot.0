From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 19 Sep 2018 15:14:20 +0200
Subject: [Buildroot] [PATCH buildroot-test] autobuild-run: add
 --flush-downloads argument to prevent false NOK due to not enough space on
 hard drive
In-Reply-To: <20180919114541.17670-1-giulio.benetti@micronovasrl.com>
References: <20180919114541.17670-1-giulio.benetti@micronovasrl.com>
Message-ID: <5427e918-c29e-d2b9-ce70-cb398a970322@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on "Micronova srl Server"

Il 19/09/2018 13:45, Giulio Benetti ha scritto:
> Some server/pc can have little hard drive, but high speed internet
> connection. If disk is little, autobuild-run could generate some false
> NOK reporting:
> Fatal error: ...: No space left on device
> 
> Add --flush-downloads argument to autobuild-run to delete entire
> instance-*/dl/ folder everytime it creates a new instance.
> If active this will lead to re-download all files needed by an instance
> in its dl/ folder when created.
> As the other options, flush-downloads can be listed in .conf file like
> this:
> flush-downloads = yes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   scripts/autobuild-run | 36 +++++++++++++++++++++++-------------
>   1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 3d2e99a..2682239 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -106,6 +106,7 @@ Options:
>     --toolchains-csv CSVFILE       Toolchain configuration file
>     -r, --repo URL                 URL of Buildroot repository to clone
>                                    Defaults to %(--repo)s
> +  --flush-downloads              Delete dl/ folder every time new instance starts
>   
>   Format of the configuration file:
>   
> @@ -301,18 +302,26 @@ def prepare_build(**kwargs):
>               for i in f:
>                   yield os.path.join(r, i)
>   
> -    # Remove 5 random files from the download directory. Removing
> -    # random files from the download directory allows to ensure we
> -    # regularly re-download files to check that their upstream
> -    # location is still correct.
> -    for i in range(0, 5):
> -        flist = list(find_files(dldir))
> -        if not flist:
> -            break
> -        f = flist[randint(0, len(flist) - 1)]
> -        log_write(log, "INFO: removing %s from downloads" %
> -                  os.path.relpath(f, dldir))
> -        os.remove(f)
> +    flush_dl = kwargs['flush_dl']
> +
> +    # Check if we need to flush dl/ folder or keep it
> +    if flush_dl:
> +        log_write(log, "INFO: flush dl/ folder")
> +        # Remove entire dl/ folder
> +        shutil.rmtree(dldir)
> +    else:
> +        # Remove 5 random files from the download directory. Removing
> +        # random files from the download directory allows to ensure we
> +        # regularly re-download files to check that their upstream
> +        # location is still correct.
> +        for i in range(0, 5):
> +            flist = list(find_files(dldir))
> +            if not flist:
> +                break
> +            f = flist[randint(0, len(flist) - 1)]
> +            log_write(log, "INFO: removing %s from downloads" %
> +                      os.path.relpath(f, dldir))
> +            os.remove(f)
>   
>       branch = get_branch()
>       log_write(log, "INFO: testing branch '%s'" % branch)
> @@ -766,7 +775,8 @@ def main():
>                   repo = args['--repo'],
>                   upload = upload,
>                   buildpid = buildpid,
> -                debug = args['--debug']
> +                debug = args['--debug'],
> +                flush_dl = args['--flush-downloads']
>               ))
>           p.start()
>           processes.append(p)
> 

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
