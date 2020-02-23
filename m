From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 23 Feb 2020 15:24:14 +0100
Subject: [Buildroot] [PATCH v3 12/12] support/scripts/pkg-stats: add
 status for cve check
In-Reply-To: <20200222085715.23769-13-heiko.thiery@gmail.com>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
 <20200222085715.23769-13-heiko.thiery@gmail.com>
Message-ID: <6d3836ec-e228-77ef-df6c-6f3bd40fdf71@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, all,

On 2/22/20 9:57 AM, Heiko Thiery wrote:
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>   support/scripts/pkg-stats | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index ed22f6b650..4efff8624f 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -617,8 +617,14 @@ def check_package_cves(nvd_path, packages):
>   
>       for cve in CVE.read_nvd_dir(nvd_path):
>           for pkg_name in cve.pkg_names:
> -            if pkg_name in packages and cve.affects(packages[pkg_name]):
> -                packages[pkg_name].cves.append(cve.identifier)
> +            if pkg_name in packages:
> +                if cve.affects(packages[pkg_name]):
> +                    packages[pkg_name].cves.append(cve.identifier)
> +                if len(packages[pkg_name].cves):
> +                    packages[pkg_name].status['cve'] = ('error', 'affected by cve')
> +                else:
> +                    packages[pkg_name].status['cve'] = ('ok', 'no cve found')
> +
>   
>   
>   def calculate_stats(packages):
> 

In the current state, that would give:

* If a CVE applies to a br package -> error
* If a CVE does not applies to a br package -> ok
* If no CVE points to a br package -> na (no status check done)

I would argue that the latest case is not correct. The status should be 
ok, because we ran through the whole list of CVEs from the NVD feed, and 
we did not find any of them that applies to this package.

I would rather write it like this:

########################
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ed22f6b650..91477d583e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -620,6 +620,12 @@ def check_package_cves(nvd_path, packages):
              if pkg_name in packages and cve.affects(packages[pkg_name]):
                  packages[pkg_name].cves.append(cve.identifier)

+    for pkg_name, pkg in packages.items():
+        if len(pkg.cves) > 0:
+            pkg.status['cve'] = ('error', 'affected by CVE(s)')
+        else:
+            pkg.status['cve'] = ('ok', 'no CVE found')
+

  def calculate_stats(packages):
      stats = defaultdict(int)
########################


Best regards,

Titouan
