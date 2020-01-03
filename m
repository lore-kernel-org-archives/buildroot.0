From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 3 Jan 2020 16:38:18 +0100
Subject: [Buildroot] [PATCH 11/11] support/scripts/pkg-stats: create and
 store defconfig information
In-Reply-To: <20200103151849.10956-12-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-12-heiko.thiery@gmail.com>
Message-ID: <20200103163818.02b74f4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Jan 2020 16:18:48 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Collect information about developers and store with defconfig name.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Seems good. Two comments below.

> ---
>  support/scripts/pkg-stats | 48 +++++++++++++++++++++++++++++++++++----
>  1 file changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index afd9cacafb..a85aefadf4 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -88,6 +88,34 @@ def parse_developers(basepath=None):
>          developers.append(Developer(name, files))
>      return developers
>  
> +class Defconfig:
> +    def __init__(self, name, path):
> +        self.name = name
> +        self.path = path
> +        self.developers = None
> +
> +    def set_developers(self, developers):
> +        """
> +        Fills in the .developers field
> +        """
> +        self.developers = list()
> +        for dev in developers:
> +            for f in dev.files:
> +                if self.path == f:

Perhaps add a Developer.has_file() method, to simplify this to:

	for dev in developers:
		if dev.has_file(f):
			self.developers.append(dev.name)


>  class Package:
>      all_licenses = dict()
>      all_license_files = list()
> @@ -791,7 +819,7 @@ def dump_html(packages, stats, date, commit, output):
>          f.write(html_footer)
>  
>  
> -def dump_json(packages, stats, date, commit, output):
> +def dump_json(packages, defconfigs, stats, date, commit, output):
>      # Format packages as a dictionnary instead of a list
>      # Exclude local field that does not contains real date
>      excluded_fields = ['url_worker']
> @@ -802,6 +830,13 @@ def dump_json(packages, stats, date, commit, output):
>              if k not in excluded_fields
>          } for pkg in packages
>      }
> +
> +    defconfigs = {
> +        d.name: {
> +            k: v
> +            for k, v in d.__dict__.items()
> +        } for d in defconfigs
> +    }
>      # Aggregate infrastructures into a single dict entry
>      statistics = {
>          k: v
> @@ -811,6 +846,7 @@ def dump_json(packages, stats, date, commit, output):
>      statistics['infra'] = {k[6:]: v for k, v in stats.items() if k.startswith('infra-')}
>      # The actual structure to dump, add commit and date to it
>      final = {'packages': pkgs,
> +             'defconfigs': defconfigs,
>               'stats': statistics,
>               'commit': commit,
>               'date': str(date)}
> @@ -847,10 +883,14 @@ def __main__():
>      date = datetime.datetime.utcnow()
>      commit = subprocess.check_output(['git', 'rev-parse',
>                                        'HEAD']).splitlines()[0]
> -    print("Build package list ...")
> -    packages = get_pkglist(args.npackages, package_list)

Not sure why this is being moved around.

>      print("Getting developers...")
>      developers = parse_developers()
> +    print("Build defconfig list ...")
> +    defconfigs = get_defconfig_list()
> +    for d in defconfigs:
> +        d.set_developers(developers)
> +    print("Build package list ...")
> +    packages = get_pkglist(args.npackages, package_list)
>      print("Getting package make info ...")
>      package_init_make_info()
>      print("Getting package details ...")
> @@ -875,7 +915,7 @@ def __main__():
>          dump_html(packages, stats, date, commit, args.html)
>      if args.json:
>          print("Write JSON")
> -        dump_json(packages, stats, date, commit, args.json)
> +        dump_json(packages, defconfigs, stats, date, commit, args.json)
>  
>  
>  __main__()

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
