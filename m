From: =?windows-1252?Q?Andr=E9_Erdmann?= <dywi@mailerd.de>
Date: Thu, 30 Apr 2015 00:54:54 +0200
Subject: [Buildroot] [autobuild v2 2/3] autobuild-run: also save CMake
 config log files on package failure
In-Reply-To: <1430338217-25518-2-git-send-email-s.martin49@gmail.com>
References: <1430338217-25518-1-git-send-email-s.martin49@gmail.com>
 <1430338217-25518-2-git-send-email-s.martin49@gmail.com>
Message-ID: <5541613E.80604@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015/4/30 Samuel Martin <s.martin49@gmail.com>:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1->v2
> - none
> ---
>  scripts/autobuild-run | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 6e83de9..01e3265 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -655,12 +655,14 @@ def send_results(result, **kwargs):
>  
>          srcroot = os.path.join(outputdir, "build", '-'.join(reason))
>          destroot = os.path.join(resultdir, '-'.join(reason))
> +        config_files = ('config.log', 'CMakeCache.txt', 'CMakeError.log',
> +            'CMakeOutput.log')
>

config_files = set(('config.log', ...))

It's negligible in terms of real time difference (<= 0.0d seconds),
but for efficiency reasons, don't use a tuple or list when doing
lookups ("fname in config_files").

os.walk() might return 100s or 1000s of file names in total,
and for each fname, you have to through the entire list/tuple
(until fname found or end of list, whatever comes first).
Data structures like set/frozenset/dict perform lookups faster (on average).
  
>          for root, dirs, files in os.walk(srcroot):
>              dest = os.path.join(destroot, os.path.relpath(root, srcroot))
>  
>              for fname in files:
> -                if fname == 'config.log':
> +                if fname in config_files:
>                      if not os.path.exists(dest):
>                          os.makedirs(dest)
>                      shutil.copy(os.path.join(root, fname), os.path.join(dest, fname))
> 


 
