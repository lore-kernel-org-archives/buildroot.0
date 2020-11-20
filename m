From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 20 Nov 2020 11:03:45 +0100
Subject: [Buildroot] [PATCH 4/4] utils/getdeveloperlib.py: use relative
 paths for files
In-Reply-To: <20201119145354.1175043-4-thomas.petazzoni@bootlin.com>
References: <20201119145354.1175043-1-thomas.petazzoni@bootlin.com>
 <20201119145354.1175043-4-thomas.petazzoni@bootlin.com>
Message-ID: <CAEyMn7ZG+LwAXv7HvGZSo3Sap72SGdh9ThnnuAV7-NTFK0pvMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Do., 19. Nov. 2020 um 15:54 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Using absolute paths within getdeveloperlib isn't very sensible, it
> makes a lot more sense to handle everything as relative paths from the
> top-level Buildroot source directory.
>
> parse_developers() is changed to no longer take the base path as
> argument: it is automatically calculated based on the location of
> utils/getdeveloperlib.py. Then, the rest of the logic is adjusted to
> use relative paths, and prepend them with the base "brpath" when
> needed.
>
> This commit allows pkg-stats to report correct developers information
> even when executed from an out of tree directory.

Just tried this but either I do not completely understand what it
should do or there is an issue.

I do as follows:

--- >8 ---
# mkdir b
# cd b
# make ../buildroot/ defconfig
# ../buildroot/support/scripts/pkg-stats -c --json out.json
make: *** Keine Regel, um ?show-info? zu erstellen.  Schluss.
Traceback (most recent call last):
  File "../buildroot/support/scripts/pkg-stats", line 1008, in <module>
    __main__()
  File "../buildroot/support/scripts/pkg-stats", line 962, in __main__
    package_list = get_config_packages()
  File "../buildroot/support/scripts/pkg-stats", line 337, in
get_config_packages
    js = json.loads(subprocess.check_output(cmd))
  File "/usr/lib/python3.7/subprocess.py", line 395, in check_output
    **kwargs).stdout
  File "/usr/lib/python3.7/subprocess.py", line 487, in run
    output=stdout, stderr=stderr)
subprocess.CalledProcessError: Command '['make',
'--no-print-directory', 'show-info']' returned non-zero exit status 2.

--- >8 ---

>
> Before this patch:
>
> $ ~/buildroot/support/scripts/pkg-stats -p ipmitool --json out.json
> $ cat out.json | jq '.packages.ipmitool.developers'
> []
>
> $ cat out.json | jq '.defconfigs.stm32f469_disco'
> {
>   "name": "stm32f469_disco",
>   "path": "configs/stm32f469_disco_defconfig",
>   "developers": []
> }
>
> After this patch:
>
> $ ~/buildroot/support/scripts/pkg-stats -p ipmitool --json out.json
> $ cat out.json | jq '.packages.ipmitool.developers'
> [
>   "Floris Bos <bos@je-eigen-domein.nl>",
>   "Heiko Thiery <heiko.thiery@gmail.com>"
> ]
> $ cat out.json | jq '.defconfigs.stm32f469_disco'
> {
>   "name": "stm32f469_disco",
>   "path": "configs/stm32f469_disco_defconfig",
>   "developers": [
>     "Christophe Priouzeau <christophe.priouzeau@st.com>"
>   ]
> }

In-tree this change works as expected.

>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  support/scripts/pkg-stats |  2 +-
>  utils/get-developers      |  5 -----
>  utils/getdeveloperlib.py  | 26 ++++++++++++--------------
>  3 files changed, 13 insertions(+), 20 deletions(-)
>
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index e472b67784..f6460cf6f2 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -969,7 +969,7 @@ def __main__():
>      print("Build package list ...")
>      packages = get_pkglist(args.npackages, package_list)
>      print("Getting developers ...")
> -    developers = parse_developers(brpath)
> +    developers = parse_developers()
>      print("Build defconfig list ...")
>      defconfigs = get_defconfig_list()
>      for d in defconfigs:
> diff --git a/utils/get-developers b/utils/get-developers
> index 20272ed60b..e027c26562 100755
> --- a/utils/get-developers
> +++ b/utils/get-developers
> @@ -45,10 +45,6 @@ def __main__():
>          print("No action specified")
>          return
>
> -    # getdeveloperlib expects to be executed from the toplevel buildroot
> -    # directory, which is one level up from this script
> -    os.chdir(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..'))
> -
>      devs = getdeveloperlib.parse_developers()
>      if devs is None:
>          sys.exit(1)
> @@ -75,7 +71,6 @@ def __main__():
>
>      # Handle the files action
>      if args.files is not None:
> -        args.files = [os.path.abspath(f) for f in args.files]
>          for dev in devs:
>              for f in args.files:
>                  if dev.hasfile(f):
> diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
> index f57f41887b..d7a90457ed 100644
> --- a/utils/getdeveloperlib.py
> +++ b/utils/getdeveloperlib.py
> @@ -6,6 +6,8 @@ import subprocess
>  import sys
>  import unittest
>
> +brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), ".."))
> +
>  #
>  # Patch parsing functions
>  #
> @@ -94,14 +96,14 @@ def get_all_test_cases(suite):
>          yield (suite.__module__, suite.__class__.__name__)
>
>
> -def list_unittests(path):
> +def list_unittests():
>      """Use the unittest module to retreive all test cases from a given
>      directory"""
>      loader = unittest.TestLoader()
> -    suite = loader.discover(path)
> +    suite = loader.discover(os.path.join(brpath, "support", "testing"))
>      tests = {}
>      for module, test in get_all_test_cases(suite):
> -        module_path = os.path.join(path, *module.split('.'))
> +        module_path = os.path.join("support", "testing", *module.split('.'))
>          tests.setdefault(module_path, []).append('%s.%s' % (module, test))
>      return tests
>
> @@ -124,9 +126,7 @@ class Developer:
>          self.defconfigs = parse_developer_defconfigs(files)
>
>      def hasfile(self, f):
> -        f = os.path.abspath(f)
>          for fs in self.files:
> -            fs = os.path.abspath(fs)
>              if f.startswith(fs):
>                  return True
>          return False
> @@ -158,7 +158,7 @@ def parse_developer_packages(fnames):
>      patterns, and return a list of those packages."""
>      packages = set()
>      for fname in fnames:
> -        for root, dirs, files in os.walk(fname):
> +        for root, dirs, files in os.walk(os.path.join(brpath, fname)):
>              for f in files:
>                  path = os.path.join(root, f)
>                  if fname_get_package_infra(path):
> @@ -223,7 +223,7 @@ def parse_developer_runtime_tests(fnames):
>      # List all files recursively
>      for fname in fnames:
>          if os.path.isdir(fname):
> -            for root, _dirs, files in os.walk(fname):
> +            for root, _dirs, files in os.walk(os.path.join(brpath, fname)):
>                  all_files += [os.path.join(root, f) for f in files]
>          else:
>              all_files.append(fname)
> @@ -237,15 +237,13 @@ def parse_developer_runtime_tests(fnames):
>      return runtimes
>
>
> -def parse_developers(basepath=None):
> +def parse_developers():
>      """Parse the DEVELOPERS file and return a list of Developer objects."""
>      developers = []
>      linen = 0
> -    if basepath is None:
> -        basepath = os.getcwd()
>      global unittests
> -    unittests = list_unittests(os.path.join(basepath, 'support/testing'))
> -    with open(os.path.join(basepath, "DEVELOPERS"), "r") as f:
> +    unittests = list_unittests()
> +    with open(os.path.join(brpath, "DEVELOPERS"), "r") as f:
>          files = []
>          name = None
>          for line in f:
> @@ -259,11 +257,11 @@ def parse_developers(basepath=None):
>                  name = line[2:].strip()
>              elif line.startswith("F:"):
>                  fname = line[2:].strip()
> -                dev_files = glob.glob(os.path.join(basepath, fname))
> +                dev_files = glob.glob(os.path.join(brpath, fname))
>                  if len(dev_files) == 0:
>                      print("WARNING: '%s' doesn't match any file" % fname,
>                            file=sys.stderr)
> -                files += dev_files
> +                files += [os.path.relpath(f, brpath) for f in dev_files]
>              elif line == "":
>                  if not name:
>                      continue

Thank you.

--
Heiko
