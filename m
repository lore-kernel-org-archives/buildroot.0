From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 21 Mar 2017 21:34:26 +0100
Subject: [Buildroot] How to organize build into multiple target
	filesystems?
In-Reply-To: <fa8d21ca-56d4-9561-bc25-333c238abfb5@mind.be>
References: <CABKRrCWcWO3MNBnFK9fAoaYoGQBNn2eN=ZvZYovHvV1jwYQbSw@mail.gmail.com>
 <fa8d21ca-56d4-9561-bc25-333c238abfb5@mind.be>
Message-ID: <CAAXf6LXGOfQQT49B+KDdNUkbLOZzCkVtcpE7SZoN05Z65w269g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dave,

On Mon, Mar 6, 2017 at 12:52 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Dave,
>
>  A bit late to answer this, but perhaps still relevant.
>
> On 21-02-17 20:08, David Wuertele wrote:
>> I would like my target to have a small initramfs, and a large-ish /usr
>> filesystem mounted at runtime.  The initramfs will be populated with some of my
>> packages, the usr fs will be populated with the rest.  I don't want the
>> initramfs to contain anything under usr except for the /usr mountpoint
>> directory.
>>
>> In general, I'm looking for a way to divert my package outputs into an
>> arbitrary number of filesystems, which I then package in various ways,
>> including but not limited to bundling into a kernel initramfs.
>>
>> Is there a way to specify such an organization in buildroot?
>
>  Not directly. The Buildroot Way is to keep things simple, preferably without
> blocking real use cases. For your use case, you need specific treatment in a
> fakeroot script.
>
>  Buildroot will still build a monolithic filesystem, and your fakeroot script
> can extract parts that need special treatment. For example, you can make a
> tarball of $TARGET_DIR/usr, then remove the /usr tree, or remove the part that
> you don't need. You can also use $BUILD_DIR/packages-file-list.txt to find out
> which file comes from which package, to do this on a per-package basis.
>
>  You will also need to add the necessary scripts (or systemd units) in a rootfs
> overlay to stitch things back together.
>
>  I'm adding Thomas DS in Cc, he described a somewhat similar setup in the last
> BR developer meeting.

Sorry for the late reply.
We are creating some opkg packages and thus extracting these files
from the rootfs.
The script I created for this is below. I guess it can be split in
two: the core part and the opkg creation, as some people may just want
tar files or something else. Feedback welcome.

diff --git a/support/scripts/create-pkgs b/support/scripts/create-pkgs
new file mode 100755
index 0000000..8e512b2
--- /dev/null
+++ b/support/scripts/create-pkgs
@@ -0,0 +1,212 @@
+#!/usr/bin/env python
+
+# Copyright (C) 2016 Thomas De Schampheleire
<thomas.de_schampheleire@nokia.com>
+
+import argparse
+import collections
+import csv
+import os
+import shutil
+import subprocess
+import sys
+import tempfile
+import pkgutil
+
+class Package(object):
+
+    @staticmethod
+    def parse_file_list():
+        """Create a dictionary pkg -> list of files installed by pkg"""
+
+        files = dict()
+        f = open(os.path.join(Package.outputdir, "build",
"packages-file-list.txt"))
+
+        # Example contents of packages-file-list.txt:
+        #     jansson,./usr/lib/libjansson.so.4.7.0
+        #     jansson,./usr/include/jansson.h
+        #     busybox,./usr/share/udhcpc/default.script
+        #     busybox,./etc/init.d/S01logging
+
+        for row in csv.reader(f):
+            fpath = row[1]
+
+            # remove the initial './' in each file path
+            fpath = fpath.strip()[2:]
+
+            # skip all files we know would be removed by target-finalize
+            # see Buildroot Makefile
+            if fpath.startswith(('usr/include/', 'usr/share/aclocal/',
+                                 'usr/lib/pkgconfig/', 'usr/share/pkgconfig/',
+                                 'usr/lib/cmake/', 'usr/share/cmake/',
+                                 'usr/man/', 'usr/share/man/',
+                                 'usr/info/', 'usr/share/info/',
+                                 'usr/doc/', 'usr/share/doc/',
+                                 'usr/share/gtk-doc/')):
+                continue
+            if fpath.endswith(('.cmake', '.a', '.la')):
+                continue
+
+            if not row[0] in files:
+                files[row[0]] = []
+            files[row[0]] += [fpath]
+        f.close()
+
+        return files
+
+    @staticmethod
+    def setup(outputdir, arch, requested_pkgs):
+        Package.outputdir = os.path.abspath(outputdir)
+        Package.arch = arch
+        Package.requested_pkgs = requested_pkgs
+        Package.files = Package.parse_file_list()
+        Package.versions = pkgutil.get_version(Package.files.keys(),
+                                                  verbose=False)
+        Package.depends = pkgutil.get_depends(Package.files.keys(),
+                                                  verbose=False)
+        Package.pkgdir = os.path.join(Package.outputdir, 'pkgs')
+        try:
+            os.makedirs(Package.pkgdir)
+        except OSError:
+            pass
+
+    def __init__(self, pkg):
+        if pkg not in Package.files:
+            raise Exception("Error: '%s' is not built and can thus
not be packaged" % pkg)
+
+        self.pkg = pkg
+        self.version = Package.versions[self.pkg]
+
+    def isolate_files(self, tempdir):
+        for f in Package.files[self.pkg]:
+            src = os.path.join(Package.outputdir, "target", f)
+            if not os.path.exists(src):
+                print('%s: WARNING: file %s does not exist, pkg will
likely be corrupt' % (self.pkg, f))
+                continue
+
+            dst = os.path.join(tempdir, os.path.dirname(f))
+            if not os.path.isdir(dst):
+                os.makedirs(dst)
+
+            if os.path.islink(src):
+                linkto = os.readlink(src)
+                linkname = os.path.basename(src)
+                dst = os.path.join(dst,linkname)
+                os.symlink(linkto, dst)
+            else:
+                shutil.copy2(src, dst)
+
+
+    def remove_files(self):
+        for f in Package.files[self.pkg]:
+            src = os.path.join(Package.outputdir, "target", f)
+            if not os.path.lexists(src):
+                continue
+            os.remove(src)
+
+    def write_control(self, tempdir, **kwargs):
+        """Write a CONTROL/control file according to the opkg file format"""
+
+        controldir = os.path.join(tempdir, 'CONTROL')
+        os.makedirs(controldir)
+
+        control = ''
+        for key,value in kwargs.items():
+            control += "%s: %s\n" % (key.title(), value)
+
+        f = open(os.path.join(controldir, 'control'), 'wb')
+        f.write(control)
+        f.close()
+
+        # Print out to the console for inspection
+        print('\n' + control)
+
+    def get_opkg_depends(self):
+        """Return the dependencies that need to be declared in the opkg"""
+        deps =
set(Package.depends[self.pkg]).intersection(set(Package.requested_pkgs))
+        if deps is not None:
+            return ','.join(deps)
+        else:
+            return ''
+
+    def create(self):
+        tempdir = tempfile.mkdtemp()
+
+        self.isolate_files(tempdir)
+
+        self.write_control(tempdir, **{
+                'package': self.pkg,
+                'version': self.version,
+                'description': self.pkg,
+                'architecture': Package.arch,
+                'maintainer': 'unknown',
+                'section': 'unknown',
+                'priority': 'optional',
+                'depends': self.get_opkg_depends(),
+                'source': 'unknown',
+                })
+
+        # generate opkg
+        p = subprocess.Popen([
+                 os.path.join(Package.outputdir, 'host/usr/bin/opkg-build'),
+                 tempdir,
+                 Package.pkgdir], stdout=subprocess.PIPE,
stderr=subprocess.PIPE)
+        out, err = p.communicate()
+        # ignore stdout, only print errors
+        print(err)
+        if p.returncode != 0:
+            print('opkg-build returned with error code %d,
exiting...' % p.returncode)
+            sys.exit(p.returncode)
+
+        shutil.rmtree(tempdir)
+
+        self.remove_files()
+
+    @property
+    def filename(self):
+        return '%s_%s_%s.ipk' % (self.pkg, self.version, Package.arch)
+
+    @property
+    def path(self):
+        return os.path.join(Package.pkgdir, self.filename)
+
+    def is_outdated(self):
+        """Check whether pkg exists and is up-to-date with the target files"""
+        if not os.path.exists(self.path):
+            return True
+
+        stamp = os.path.join(Package.outputdir, 'build', '%s-%s' %
(self.pkg, self.version), '.stamp_target_installed')
+
+        if os.stat(self.path).st_mtime < os.stat(stamp).st_mtime:
+            return True
+
+        return False
+
+def main():
+
+    parser = argparse.ArgumentParser(description='Create binary packages')
+
+    parser.add_argument("--outputdir", '-d', metavar="OUTPUTDIR",
required=True,
+                        help="Buildroot output directory")
+    parser.add_argument("--arch", "-a", required=True,
+                        help="Architecture (free-format)")
+    parser.add_argument('pkgnames', nargs='+',
+                        help="List of packages to create a pkg for")
+    args = parser.parse_args()
+
+    print('Creating packages for: %s' % ', '.join(args.pkgnames))
+
+    Package.setup(args.outputdir, args.arch, args.pkgnames)
+
+    for pkgname in args.pkgnames:
+        pkg = Package(pkgname)
+        if pkg.is_outdated():
+            print('%s: creating package...' % pkgname)
+            pkg.create()
+            print('%s: created %s' % (pkgname, pkg.path))
+        else:
+            print('%s: package already exists and is up-to-date: %s'
% (pkgname, pkg.path))
+
+    print("\nNOTE: to force recreation of a package, run 'make
foo-reinstall' before calling this script.")
+
+if __name__ == '__main__':
+    main()


I call this script from a post-build script, wrapping it in fakeroot
and providing architecture and list of packages to package.
The post-build script looks like this:

# Expose only the selected key/value pair. This is safer than getopt_simple
# because it avoids overwriting variables of the calling script unexpectedly.
# Usage: getopt_simple_onevar <key> <cmdline>
getopt_simple_onevar()
{
    local key=$1
    shift

    until [ -z "$1" ]
    do
        parameter=${1%%=*}     # Extract name.
        value=${1##*=}         # Extract value.
        if [ "$parameter" = "$key" ]; then
            eval $parameter=\"$value\"
        fi
        shift                  # Drop $1 and shift $2 to $1
    done
}

# Parse passed arguments (POST_SCRIPT_ARGS)
getopt_simple_onevar ARCH "$@"
getopt_simple_onevar PKGLIST "$@"

# Replace commas back to spaces. The reverse conversion was done to accommodate
# getopt_simple_onevar who uses spaces as word-separator
PKGLIST=${PKGLIST//,/ }

if [ -z "$PKGLIST" ]; then
    echo "WARNING: create-pkgs feature enabled but package list empty"
else
    $HOST_DIR/usr/bin/fakeroot -- support/scripts/create-pkgs
--outputdir output/ --arch "$ARCH" $PKGLIST
fi



And via the config we set BR2_POST_SCRIPT_ARGS to something like
"ARCH=$(ARCH) PKGLIST=foo,bar"

Best regards,
Thomas
