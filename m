From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 23 Nov 2019 12:20:31 -0800
Subject: [Buildroot] [PATCH v2 0/3] uwsgi: new package
Message-ID: <20191123202034.1397950-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This patch series is reasonably substantial. Below I have documented my thoughts.

The uWSGI project aims at developing a full stack for building hosting services.
Application servers (for various programming languages and protocols), proxies,
process managers and monitors are all implemented using a common API and a
standard configuration style.Thanks to its pluggable architecture, it can be
extended to support more platforms and languages.

The first patch set's the package directly as a python package because the main
application is hard-coded to Python (This is the most common use case as far as
I can tell.)

The second patch allows a user to force building the libphp7.so file from PHP.
This is necessary to enable PHP as the main application for uWSGI.

The third and final patch changes the package to a dual-type. The first being
generic if the application type isn't Python and the second as a python-type
package. This change saves a substantial amount of space and build time if the
user isn't using uWSGI as a Python server.

The package itself requires Python to configure, build, and install, but it is
not required to run, as such, this package is defined as a generic-package.
Defining uWSGI as a generic package saves 29M of space with a Glibc target
filing system (52M vs. 23M.) If however, the primary application type is Python,
then the package is better suited to be a python-package because there is no
longer any space saved, as Python is now on the target and staging directories.

There are five patches currently required to properly cross-compile uWSGI,
all but one of which are pending upstream:
  1) add-plugin_base_dir-variable.patch
    - uWSGI appends the full path of the plugin directory to the binary when
      compiling, which results in plugins failing to load on the target filing
      system.

  2) add-a-xml2_config-environment-variable-for-cross-co.patch
    - uWSGI calls out to xml2-config with no way to define a path for
      xml2-config, thus resulting in the hosts xml2-config cflags and library
      paths used, add the XML2_CONFIG environment variable which overwrites the
      default xml2-config path.

  3) add-a-pcre_config-environment-variable-for-cross-co.patch
    - This patch is the same as the above, except the variable name is
      PCRE_CONFIG.

  4) adjust-python-library-header-paths-for-cross-compila.patch
    - uWSGI calls sysconfig.get_config_var('LIBDIR') which return the host
      header and library paths. To fix this, prefix the LIBDIR path with
      _python_sysroot taken from the sysconfigdata module.

  5) fix-building-with-uClibc.patch
    - There are two issues building uwsgi with uClibc:
      1) core/uwsgi.c includes <execinfo.h> when __GLIBC__  is defined,
         but does not check if __UCLIBC__ is also defined.
      2) plugins/router_basicauth/router_basicauth.c checks if
         __GLIBC__ is defined for <crypt.h> and to enable a
         workaround for a bug in Glibc-2.2.5, both of which do not apply to
         uClibc. Adding a check for __UCLIBC__ for both of these conditions
         fixes the issue.

While PCRE is not technically required, the official documentation recommends
always building with PCRE support, and many of the embedded plugins require
PCRE to be present. As such, PCRE is a dependency.
https://uwsgi-docs.readthedocs.io/en/latest/SNI.html?highlight=sni-regexp

The "Main application type" prompt in the Config.in is to set the main_plugin
variable in the buildroot.ini file. The main application plugin sets several
dependencies, and this patchset includes support for PHP and Python.
Other application types can be added in the future.

There is a "buildroot.ini.in" file which is used to overwrite the default
settings in buildconf/base.ini. The following settings that explicitly set:
  - json: Allow a config file to be in JSON format
  - pcre: Set to True
  - ssl: Allow SSL connections
  - xml: Allow a config file to be in XML format.
  - yaml: Allow a config file to be in YAML format.
  - main_plugin: The main plugin application type.
  - plugin_dir: The plugin directory for the target.

The .ini file does not have a standard value for each option; because of this,
each option is a key/value pair with a colon set as a delimiter. A for loop
set's each setting appropriately by splitting the key/value into two variables
and running SED against the .ini file.

Tested with every option enabled, with both PHP and Python set as the main application type:
br-arm-full [1/6]: OK
br-arm-cortex-a9-glibc [2/6]: OK
br-arm-cortex-m4-full [3/6]: SKIPPED
br-x86-64-musl [4/6]: OK
br-arm-full-static [5/6]: SKIPPED
sourcery-arm [6/6]: OK

Changed v1 -> v2:
  - Change 0005-fix-building-with-uClibc.patch upstream status to merged.
  - For the first patch, keep the uwsgi package as a generic package.
  - For the last patch, I no longer set the package as either python or generic,
    instead, it's always a generic package. This makes the package file much
    easier to read and maintain.

Adam Duskett (3):
  uwsgi: new package
  package/php: add option to force building the shared library
  package/uwsgi: add support for application types

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 package/php/Config.in                         |   9 ++
 package/php/php.mk                            |   4 +
 .../0001-add-plugin_base_dir-variable.patch   |  47 ++++++++
 ...ig-environment-variable-for-cross-co.patch |  60 ++++++++++
 ...ig-environment-variable-for-cross-co.patch |  58 +++++++++
 ...brary-header-paths-for-cross-compila.patch |  34 ++++++
 .../uwsgi/0005-fix-building-with-uClibc.patch |  61 ++++++++++
 package/uwsgi/Config.in                       |  94 +++++++++++++++
 package/uwsgi/buildroot.ini.in                |   9 ++
 package/uwsgi/uwsgi.hash                      |   3 +
 package/uwsgi/uwsgi.mk                        | 110 ++++++++++++++++++
 13 files changed, 491 insertions(+)
 create mode 100644 package/uwsgi/0001-add-plugin_base_dir-variable.patch
 create mode 100644 package/uwsgi/0002-add-a-xml2_config-environment-variable-for-cross-co.patch
 create mode 100644 package/uwsgi/0003-add-a-pcre_config-environment-variable-for-cross-co.patch
 create mode 100644 package/uwsgi/0004-adjust-python-library-header-paths-for-cross-compila.patch
 create mode 100644 package/uwsgi/0005-fix-building-with-uClibc.patch
 create mode 100644 package/uwsgi/Config.in
 create mode 100644 package/uwsgi/buildroot.ini.in
 create mode 100644 package/uwsgi/uwsgi.hash
 create mode 100644 package/uwsgi/uwsgi.mk

-- 
2.23.0
