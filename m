From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:42 +0200
Subject: [Buildroot] [PATCH 09/17] docs/manual: new security management
 section
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-10-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

This changeset captures an initial discussion on the use of CPE
reporting within a target build.  It notes the reporting limitations
and provides actions a user could take to improve upon the current
report information.

There is also an example of how one might do CVE analysis using the
CPE report information.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 docs/manual/cpe-reporting.txt | 107 ++++++++++++++++++++++++++++++++++
 docs/manual/manual.txt        |   2 +
 2 files changed, 109 insertions(+)
 create mode 100644 docs/manual/cpe-reporting.txt

diff --git a/docs/manual/cpe-reporting.txt b/docs/manual/cpe-reporting.txt
new file mode 100644
index 0000000000..11da979345
--- /dev/null
+++ b/docs/manual/cpe-reporting.txt
@@ -0,0 +1,107 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[cpe-info]]
+
+== Security Vulnerability Management
+
+There are many different vulnerability databases (open/paid). This
+section documents the use of the National Vulnerability Database(NVD)
+provided by the National Institute of Standards and Technology (NIST).
+
+Within Buildroot, the intent is to provide good reporting of the build
+configuration's inventory of software. The vulnerability analysis is
+assumed to occur outside of the Buildroot environment (at this time).
+
+=== Common Platform Enumeration (CPE) Reporting
+
+Buildroot consists of a series of upstream packages.  Each of those
+packages may have a CPE definition used to map vulnerabilities to Common
+Vulnerabilities and Exposures (CVE). A single package CPE has many versions
+and each version may have a suite of CVEs associated.
+
+To make the gathering of the software inventory of CPE easier, Buildroot can
+collect for you all the CPE related to the configured defconfig. To produce
+this material, after you have configured Buildroot with +make menuconfig+,
++make xconfig+ or +make gconfig+, run:
+
+--------------------
+make cpe-info
+--------------------
+
+Buildroot then collects and writes the +$(TOPDIR)/cpe-manifest.csv+. This file
+can be used for manual inspection against a CVE database or provided to
+external tools which perform CVE inventory/analysis.
+
+*CPE Maintenance*
+
+To maintain these CPE strings for version changes against the NIST dictionary,
+the manifest can be further processed. First, navigate to your Buildroot
+directory and execute the script below. The script has some optional arguments
+for providing a alternate dictionary URL or caching a processed dictionary.
+
+--------------------
+support/scripts/cpe-report -c $(TOPDIR)/cpe-manifest.csv
+--------------------
+
+This script retrieves the NIST dictionary and classifies each CPE as either
+matched, requires version update or missing. Based on this analysis, the script
+automatically uses the NIST dictionary entries to produce a draft of XML which
+can be submitted to NIST to update a version of an entry in the dictionary. It
+is important to review the generated xml files in the cpe folder as they may
+need refined reference tags and adjustments to how the version is represented
+in the title.
+
+In the case of missing items, a +cpe-report-missing.txt+ report is output by
+the script and can be used as a starting point to manually create a xml file
+to submit. Note, some manual analysis using the NIST search engine (https://nvd.nist.gov/products/cpe/search)
+is suggested for these missing item as the Buildroot +CPE_ID_+ variables maybe
+slightly incorrect and cause the cpe-report script to catagorize the package
+as missing. If that is the case, a change can be made by adjusting the default
+CPE variables in the specific package's +.mk+. See xref:_infrastructure_for_packages_with_specific_build_systems[]
+discussion on the use of +LIBFOO_CPE_*+.
+If the package is truely missing, the package's Kconfig help material and .mk
+should provide most of the information to construct a new NIST submission.
+
+To submit a new entry or updated entry to NIST, create an request email to the
+cpe_dictionary at nist.gov recipient and attach a individual xml file per package
+being added/updated.  It is OK to have multiple version updates in a single
+file as long as they are all for the same package. For reference the guidance
+can be found on the NIST CPE site (https://nvd.nist.gov/products/cpe).
+
+*Limitations*
+
+Buildroot does not produce or accurately present some of the CPE material. Items
+such as any versions which are non-number/hash are not compliant with the CPE
+string specification and would require a manual analysis to update the CPE list
+before any external CVE analysis should occur. This is a similar situation for
+packages like the Linux kernel or U-Boot which may not have a version which
+directly maps to a CPE.
+
+There is an assumed default CPE string for each package which is auto-generated
+using existing package information. The output of +make cpe-info+ is based on
+this default information and the packages which have been individually tailored
+to match existing CPE strings. The Buildroot developers try to do their best to
+keep those declarative statements as accurate as possible, to the best of their
+knowledge. However, it is very well possible that those declarative statements
+are not all fully accurate nor exhaustive. Similar to legal-info, it is your
+responsibility to verify this information.
+
+=== Common Vulnerability and Exposures (CVE) Anaylsis
+The Common Vulnerabilities and Exposures (CVE) system provides a
+reference-method for publicly known information-security vulnerabilities and
+exposures. (https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures)
+
+Like previously stated, there are many tools and methods to perform this
+analysis. The most basic example is to do a manual CVE analysis by navigating
+to the NVD search engine (https://nvd.nist.gov/vuln/search) and using the CPE
+string identified in the first field of the +$(TOPDIR)/cpe-manifest.csv+.
+Here's an example for tcpdump.
+
+CPE ID: "cpe:2.3:a:tcpdump:tcpdump:4.9.1:*:*:*:*:*:*:*"
+
+Result: https://nvd.nist.gov/vuln/search/results?form_type=Basic&results_type=overview&query=cpe%3A2.3%3Aa%3Atcpdump%3Atcpdump%3A4.9.1%3A*%3A*%3A*%3A*%3A*%3A*%3A*&search_type=all
+
+Beyond the manual search approach, the next step would be a more centralized
+shared database with multi-feed support (NVD+).  The cve-search project aims
+to offer that type of solution (https://github.com/cve-search/cve-search).
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index b5cc044805..9297cbd599 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -48,6 +48,8 @@ include::legal-notice.txt[]
 
 include::beyond-buildroot.txt[]
 
+include::cpe-reporting.txt[]
+
 = Developer guide
 
 include::how-buildroot-works.txt[]
-- 
2.28.0
