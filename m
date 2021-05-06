From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  6 May 2021 23:25:40 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-django: security bump to
 version 3.2.2
In-Reply-To: <20210506212540.17671-1-peter@korsgaard.com>
References: <20210506212540.17671-1-peter@korsgaard.com>
Message-ID: <20210506212540.17671-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Django 3.0.x is EOL, so move to 3.2.x which is the new LTS release.  For
details of the changes and update instructions, see the announcement:

https://www.djangoproject.com/weblog/2021/apr/06/django-32-released/

Fixes the following security issues:

- CVE-2021-30459 - SQL Injection via Select, Explain and Analyze forms of
  the SQLPanel for Django Debug Toolbar >= 0.10.0

  With Django Debug Toolbar 0.10.0 and above, attackers are able to execute
  SQL by changing the raw_sql input of the SQL explain, analyze or select
  forms and submitting the form.  This is a high severity issue for anyone
  using the toolbar in a production environment.  Generally the Django Debug
  Toolbar team only maintains the latest version of django-debug-toolbar,
  but an exception was made because of the high severity of this issue.

  The GitHub Security Advisory can be found here:
  https://github.com/jazzband/django-debug-toolbar/security/advisories/GHSA-pghf-347x-c2gj

- CVE-2021-31542: Potential directory-traversal via uploaded files

  MultiPartParser, UploadedFile, and FieldFile allowed directory-traversal
  via uploaded files with suitably crafted file names.

  In order to mitigate this risk, stricter basename and path sanitation is
  now applied.  Specifically, empty file names and paths with dot segments
  will be rejected.

  This issue has low severity, according to the Django security policy.

- CVE-2021-32052: Header injection possibility since URLValidator accepted
  newlines in input on Python 3.9.5+

  On Python 3.9.5+, URLValidator didn't prohibit newlines and tabs.  If you
  used values with newlines in HTTP response, you could suffer from header
  injection attacks.  Django itself wasn't vulnerable because HttpResponse
  prohibits newlines in HTTP headers.

  Moreover, the URLField form field which uses URLValidator silently removes
  newlines and tabs on Python 3.9.5+, so the possibility of newlines
  entering your data only existed if you are using this validator outside of
  the form fields.

  This issue was introduced by the bpo-43882 fix.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 1cc4b5ecc9..1c7d7b8841 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  f444fdd6ff8edec132991cbc343368d4  Django-3.0.14.tar.gz
-sha256  d58d8394036db75a81896037d757357e79406e8f68816c3e8a28721c1d9d4c11  Django-3.0.14.tar.gz
+md5  43784c090a8805605e3d0b768cd21cb2  Django-3.2.2.tar.gz
+sha256  0a1d195ad65c52bf275b8277b3d49680bd1137a5f55039a806f25f6b9752ce3d  Django-3.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index cb8f5492d6..0e36a530a9 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.0.14
+PYTHON_DJANGO_VERSION = 3.2.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/76/0e/5d847a77b7b42cacd01405b45e4e370124c1d8a15970865df5ab0f09f83a
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/da/24/e2e6e534464f8e0bd010401f06d2cfc773141776d2952d6418d01c97f12c
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.20.1
