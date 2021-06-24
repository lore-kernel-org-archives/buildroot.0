From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Jun 2021 15:04:36 +0200
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: add
 infra_coinfig to json_output
In-Reply-To: <20210624125702.22106-1-heiko.thiery@gmail.com>
References: <20210624125702.22106-1-heiko.thiery@gmail.com>
Message-ID: <20210624150436.1806e5e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Jun 2021 14:57:03 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index cc91d13167..f4dd034bd9 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -89,6 +89,7 @@ class Package:
>          self.path = path
>          self.pkg_path = os.path.dirname(path)
>          self.infras = None
> +        self.infra_config = None
>          self.license = None
>          self.has_license = False
>          self.has_license_files = False
> @@ -146,9 +147,9 @@ class Package:
>              return False
>          return True
>  
> -    def set_infra(self):
> +    def set_infra(self, config_info):
>          """
> -        Fills in the .infras field
> +        Fills in the .infras and ..infra_config fields
>          """
>          self.infras = list()
>          with open(os.path.join(brpath, self.path), 'r') as f:
> @@ -163,6 +164,13 @@ class Package:
>                  else:
>                      self.infras.append(("target", infra))
>  
> +        if config_info:
> +            for pkg_name in config_info:
> +                if config_info[pkg_name]['name'] == self.name:
> +                    if self.infra_config == None:
> +                        self.infra_config = list()
> +                    self.infra_config.append(config_info[pkg_name]['type'])
> +
>      def set_license(self):
>          """
>          Fills in the .status['license'] and .status['license-files'] fields
> @@ -369,8 +377,8 @@ def get_pkglist(npackages, package_list):
>  
>  def get_config_packages():
>      cmd = ["make", "--no-print-directory", "show-info"]
> -    js = json.loads(subprocess.check_output(cmd))
> -    return set([v["name"] for v in js.values()])
> +    config_info = json.loads(subprocess.check_output(cmd))
> +    return (config_info, set([v["name"] for v in config_info.values()]))
>  
>  
>  def package_init_make_info():
> @@ -1115,10 +1123,11 @@ def __main__():
>      if args.nvd_path:
>          import cve as cvecheck
>  
> +    config_info = None
>      if args.packages:
>          package_list = args.packages.split(",")
>      elif args.configpackages:
> -        package_list = get_config_packages()
> +        (config_info, package_list) = get_config_packages()

Why is this information passed separately, and not within the
package_list ? I'm a bit confused here. Why don't have you add a "type"
field in the Package class that says whether it's a host, target, or
both package ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
