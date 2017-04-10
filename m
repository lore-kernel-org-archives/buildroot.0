From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 10:49:42 +0200
Subject: [Buildroot] [PATCH/autobuild 8/8] autobuild-run: use in-tree
 toolchain configs
In-Reply-To: <20170409205128.11560-8-arnout@mind.be>
References: <20170409205128.11560-1-arnout@mind.be>
 <20170409205128.11560-8-arnout@mind.be>
Message-ID: <280c7fdf-a3a5-3a9a-b3f5-c7f20ca389c7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Ho, turns out I sent this out before amending, so this patch is NOT correct...

 I'll quickly send out an update for proper review, but it'll probably need a v3
as well.

 Regards,
 Arnout

On 09-04-17 22:51, Arnout Vandecappelle (Essensium/Mind) wrote:
> Instead of having the list of toolchain configs as a CSV file, they
> are now maintained within the buildroot tree itself. Therefore,
> autobuild-run must get the toolchain configs from there.
> 
> The toolchains-url option is replaced with a toolchains-path option.
> This path is relative to the buildroot directory and defaults to
> support/config-fragments/autobuild. It is possible to override this
> with a relative or absolute path to the directory containing the
> toolchain configs.
> 
> The toolchain configs no longer contain the hostarch information.  For
> the predefined external toolchains, this is handled by checking after
> the olddefconfig: because of "depends on HOSTARCH=...", the toolchain
> config will have been removed. For the custom external toolchains, we
> instead rely on the URL: it ends with -HOSTARCH.tar.gz.
> 
> Since we don't fetch from a URL anymore, the exception handling
> introduced in 5f1016ab0 is no longer needed.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Clearly, at the moment, the custom external toolchain tarball names
> *don't* end with -HOSTARCH, so the hostarch check doesn't actually
> work. However, I think this is the most elegent solution. Other
> alternatives are:
> - Adding a dummy config option BR2_HOSTARCH=... to the toolchain
>   config fragments. This works pretty nicely, because then it will
>   be covered automatically by the check that all the toolchain config
>   lines are still there. However, this requires manual handling when
>   generating the toolchain configs (they are no longer the result of
>   "make savedefconfig"). Also, it is not enough for the x86 case
>   (i.e. the ctng toolchains): these also work on x86_64 autobuilders,
>   so special handling for that case would be needed.
> - As it happens, all br-* toolchains are x86_64, and all ctng
>   toolchains are x86, so we could just do string matching on those to
>   derive the hostarch. However, that would be too much of a hack for
>   my comfort.
> 
> Any other ideas are welcome!
> 
> If this solution is chosen, I propose to replace
> http://patchwork.ozlabs.org/patch/748187/ with the renamed tarballs
> immediately while applying.
> ---
>  scripts/autobuild-run | 62 +++++++++++++++------------------------------------
>  1 file changed, 18 insertions(+), 44 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index d17e089..f920251 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -67,7 +67,7 @@ defaults = {
>      '--nice': 0,
>      '--pid-file': '/tmp/buildroot-autobuild.pid',
>      '--http-url': 'http://autobuild.buildroot.org/submit/',
> -    '--toolchains-url': 'http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv',
> +    '--toolchains-path': 'support/config-fragments/autobuild',
>  }
>  
>  doc = """autobuild-run - run Buildroot autobuilder
> @@ -102,7 +102,8 @@ Options:
>    -c, --config CONFIG            path to configuration file
>                                   Not set by default.
>    -d, --debug                    Send log output to stdout instead of log file
> -  --toolchains-url URL           URL of toolchain configuration file
> +  --toolchains-path URL          Path to the toolchain configuration files
> +                                 (relative to buildroot dir).
>  
>  Format of the configuration file:
>  
> @@ -169,7 +170,7 @@ else:
>      encode_str = _identity
>  
>  MAX_DURATION = 60 * 60 * 8
> -VERSION = 1
> +VERSION = 2
>  
>  def log_write(logf, msg):
>      logf.write("[%s] %s\n" % (strftime("%a, %d %b %Y %H:%M:%S", localtime()), msg))
> @@ -255,44 +256,20 @@ def get_toolchain_configs(**kwargs):
>      This function returns an array of toolchain configurations. Each
>      toolchain configuration is itself an array of lines of the defconfig.
>      """
> -    toolchains_url = kwargs['toolchains_url']
> +    toolchains_path = kwargs['toolchains_path']
>  
> -    with urlopen_closing(toolchains_url) as r:
> -        l = decode_byte_list(r.readlines())
> -    configs = []
> -
> -    (_, _, _, _, hostarch) = os.uname()
> -    # ~2015 distros report x86 when on a 32bit install
> -    if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
> -        hostarch = 'x86'
> -
> -    for row in csv.reader(l):
> -        config = {}
> -        url = row[0]
> -        config_hostarch = row[1]
> -        keep = False
> -
> -        # Keep all toolchain configs that work regardless of the host
> -        # architecture
> -        if config_hostarch == "any":
> -            keep = True
> -
> -        # Keep all toolchain configs that can work on the current host
> -        # architecture
> -        if hostarch == config_hostarch:
> -            keep = True
> -
> -        # Assume that x86 32 bits toolchains work on x86_64 build
> -        # machines
> -        if hostarch == 'x86_64' and config_hostarch == "x86":
> -            keep = True
> -
> -        if not keep:
> -            continue
> +    if os.path.isabs(toolchains_path):
> +        toolchains_dir = toolchains_path
> +    else:
> +        idir = "instance-%d" % kwargs['instance']
> +        toolchains_dir = os.path.join(idir, "buildroot", toolchains_path)
>  
> -        with urlopen_closing(url) as r:
> -            config = decode_byte_list(r.readlines())
> -        configs.append(config)
> +    configs = []
> +    for configfile in os.listdir(toolchains_dir):
> +        if configfile.endswith('.config'):
> +            with open(os.path.join(toolchains_dir, configfile)) as r:
> +                config = decode_byte_list(r.readlines())
> +            configs.append(config)
>      return configs
>  
>  def prepare_build(**kwargs):
> @@ -535,10 +512,7 @@ def gen_config(**kwargs):
>      log_write(log, "INFO: generate the configuration")
>  
>      # Select a random toolchain configuration
> -    try:
> -        configs = get_toolchain_configs(**kwargs)
> -    except:
> -        return -1
> +    configs = get_toolchain_configs(**kwargs)
>  
>      i = randint(0, len(configs) - 1)
>      config = configs[i]
> @@ -928,7 +902,7 @@ def main():
>                  submitter = args['--submitter'],
>                  make_opts = (args['--make-opts'] or ''),
>                  nice = (args['--nice'] or 0),
> -                toolchains_url = args['--toolchains-url'],
> +                toolchains_path = args['--toolchains-path'],
>                  upload = upload,
>                  buildpid = buildpid,
>                  debug = args['--debug']
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
