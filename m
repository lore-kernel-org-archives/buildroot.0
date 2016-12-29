From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 29 Dec 2016 14:32:16 +0100
Subject: [Buildroot] [RFC] Add download helper for PyPi
In-Reply-To: <1482477521-12235-1-git-send-email-yegorslists@googlemail.com>
References: <1482477521-12235-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <CAGm1_kuM3OThNiFEnYbuJj1VDLicpqniAWamG9VQsgHqYht9bQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 23, 2016 at 8:18 AM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> PyPI has changed package download location. The old scheme below is
> working only for the old package versions:
>
> https://pypi.python.org/packages/source/{first pkg name char}/{pkg name}
>
> All new packages have following scheme:
>
> https://pypi.python.org/packages/{hash[:2]}/{hash[2:4]}/{hash[4:]}/{filename}
>
> This means every time package's version is bumped, one have to change download
> URL as well. So PyPI helper takes care of handling the URL and in the future
> version bumping will only touch package's version variable.
>
> pypi-dl-url.py reads package's JSON file and extracts download URL according
> to the given version.
>
> Usage example:
>
> PYTHON_PYTZ_SITE = $(call pypi,pytz,$(PYTHON_PYTZ_VERSION),tar.bz2)
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/pkg-download.mk         |  3 ++
>  support/download/pypi-dl-url.py | 69 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100755 support/download/pypi-dl-url.py
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index cfc550e..676f8f6 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -55,6 +55,9 @@ domainseparator = $(if $(1),$(1),/)
>  # github(user,package,version): returns site of GitHub repository
>  github = https://github.com/$(1)/$(2)/archive/$(3)
>
> +# pypi(package, version, packer extention): returns site of PyPi download location
> +pypi = $(shell support/download/pypi-dl-url.py $(1) $(2) $(3))
> +
>  # Expressly do not check hashes for those files
>  # Exported variables default to immediately expanded in some versions of
>  # make, but we need it to be recursively-epxanded, so explicitly assign it.
> diff --git a/support/download/pypi-dl-url.py b/support/download/pypi-dl-url.py
> new file mode 100755
> index 0000000..e9d36bd
> --- /dev/null
> +++ b/support/download/pypi-dl-url.py
> @@ -0,0 +1,69 @@
> +#!/usr/bin/python
> +
> +# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
> +
> +import sys
> +import json
> +try:
> +    from urllib.request import urlopen
> +    from urllib.error import HTTPError, URLError
> +except ImportError:
> +    from urllib2 import urlopen, HTTPError, URLError
> +
> +
> +def pypi_get_metadata(pkg_name, version):
> +    '''Get package release metadata from PyPI'''
> +
> +    metadata_url = 'https://pypi.python.org/pypi/{pkg}/json'.format(pkg=pkg_name)
> +    try:
> +        pkg_json = urlopen(metadata_url).read().decode()
> +    except HTTPError as error:
> +        print('ERROR:', error.getcode(), error.msg)
> +        print('ERROR: Could not find package {pkg}.\n'
> +              'Check syntax inside the python package index:\n'
> +              'https://pypi.python.org/pypi/ '
> +              .format(pkg=pkg_name))
> +        raise
> +    except URLError:
> +        print('ERROR: Could not find package {pkg}.\n'
> +              'Check syntax inside the python package index:\n'
> +              'https://pypi.python.org/pypi/ '
> +              .format(pkg=pkg_name))
> +        raise
> +
> +    ver_metadata = None
> +    try:
> +        ver_metadata = json.loads(pkg_json)['releases'][version]
> +    except KeyError:
> +        print('ERROR: Could not find release {ver}.\n'
> +              .format(ver=version))
> +        raise
> +
> +    return ver_metadata
> +
> +
> +if __name__ == '__main__':
> +    if len(sys.argv) != 4:
> +        print('Wrong command line arguments number.\n')
> +        print('Please supply package name, version and file extention.\n')
> +        sys.exit(1)
> +
> +    metadata = None
> +    try:
> +        metadata = pypi_get_metadata(sys.argv[1], sys.argv[2])
> +    except:
> +        sys.exit(1)
> +
> +    br_pypi_url = ''
> +    full_pkg_name = '{name}-{ver}.{ext}'.format(name=sys.argv[1],
> +                                                ver=sys.argv[2],
> +                                                ext=sys.argv[3])
> +    for download_url in metadata:
> +        if 'bdist' in download_url['packagetype']:
> +            continue
> +
> +        if download_url['url'].endswith(full_pkg_name):
> +            br_pypi_url = download_url['url'][:-(len(full_pkg_name) + 1)]
> +            break
> +
> +    print(br_pypi_url)

Alternatively pypi helper can search for filename according to following scheme:

1. *.tar.bz2
2. *.tar.gz
3. *.zip

When adding a package the best archival method is to be used. Then we
can drop the third parameter and work only with package name and
version.

Or just pass PYTHON_PKG_SOURCE to the helper and extract package name
and version there?

What do you think?

Yegor
