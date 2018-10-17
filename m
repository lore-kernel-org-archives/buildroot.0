From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 17 Oct 2018 16:42:02 -0500
Subject: [Buildroot] [PATCH v7 10/10] docs/manual: security management
 section
In-Reply-To: <1539812522-7171-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1539812522-7171-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1539812522-7171-10-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Start a section on security vulnerability management
 - Capture notes on cpe reporting support and limitations

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
v7
 - New
---
 docs/manual/cpe-reporting.txt | 79 +++++++++++++++++++++++++++++++++++++++++++
 docs/manual/manual.txt        |  2 ++
 2 files changed, 81 insertions(+)
 create mode 100644 docs/manual/cpe-reporting.txt

diff --git a/docs/manual/cpe-reporting.txt b/docs/manual/cpe-reporting.txt
new file mode 100644
index 0000000..dde7fb8
--- /dev/null
+++ b/docs/manual/cpe-reporting.txt
@@ -0,0 +1,79 @@
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
+assumed to occur outside of the Buildroot environment.
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
+directory and execute the script below. The +-d+ flag requires the paths to
+your Buildroot and other BR2_EXTERNAL folder(s) to gather the required
+information to generate NIST update XML. If more then one path is provided,
+they should be seperated by colons.
+
+--------------------
+support/scripts/cpe-report -c cpe-manifest.csv -d "<buildroot folder>:<BR2_EXTERNAL paths>"
+--------------------
+
+This script retrieves the current NIST dictionary and classifies each CPE
+as either matched, requires version update or missing. Based on this
+analysis, the script automatically uses Buildroot information to produce a
+draft of XML which can be submitted to NIST to update the dictionary.
+It is important to review the feedback from this script for cases of
+"missing", as there maybe valid CPE strings for the package, however Buildroot
+needs to be updated to match.  This change is made by adjusting the default
+CPE variables in the specific package's +.mk+. See xref:_infrastructure_for_packages_with_specific_build_systems[]
+discussion on the use of +LIBFOO_CPE_*+. The NIST search engine is a good
+tool for identifing existing strings (https://nvd.nist.gov/products/cpe/search).
+
+*Limitations*
+
+Buildroot does not produce or accurately present some of the material. Items
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
+responsibility to verify this information. A current health of CPE strings for
+the latest upstream commit vs the NIST dictionary, can be checked in the
+pkg-stats report (http://autobuild.buildroot.net/stats/).
+
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 9d50760..f15cf50 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -46,6 +46,8 @@ include::legal-notice.txt[]
 
 include::beyond-buildroot.txt[]
 
+include::cpe-reporting.txt[]
+
 = Developer guide
 
 include::how-buildroot-works.txt[]
-- 
1.9.1
