From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  7 Jan 2021 14:39:47 +0100
Subject: [Buildroot] [PATCH 10/10] docs/manual: add details about
 vulnerability management
In-Reply-To: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
References: <20210107133948.2997849-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210107133948.2997849-11-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This addition to the documentation gives some details about CPE/CVE,
pkg-stats and missing-cpe.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/common-usage.txt | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 9ba87a8339..730c759cfb 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -417,6 +417,48 @@ effects:
   be empty and it's only at the very end of the build that they will
   be populated.
 
+[[vulnerability-management]]
+=== Vulnerability management
+
+Buildroot integrates a number of features that help tracking whether
+known security vulnerabilities are affecting some of the
+packages. Buildroot bases this logic on _CVEs_ (Common Vulnerabilities
+and Exposure) and the https://nvd.nist.gov/vuln[NVD database] provided
+by NIST.
+
+First, each package in Buildroot can be associated to a _CPE_
+identifier, by means of the various +FOO_CPE_ID_<something>+ variables
+that can be provided by each package. See
+xref:generic-package-reference[] for more details about those
+variables. When the _CPE_ identifier of a package is not defined, a
+default value is used, which may or may not be correct. This _CPE_
+identifier is used to find in the NVD database of vulnerabilities
+which _CVEs_ are affecting any given package.
+
+Based on this and the NIST databases, the +make pkg-stats+ target
+produces JSON and HTML formatted reports that indicate for each
+package of the current Buildroot configuration:
+
+* If there are known _CVEs_ for each package. Note that CVEs can
+  manually be ignored on a per-package basis using the
+  +FOO_IGNORED_CVES+ variable, for example if Buildroot has a patch
+  that fixes the vulnerability, or if the vulnerability is not
+  applicable to Buildroot for some reason.
+
+* If the _CPE_ identifier is valid and known in the
+  https://nvd.nist.gov/products/cpe[NIST CPE dictionary]. A _CPE_ is
+  valid is one of the +FOO_CPE_ID_<something>+ variable is defined, or
+  if +FOO_CPE_ID_VALID = YES+ validating that the default value of the
+  _CPE_ identifier is correct. In addition, _CPE_ are checked for
+  existence in the NIST CPE dictionary. If the _CPE_ identifier is not
+  known to the NIST CPE dictionary, then it is possible to contribute
+  to the NIST CPE dictionary: one need to submit a XML document that
+  describes the additional CPE identifier. Buildroot can help
+  generating such XML documents for missing CPE identifiers using the
+  +make missing-cpe+ target. The XML documents are generated in
+  +$(O)/cpe-updates+, and may need to be edited before submission to
+  NIST.
+
 include::eclipse-integration.txt[]
 
 include::advanced.txt[]
-- 
2.29.2
