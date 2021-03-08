From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  8 Mar 2021 14:45:40 +0100
Subject: [Buildroot] [PATCH 2/2] utils/scanpypi: allow installation of
 commands without 'main' method
In-Reply-To: <20210308134542.22324-1-patrickdepinguin@gmail.com>
References: <20210308134542.22324-1-patrickdepinguin@gmail.com>
Message-ID: <20210308134542.22324-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

In case the setup.py file of a python package does not directly call the
'setup' method, utils/scanpypi was hoping there be a 'main' function which
would do the work, normally called via a construct like:

    if __name__ == '__main__':
        main()

However, this construct is nonstandard, and there are packages in PyPI which
call 'setup()' directly from the 'if' statement, without a main() method.

But scanpypi does not actually need to make such assumption: when loading
the module, it can decide the name to be '__main__', just as if setup.py
would be loaded interactively.

Additionally, remove some logic seemingly related to the previous trick of
calling 'main'. There should not be a problem in keeping already loaded
modules in sys.modules, as this is the purpose of sys.modules.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 utils/scanpypi | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 24c64dddde..1d1f25f596 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -299,7 +299,7 @@ class BuildrootPackage():
         os.chdir(self.tmp_extract)
         sys.path.insert(0,self.tmp_extract)
         s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
-        setup = imp.load_module('setup', s_file, s_path, s_desc)
+        setup = imp.load_module('__main__', s_file, s_path, s_desc)
         if self.metadata_name in self.setup_args:
             pass
         elif self.metadata_name.replace('_', '-') in self.setup_args:
@@ -309,19 +309,10 @@ class BuildrootPackage():
         try:
             self.setup_metadata = self.setup_args[self.metadata_name]
         except KeyError:
-            # This means setup was not called which most likely mean that it is
-            # called through the if __name__ == '__main__' directive.
-            # In this case, we can only pray that it is called through a
-            # function called main() in setup.py.
-            setup.main()  # Will raise AttributeError if not found
-            self.setup_metadata = self.setup_args[self.metadata_name]
-        # Here we must remove the module the hard way.
-        # We must do this because of a very specific case: if a package calls
-        # setup from the __main__ but does not come with a 'main()' function,
-        # for some reason setup.main() will successfully call the main
-        # function of a previous package...
-        sys.modules.pop('setup', None)
-        del setup
+            # This means setup was not called
+            print('ERROR: Could not determine package metadata for {pkg}.\n'
+                  .format(pkg=self.real_name))
+            raise
         os.chdir(current_dir)
         sys.path.remove(self.tmp_extract)
 
@@ -706,7 +697,7 @@ def main():
                 else:
                     raise
                 continue
-            except AttributeError as error:
+            except (AttributeError, KeyError) as error:
                 print('Error: Could not install package {pkg}: {error}'.format(
                     pkg=package.real_name, error=error))
                 continue
-- 
2.26.2
