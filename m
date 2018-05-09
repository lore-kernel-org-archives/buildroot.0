From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 9 May 2018 16:33:58 -0500
Subject: [Buildroot] [PATCH v3 6/6] support/scripts/pkgstat: add CPE
 status reporting
In-Reply-To: <CAPP7BN1A8KV+MEfxJJ1Lk9suG7pVORk4yhKwp2Fr9+Oj9dHomA@mail.gmail.com>
References: <1525725005-41435-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1525725005-41435-7-git-send-email-matthew.weber@rockwellcollins.com>
 <CAPP7BN1A8KV+MEfxJJ1Lk9suG7pVORk4yhKwp2Fr9+Oj9dHomA@mail.gmail.com>
Message-ID: <CANQCQpaJ2XAZCpSArkrj6SwhEogphBviO6Wa30S3q_70bzg_PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erik,

On Wed, May 9, 2018 at 4:03 PM, Erik Larsson
<karl.erik.larsson@gmail.com> wrote:
> Hi!
>
> 2018-05-07 22:30 GMT+02:00 Matt Weber <matthew.weber@rockwellcollins.com>:
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>> ---
>>  support/scripts/pkg-stats | 80 ++++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 76 insertions(+), 4 deletions(-)
>>
>> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
>> index 144c00c..82057f1 100755
>> --- a/support/scripts/pkg-stats
>> +++ b/support/scripts/pkg-stats
>> @@ -38,6 +38,7 @@ class Package:
>>      all_licenses = list()
>>      all_license_files = list()
>>      all_versions = dict()
>> +    all_cpe_id = dict()
>>
>>      def __init__(self, name, path):
>>          self.name = name
>> @@ -49,6 +50,8 @@ class Package:
>>          self.patch_count = 0
>>          self.warnings = 0
>>          self.current_version = None
>> +        self.cpe_id = None
>> +        self.has_cpe = False
>>
>>      def pkgvar(self):
>>          return self.name.upper().replace("-", "_")
>> @@ -122,6 +125,22 @@ class Package:
>>                  self.warnings = int(m.group(1))
>>                  return
>>
>> +    def set_cpe_info(self, cpe_dict):
>> +        """
>> +        Fills in the .has_cpe field
>> +        """
>> +        var = self.pkgvar()
>> +        if var in self.all_cpe_id:
>> +            self.cpe_id = self.all_cpe_id[var]
>> +        result = cpe_dict.find(self.cpe_id)
>> +        if not result:
>> +            result = cpe_dict.find_partial(cpe_dict.get_cpe_no_version(self.cpe_id))
>> +            if result:
>> +                self.has_cpe = "Update"
>> +            # Unset case for has_cpe is assumed missing/does not exist
>> +        else:
>> +            self.has_cpe = cpe_dict.get_nvd_url(self.cpe_id)
>> +
>>      def __eq__(self, other):
>>          return self.path == other.path
>>
>> @@ -260,6 +279,22 @@ def package_init_make_info():
>>
>>          Package.all_versions[pkgvar] = value
>>
>> +    # CPE ID
>> +    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
>> +                                 "-s", "printvars", "VARS=%_CPE_ID"])
>> +    for l in o.splitlines():
>> +        # Get variable name and value
>> +        pkgvar, value = l.split("=")
>> +
>> +        # Strip _CPE_ID
>> +        pkgvar = pkgvar[:-7]
>> +
>> +        if pkgvar == "LINUX":
>> +            Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"
>> +        elif pkgvar == "LINUX_HEADERS":
>> +            Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"
>> +        else:
>> +            Package.all_cpe_id[pkgvar] = "cpe:2.3:a:" + value + ":*:*:*:*:*:*:*"
>>
>>  def calculate_stats(packages):
>>      stats = defaultdict(int)
>> @@ -285,6 +320,12 @@ def calculate_stats(packages):
>>              stats["hash"] += 1
>>          else:
>>              stats["no-hash"] += 1
>> +        if pkg.has_cpe == "Update":
>> +            stats["update-cpe"] += 1
>> +        elif pkg.has_cpe:
>> +            stats["cpe"] += 1
>> +        else:
>> +            stats["no-cpe"] += 1
>>          stats["patches"] += pkg.patch_count
>>      return stats
>>
>> @@ -428,6 +469,20 @@ def dump_html_pkg(f, pkg):
>>      f.write("  <td class=\"%s\">%d</td>\n" %
>>              (" ".join(td_class), pkg.warnings))
>>
>> +    # CPE Valid
>> +    td_class = ["centered"]
>> +    if not pkg.has_cpe:
>> +        td_class.append("wrong")
>> +        f.write("  <td class=\"%s\">%s</td>\n" %
>> +                (" ".join(td_class), boolean_str(pkg.has_cpe)))
>> +    elif pkg.has_cpe == "Update":
>> +        td_class.append("wrong")
>> +        f.write("  <td class=\"%s\">Update</td>\n" %
>> +                (" ".join(td_class)))
>> +    else:
>> +        td_class.append("correct")
>> +        f.write("  <td class=\"%s\"><a href=\"%s\">%s</a></td>\n" %
>> +                (" ".join(td_class), pkg.has_cpe, boolean_str(pkg.has_cpe)))
>>      f.write(" </tr>\n")
>>
>>
>> @@ -443,6 +498,7 @@ def dump_html_all_pkgs(f, packages):
>>  <td class=\"centered\">Hash file</td>
>>  <td class=\"centered\">Current version</td>
>>  <td class=\"centered\">Warnings</td>
>> +<td class=\"centered\">CPE Valid</td>
>>  </tr>
>>  """)
>>      for pkg in sorted(packages):
>> @@ -469,6 +525,12 @@ def dump_html_stats(f, stats):
>>              stats["hash"])
>>      f.write(" <tr><td>Packages not having a hash file</td><td>%s</td></tr>\n" %
>>              stats["no-hash"])
>> +    f.write(" <tr><td>Packages having a registered CPE</td><td>%s</td></tr>\n" %
>> +            stats["cpe"])
>> +    f.write(" <tr><td>Packages needing CPE update</td><td>%s</td></tr>\n" %
>> +            stats["update-cpe"])
>> +    f.write(" <tr><td>Packages missing a registered CPE</td><td>%s</td></tr>\n" %
>> +            stats["no-cpe"])
>>      f.write(" <tr><td>Total number of patches</td><td>%s</td></tr>\n" %
>>              stats["patches"])
>>      f.write("</table>\n")
>> @@ -518,6 +580,16 @@ class CPE:
>>              if cpe['cpe-23:cpe23-item']['@name'] == cpe_str:
>>                  return cpe['cpe-23:cpe23-item']['@name']
>>
>> +    def get_cpe_no_version(self, cpe):
>> +        return cpe.split(":")[0]+":"+cpe.split(":")[1]+ \
>> +               ":"+cpe.split(":")[2]+":"+cpe.split(":")[3]+ \
>> +               ":"+cpe.split(":")[4]
>
> I tested this script by running:
> # ./support/scripts/pkg-stats -o /tmp/test.html
>
> The result I got was a crash. Maybe you understand it better then me.
>
> CPE: Searching for partial [cpe:2.3:a:copas_project:copas]
> CPE: Searching for [None]
> Traceback (most recent call last):
>  File "./support/scripts/pkg-stats", line 667, in <module>
>    __main__()
>  File "./support/scripts/pkg-stats", line 661, in __main__
>    pkg.set_cpe_info(cpe_dict)
>  File "./support/scripts/pkg-stats", line 137, in set_cpe_info
>    result = cpe_dict.find_partial(cpe_dict.get_cpe_no_version(self.cpe_id))
>  File "./support/scripts/pkg-stats", line 586, in get_cpe_no_version
>    ":"+cpe.split(":")[4]
> AttributeError: 'NoneType' object has no attribute 'split'
>

I was running pkgstat with a specific list of packages.  I bet when
unbounded that error is produced.  I'll retest, thanks for looking at
it!

Matt
