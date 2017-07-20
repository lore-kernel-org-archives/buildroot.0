From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 22:27:58 +0200
Subject: [Buildroot] [git commit] utils/scanpypi: don't pass any arguments
	to main()
Message-ID: <20170720202408.A2FCA80E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2877a2a8b9ac4ddf4359b5ee7266acd78a87c1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'if __name__ == "__main__"' idiom typically calls main function that
doesn't take any arguments in most cases. We shouldn't pass any tuple to
it.
I've tested the script with python-idna-2.5 and now it works with this
little change.

Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/scanpypi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index bb38992..9abf3c4 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -255,12 +255,12 @@ class BuildrootPackage():
             # called through the if __name__ == '__main__' directive.
             # In this case, we can only pray that it is called through a
             # function called main() in setup.py.
-            setup.main([]) # Will raise AttributeError if not found
+            setup.main() # Will raise AttributeError if not found
             self.setup_metadata = self.setup_args[self.metadata_name]
         # Here we must remove the module the hard way.
         # We must do this because of a very specific case: if a package calls
         # setup from the __main__ but does not come with a 'main()' function,
-        # for some reason setup.main([]) will successfully call the main
+        # for some reason setup.main() will successfully call the main
         # function of a previous package...
         sys.modules.pop('setup',None)
         del setup
