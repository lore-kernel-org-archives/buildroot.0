From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 4 Nov 2020 11:18:50 -0600
Subject: [Buildroot] [PATCH 08/10] support/script/pkg-stats: show CPE ID
 in results
In-Reply-To: <20201104145145.1316167-9-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-9-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpbN8-SXF8T4bxdn+JnyYrHSzpQy8J2ZzByCZ=yp_gtZNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas / Greg,

On Wed, Nov 4, 2020 at 8:53 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> From: Gregory CLEMENT <gregory.clement@bootlin.com>
>
> This commit improves the pkg-stats script to show the CPE ID of
> packages, if available. For now, it doesn't use CPE IDs to match CVEs.
>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/pkg-stats | 44 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 503cc45c16..0a48cf9581 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -76,6 +76,7 @@ class Package:
>      all_license_files = list()
>      all_versions = dict()
>      all_ignored_cves = dict()
> +    all_cpeids = dict ()
>      # This is the list of all possible checks. Add new checks to this list so
>      # a tool that post-processeds the json output knows the checks before
>      # iterating over the packages.
> @@ -96,6 +97,7 @@ class Package:
>          self.current_version = None
>          self.url = None
>          self.url_worker = None
> +        self.cpeid = None
>          self.cves = list()
>          self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
>          self.status = {}
> @@ -210,6 +212,14 @@ class Package:
>          if var in self.all_versions:
>              self.current_version = self.all_versions[var]
>
> +    def set_cpeid(self):
> +        """
> +        Fills in the .cpeid field
> +        """
> +        var = self.pkgvar()
> +        if var in self.all_cpeids:
> +            self.cpeid = self.all_cpeids[var]
> +
>      def set_check_package_warnings(self):
>          """
>          Fills in the .warnings and .status['pkg-check'] fields
> @@ -333,7 +343,7 @@ def get_pkglist(npackages, package_list):
>  def package_init_make_info():
>      # Fetch all variables at once
>      variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
> -                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES"])
> +                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"])
>      variable_list = variables.decode().splitlines()
>
>      # We process first the host package VERSION, and then the target
> @@ -371,6 +381,9 @@ def package_init_make_info():
>              pkgvar = pkgvar[:-12]
>              Package.all_ignored_cves[pkgvar] = value.split()
>
> +        elif pkgvar.endswith("_CPE_ID"):
> +            pkgvar = pkgvar[:-7]
> +            Package.all_cpeids[pkgvar] = value

I haven't dug that deep yet in the script, but would this populate
host and target CPE ID values?  I know the Infrastructure does note
host/target so there is probably enough information to conditionally
pull the value.
