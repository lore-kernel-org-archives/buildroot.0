From: Denis THULIN <denis.thulin@openwide.fr>
Date: Mon,  1 Jun 2015 16:56:07 +0200
Subject: [Buildroot] [PATCH 1/3] [RFC] python-package-generator: new utility
In-Reply-To: <1433170569-15031-1-git-send-email-denis.thulin@openwide.fr>
References: <1433170569-15031-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1433170569-15031-2-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds package python-package-generator.py
---
v0: initial commit
    - python-pacakage-generator.py is an utility for automatically generating
      python packages using metadata from the python package index:
      https://pypi.python.org

I did not know where to put the script so I put it in support/scripts.
I have updated the python-package section of the manual as well.

Please bear in mind that python-package-generator.py does not add the packages
to your buildroot project and you need to do it manually.

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 docs/manual/adding-packages-python.txt      |  36 +++
 support/scripts/python-package-generator.py | 435 ++++++++++++++++++++++++++++
 2 files changed, 471 insertions(+)
 create mode 100755 support/scripts/python-package-generator.py

diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
index f81d625..6f608ed 100644
--- a/docs/manual/adding-packages-python.txt
+++ b/docs/manual/adding-packages-python.txt
@@ -7,6 +7,42 @@ This infrastructure applies to Python packages that use the standard
 Python setuptools mechanism as their build system, generally
 recognizable by the usage of a +setup.py+ script.
 
+[[python-package-generator]]
+
+==== generating a +python-package+ from a pypi repository
+
+You may want to use the +python-package-generator.py+ located in
++support/script+ to generate a package from an existing pypi(pip) package.
+
+you can find the list of existing pypi package here: (https://pypi.python.org).
+
+Please keep in mind that you most likely need 
+to manually check the package for any mistakes
+as there are things that cannot be guessed by the generator (e.g. 
+dependencies on any of the python core modules 
+such as BR2_PACKAGE_PYTHON_ZLIB).
+
+When at the root of your buildroot directory just do :
+
+-----------------------
+./support/script/python-package-generator.py foo bar -o package
+-----------------------
+
+This will generate packages +python-foo+ and +python-bar+ in the package
+folder if they exist on https://pypi.python.org.
+
+You will need to manually write the path to the package inside 
+the +package/Config.in+ file:
+
+Find the +external python modules+ menu and insert your package inside.
+Keep in mind that the items inside a menu should be in alphabetical order.
+
+Option +-h+ wil list the options available
+
+-----------------------
+./support/script/python-package-generator.py -h
+-----------------------
+
 [[python-package-tutorial]]
 
 ==== +python-package+ tutorial
diff --git a/support/scripts/python-package-generator.py b/support/scripts/python-package-generator.py
new file mode 100755
index 0000000..4f5e884
--- /dev/null
+++ b/support/scripts/python-package-generator.py
@@ -0,0 +1,435 @@
+#!/usr/bin/python2
+"""
+    Utility for building buildroot packages for existing pypi packages
+
+    Any package built by brpy-generator should be manually checked for errors.
+"""
+from __future__ import print_function
+import argparse
+import json
+import urllib2
+import sys
+import os
+import shutil
+import StringIO
+import tarfile
+import errno
+import hashlib
+import re
+import magic
+import tempfile
+from functools import wraps
+
+# TODO: Create a real module instead of a 320 line script
+
+# private global
+_calls = {}
+
+
+def setup_info(pkg_name):
+    """Get a package info from _calls
+
+    Keyword arguments:
+    pkg_name -- the name of the package
+    """
+    return _calls[pkg_name]
+
+
+def setup_decorator(func, method):
+    """
+    Decorator for distutils.core.setup and setuptools.setup.
+    Puts the args of setup as a dict inside global private dict _calls.
+    Add key 'method' which should be either 'setuptools' or 'distutils'.
+
+    Keyword arguments:
+    func -- either setuptools.setup or distutils.core.setup
+    method -- either 'setuptools' or 'distutils'
+    """
+
+    @wraps(func)
+    def closure(*args, **kwargs):
+        _calls[kwargs['name']] = kwargs
+        _calls[kwargs['name']]['method'] = method
+
+    return closure
+
+
+def find_file_upper_case(filenames, path='./'):
+    """
+    List generator:
+    Recursively find files that matches one of the specified filenames.
+    Returns absolute path
+
+    Keyword arguments:
+    filenames -- List of filenames to be found
+    path -- Path to the directory to search
+    """
+    for root, dirs, files in os.walk(path):
+        for file in files:
+            if file.upper() in filenames:
+                yield (os.path.join(root, file))
+
+
+def pkg_new_name(pkg_name):
+    """
+    Returns name to avoid troublesome characters.
+    Remove all non alphanumeric characters except -
+    Also lowers the name
+
+    Keyword arguments:
+    pkg_name -- String to rename
+    """
+    name = re.sub('[^\w-]', '', pkg_name.lower())
+    name = name.lstrip('python-')
+    return name
+
+
+def find_setup(package_name, version, archive):
+    """
+    Search for setup.py file in an archive and returns True if found
+    Used for finding the correct path to the setup.py
+
+    Keyword arguments:
+    package_name -- base name of the package to search (e.g. Flask)
+    version -- version of the package to search (e.g. 0.8.1)
+    archive -- tar archive to search in
+    """
+    try:
+        archive.getmember('{name}-{version}/setup.py'.format(
+            name=package_name,
+            version=version))
+    except KeyError:
+        return False
+    else:
+        return True
+
+
+# monkey patch
+import setuptools
+setuptools.setup = setup_decorator(setuptools.setup, 'setuptools')
+import distutils
+distutils.core.setup = setup_decorator(setuptools.setup, 'distutils')
+
+if __name__ == "__main__":
+
+    # Building the parser
+    parser = argparse.ArgumentParser(
+        description=("Creates buildroot packages from the metadata of "
+                     "an existing pypi(pip) packages and include it "
+                     "in menuconfig"))
+    parser.add_argument("packages",
+                        help="list of packages to be made",
+                        nargs='+')
+    parser.add_argument("-o", "--output",
+                        help="""
+                        Output directory for packages
+                        """,
+                        default='.')
+
+    args = parser.parse_args()
+    packages = list(set(args.packages))
+
+    # tmp_path is where we'll extract the files later
+    tmp_prefix = '-python-package-generator'
+    # dl_dir is supposed to be your buildroot dl dir
+    pkg_folder = args.output
+    tmp_path = tempfile.mkdtemp(prefix=tmp_prefix)
+
+    packages_local_names = map(pkg_new_name, packages)
+    print(
+        'Character . is forbidden.',
+        'Generator will use only alphanumeric characters (including _ and -)',
+        sep='\n')
+    for index, real_pkg_name in enumerate(packages):
+        # First we download the package
+        # Most of the info we need can only be found inside the package
+        pkg_name = packages_local_names[index]
+        print('Package:', pkg_name)
+        print('Fetching package', real_pkg_name)
+        url = 'https://pypi.python.org/pypi/{pkg}/json'.format(
+            pkg=real_pkg_name)
+        print('URL:', url)
+        try:
+            pkg_json = urllib2.urlopen(url).read().decode()
+        except (urllib2.HTTPError, urllib2.URLError) as error:
+            print('ERROR:', error.getcode(), error.msg, file=sys.stderr)
+            print('ERROR: Could not find package {pkg}.\n'
+                  'Check syntax inside the python package index:\n'
+                  'https://pypi.python.org/pypi/ '.format(pkg=real_pkg_name))
+            continue
+
+        pkg_dir = ''.join([pkg_folder, '/python-', pkg_name])
+
+        package = json.loads(pkg_json)
+        used_url = ''
+        try:
+            targz = package['urls'][0]['filename']
+        except IndexError:
+            print(
+                'Non conventional package, ',
+                'please check manually after creation')
+            download_url = package['info']['download_url']
+            try:
+                download = urllib2.urlopen(download_url)
+            except urllib2.HTTPError:
+                pass
+            else:
+                used_url = {'url': download_url}
+                as_file = StringIO.StringIO(download.read())
+                md5_sum = hashlib.md5(as_file.read()).hexdigest()
+                used_url['md5_digest'] = md5_sum
+                as_file.seek(0)
+                print(magic.from_buffer(as_file.read()))
+                as_file.seek(0)
+                extension = 'tar.gz'
+                if 'gzip' not in magic.from_buffer(as_file.read()):
+                    extension = 'tar.bz2'
+                targz = '{name}-{version}.{extension}'.format(
+                    package['info']['name'], package['info']['version'],
+                    extension)
+                as_file.seek(0)
+                used_url['filename'] = targz
+
+        print(
+            'Downloading package {pkg}...'.format(pkg=package['info']['name']))
+        for download_url in package['urls']:
+            try:
+                download = urllib2.urlopen(download_url['url'])
+            except urllib2.HTTPError:
+                pass
+            else:
+                used_url = download_url
+                as_file = StringIO.StringIO(download.read())
+                md5_sum = hashlib.md5(as_file.read()).hexdigest()
+                if md5_sum == download_url['md5_digest']:
+                    break
+                targz = used_url['filename']
+
+        if not download:
+            print('Error downloading package :', pkg_name)
+            continue
+
+        # extract the tarball
+        as_file.seek(0)
+        as_tarfile = tarfile.open(fileobj=as_file)
+        tmp_pkg = '/'.join([tmp_path, pkg_name])
+        try:
+            os.makedirs(tmp_pkg)
+        except OSError as exception:
+            if exception.errno != errno.EEXIST:
+                print("ERROR: ", exception.message, file=sys.stderr)
+                continue
+            print('WARNING:', exception.message, file=sys.stderr)
+            print('Removing {pkg}...'.format(pkg=tmp_pkg))
+            shutil.rmtree(tmp_pkg)
+            os.makedirs(tmp_pkg)
+        tar_folder_names = [real_pkg_name.capitalize(),
+                            real_pkg_name.lower(),
+                            package['info']['name']]
+        version = package['info']['version']
+        try:
+            tar_folder = next(folder for folder in tar_folder_names
+                              if find_setup(folder, version, as_tarfile))
+        except StopIteration:
+            print('ERROR: Could not extract package %s' %
+                  real_pkg_name,
+                  file=sys.stderr)
+            continue
+        as_tarfile.extractall(tmp_pkg)
+        as_tarfile.close()
+        as_file.close()
+        tmp_extract = '{folder}/{name}-{version}'.format(
+            folder=tmp_pkg,
+            name=tar_folder,
+            version=package['info']['version'])
+
+        # Loading the package install info from the package
+        sys.path.append(tmp_extract)
+        import setup
+        setup = reload(setup)
+        sys.path.remove(tmp_extract)
+
+        pkg_req = None
+        # Package requierement are an argument of the setup function
+        if 'install_requires' in setup_info(tar_folder):
+            pkg_req = setup_info(tar_folder)['install_requires']
+            pkg_req = [re.sub('([\w-]+)[><=]*.*', r'\1', req).lower()
+                       for req in pkg_req]
+            pkg_req = map(pkg_new_name, pkg_req)
+            req_not_found = [
+                pkg for pkg in pkg_req
+                if 'python-{name}'.format(name=pkg)
+                not in os.listdir(pkg_folder)
+            ]
+            req_not_found = [pkg for pkg in req_not_found
+                             if pkg not in packages]
+            if (req_not_found) != 0:
+                print(
+                    'Error: could not find packages \'{packages}\'',
+                    'required by {current_package}'.format(
+                        packages=", ".join(req_not_found),
+                        current_package=pkg_name))
+            # We could stop here
+            # or ask the user if he still wants to continue
+
+            # Buildroot python packages require 3 files
+            # The  first is the mk file
+            # See:
+            # http://buildroot.uclibc.org/downloads/manual/manual.html
+        pkg_mk = 'python-{name}.mk'.format(name=pkg_name)
+        path_to_mk = '/'.join([pkg_dir, pkg_mk])
+        print('Creating {file}...'.format(file=path_to_mk))
+        print('Checking if package {name} already exists...'.format(
+            name=pkg_dir))
+        try:
+            os.makedirs(pkg_dir)
+        except OSError as exception:
+            if exception.errno != errno.EEXIST:
+                print("ERROR: ", exception.message, file=sys.stderr)
+                continue
+            print('Error: Package {name} already exists'.format(name=pkg_dir))
+            del_pkg = raw_input(
+                'Do you want to delete existing package ? [y/N]')
+            if del_pkg.lower() == 'y':
+                shutil.rmtree(pkg_dir)
+                os.makedirs(pkg_dir)
+            else:
+                continue
+        with open(path_to_mk, 'w') as mk_file:
+            # header
+            header = ['#' * 80 + '\n']
+            header.append('#\n')
+            header.append('# {name}\n'.format(name=pkg_dir))
+            header.append('#\n')
+            header.append('#' * 80 + '\n')
+            header.append('\n')
+            mk_file.writelines(header)
+
+            version_line = 'PYTHON_{name}_VERSION = {version}\n'.format(
+                name=pkg_name.upper(),
+                version=package['info']['version'])
+            mk_file.write(version_line)
+            targz = targz.replace(
+                package['info']['version'],
+                '$(PYTHON_{name}_VERSION)'.format(name=pkg_name.upper()))
+            targz_line = 'PYTHON_{name}_SOURCE = {filename}\n'.format(
+                name=pkg_name.upper(),
+                filename=targz)
+            mk_file.write(targz_line)
+
+            site_line = ('PYTHON_{name}_SITE = {url}\n'.format(
+                name=pkg_name.upper(),
+                url=used_url['url'].replace(used_url['filename'], '')))
+            if 'sourceforge' in site_line:
+                site_line = ('PYTHON_{name}_SITE = {url}\n'.format(
+                    name=pkg_name.upper(),
+                    url=used_url['url']))
+
+            mk_file.write(site_line)
+
+            # There are two things you can use to make an installer
+            # for a python package: distutils or setuptools
+            # distutils comes with python but does not support dependancies.
+            # distutils is mostly still there for backward support.
+            # setuptools is what smart people use,
+            # but it is not shipped with python :(
+
+            # setuptools.setup calls distutils.core.setup
+            # We use the monkey patch with a tag to know which one is used.
+            setup_type_line = 'PYTHON_{name}_SETUP_TYPE = {method}\n'.format(
+                name=pkg_name.upper(),
+                method=setup_info(tar_folder)['method'])
+            mk_file.write(setup_type_line)
+
+            license_line = 'PYTHON_{name}_LICENSE = {license}\n'.format(
+                name=pkg_name.upper(),
+                license=package['info']['license'])
+            mk_file.write(license_line)
+            print('WARNING: License has been set to "{license}",'
+                  ' please change it manually if necessary'.format(
+                      license=package['info']['license']))
+            filenames = ['LICENSE', 'LICENSE.TXT']
+            license_files = list(find_file_upper_case(filenames, tmp_extract))
+            license_files = [license.replace(tmp_extract, '')[1:]
+                             for license in license_files]
+            if len(license_files) > 1:
+                print('More than one file found for license: ')
+                for index, item in enumerate(license_files):
+                    print('\t{index})'.format(index), item)
+                license_choices = raw_input(
+                    'specify file numbers separated by spaces(default 0): ')
+                license_choices = [int(choice)
+                                   for choice in license_choices.split(' ')
+                                   if choice.isdigit() and int(choice) in
+                                   range(len(license_files))]
+                if len(license_choices) == 0:
+                    license_choices = [0]
+                license_files = [file
+                                 for index, file in enumerate(license_files)
+                                 if index in license_choices]
+            elif len(license_files) == 0:
+                print('WARNING: No license file found,'
+                      ' please specify it manually afterward')
+
+            license_file_line = ('PYTHON_{name}_LICEiNSE_FILES ='
+                                 ' {files}\n'.format(
+                                     name=pkg_name.upper(),
+                                     files=' '.join(license_files)))
+            mk_file.write(license_file_line)
+
+            if pkg_req:
+                python_pkg_req = ['python-{name}'.format(name=pkg)
+                                  for pkg in pkg_req]
+                dependencies_line = ('PYTHON_{name}_DEPENDENCIES ='
+                                     ' {reqs}\n'.format(
+                                         name=pkg_name.upper(),
+                                         reqs=' '.join(python_pkg_req)))
+                mk_file.write(dependencies_line)
+
+            mk_file.write('\n')
+            mk_file.write('$(eval $(python-package))')
+
+        # The second file we make is the hash file
+        # It consists of hashes of the package tarball
+        # http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages-hash
+        pkg_hash = 'python-{name}.hash'.format(name=pkg_name)
+        path_to_hash = '/'.join([pkg_dir, pkg_hash])
+        print('Creating {filename}...'.format(filename=path_to_hash))
+        with open(path_to_hash, 'w') as hash_file:
+            commented_line = '# md5 from {url}\n'.format(url=url)
+            hash_file.write(commented_line)
+
+            hash_line = 'md5\t{digest}  {filename}\n'.format(
+                digest=used_url['md5_digest'],
+                filename=used_url['filename'])
+            hash_file.write(hash_line)
+
+        # The Config.in is the last file we create
+        # It is used by buildroot's menuconfig, gconfig, xconfig or nconfig
+        # it is used to displayspackage info and to select requirements
+        # http://buildroot.uclibc.org/downloads/manual/manual.html#_literal_config_in_literal_file
+        path_to_config = '/'.join([pkg_dir, 'Config.in'])
+        print('Creating {file}...'.format(file=path_to_config))
+        with open(path_to_config, 'w') as config_file:
+            config_line = 'config BR2_PACKAGE_PYTHON_{name}\n'.format(
+                name=pkg_name.upper())
+            config_file.write(config_line)
+            python_line = '\tdepends on BR2_PACKAGE_PYTHON\n'
+            config_file.write(python_line)
+
+            bool_line = '\tbool "python-{name}"\n'.format(name=pkg_name)
+            config_file.write(bool_line)
+            if pkg_req:
+                for dep in pkg_req:
+                    dep_line = '\tselect BR2_PACKAGE_PYTHON_{req}\n'.format(
+                        req=dep.upper())
+                    config_file.write(dep_line)
+
+            config_file.write('\thelp\n')
+
+            help_lines = package['info']['summary'].split('\n')
+            help_lines.append('')
+            help_lines.append(package['info']['home_page'])
+            help_lines = ['\t  {line}\n'.format(line=line)
+                          for line in help_lines]
+            config_file.writelines(help_lines)
-- 
2.4.2
