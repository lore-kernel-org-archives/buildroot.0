From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Jun 2015 14:29:16 +0200
Subject: [Buildroot] [PATCH 1/3] scanpypi.py: new utility
In-Reply-To: <1434362765-1074-2-git-send-email-denis.thulin@openwide.fr>
References: <1434362765-1074-1-git-send-email-denis.thulin@openwide.fr>
 <1434362765-1074-2-git-send-email-denis.thulin@openwide.fr>
Message-ID: <5586AE1C.3080400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/15/15 12:06, Denis THULIN wrote:
> Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
> ---
> v0: initial commit
>  python-pacakage-generator.py is an utility for automatically generating a
>  python package. It fetches packages info from http://pypi.python.org and
>  generates corresponding packages files.

 This should go above your Sob so there's an actual commit message.

> 
> v1:
>  - renamed python-package-generator to scanpypi
>  - split the huge script into a lot of functions
>  - fixed mistakes and small bugs
> 
> I did not know where to put the script so I put it in support/scripts.
> I have updated the python-package section of the manual as well.

 We generally make the update to the manual a separate patch, but this is OK for
me as well.

> 
> Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
> ---
>  docs/manual/adding-packages-python.txt |  36 ++
>  support/scripts/scanpypi.py            | 607 +++++++++++++++++++++++++++++++++
>  2 files changed, 643 insertions(+)
>  create mode 100755 support/scripts/scanpypi.py
> 
> diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
> index f81d625..647cb67 100644
> --- a/docs/manual/adding-packages-python.txt
> +++ b/docs/manual/adding-packages-python.txt
> @@ -7,6 +7,42 @@ This infrastructure applies to Python packages that use the standard
>  Python setuptools mechanism as their build system, generally
>  recognizable by the usage of a +setup.py+ script.
>  
> +[[scanpypi]]
> +
> +==== generating a +python-package+ from a pypi repository

 Capitalization: Generating

> +
> +You may want to use the +scanpypi.py+ located in
> ++support/script+ to generate a package from an existing pypi(pip) package.
> +
> +you can find the list of existing pypi package here: (https://pypi.python.org).

 You

 The parenthesis are redundant.


> +
> +Please keep in mind that you most likely need 
> +to manually check the package for any mistakes
> +as there are things that cannot be guessed by the generator (e.g. 
> +dependencies on any of the python core modules 
> +such as BR2_PACKAGE_PYTHON_ZLIB).

 Could you rewrap this paragraph? And remove the end-of-line spaces.

> +
> +When at the root of your buildroot directory just do :
> +
> +-----------------------
> +./support/script/scanpypi.py foo bar -o package
> +-----------------------
> +
> +This will generate packages +python-foo+ and +python-bar+ in the package
> +folder if they exist on https://pypi.python.org.
> +
> +You will need to manually write the path to the package inside 
> +the +package/Config.in+ file:

 : -> .

 But perhaps reformulate:

You need to manually add the package to the +package/Config.in+ file.

 It would also be better if this sentence was part of the paragraph a couple of
lines higher, were you say that the package has to be checked manually. And the
following sentence should be part of the same paragraph.

> +
> +Find the +external python modules+ menu and insert your package inside.
> +Keep in mind that the items inside a menu should be in alphabetical order.
> +
> +Option +-h+ wil list the options available
> +
> +-----------------------
> +./support/script/scanpypi.py -h
> +-----------------------
> +
>  [[python-package-tutorial]]
>  
>  ==== +python-package+ tutorial
> diff --git a/support/scripts/scanpypi.py b/support/scripts/scanpypi.py
> new file mode 100755
> index 0000000..953f8d2
> --- /dev/null
> +++ b/support/scripts/scanpypi.py
> @@ -0,0 +1,607 @@
> +#!/usr/bin/python2
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
> +import magic
> +import tempfile
> +from functools import wraps
> +
> +
> +# private global
> +_calls = {}
> +
> +
> +def setup_info(pkg_name):
> +    """Get a package info from _calls
> +
> +    Keyword arguments:
> +    pkg_name -- the name of the package
> +    """
> +    return _calls[pkg_name]
> +
> +
> +def setup_decorator(func, method):
> +    """
> +    Decorator for distutils.core.setup and setuptools.setup.
> +    Puts the args of setup as a dict inside global private dict _calls.
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
> +        _calls[kwargs['name']]['method'] = method
> +    return closure
> +
> +
> +# monkey patch
> +import setuptools
> +setuptools.setup = setup_decorator(setuptools.setup, 'setuptools')
> +import distutils
> +distutils.core.setup = setup_decorator(setuptools.setup, 'distutils')
> +
> +
> +def find_file_upper_case(filenames, path='./'):
> +    """
> +    List generator:
> +    Recursively find files that matches one of the specified filenames.
> +    Returns absolute path
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
> +def find_setup(package_name, version, archive):
> +    """
> +    Search for setup.py file in an archive and returns True if found
> +    Used for finding the correct path to the setup.py
> +
> +    Keyword arguments:
> +    package_name -- base name of the package to search (e.g. Flask)
> +    version -- version of the package to search (e.g. 0.8.1)
> +    archive -- tar archive to search in
> +    """
> +    try:
> +        archive.getmember('{name}-{version}/setup.py'.format(
> +            name=package_name,
> +            version=version))
> +    except KeyError:
> +        return False
> +    else:
> +        return True
> +
> +
> +def fetch_package_info(pkg_name):
> +    """
> +    Fetch a package's metadata for the python package index
> +
> +    Keyword arguments:
> +    pkg_name -- the name of the package
> +    """
> +    url = 'https://pypi.python.org/pypi/{pkg}/json'.format(
> +        pkg=pkg_name)
> +    print('URL:', url)
> +    try:
> +        pkg_json = urllib2.urlopen(url).read().decode()
> +    except (urllib2.HTTPError) as error:

 I don't think these parenthesis are needed?

> +        print('ERROR:', error.getcode(), error.msg, file=sys.stderr)
> +        print('ERROR: Could not find package {pkg}.\n'
> +              'Check syntax inside the python package index:\n'
> +              'https://pypi.python.org/pypi/ '.format(pkg=pkg_name))
> +        return None, None
> +    except urllib2.URLError:
> +        print('ERROR: Could not find package {pkg}.\n'
> +              'Check syntax inside the python package index:\n'
> +              'https://pypi.python.org/pypi/ '.format(pkg=pkg_name))
> +        return None, None
> +
> +    else:
> +        return pkg_json, url
> +
> +
> +def download_package(package):
> +    """
> +    Download a package using metadata from pypi
> +
> +    Keyword arguments:
> +    package -- a dictionary containing info from the pypi json api
> +    """
> +    try:
> +        targz = package['urls'][0]['filename']
> +    except IndexError:
> +        print(
> +            'Non conventional package, ',
> +            'please check manually after creation')

 Is it even worthwhile to support this case?

> +        download_url = package['info']['download_url']
> +        try:
> +            download = urllib2.urlopen(download_url)
> +        except urllib2.HTTPError:

 Shouldn't we print an error message here? Or does urrlib already do that?

> +            targz = None
> +            download = None
> +            as_file = None
> +            used_url = None
> +        else:
> +            used_url = {'url': download_url}
> +            as_file = StringIO.StringIO(download.read())

 Actually, you use the download mostly as a string, it's only used as a file in
tarfile.open(). So I'd put the StringIO call there, and keep it as a string
everywhere else.

 Also, perhaps it's worthwhile to make a class for the package information
instead of passing around tuples? I'm not entirely sure if that really makes
things simpler, but it's something to consider.

> +            as_file.seek(0)
> +            extension = 'tar.gz'
> +            if 'gzip' not in magic.from_buffer(as_file.read()):
> +                extension = 'tar.bz2'

 This part I really don't like. Can't we just get the extension from the URL?

> +            targz = '{name}-{version}.{extension}'.format(
> +                name=package['info']['name'],
> +                version=package['info']['version'], extension=extension)
> +            as_file.seek(0)
> +            used_url['filename'] = targz
> +    else:
> +        for download_url in package['urls']:
> +            try:
> +                download = urllib2.urlopen(download_url['url'])
> +            except urllib2.HTTPError:
> +                targz = None
> +                download = None
> +                as_file = None
> +                used_url = None
> +            else:
> +                used_url = download_url
> +                as_file = StringIO.StringIO(download.read())
> +                md5_sum = hashlib.md5(as_file.read()).hexdigest()
> +                if md5_sum == download_url['md5_digest']:
> +                    break
> +                targz = used_url['filename']
> +    return download, targz, used_url, as_file
> +
> +
> +def extract_package(pkg_name, as_file, tmp_path):
> +    """
> +    Create folders used for extracting a package as file object and extract it
> +
> +    pkg_name -- name of the package to be extracted
> +    as_file -- file object to extract
> +    tmp_path -- folder where you want the package to be extracted
> +    """
> +    as_file.seek(0)
> +    as_tarfile = tarfile.open(fileobj=as_file)

 Better use a with clause here.

> +    tmp_pkg = '/'.join([tmp_path, pkg_name])

 os.path.join is better I think.

> +    try:
> +        os.makedirs(tmp_pkg)
> +    except OSError as exception:
> +        if exception.errno != errno.EEXIST:
> +            print("ERROR: ", exception.message, file=sys.stderr)
> +            return None, None
> +        print('WARNING:', exception.message, file=sys.stderr)
> +        print('Removing {pkg}...'.format(pkg=tmp_pkg))
> +        shutil.rmtree(tmp_pkg)
> +        os.makedirs(tmp_pkg)
> +    version = package['info']['version']

 This accidentally works because the package variable is set in the global
scope, but I think it's better to pass this as an argument to the function. Or
better yet, make a class :-)

> +    tar_folder = package['info']['name']
> +    if not find_setup(tar_folder, version, as_tarfile):
> +        return None, None

 Since the tarball will anyway be extracted below, perhaps it's easier to do
this find_setup on the extracted directory.

> +    as_tarfile.extractall(tmp_pkg)
> +    as_tarfile.close()
> +    as_file.close()
> +    tmp_extract = '{folder}/{name}-{version}'.format(
> +        folder=tmp_pkg,
> +        name=tar_folder,
> +        version=package['info']['version'])
> +    return tar_folder, tmp_extract
> +
> +
> +def get_requirements(package_name):
> +    """
> +    Retrieve dependencies of from a metadata found in the setup.py script of
                             ^^^^^^^^^
                      dependencies from the metadata

> +    a pypi package.
> +
> +    Keyword Arguments:
> +    package_name -- name of the package found in the pypi metadata of the
> +                    package.
> +    """
> +    pkg_req = setup_info(package_name)['install_requires']
> +    pkg_req = [re.sub('([\w-]+)[><=]*.*', r'\1', req).lower()
> +               for req in pkg_req]
> +    pkg_req = map(pkg_buildroot_name, pkg_req)
> +    req_not_found = [
> +        pkg for pkg in pkg_req
> +        if 'python-{name}'.format(name=pkg)
> +        not in os.listdir(pkg_folder)
> +    ]
> +    req_not_found = [pkg for pkg in req_not_found
> +                     if pkg not in packages]
> +    if (req_not_found) != 0:

 Just "if req_not_found:" - it's a list, so comparing to 0 is weird.

> +        print(
> +            'Error: could not find packages \'{packages}\''
> +            'required by {current_package}'.format(
> +                packages=", ".join(req_not_found),
> +                current_package=pkg_name))

 scancpan instead adds the dependencies to the list of packages to create. We
could do something like this here as well. But that can be done in a follow-up
patch.

> +    return pkg_req
> +
> +
> +def create_mk_header(pkg_name):
> +    """
> +    Create the header of the <package_name>.mk file
> +
> +    Keyword arguments:
> +    pkg_name -- name of the package
> +    """
> +    header = ['#' * 80 + '\n']
> +    header.append('#\n')
> +    header.append('# python-{name}\n'.format(name=pkg_name))
> +    header.append('#\n')
> +    header.append('#' * 80 + '\n')
> +    header.append('\n')
> +    return header

I would return a string here instead of a list, so it can all be concatenated
easily in the calling function.

> +
> +
> +def create_mk_download_info(pkg_name, version, targz, url):
> +    """
> +    Create the lines refering to the download information of the
> +    <package_name>.mk file
> +
> +    Keyword arguments:
> +    pkg_name -- name of the package
> +    version -- version of the package
> +    targz -- name of the archive corresponding to the package
> +    url -- url to be used for downloading the package
> +    """
> +    lines = []
> +    version_line = 'PYTHON_{name}_VERSION = {version}\n'.format(
> +        name=pkg_name.upper(),

 It's not just .upper(), also - has to replaced with _

> +        version=version)
> +    lines.append(version_line)
> +
> +    targz = targz.replace(
> +        version,
> +        '$(PYTHON_{name}_VERSION)'.format(name=pkg_name.upper()))
> +    targz_line = 'PYTHON_{name}_SOURCE = {filename}\n'.format(
> +        name=pkg_name.upper(),
> +        filename=targz)
> +    lines.append(targz_line)
> +
> +    site_line = ('PYTHON_{name}_SITE = {url}\n'.format(
> +        name=pkg_name.upper(),
> +        url=url['url'].replace(url['filename'], '')))
> +    if 'sourceforge' in site_line:
> +        site_line = ('PYTHON_{name}_SITE = {url}\n'.format(
> +            name=pkg_name.upper(),
> +            url=url['url']))
> +    lines.append(site_line)
> +    return lines
> +
> +
> +def create_mk_setup(pkg_name, tar_folder):
> +    """
> +    Create the line refering to the setup method of the package of the
> +    <package_name>.mk file
> +
> +    There are two things you can use to make an installer
> +    for a python package: distutils or setuptools
> +    distutils comes with python but does not support dependancies.

 dependencies

> +    distutils is mostly still there for backward support.
> +    setuptools is what smart people use,
> +    but it is not shipped with python :(
> +
> +    Keyword Arguments:
> +    pkg_name -- name of the package
> +    tar_folder -- name of the folder where the setup.py can be found
> +    """
> +    lines = []
> +    setup_type_line = 'PYTHON_{name}_SETUP_TYPE = {method}\n'.format(
> +        name=pkg_name.upper(),
> +        method=setup_info(tar_folder)['method'])
> +    lines.append(setup_type_line)
> +    return lines
> +
> +
> +def create_mk_license(pkg_name, license_name, package_location):
> +    """
> +    Create the lines referring to the package's license informations of the
> +    <package_name>.mk file
> +
> +    The license's files are found by searching the package for files named
> +    license or license.txt (case insensitive).
> +    If more than one license file is found, the user is asked to select which
> +    ones he wants to use.
> +
> +    Keyword Arguments:
> +    pkg_name -- name of the package
> +    license_name -- name of the license
> +    package_location -- where to look for the licenses
> +    """
> +    lines = []
> +    license_line = 'PYTHON_{name}_LICENSE = {license}\n'.format(
> +        name=pkg_name.upper(),
> +        license=license_name)
> +    lines.append(license_line)
> +    print('WARNING: License has been set to "{license}",'
> +          ' please change it manually if necessary'.format(
> +              license=license_name))
> +    filenames = ['LICENSE', 'LICENSE.TXT']
> +    license_files = list(find_file_upper_case(filenames, package_location))
> +    license_files = [license.replace(package_location, '')[1:]
> +                     for license in license_files]
> +    if len(license_files) > 1:
> +        print('More than one file found for license: ')

 No need to go interactive here: just make a space-separated list of license
files. You could spew a warning if it is more than one, but it's anyway going to
be verified manually.

> +        for index, item in enumerate(license_files):
> +            print('\t{index})'.format(index=index), item)
> +        license_choices = raw_input(
> +            'specify file numbers separated by spaces(default 0): ')
> +        license_choices = [int(choice)
> +                           for choice in license_choices.split(' ')
> +                           if choice.isdigit() and int(choice) in
> +                           range(len(license_files))]
> +        if len(license_choices) == 0:
> +            license_choices = [0]
> +        license_files = [file
> +                         for index, file in enumerate(license_files)
> +                         if index in license_choices]
> +    elif len(license_files) == 0:
> +        print('WARNING: No license file found,'
> +              ' please specify it manually afterward')
> +
> +    license_file_line = ('PYTHON_{name}_LICENSE_FILES ='

 This line should not be added if len(license_files) == 0, but instead there
should be something like:

# No license file found

> +                         ' {files}\n'.format(
> +                             name=pkg_name.upper(),
> +                             files=' '.join(license_files)))
> +    license_file_line = license_file_line.replace(' \n', '\n')

 If len(license_files) > 0 then this will not be needed.

> +    lines.append(license_file_line)
> +    return lines
> +
> +
> +def create_mk_requirements(pkg_name, pkg_req):
> +    """
> +    Create the lines referring to the dependencies of the of the
> +    <package_name>.mk file
> +
> +    Keyword Arguments:
> +    pkg_name -- name of the package
> +    pkg_req -- dependencies of the package
> +    """
> +    lines = []
> +    python_pkg_req = ['python-{name}'.format(name=pkg)
> +                      for pkg in pkg_req]
> +    dependencies_line = ('PYTHON_{name}_DEPENDENCIES ='
> +                         ' {reqs}\n'.format(
> +                             name=pkg_name.upper(),
> +                             reqs=' '.join(python_pkg_req)))
> +    lines.append(dependencies_line)
> +    return lines
> +
> +
> +def create_config_mk(pkg_name, version, license, url, targz,
> +                     tar_folder, pkg_req, package_location):

 create_config_mk -> create_package_mk

> +    """
> +    Create the lines corresponding to the <package_name>.mk file
> +
> +    Keyword Arguments:
> +    pkg_name -- name of the package
> +    version -- version of the package
> +    license -- name of the package's license
> +    url -- where to download the package
> +    targz -- name of the archive when downloaded
> +    tar_folder -- name of the folder where the setup.py can be found
> +    pkg_req -- dependencies of the package
> +    package_location -- path to the extracted package
> +    """
> +    lines = create_mk_header(pkg_name)
> +    lines += create_mk_download_info(pkg_name, version, targz, url)
> +    lines += create_mk_setup(pkg_name, tar_folder)
> +    lines += create_mk_license(pkg_name, license, package_location)
> +    if pkg_req:
> +        lines += create_mk_requirements(pkg_name, pkg_req)
> +
> +    lines.append('\n')
> +    lines.append('$(eval $(python-package))')
> +    lines.append('\n')
> +
> +    return lines
> +
> +
> +def create_hash_file(url, digest, hash_function='sha356'):
                                                    ^^^^^^sha256

> +    """
> +    Create the lines corresponding to the <package_name>.hash files
> +
> +    Keyword Arguments:
> +    url -- metadata 'url' from the pypi json api
> +    digest -- digest made from the downladed archive
> +    hash_function -- algorythm used for hashing

 algorithm

> +    """
> +    lines = []
> +    commented_line = '# {method} calculated by scanpypi\n'.format(

 I think there would typically be one md5 that comes from pypi, and one sha256
that is calculated locally. So the comment is not correct.

> +        method=hash_function)
> +    lines.append(commented_line)
> +    hash_line = '{method}\t{digest}  {filename}\n'.format(
> +        method=hash_function,
> +        digest=digest,
> +        filename=url['filename'])
> +    lines.append(hash_line)
> +    return lines
> +
> +
> +def create_config_in(pkg_name, pkg_req, package):
> +    """
> +    Creates the Config.in file of a package
> +
> +    pkg_name -- name of the package
> +    pkg_req -- dependencies of the package
> +    package -- metadata of the package from pypi
> +    """
> +    lines = []
> +    config_line = 'config BR2_PACKAGE_PYTHON_{name}\n'.format(
> +        name=pkg_name.upper())
> +    lines.append(config_line)
> +    python_line = '\tdepends on BR2_PACKAGE_PYTHON\n'

 Why? Are all pypi packages python2-only? Remember, the python2||python3
condition is already in package/Config.in.

> +    lines.append(python_line)
> +
> +    bool_line = '\tbool "python-{name}"\n'.format(name=pkg_name)
> +    lines.append(bool_line)
> +    if pkg_req:
> +        for dep in pkg_req:
> +            dep_line = '\tselect BR2_PACKAGE_PYTHON_{req}\n'.format(
> +                req=dep.upper())
> +            lines.append(dep_line)
> +
> +    lines.append('\thelp\n')
> +
> +    help_lines = package['info']['summary'].split('\n')

 The help_lines should also be wrapped, so call textwrap.wrap() on it.

> +    help_lines.append('')
> +    help_lines.append(package['info']['home_page'])
> +    help_lines = ['\t  {line}\n'.format(line=line)
> +                  for line in help_lines]
> +    lines += help_lines
> +    return lines
> +
> +
> +if __name__ == "__main__":
> +
> +    # Building the parser
> +    parser = argparse.ArgumentParser(
> +        description="Creates buildroot packages from the metadata of "
> +                    "an existing pypi(pip) packages and include it "
> +                    "in menuconfig")
> +    parser.add_argument("packages",
> +                        help="list of packages to be made",
> +                        nargs='+')
> +    parser.add_argument("-o", "--output",
> +                        help="""
> +                        Output directory for packages
> +                        """,
> +                        default='.')

 Since it will be called from the buildroot top dir, this should default to
./packages I think.

> +
> +    args = parser.parse_args()
> +    packages = list(set(args.packages))
> +
> +    # tmp_path is where we'll extract the files later
> +    tmp_prefix = 'scanpypi-'
> +    pkg_folder = args.output
> +    tmp_path = tempfile.mkdtemp(prefix=tmp_prefix)

 There should be a big try: block around here that removes the tmpdir
unconditionally. Clearly that makes debugging harder, but it's easy to remove
the rmtree from the script when you want to debug.

> +
> +    for real_pkg_name in packages:
> +        pkg_name = pkg_buildroot_name(real_pkg_name)
> +        print('buildroot package name for {}:'.format(real_pkg_name),
> +              pkg_name)
> +        # First we download the package
> +        # Most of the info we need can only be found inside the package
> +        print('Package:', pkg_name)
> +        print('Fetching package', real_pkg_name)
> +        pkg_json, url = fetch_package_info(real_pkg_name)
> +        if not pkg_json:
> +            continue
> +
> +        pkg_dir = pkg_folder + '/python-' + pkg_name
> +        package = json.loads(pkg_json)
> +        used_url = ''
> +        print('Downloading package {pkg}...'.format(
> +              pkg=package['info']['name']))
> +        download, targz, used_url, as_file = download_package(package)
> +        version = package['info']['version']
> +
> +        if not download:
> +            print('Error downloading package :', pkg_name)
> +            continue
> +
> +        sha256_digest = hashlib.sha256(as_file.read()).hexdigest()
> +
> +        # extract the tarball
> +        tar_folder, tmp_extract = extract_package(pkg_name, as_file, tmp_path)
> +
> +        # Loading the package install info from the package
> +        sys.path.append(tmp_extract)
> +        print(tmp_extract)

 This print is not necessary or useful I think.

> +        import setup
> +        setup = reload(setup)

 A comment explaining why the reload is necessary would be useful.

 Also, it seems that some packages import other modules from their source
directory. So instead of appending to sys.path, I think it's better to
temporarily chdir to the tmp_extract directory. Try for instance
json-schema-validator

> +        sys.path.remove(tmp_extract)
> +
> +        pkg_req = None
> +        # Package requierement are an argument of the setup function

 requirements

> +        if 'install_requires' in setup_info(tar_folder):
> +            pkg_req = get_requirements(tar_folder)
> +            # We could stop here
> +            # or ask the user if he still wants to continue
> +
> +            # Buildroot python packages require 3 files
> +            # The  first is the mk file
> +            # See:
> +            # http://buildroot.uclibc.org/downloads/manual/manual.html

 Indentation is wrong.

 But I don't think this comment is very useful.

> +        print('Checking if package {name} already exists...'.format(
> +            name=pkg_dir))
> +        try:
> +            os.makedirs(pkg_dir)
> +        except OSError as exception:
> +            if exception.errno != errno.EEXIST:
> +                print("ERROR: ", exception.message, file=sys.stderr)
> +                continue
> +            print('Error: Package {name} already exists'.format(name=pkg_dir))
> +            del_pkg = raw_input(
> +                'Do you want to delete existing package ? [y/N]')
> +            if del_pkg.lower() == 'y':
> +                shutil.rmtree(pkg_dir)
> +                os.makedirs(pkg_dir)
> +            else:
> +                continue
> +        pkg_mk = 'python-{name}.mk'.format(name=pkg_name)
> +        path_to_mk = '/'.join([pkg_dir, pkg_mk])
> +        print('Creating {file}...'.format(file=path_to_mk))
> +        config_mk_lines = create_config_mk(pkg_name, version,
> +                                           package['info']['license'],
> +                                           used_url, targz, tar_folder,
> +                                           pkg_req, tmp_extract)
> +        with open(path_to_mk, 'w') as mk_file:
> +            mk_file.writelines(config_mk_lines)

 I think it's more appropriate to do the file writing inside the function.

> +
> +        # The second file we make is the hash file
> +        # It consists of hashes of the package tarball
> +        # http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-hash
> +        pkg_hash = 'python-{name}.hash'.format(name=pkg_name)
> +        path_to_hash = '/'.join([pkg_dir, pkg_hash])
> +        print('Creating {filename}...'.format(filename=path_to_hash))
> +        hash_lines = create_hash_file(used_url, sha256_digest)

 The pypi md5 should be included as well.


 Regards,
 Arnout

> +        with open(path_to_hash, 'w') as hash_file:
> +            hash_file.writelines(hash_lines)
> +
> +        # The Config.in is the last file we create
> +        # It is used by buildroot's menuconfig, gconfig, xconfig or nconfig
> +        # it is used to displayspackage info and to select requirements
> +        # http://buildroot.uclibc.org/downloads/manual/manual.html#_literal_config_in_literal_file
> +        path_to_config = '/'.join([pkg_dir, 'Config.in'])
> +        print('Creating {file}...'.format(file=path_to_config))
> +        config_in_lines = create_config_in(pkg_name, pkg_req, package)
> +        with open(path_to_config, 'w') as config_file:
> +            config_file.writelines(config_in_lines)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
