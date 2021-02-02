From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2021 23:02:12 +0100
Subject: [Buildroot] [PATCH v2 7/7] docs/manual: add details about
 vulnerability management
In-Reply-To: <20210131133819.1818537-8-thomas.petazzoni@bootlin.com>
References: <20210131133819.1818537-1-thomas.petazzoni@bootlin.com>
 <20210131133819.1818537-8-thomas.petazzoni@bootlin.com>
Message-ID: <7ea5cb01-3ea0-50fc-c700-9c80a27c3ceb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/01/2021 14:38, Thomas Petazzoni wrote:
> This addition to the documentation gives some details about CPE/CVE,
> pkg-stats and missing-cpe.

 That was sorely needed!

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  docs/manual/common-usage.txt | 49 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index 9ba87a8339..e5d9d79420 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -417,6 +417,55 @@ effects:
>    be empty and it's only at the very end of the build that they will
>    be populated.
>  
> +[[vulnerability-management]]
> +=== Vulnerability management
> +
> +Buildroot integrates a number of features that help tracking whether
> +known security vulnerabilities are affecting some of the
> +packages. Buildroot bases this logic on _CVEs_ (Common Vulnerabilities
> +and Exposure) and the https://nvd.nist.gov/vuln[NVD database] provided
> +by NIST.
> +
> +First, each package in Buildroot can be associated to a _CPE_
> +identifier, by means of the various +FOO_CPE_ID_<something>+ variables
> +that can be provided by each package. See
> +xref:generic-package-reference[] for more details about those
> +variables. When the _CPE_ identifier of a package is not defined, a
> +default value is used, which may or may not be correct.

 I don't think this reflects the reality very well. cpeid is only used if
*something* is set in the .mk file. Something like:

When no +FOO_CPE_ID_<something>+ variable is set for a package, it is not
considered as having a valid _CPE_ identifier.


> This _CPE_
> +identifier is used to find in the NVD database of vulnerabilities
> +which _CVEs_ are affecting any given package.

 ... If a package doesn't have a valid CPE identifier, a guess is made based on
the package name and version.

> +
> +Based on this and the NIST databases, the +make pkg-stats+ target
> +produces JSON and HTML formatted reports that indicate for each
> +package of the current Buildroot configuration:
> +
> +* If there are known _CVEs_ for each package. Note that CVEs can
> +  manually be ignored on a per-package basis using the
> +  +FOO_IGNORED_CVES+ variable, for example if Buildroot has a patch
> +  that fixes the vulnerability, or if the vulnerability is not
> +  applicable to Buildroot for some reason.
> +
> +* If the _CPE_ identifier is valid and known in the
> +  https://nvd.nist.gov/products/cpe[NIST CPE dictionary]. A _CPE_ is
> +  valid is one of the +FOO_CPE_ID_<something>+ variable is defined, or
> +  if +FOO_CPE_ID_VALID = YES+ validating that the default value of the
> +  _CPE_ identifier is correct. In addition, _CPE_ are checked for
> +  existence in the NIST CPE dictionary. If the _CPE_ identifier is not
> +  known to the NIST CPE dictionary, then it is possible to contribute
> +  to the NIST CPE dictionary: one need to submit a XML document that
                                     needs

> +  describes the additional CPE identifier. 

 Can you add a reference to a web page that describes the procedure? Otherwise
it's not terribly helpful IMHO.

> Buildroot can help
> +  generating such XML documents for missing CPE identifiers using the
> +  +make missing-cpe+ target. The XML documents are generated in
> +  +$(O)/cpe-updates+, will need to be edited before submission to
> +  NIST. In particular, one should verify the version information and
> +  check that the reference URLs are reachable with a valid type
> +  (suggestions for types are provided in the generated file).  If a
> +  previous _CPE_ entry was found in the NIST CPE dictionary, the XML

 If no previous CPE entry exists (i.e., the CPE_ID specified in the .mk file is
not valid), then no XML file is generated at all... AFAICS there is no help at
the moment for generating the XML for completely new entries.

 My brain is too tired ATM to try to formulate the documentation that expresses
that.

 I've marked this one changes requested in patchwork.

 Regards,
 Arnout


> +  document generation tries to minimize the entry differences between
> +  the existing versions in the dictionary. The XML document
> +  generation uses the XML from the last version of that CPE as a
> +  template for the new submission.
> +
>  include::eclipse-integration.txt[]
>  
>  include::advanced.txt[]
> 
