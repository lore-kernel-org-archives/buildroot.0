From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Jul 2015 14:56:30 +0200
Subject: [Buildroot] [PATCH 1/2] scanpypi: new utility
In-Reply-To: <1436448717-6088-2-git-send-email-denis.thulin@openwide.fr>
References: <1436448717-6088-1-git-send-email-denis.thulin@openwide.fr>
 <1436448717-6088-2-git-send-email-denis.thulin@openwide.fr>
Message-ID: <55A1127E.2040905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/15 15:31, Denis THULIN wrote:
> An utility for creating python package from the python package index

 It would make sense to list here the packages with which you have tested it.
I've tried it for about 5 packages and it worked for none of them... Usually the
problem is that setup.py either has an if __name__ == '__main__', or it tries to
load other modules from the package.

 I think you should at least test it with the packages that already are in
buildroot. django, pyzmq, six, twisted are a few nice examples. This also allows
you to see how the automatically generated files differ from what we have already.

> 
> Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
> ---
> v0: initial commit
>  python-pacakage-generator.py is an utility for automatically generating a
>  python package. It fetches packages info from http://pypi.python.org and
>  generates corresponding packages files.

 Actually, this sentence should go into the commit log as well.

> 
> v1:
>  - renamed python-package-generator to scanpypi
>  - split the huge script into a lot of functions
>  - fixed mistakes and small bugs
> 
> v2:
>  - Rewrited most of the functions into a class
>  - Changed the method for importing setup.py

 And what was the reason for that change? It turns out not to work so well...

>  - Created a main function to avoid use of global variable
>  - Now adds new dependencies to the list of packages to create
>  - Droppped the .py extension
> 
> Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
> ---
>  docs/manual/adding-packages-python.txt |  32 ++
>  support/scripts/scanpypi               | 620 +++++++++++++++++++++++++++++++++
>  2 files changed, 652 insertions(+)
>  create mode 100755 support/scripts/scanpypi
> 
> diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
> index f81d625..dcde08d 100644
> --- a/docs/manual/adding-packages-python.txt
> +++ b/docs/manual/adding-packages-python.txt
> @@ -7,6 +7,38 @@ This infrastructure applies to Python packages that use the standard
>  Python setuptools mechanism as their build system, generally
>  recognizable by the usage of a +setup.py+ script.
>  
> +[[scanpypi]]
> +
> +==== Generating a +python-package+ from a pypi repository
> +
> +You may want to use the +scanpypi.py+ located in

 Drop the .py :-) and rewrap.

> ++support/script+ to generate a package from an existing pypi(pip) package.

 PyPI is capitalized differently. Rephrase:

... from an existing PyPI package (i.e. a package that can be installed with pip).

> +
> +you can find the list of existing pypi package here: https://pypi.python.org .

You can find the list of existing PyPI packages https://pypi.python.org[here].

> +
> +Please keep in mind that you most likely need to manually check the package for
> +any mistakes as there are things that cannot be guessed by the generator (e.g. 
> +dependencies on any of the python core modules such as BR2_PACKAGE_PYTHON_ZLIB)

 Also useful te mention: the license and license files (they're a bit of ad hoc
guesswork).

> +. You need no manually add the package to the +package/Config.in+ file.

 That . should still be on the preceding line, without space in front of it.

You also need to manually add the package the the +package/Config.in+ file.

> +
> +When at the root of your buildroot directory just do :
> +
> +-----------------------
> +./support/script/scanpypi.py foo bar -o package

 s/.py//

> +-----------------------
> +
> +This will generate packages +python-foo+ and +python-bar+ in the package
> +folder if they exist on https://pypi.python.org.
> +
> +Find the +external python modules+ menu and insert your package inside.
> +Keep in mind that the items inside a menu should be in alphabetical order.


 I would also make an explicit reference here to how to use it with
BR2_EXTERNAL. I.e., using the -o flag.

> +
> +Option +-h+ wil list the options available
> +
> +-----------------------
> +./support/script/scanpypi.py -h

 s/.py//

> +-----------------------
> +
>  [[python-package-tutorial]]
>  
>  ==== +python-package+ tutorial
> diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
> new file mode 100755
> index 0000000..e98e8f8
> --- /dev/null
> +++ b/support/scripts/scanpypi
> @@ -0,0 +1,620 @@
> +#!/usr/bin/python2

 It would be nice to make it python3 compliant as well, but that can be done later.

> +"""
> +Utility for building buildroot packages for existing pypi packages
> +
> +Any package built by scanpypi should be manually checked for
> +errors.
> +"""
> +from __future__ import print_function
> +import argparse
> +import json
> +import urllib2
> +import sys
> +import os
> +import shutil
> +import StringIO
> +import tarfile
> +import errno
> +import hashlib
> +import re
> +import textwrap
> +import tempfile
> +import imp
> +from functools import wraps
> +
> +
> +# private global
> +_calls = {}

 I guess this could be converted into a class member of BuildrootPackage.

 Also, the name could be a bit better, e.g. setup_args.

> +
> +
> +def setup_info(pkg_name):
> +    """Get a package info from _calls
> +
> +    Keyword arguments:
> +    pkg_name -- the name of the package
> +    """
> +    return _calls[pkg_name]

 I still don't think it's worthwhile to make a function from this.

> +
> +
> +def setup_decorator(func, method):
> +    """
> +    Decorator for distutils.core.setup and setuptools.setup.
> +    Puts the args of setup as a dict inside global private dict _calls.

 I finally understand what this does :-) Even better:

Puts the arguments with which setup is called as a dict ...

> +    Add key 'method' which should be either 'setuptools' or 'distutils'.
> +
> +    Keyword arguments:
> +    func -- either setuptools.setup or distutils.core.setup
> +    method -- either 'setuptools' or 'distutils'
> +    """
> +
> +    @wraps(func)
> +    def closure(*args, **kwargs):
> +        _calls[kwargs['name']] = kwargs

 Perhaps document where this 'name' comes from. It's quite obvious if you're
familiar with distutils, but this wrapping is not easy to understand so it's
worthwhile to mention it.

> +        _calls[kwargs['name']]['method'] = method
> +    return closure
> +
> +
> +def find_file_upper_case(filenames, path='./'):
> +    """
> +    List generator:
> +    Recursively find files that matches one of the specified filenames.
> +    Returns absolute path

 No it doesn't, it returns a relative path starting with path.

> +
> +    Keyword arguments:
> +    filenames -- List of filenames to be found
> +    path -- Path to the directory to search
> +    """
> +    for root, dirs, files in os.walk(path):
> +        for file in files:
> +            if file.upper() in filenames:
> +                yield (os.path.join(root, file))
> +
> +
> +def pkg_buildroot_name(pkg_name):
> +    """
> +    Returns name to avoid troublesome characters.

 No it doesn't.

Returns the buildroot package name for the PyPI package pkg_name.


 In fact, the function should also prepend the python- prefix, because the
buildroot name starts with python-.

> +    Remove all non alphanumeric characters except -
> +    Also lowers the name
> +
> +    Keyword arguments:
> +    pkg_name -- String to rename
> +    """
> +    name = re.sub('[^\w-]', '', pkg_name.lower())
> +    name = re.sub('^python-', '', name)
> +    return name
> +
> +
> +# monkey patch
> +import setuptools
> +setuptools.setup = setup_decorator(setuptools.setup, 'setuptools')
> +import distutils
> +distutils.core.setup = setup_decorator(setuptools.setup, 'distutils')

 This should go just below the definition of the decorator.

> +
> +
> +class SetupNotFound(Exception):
> +    pass
> +
> +
> +class BuildrootPackage():
> +    """
> +    This class's methods are not meant to be used individually please use those
> +    in the correct order:
> +    __init__
> +
> +    download_package
> +
> +    extract_package
> +
> +    load_module
> +
> +    get_requirements
> +
> +    create_package_mk
> +
> +    create_hash_file
> +
> +    create_config_in
> +    """
> +    def __init__(self, real_name, pkg_folder):
> +        self.real_name = real_name
> +        self.name = pkg_buildroot_name(self.real_name)

 Perhaps to clarify the distinction, call it buildroot_name instead of just name.

> +        self.pkg_dir = pkg_folder + '/python-' + self.name

 It's good practice to set all the members you're going to create to None in
__init__, as a kind of declaration of what members are available.

> +
> +    def find_setup(self, folder):
> +        """
> +        Search for setup.py file in an archive and returns the path to this
> +        file
> +        if it is found

 Wrapping.

> +
> +        Keyword arguments:
> +        folder -- path to search in
> +        """
> +        filename = 'setup.py'
> +        # Next return the first element of an iterable,
> +        # here, it returns the path to the first file named "setup.py"
> +        # found in the python package or raises StopIteration if not found
> +        self.setup_location = next(os.path.join(root, filename)
> +                                   for root, dirs, files in os.walk(folder)
> +                                   if filename in files)

 Is it just me or is setup_location not used anywhere? I anyway don't think this
is a good idea: if setup.py is not in the top dir, most likely other things in
this script will break.

 So the only thing this function does, really, is checking if there is any
setup.py file in the folder. Which is later done again by calling
imp.find_module, which will anyway raise an ImportError if the module isn't found.

 IOW, remove this function.

> +
> +    def fetch_package_info(self):
> +        """
> +        Fetch a package's metadata for the python package index

 for -> from

> +        """
> +        url = 'https://pypi.python.org/pypi/{pkg}/json'.format(

 Already asign to metadata_url here.

> +            pkg=self.real_name)
> +        print('URL:', url)

 This print is not needed.

> +        try:
> +            pkg_json = urllib2.urlopen(url).read().decode()
> +        except urllib2.HTTPError as error:
> +            print('ERROR:', error.getcode(), error.msg, file=sys.stderr)
> +            print('ERROR: Could not find package {pkg}.\n'
> +                  'Check syntax inside the python package index:\n'
> +                  'https://pypi.python.org/pypi/ '
> +                  .format(pkg=self.real_name))
> +            raise
> +        except urllib2.URLError:
> +            print('ERROR: Could not find package {pkg}.\n'
> +                  'Check syntax inside the python package index:\n'
> +                  'https://pypi.python.org/pypi/ '
> +                  .format(pkg=self.real_name))
> +            raise
> +        else:

 Else is not needed here since the exceptions are raise'd.

> +            self.metadata_url = url
> +            self.metadata = json.loads(pkg_json)
> +            self.metadata_name = self.metadata['info']['name']
> +
> +    def download_package(self):
> +        """
> +        Download a package using metadata from pypi
> +        """
> +        try:
> +            self.metadata['urls'][0]['filename']
> +        except IndexError:
> +            print(
> +                'Non conventional package, ',

 Non-conventional

> +                'please check manually after creation')

 manually -> carefully

> +            download_url = self.metadata['info']['download_url']

 I think it would be simpler to, instead of repeating the download infra, just
emulate the needed metadata and use the same infra as below. So:

download_url = [{
 'packagetype': 'tgz',
 'url', self.metadata['info']['download_url'],
 'md5_digest': None,
}]

> +            try:
> +                self.download = urllib2.urlopen(download_url)

 self.download is not used outside this function, so make it a local variable.
Or actually, drop it completely and read directly into self.as_string().

> +            except urllib2.HTTPError as http_error:
> +                self.download = http_error
> +            else:
> +                self.as_string = self.download.read()
> +                self.used_url = {'url': download_url,
> +                                 'md5_digest': hashlib.md5(self.as_string)
> +                                                      .hexdigest()}

 I don't think it makes a lot os sense to compute the md5 here. Better set it to
None and not mention it in the .hash file.

> +                # In this case, we can't get the name of the downloaded file
> +                # from the pypi api, so we need to find it, this should work
> +                urlpath = urllib2.urlparse.urlparse(self.download.url).path
> +                # urlparse().path give something like
> +                # /path/to/file-version.tar.gz
> +                # We use basename to remove /path/to
> +                self.targz = os.path.basename(urlpath)
> +                self.used_url['filename'] = self.targz

 This magic is still needed to set download_url['filename'], but it doesn't need
to be downloaded yet to do that.

> +        else:
> +            for download_url in self.metadata['urls']:
> +                if 'wheel' in download_url['packagetype']:

 This could be zip or egg as well. Isn't there a positive match possible?

> +                    continue
> +                try:

 I think it's useful to print the download URL here, just before downloading. So
move the print ('Downloading package ...') here instead, and add the download
URL to it.

> +                    self.download = urllib2.urlopen(download_url['url'])
> +                except urllib2.HTTPError as http_error:
> +                    self.download = http_error

 This is only used to raise it later, so you can just drop the entire try block
and let the exception leak up.

> +                else:
> +                    self.used_url = download_url
> +                    self.as_string = self.download.read()
> +                    self.md5_sum = hashlib.md5(self.as_string).hexdigest()
> +                    self.targz = self.used_url['filename']
> +                    if self.md5_sum == download_url['md5_digest']:

 This should probably raise an exception if it doesn't match.

> +                        break

 The for loop needs an else: in case none of them can be downloaded.

> +        if self.download.__class__ == urllib2.HTTPError:
> +            raise self.download
> +        else:
> +            self.digest_method = 'sha256'

 This is always sha256 so no point making a variable for it.

> +            self.digest = hashlib.sha256(self.as_string).hexdigest()

 Minor nit: it's used only once, so I'd calculate it at the time that you use it.

> +
> +    def extract_package(self, tmp_path):
> +        """
> +        Create folders used for extracting a package as file object and extract
> +        it

 A bit too detailed...

Extract the package contents into a directory.

> +
> +        Keyword arguments:
> +        tmp_path -- folder where you want the package to be extracted

 s/folder/directory/g

> +        """
> +        as_file = StringIO.StringIO(self.as_string)
> +        with tarfile.open(fileobj=as_file) as as_tarfile:
> +            tmp_pkg = os.path.join(tmp_path, self.name)
> +            try:
> +                os.makedirs(tmp_pkg)
> +            except OSError as exception:
> +                if exception.errno != errno.EEXIST:
> +                    print("ERROR: ", exception.message, file=sys.stderr)
> +                    return None, None
> +                print('WARNING:', exception.message, file=sys.stderr)
> +                print('Removing {pkg}...'.format(pkg=tmp_pkg))
> +                shutil.rmtree(tmp_pkg)
> +                os.makedirs(tmp_pkg)
> +            as_tarfile.extractall(tmp_pkg)
> +        try:
> +            self.find_setup(tmp_pkg)
> +        except StopIteration:
> +            raise SetupNotFound('Could not find file setup.py for package {}'
> +                                .format(self.real_name))

 As I said before, this is not needed since it is covered by load_setup().

> +        tmp_extract = '{folder}/{name}-{version}'

 Is this guaranteed to be the directory used by the package?

> +        self.tmp_extract = tmp_extract.format(
> +            folder=tmp_pkg,
> +            name=self.metadata_name,
> +            version=self.metadata['info']['version'])
> +
> +    def load_setup(self):
> +        """
> +        Loads the corresponding setup and store its metadata
> +        """
> +        s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
> +        imp.load_module('setup', s_file, s_path, s_desc)
> +        self.setup_metadata = setup_info(self.metadata_name)

 Is the name given in the metadata guaranteed to be the same as what is passed
to setup()? Especially considering case...

> +
> +    def get_requirements(self, pkg_folder, packages):
> +        """
> +        Retrieve dependencies from the metadata found in the setup.py script of
> +        a pypi package.
> +
> +        Keyword Arguments:
> +        pkg_folder -- location of the already created packages
> +        packages  -- other packages to be built
> +        """
> +        if 'install_requires' not in self.setup_metadata:
> +            self.pkg_req = None
> +            self.req_not_found = []
> +            return
> +        self.pkg_req = self.setup_metadata['install_requires']
> +        self.pkg_req = [re.sub('([\w-]+)[><=]*.*', r'\1', req).lower()

 The .lower() is handled by pkg_buildroot_name so not needed here.

> +                        for req in self.pkg_req]
> +        self.pkg_req = map(pkg_buildroot_name, self.pkg_req)
> +        self.req_not_found = [
> +            pkg for pkg in self.pkg_req
> +            if 'python-{name}'.format(name=pkg)

 pkg_buildroot_name already adds python- (or at least it should :-).

> +            not in os.listdir(pkg_folder)

 Maybe better use "not os.path.isdir(pkg)".

> +        ]
> +        self.req_not_found = [pkg for pkg in self.req_not_found
> +                              if pkg not in packages]

 Small nit: I'd make this function just return req_not_found instead of adding
it as a member, and move the set.difference logic up to the caller. Oh, and
perhaps use a set :-)

> +
> +    def __create_mk_header(self):
> +        """
> +        Create the header of the <package_name>.mk file
> +        """
> +        header = ['#' * 80 + '\n']
> +        header.append('#\n')
> +        header.append('# python-{name}\n'.format(name=self.name))
> +        header.append('#\n')
> +        header.append('#' * 80 + '\n')
> +        header.append('\n')
> +        return header
> +
> +    def __create_mk_download_info(self):
> +        """
> +        Create the lines refering to the download information of the
> +        <package_name>.mk file
> +        """
> +        lines = []
> +        version_line = 'PYTHON_{name}_VERSION = {version}\n'.format(
> +            name=self.name.upper().replace('-', '_'),

 Like you have pkg_buildroot_name, you should also have something for the
conversion to uppercase. Becasue below, you forget the replace('-', '_'). Also
it's probably best to add the uppercase name as a member.

> +            version=self.metadata['info']['version'])

 I think it makes sense to add these things as direct members of
BuildrootPackage rather than going through metadata all the time: version, url,
filename.

> +        lines.append(version_line)
> +
> +        targz = self.targz.replace(
> +            self.metadata['info']['version'],
> +            '$(PYTHON_{name}_VERSION)'.format(name=self.name.upper()))
> +        targz_line = 'PYTHON_{name}_SOURCE = {filename}\n'.format(
> +            name=self.name.upper(),
> +            filename=targz)
> +        lines.append(targz_line)
> +
> +        site_line = ('PYTHON_{name}_SITE = {url}'.format(
> +            name=self.name.upper(),
> +            url=self.used_url['url'].replace(self.used_url['filename'], '')))
> +        if 'sourceforge' in site_line:
> +            site_line = ('PYTHON_{name}_SITE = {url}'.format(
> +                name=self.name.upper(),
> +                url=self.used_url['url']))

 This looks very weird... At least add an explanatory comment. And anyway, it's
better to do any fixups in a new variable (e.g. 'site') and format the line only
once.

> +        site_line = site_line.rstrip('/') + '\n'
> +        lines.append(site_line)
> +        return lines
> +
> +    def __create_mk_setup(self):
> +        """
> +        Create the line refering to the setup method of the package of the
> +        <package_name>.mk file
> +
> +        There are two things you can use to make an installer
> +        for a python package: distutils or setuptools
> +        distutils comes with python but does not support dependencies.
> +        distutils is mostly still there for backward support.
> +        setuptools is what smart people use,
> +        but it is not shipped with python :(

 This comment is a bit redundant, but OK.

> +        """
> +        lines = []
> +        setup_type_line = 'PYTHON_{name}_SETUP_TYPE = {method}\n'.format(
> +            name=self.name.upper(),
> +            method=self.setup_metadata['method'])
> +        lines.append(setup_type_line)
> +        return lines
> +
> +    def __create_mk_license(self):
> +        """
> +        Create the lines referring to the package's license informations of the
> +        <package_name>.mk file
> +
> +        The license is found using the metadata from pypi.
> +        In the metadata, the license can be found either with standard names in
> +        the classifiers part or with naming from the packager in the "License"
> +        part.
> +
> +        From the classifiers, the license is "translated" according to
> +        buildroot standards if need be (i.e. from Apache Software License to
> +        Apache-2.0).
> +
> +        From the License part, we cannot guess what formatting the packager
> +        used. Hence, it is likely to be incorrect. (i.e. Apache License 2.0
> +        instead of Apache-2.0).
> +
> +        The license's files are found by searching the package for files named
> +        license or license.txt (case insensitive).
> +        If more than one license file is found, the user is asked to select
> +        which ones he wants to use.
> +        """
> +        license_dict = {
> +            'Apache Software License': 'Apache-2.0',
> +            'BSD License': 'BSD',

 We normally put BSD-2c, BSD-3c, etc. but it may be difficult to find that out
automatically.

> +            'European Union Public Licence 1.0': 'EUPLv1.0',
> +            'European Union Public Licence 1.1': 'EUPLv1.1',
> +            "GNU General Public License": "GPL",
> +            "GNU General Public License v2": "GPLv2",
> +            "GNU General Public License v2 or later": "GPLv2+",
> +            "GNU General Public License v3": "GPLv3",
> +            "GNU General Public License v3 or later": "GPLv3+",
> +            "GNU Lesser General Public License v2": "LGPLv2",
> +            "GNU Lesser General Public License v2 or later": "LGPLv2+",

 That's actually LGPVLv2.1(+). LGPLv2 is the GNU Library General Public License.

> +            "GNU Lesser General Public License v3": "LGPLv3",
> +            "GNU Lesser General Public License v3 or later": "LGPLv3+",
> +            "GNU Library or Lesser General Public License": "LGPL",

 So this is probably LGPLv2 (there was no library/lesser version of v1).

> +            "ISC License": "ISC",
> +            "MIT License": "MIT",
> +            "Mozilla Public License 1.0": "MPL-1.0",
> +            "Mozilla Public License 1.1": "MPL-1.1",
> +            "Mozilla Public License 2.0": "MPL-2.0",
> +            "Zope Public License": "ZPL"
> +            }

 Nice list!

> +        regexp = re.compile('^License :* *.* *:+ (.*)( \(.*\))?$')
> +        classifiers_licenses = [regexp.sub(r"\1", lic)
> +                                for lic in self.metadata['info']['classifiers']
> +                                if regexp.match(lic)]
> +        licenses = map(lambda x: license_dict[x] if x in license_dict else x,
> +                       classifiers_licenses)

 I would give an explicit warning if the license is not in license_dict, since
it most likely means it's wrong.


> +        lines = []
> +        if not len(licenses):
> +            licenses = [self.metadata['info']['license']]

 This should probably go before the license_dict map.

> +        license_line = 'PYTHON_{name}_LICENSE = {license}\n'.format(
> +            name=self.name.upper(),
> +            license=', '.join(licenses))
> +        lines.append(license_line)
> +        print('WARNING: License has been set to "{license}",'
> +              ' please change it manually if necessary'.format(
> +                  license=', '.join(licenses)))

 So this warning is not necessary if it was found in the dict.

> +
> +        filenames = ['LICENSE', 'LICENSE.TXT']

 Shouldn't we also look for COPYING?

> +        license_files = list(find_file_upper_case(filenames, self.tmp_extract))
> +        license_files = [license.replace(self.tmp_extract, '')[1:]
> +                         for license in license_files]
> +        if len(license_files) > 0:
> +            if len(license_files) > 1:
> +                print('More than one file found for license:',
> +                      ', '.join(license_files))
> +            license_files = [filename
> +                             for index, filename in enumerate(license_files)]
> +            license_file_line = ('PYTHON_{name}_LICENSE_FILES ='
> +                                 ' {files}\n'.format(
> +                                     name=self.name.upper(),
> +                                     files=' '.join(license_files)))
> +            lines.append(license_file_line)
> +        elif len(license_files) == 0:

 Can len(license_files) be anything else than 0 at this point?

> +            print('WARNING: No license file found,'
> +                  ' please specify it manually afterward')

 afterwards

> +            license_file_line = '# No license file found\n'
> +
> +        return lines
> +
> +    def __create_mk_requirements(self):
> +        """
> +        Create the lines referring to the dependencies of the of the
> +        <package_name>.mk file
> +
> +        Keyword Arguments:
> +        pkg_name -- name of the package
> +        pkg_req -- dependencies of the package
> +        """
> +        lines = []
> +        python_pkg_req = ['python-{name}'.format(name=pkg)
> +                          for pkg in self.pkg_req]
> +        dependencies_line = ('PYTHON_{name}_DEPENDENCIES ='
> +                             ' {reqs}\n'.format(
> +                                 name=self.name.upper(),
> +                                 reqs=' '.join(python_pkg_req)))
> +        lines.append(dependencies_line)
> +        return lines
> +
> +    def create_package_mk(self):
> +        """
> +        Create the lines corresponding to the <package_name>.mk file
> +        """
> +        pkg_mk = 'python-{name}.mk'.format(name=self.name)
> +        path_to_mk = os.path.join(self.pkg_dir, pkg_mk)
> +        print('Creating {file}...'.format(file=path_to_mk))
> +        lines = self.__create_mk_header()
> +        lines += self.__create_mk_download_info()
> +        lines += self.__create_mk_setup()
> +        lines += self.__create_mk_license()
> +        if self.pkg_req:
> +            lines += self.__create_mk_requirements()
> +
> +        lines.append('\n')
> +        lines.append('$(eval $(python-package))')
> +        lines.append('\n')
> +        with open(path_to_mk, 'w') as mk_file:
> +            mk_file.writelines(lines)
> +
> +    def create_hash_file(self):
> +        """
> +        Create the lines corresponding to the <package_name>.hash files
> +        """
> +        pkg_hash = 'python-{name}.hash'.format(name=self.name)
> +        path_to_hash = os.path.join(self.pkg_dir, pkg_hash)
> +        print('Creating {filename}...'.format(filename=path_to_hash))
> +        lines = []
> +        commented_line = '# md5 from {url}, {method} calculated by scanpypi\n'

 Actually, the md5 comes from the pypi/json url, so mention that one. So just:

# From https://pypi.python.org/pypi/{pkg}/json

> +        commented_line = commented_line.format(url=self.used_url['url'],
> +                                               method=self.digest_method)
> +        lines.append(commented_line)
> +        hash_line = '{method}\t{digest}  {filename}\n'.format(
> +            method='md5',
> +            digest=self.used_url['md5_digest'],
> +            filename=self.used_url['filename'])

 The md5 should only be added if there really was an md5.

> +        lines.append(hash_line)
> +        hash_line = '{method}\t{digest}  {filename}\n'.format(
> +            method=self.digest_method,
> +            digest=self.digest,
> +            filename=self.used_url['filename'])
> +        lines.append(hash_line)
> +
> +        with open(path_to_hash, 'w') as hash_file:
> +            hash_file.writelines(lines)
> +
> +    def create_config_in(self):
> +        """
> +        Creates the Config.in file of a package
> +        """
> +        path_to_config = os.path.join(self.pkg_dir, 'Config.in')
> +        print('Creating {file}...'.format(file=path_to_config))
> +        lines = []
> +        config_line = 'config BR2_PACKAGE_PYTHON_{name}\n'.format(
> +            name=self.name.upper())
> +        lines.append(config_line)
> +
> +        bool_line = '\tbool "python-{name}"\n'.format(name=self.name)
> +        lines.append(bool_line)
> +        if self.pkg_req:
> +            for dep in self.pkg_req:
> +                dep_line = '\tselect BR2_PACKAGE_PYTHON_{req}\n'.format(
> +                    req=dep.upper())
> +                lines.append(dep_line)
> +
> +        lines.append('\thelp\n')
> +
> +        help_lines = textwrap.wrap(self.metadata['info']['summary'], 67)

 I'm not really sure if we should use the summary or the description here... The
summary is _really_ short.

 Also, use textwrap.fill and add the initial_indent='\t  ' argument, then all
the mangling below should no longer be necessary.

> +        # \t + two spaces is 3 char long
> +        help_lines.append('')
> +        help_lines.append(self.metadata['info']['home_page'])
> +        help_lines = map(lambda l: '\t  {}\n'.format(l)
> +                                   if not l == '' else '\n',
> +                         help_lines)
> +        # help_lines = ['\t  {line}\n'.format(line=line).replace('\t  \n','\n')
> +        #              for line in help_lines]
> +        lines += help_lines
> +
> +        with open(path_to_config, 'w') as config_file:
> +            config_file.writelines(lines)
> +
> +
> +def main():
> +    # Building the parser
> +    parser = argparse.ArgumentParser(
> +        description="Creates buildroot packages from the metadata of "
> +                    "an existing pypi(pip) packages and include it "

 PyPI

> +                    "in menuconfig")
> +    parser.add_argument("packages",
> +                        help="list of packages to be made",

 made -> created

> +                        nargs='+')
> +    parser.add_argument("-o", "--output",
> +                        help="""
> +                        Output directory for packages

 Please explicitly mention the default in the help text.

> +                        """,
> +                        default='./package')
> +
> +    args = parser.parse_args()
> +    packages = list(set(args.packages))
> +
> +    # tmp_path is where we'll extract the files later
> +    tmp_prefix = 'scanpypi-'
> +    pkg_folder = args.output
> +    tmp_path = tempfile.mkdtemp(prefix=tmp_prefix)
> +    try:
> +        for real_pkg_name in packages:
> +            package = BuildrootPackage(real_pkg_name, pkg_folder)
> +            print('buildroot package name for {}:'.format(package.real_name),
> +                  package.name)
> +            # First we download the package
> +            # Most of the info we need can only be found inside the package
> +            print('Package:', package.name)
> +            print('Fetching package', package.real_name)
> +            try:
> +                package.fetch_package_info()
> +            except (urllib2.URLError, urllib2.HTTPError):
> +                continue
> +
> +            print('Downloading package {pkg}...'.format(
> +                  pkg=package.metadata['info']['name']))
> +            try:
> +                package.download_package()
> +            except urllib2.HTTPError as error:
> +                print('Error: {code} {reason}'.format(code=error.code,
> +                                                      reason=error.reason))
> +                print('Error downloading package :', package.name)
> +                continue
> +
> +            # extract the tarball
> +            package.extract_package(tmp_path)
> +            print(package.metadata_name)
> +            print(package.tmp_extract)

 These two prints are redundant.

> +
> +            # Loading the package install info from the package
> +            package.load_setup()
> +
> +            # Package requirement are an argument of the setup function
> +            package.get_requirements(pkg_folder, packages)
> +            packages += package.req_not_found

 Python doesn't allow updating a list while iterating over it. But I believe
there is something in itertools that supports that.

> +            if package.req_not_found:
> +                print('Added packages \'{pkgs}\' as dependencies of {pkg}'
> +                      .format(pkgs=", ".join(package.req_not_found),
> +                              pkg=package.name))
> +            print('Checking if package {name} already exists...'.format(
> +                name=package.pkg_dir))
> +            try:
> +                os.makedirs(package.pkg_dir)
> +            except OSError as exception:
> +                if exception.errno != errno.EEXIST:
> +                    print("ERROR: ", exception.message, file=sys.stderr)
> +                    continue
> +                print('Error: Package {name} already exists'
> +                      .format(name=package.pkg_dir))
> +                del_pkg = raw_input(
> +                    'Do you want to delete existing package ? [y/N]')
> +                if del_pkg.lower() == 'y':
> +                    shutil.rmtree(package.pkg_dir)
> +                    os.makedirs(package.pkg_dir)
> +                else:
> +                    continue
> +            package.create_package_mk()
> +
> +            package.create_hash_file()
> +
> +            package.create_config_in()
> +            print()
> +            # printing an empty line for visual confort
> +    except:
> +        shutil.rmtree(tmp_path)
> +        raise
> +    else:
> +        shutil.rmtree(tmp_path)

 Isn't finally: supposed to do exactly what you're trying to do here?

 Regards,
 Arnout

> +
> +if __name__ == "__main__":
> +    main()
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
