From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 16:39:33 +0200
Subject: [Buildroot] [PATCH v8 9/9] docs/manual: new security management
 section
In-Reply-To: <1552082667-46877-10-git-send-email-matthew.weber@rockwellcollins.com>
References: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1552082667-46877-10-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <908318d4-c0e8-5b31-77ac-a3fa69987bc3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

 I'm going to give most of my feedback here, because the docs really say where
we are going with this.

On 08/03/2019 23:04, Matt Weber wrote:
> This changeset captures an initial discussion on the use of CPE
> reporting within a target build.  It notes the reporting limitations
> and provides actions a user could take to improve upon the current
> report information.
> 
> There is also an example of how one might do CVE analysis using the
> CPE report information.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> 
> v8
>  - Updated for cpe-report changes
>  - Added notes on doing CVE searches and submissions
> 
> v7
>  - New
> ---
>  docs/manual/cpe-reporting.txt | 103 ++++++++++++++++++++++++++++++++++++++++++
>  docs/manual/manual.txt        |   2 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 docs/manual/cpe-reporting.txt
> 
> diff --git a/docs/manual/cpe-reporting.txt b/docs/manual/cpe-reporting.txt
> new file mode 100644
> index 0000000..a6f32d5
> --- /dev/null
> +++ b/docs/manual/cpe-reporting.txt
> @@ -0,0 +1,103 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +[[cpe-info]]
> +
> +== Security Vulnerability Management
> +
> +There are many different vulnerability databases (open/paid). This
> +section documents the use of the National Vulnerability Database(NVD)
> +provided by the National Institute of Standards and Technology (NIST).
> +
> +Within Buildroot, the intent is to provide good reporting of the build
> +configuration's inventory of software. The vulnerability analysis is
> +assumed to occur outside of the Buildroot environment (at this time).

 ... But in the end, what we want is a list of CVE and other vulnerabilities
that apply to my particular Buildroot configuration, and preferably weeding out
the ones that have been patched within Buildroot.

 The inventory is a step in the direction of getting there, because you can
search the NIST CVE database based on CPE strings. But that hinges on the
quality of the CPE strings. We can distinguish a few cases.

* Perfect match: CPE_ID is the same as the CPE dictionary entry.

* Imperfect match: CPE_ID is the same as a CPE dictionary entry, but it doesn't
actually refer to exactly the same software (e.g. because we have patched it, or
we use a git commit beyond the release version).

* Version missing: the package exists in the CPE dictionary, but our specific
version is missing. This could be converted into an imperfect match by using a
"wrong" version string, or by updating the CPE dictionary.

* Package missing: the package doesn't exist in the CPE dictionary.

* Wrong match: the matching package in the CPE dictionary doesn't actually refer
to the same software at all.


 So, how bad are these imperfect, missing and wrong matches? In fact, nobody
cares about the match in the CPE dictionary, what we care about is the generated
vulnerability list.

 For searching CVEs, we have the choice of using a full CPE_ID that is identical
to a string in the CPE dictionary, or to use wildcards to (potentially) match
more entries. The more wildcards, the more false hits you get when searching for
vulnerabilities. The less wildcards, the more vulnerabilities you will miss.

 Since you probably prefer to have false hits rather than missing
vulnerabilities, I think we should tend to using more wildcards. (Note BTW that
you're going to have false hits and missing vulns even if an exact CPE_ID is
used, because sometimes the CVE info itself is inaccurate).

 Therefore, I think the automatically generated CPE_ID should be more
wildcard-y. In particular, I think the vendor should be set to *. Conversely, I
think that when a package provides a CPE_ID, it should always specify the full
ID (which could still use $(FOO_VERSION), of course). Yes, that's a bit of
duplication, but it's trivial to do (supposedly you just cut and paste from the
existing dictionary entry) and it's nice and explicit.

 Note that this means that IMO eventually all packages should have a CPE_ID (or,
if the CPE_ID is missing, it would imply that the package doesn't exist in the
CPE dictionary).


> +
> +=== Common Platform Enumeration (CPE) Reporting
> +
> +Buildroot consists of a series of upstream packages.  Each of those
> +packages may have a CPE definition used to map vulnerabilities to Common
> +Vulnerabilities and Exposures (CVE). A single package CPE has many versions
> +and each version may have a suite of CVEs associated.

 That last statement is not entirely correct. It's actualy the CVE that will
have a suite of CPE match strings associated with it.

 Ideally, the CVE's match strings would just be compared to the query's match
string - this way, there would not be a need for a dictionary at all.
Unfortunately, that's not how it works - at least for the NIST lookup.


> +To make the gathering of the software inventory of CPE easier, Buildroot can
> +collect for you all the CPE related to the configured defconfig. To produce
> +this material, after you have configured Buildroot with +make menuconfig+,
> ++make xconfig+ or +make gconfig+, run:
> +
> +--------------------
> +make cpe-info
> +--------------------
> +
> +Buildroot then collects and writes the +$(TOPDIR)/cpe-manifest.csv+. This file
> +can be used for manual inspection against a CVE database or provided to
> +external tools which perform CVE inventory/analysis.

 Now that we have show-info on its way in, I don't think we should add this
cpe-info target at all. Instead, we should rely on show-info and let tools parse
the JSON rather than the CSV.


> +*CPE Maintenance*

 This part does not belong in the user guide, it should go to a section in the
developer guide. Either a new top-level section, or a subsection of Contributing
to Buildroot.


> +To maintain these CPE strings for version changes against the NIST dictionary,
> +the manifest can be further processed. First, navigate to your Buildroot
> +directory and execute the script below. The script has some optional arguments
> +for providing a alternate dictionary URL or caching a processed dictionary.
> +
> +--------------------
> +support/scripts/cpe-report -c $(TOPDIR)/cpe-manifest.csv
> +--------------------
> +
> +This script retrieves the NIST dictionary and classifies each CPE as either
> +matched, requires version update or missing. Based on this analysis, the script
> +automatically uses the NIST dictionary entries to produce a draft of XML which
> +can be submitted to NIST to update a version of an entry in the dictionary. It
> +is important to review the generated xml files in the cpe folder as they may
> +need refined reference tags and adjustments to how the version is represented
> +in the title.
> +
> +In the case of missing items, a +cpe-report-missing.txt+ report is output by
> +the script and can be used as a starting point to manually create a xml file
> +to submit. Note, some manual analysis using the NIST search engine (https://nvd.nist.gov/products/cpe/search)
> +is suggested for these missing item as the Buildroot +CPE_ID_+ variables maybe
> +slightly incorrect and cause the cpe-report script to catagorize the package
> +as missing. If that is the case, a change can be made by adjusting the default
> +CPE variables in the specific package's +.mk+. See xref:_infrastructure_for_packages_with_specific_build_systems[]
> +discussion on the use of +LIBFOO_CPE_*+.
> +If the package is truely missing, the package's Kconfig help material and .mk
> +should provide most of the information to construct a new NIST submission.
> +
> +To submit a new entry or updated entry to NIST, create an request email to the
> +cpe_dictionary at nist.gov recipient and attach a individual xml file per package
> +being added/updated.  It is OK to have multiple version updates in a single
> +file as long as they are all for the same package. 

 This statement is a bit stupid: in Buildroot context, you're never going to
have multiple version updates in a single XML file, are you?

> For reference the guidance
> +can be found on the NIST CPE site (https://nvd.nist.gov/products/cpe).

 I actually don't find anything there about how to contribute to the dictionary,
other than "contact the CPE team".

> +
> +*Limitations*

 This part should again be in the user documentation, not the developer
documentation.

> +
> +Buildroot does not produce or accurately present some of the CPE material. Items
> +such as any versions which are non-number/hash are not compliant with the CPE
> +string specification and would require a manual analysis to update the CPE list
> +before any external CVE analysis should occur. This is a similar situation for
> +packages like the Linux kernel or U-Boot which may not have a version which
> +directly maps to a CPE.
> +
> +There is an assumed default CPE string for each package which is auto-generated
> +using existing package information. The output of +make cpe-info+ is based on
> +this default information and the packages which have been individually tailored
> +to match existing CPE strings. The Buildroot developers try to do their best to
> +keep those declarative statements as accurate as possible, to the best of their
> +knowledge. However, it is very well possible that those declarative statements
> +are not all fully accurate nor exhaustive. Similar to legal-info, it is your
> +responsibility to verify this information.

 So all this would be a bit stronger if we can just say that autogenerated
string may or may not convey useful information, and that if the vendor is set,
you know that it's a validated string.



> +
> +=== Common Vulnerability and Exposures (CVE) Anaylsis
> +The Common Vulnerabilities and Exposures (CVE) system provides a
> +reference-method for publicly known information-security vulnerabilities and
> +exposures. (https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures)
> +
> +Like previously stated, there are many tools and methods to perform this
> +analysis. The most basic example is to do a manual CVE analysis by navigating
> +to the NVD search engine (https://nvd.nist.gov/vuln/search) and using the CPE
> +string identified in the first field of the +$(TOPDIR)/cpe-manifest.csv+.
> +Here's an example for tcpdump (https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&query=cpe%3A2.3%3Aa%3Atcpdump%3Atcpdump%3A4.9.1%3A*%3A*%3A*%3A*%3A*%3A*%3A*&search_type=all).

 Could we make a simple script that takes show-info and generates a list of URLs?


> +
> +Beyond the manual search approach, the next step would be a more centralized
> +shared database with multi-feed support (NVD+).  The cve-search project aims
> +to offer that type of solution (https://github.com/cve-search/cve-search).

 I tried the public search at https://cve.circl.lu/ and apparently it (or at
least the web interface and API) only allows to search by exact CPE_ID, or by
vendor/product (but NOT version).


 Are you actually using this stuff at the moment? I feel that it still has some
way to go before being actually useful. If this printing of CVE search links
would be there, that would be something already. And of course, the tool to add
new entries is nice as well.


 Regards,
 Arnout


> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index 4eb4ba9..fad8bf2 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -46,6 +46,8 @@ include::legal-notice.txt[]
>  
>  include::beyond-buildroot.txt[]
>  
> +include::cpe-reporting.txt[]
> +
>  = Developer guide
>  
>  include::how-buildroot-works.txt[]
> 
