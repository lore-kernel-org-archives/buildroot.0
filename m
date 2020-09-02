From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 2 Sep 2020 23:30:31 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix flake8 errors in
 cve-checker and pkg-stats
In-Reply-To: <20200902212157.15518-1-yann.morin.1998@free.fr>
References: <20200902212157.15518-1-yann.morin.1998@free.fr>
Message-ID: <20200902233031.45790630@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Wed,  2 Sep 2020 23:21:57 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Note that one is silenced, rather than fixed: we indeed need to import
> after we add the local dorectory to the modules search path.

s/dorectory/directory/ ?

Regards,
Peter


>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/scripts/cve-checker | 8 ++++++--
>  support/scripts/pkg-stats   | 8 +++-----
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/support/scripts/cve-checker b/support/scripts/cve-checker
> index 2bfe2d8543..998ea5b8af 100755
> --- a/support/scripts/cve-checker
> +++ b/support/scripts/cve-checker
> @@ -24,6 +24,7 @@ import json
>  import sys
>  import cve as cvecheck
>
> +
>  class Package:
>      def __init__(self, name, version, ignored_cves):
>          self.name = name
> @@ -31,6 +32,7 @@ class Package:
>          self.cves = list()
>          self.ignored_cves = ignored_cves
>
> +
>  def check_package_cves(nvd_path, packages):
>      if not os.path.isdir(nvd_path):
>          os.makedirs(nvd_path)
> @@ -41,6 +43,7 @@ def check_package_cves(nvd_path, packages):
>              if pkg and cve.affects(pkg.name, pkg.version, pkg.ignored_cves) == cve.CVE_AFFECTS:
>                  pkg.cves.append(cve.identifier)
>
> +
>  html_header = """
>  <head>
>  <script src=\"https://www.kryogenix.org/code/browser/sorttable/sorttable.js\"></script>
> @@ -140,7 +143,7 @@ def dump_json(packages, date, output):
>              "cves": pkg.cves,
>          } for pkg in packages
>      }
> -     # The actual structure to dump, add date to it
> +    # The actual structure to dump, add date to it
>      final = {'packages': pkgs,
>               'date': str(date)}
>      with open(output, 'w') as f:
> @@ -160,7 +163,7 @@ def parse_args():
>      output.add_argument('--json', dest='json', type=resolvepath,
>                          help='JSON output file')
>      parser.add_argument('--nvd-path', dest='nvd_path',
> -                        help='Path to the local NVD database',type=resolvepath,
> +                        help='Path to the local NVD database', type=resolvepath,
>                          required=True)
>      args = parser.parse_args()
>      if not args.html and not args.json:
> @@ -189,4 +192,5 @@ def __main__():
>          print("Write JSON")
>          dump_json(packages, date, args.json)
>
> +
>  __main__()
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index fceb28839b..503cc45c16 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -25,15 +25,12 @@ import os
>  from collections import defaultdict
>  import re
>  import subprocess
> -import requests  # NVD database download
>  import json
> -import time
>  import sys
>
>  sys.path.append('utils/')
>  from getdeveloperlib import parse_developers  # noqa: E402
> -
> -import cve as cvecheck
> +import cve as cvecheck  # noqa: E402
>
>
>  INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
> @@ -538,9 +535,10 @@ def check_package_cves(nvd_path, packages):
>          for pkg_name in cve.pkg_names:
>              if pkg_name in packages:
>                  pkg = packages[pkg_name]
> -                if cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves) == cve.CVE_AFFECTS :
> +                if cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves) == cve.CVE_AFFECTS:
>                      pkg.cves.append(cve.identifier)
>
> +
>  def calculate_stats(packages):
>      stats = defaultdict(int)
>      stats['packages'] = len(packages)
