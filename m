From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 20:56:17 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-django:
 security bump to version 2.2.4
Message-ID: <20191225194924.065CE8E3DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=987e5ae5951af672e5cbc269d7b4a890d5212f00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

CVE-2019-14232: Denial-of-service possibility in django.utils.text.Truncator

If django.utils.text.Truncator's chars() and words() methods were passed the
html=True argument, they were extremely slow to evaluate certain inputs due
to a catastrophic backtracking vulnerability in a regular expression.  The
chars() and words() methods are used to implement the truncatechars_html and
truncatewords_html template filters, which were thus vulnerable.

The regular expressions used by Truncator have been simplified in order to
avoid potential backtracking issues.  As a consequence, trailing punctuation
may now at times be included in the truncated output.

CVE-2019-14233: Denial-of-service possibility in strip_tags()

Due to the behavior of the underlying HTMLParser,
django.utils.html.strip_tags() would be extremely slow to evaluate certain
inputs containing large sequences of nested incomplete HTML entities.  The
strip_tags() method is used to implement the corresponding striptags
template filter, which was thus also vulnerable.

strip_tags() now avoids recursive calls to HTMLParser when progress removing
tags, but necessarily incomplete HTML entities, stops being made.

Remember that absolutely NO guarantee is provided about the results of
strip_tags() being HTML safe.  So NEVER mark safe the result of a
strip_tags() call without escaping it first, for example with
django.utils.html.escape().

CVE-2019-14234: SQL injection possibility in key and index lookups for
JSONField/HStoreField

Key and index lookups for django.contrib.postgres.fields.JSONField and key
lookups for django.contrib.postgres.fields.HStoreField were subject to SQL
injection, using a suitably crafted dictionary, with dictionary expansion,
as the **kwargs passed to QuerySet.filter().

CVE-2019-14235: Potential memory exhaustion in
django.utils.encoding.uri_to_iri()

If passed certain inputs, django.utils.encoding.uri_to_iri could lead to
significant memory usage due to excessive recursion when re-percent-encoding
invalid UTF-8 octet sequences.

uri_to_iri() now avoids recursion when re-percent-encoding invalid UTF-8
octet sequences.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a62cd7dd4cbb718a162d76dbe8333cb144867343)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 0d63853aaa..b89ee907d3 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	f152164e77d38460ee06c42c210d2f57  Django-2.2.3.tar.gz
-sha256	4d23f61b26892bac785f07401bc38cbf8fa4cec993f400e9cd9ddf28fd51c0ea  Django-2.2.3.tar.gz
+md5	b32e396c354880742d85a7628a0bdd5a  Django-2.2.4.tar.gz
+sha256	16a5d54411599780ac9dfe3b9b38f90f785c51259a584e0b24b6f14a7f69aae8  Django-2.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 2697f05466..7dbf7a38fd 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.2.3
+PYTHON_DJANGO_VERSION = 2.2.4
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d3/20/b447eb3d820e0d05fe83cbfb016842bd8da35f4b0f83498dca43d02aebc3
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/19/11/3449a2071df9427e7a5c4dddee2462e88840dd968a9b0c161097154fcb0c
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
