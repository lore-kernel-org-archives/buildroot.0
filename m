From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2019 14:30:03 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/python-django:
 security bump to version 2.1.11
Message-ID: <20190821122637.7F20283F73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18c2e3fa599804c9fd90313c32c654e1a0a3cd39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

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
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 8cb60adf0c..22a0d9c4d8 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	2162aed4111da837433f41a9eed5c8bd  Django-2.1.10.tar.gz
-sha256	65e2a548a52fca560cdd4e35f4fa1a79140f405af48950e59702a37e4227e958  Django-2.1.10.tar.gz
+md5	42f0d3ccdcd89c566a30765ee0e25d42  Django-2.1.11.tar.gz
+sha256	1a41831eace203fd1939edf899e07d7abd12ce9bafc3d9a5a63a24a8d1d12bd5  Django-2.1.11.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 09c178288c..40a2e96e03 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.1.10
+PYTHON_DJANGO_VERSION = 2.1.11
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/be/1b/009ec818adf51c7641f3bd9dae778e8b28291b3ceedb352317b0eeafd7ff
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e0/e9/7e6008abee3eb2a40704c95a5cfc8a9627012df1580289d3df0f34c99766
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
