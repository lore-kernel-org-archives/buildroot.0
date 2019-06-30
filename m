From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Jun 2019 15:35:37 +0200
Subject: [Buildroot] [PATCH 1/2] python-inflection: new package
In-Reply-To: <20190624154451.22199-1-jfaith@impinj.com>
References: <20190624154451.22199-1-jfaith@impinj.com>
Message-ID: <20557d72-6c94-2437-47db-44d53d0ab144@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi John,

 Thanks for your contribution.

On 24/06/2019 17:45, John Faith wrote:
> A string transformation library that singularizes and pluralizes English
> words, and transforms strings from CamelCase to underscored string.
> Inflection is a port of Ruby on Rails' inflector to Python.
> 
> https://github.com/jpvanhal/inflection
> 
> Signed-off-by: John Faith <jfaith@impinj.com>
[snip]
> diff --git a/package/python-inflection/Config.in b/package/python-inflection/Config.in
> new file mode 100644
> index 0000000000..354a2345f1
> --- /dev/null
> +++ b/package/python-inflection/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYTHON_INFLECTION
> +	bool "python-inflection"

 This module uses the unicodedata module, so you have to make sure it's available:

	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3

> +	help
> +	  A string transformation library that singularizes and
> +	  pluralizes English words, and transforms strings from
> +	  CamelCase to underscored string.
> +
> +	  Inflection is a port of Ruby on Rails' inflector to Python
> +
> +	  https://github.com/jpvanhal/inflection
> diff --git a/package/python-inflection/python-inflection.hash b/package/python-inflection/python-inflection.hash
> new file mode 100644
> index 0000000000..4bccf81622
> --- /dev/null
> +++ b/package/python-inflection/python-inflection.hash
> @@ -0,0 +1,3 @@
> +# Hashes from https://pypi.python.org/pypi/inflection/json
> +md5     7941165e9f148e0520023941c0886b40  inflection-0.3.1.tar.gz
> +sha256  18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4edeb16ca  inflection-0.3.1.tar.gz

 There should also be a hash for the license file:

# License file, locally calculated
sha256  4a3f52ac1012a90db398e4c55f1d1bea501dddafef8a4b3adb7533b1d820e148  LICENSE


 I've fixed those two things and applied to master, thanks.

 Regards,
 Arnout


> diff --git a/package/python-inflection/python-inflection.mk b/package/python-inflection/python-inflection.mk
> new file mode 100644
> index 0000000000..7309880c6a
> --- /dev/null
> +++ b/package/python-inflection/python-inflection.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-inflection
> +#
> +################################################################################
> +
> +PYTHON_INFLECTION_VERSION = 0.3.1
> +PYTHON_INFLECTION_SOURCE = inflection-$(PYTHON_INFLECTION_VERSION).tar.gz
> +PYTHON_INFLECTION_SITE = https://pypi.python.org/packages/d5/35/a6eb45b4e2356fe688b21570864d4aa0d0a880ce387defe9c589112077f8
> +PYTHON_INFLECTION_SETUP_TYPE = setuptools
> +PYTHON_INFLECTION_LICENSE = MIT
> +PYTHON_INFLECTION_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> +$(eval $(host-python-package))
> 
