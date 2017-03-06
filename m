From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 05 Mar 2017 21:41:06 -0300
Subject: [Buildroot] [PATCH v2 5/5] support/testing: add toolchain tests
References: <20170305223650.296c7225@free-electrons.com>
Message-ID: <58bcb02257997_43d6be0488567c0@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, Mar 05, 2017 at 06:36 PM, Thomas Petazzoni wrote:

> Speaking of this, there is one thing I am not entirely happy with: it
> would be much nicer if we could split some test cases in multiple
> test_<foo>() methods, especially the external toolchain tests.
> 
> However, the setUp() and tearDown() methods are called before and after
> running *each* test_<foo>() method of the current unit test class. This
> is clearly not what we want, as we don't want to rebuild/clean up the
> whole Buildroot build for each test_<foo>() method.
> 
> I saw we have setUpClass() and tearDownClass(), but these being class

Beware those methods need python 2.7 at least.
But I don't think it is a huge problem.
Maybe it will be better if 'run-tests' bails out for older python versions if
we start using those methods. When called by an old python interpreter the
tests run but those methods are silently ignored!

I didn't tested this series with older python.

> methods, I guess you don't have access to members of the object
> instance that will be used. And we access a lot of these through
> "self." in setUp() and tearDown().

But it seems to me all accessed values are indirectly coming from the class.
Maybe I am missing something here.

> 
> Do you have an idea?

Please see this *hack*. Notice I don't rename self to cls because I want to
generate a small diff. I also manually edited the diff to make - and +
consecutive.

+++ support/testing/infra/basetest.py
@@ -37,4 +37,5 @@ class BRTest(unittest.TestCase):
 
+    @classmethod
     def show_msg(self, msg):
-        print "[%s/%s/%s] %s" % (os.path.basename(self.__class__.outputdir),
+        print "[%s/%s/%s] %s" % (os.path.basename(self.outputdir),
                                  self.testname,
@@ -42,5 +43,6 @@ class BRTest(unittest.TestCase):
                                  msg)
+    @classmethod
-    def setUp(self):
+    def setUpClass(self):
-        self.testname = self.__class__.__name__
+        self.testname = self.__name__
-        self.builddir = os.path.join(self.__class__.outputdir, self.testname)
+        self.builddir = os.path.join(self.outputdir, self.testname)
         self.runlog = self.builddir + "-run.log"
@@ -48,3 +50,3 @@ class BRTest(unittest.TestCase):
         self.show_msg("Starting")
-        self.b = Builder(self.__class__.config, self.builddir, self.logtofile)
+        self.b = Builder(self.config, self.builddir, self.logtofile)
 
@@ -60,3 +62,4 @@ class BRTest(unittest.TestCase):
 
+    @classmethod
-    def tearDown(self):
+    def tearDownClass(self):
         self.show_msg("Cleaning up")

Something like this can be done in a follow-up patch.

> 
> In addition to this, we will at some point need to allow a test case to
> do something special before the build is started, i.e in the middle of
> the setUp() logic. Should the specific test case override setUp() in
> this case, do its own stuff, and call the parent class setUp() method?

I think in this case the setUp could do only the part before the special
operation. Then the testcase can do the special operation and resume the build
and then do the runtime test.

I plan to do something like this to test the git downloader. I will split the
build() method from Builder into configure() and build().
Probably I will create a new type of test (perhaps DownloadTest or GitTest)
that overrides setUp() to call only configure() and each testcase that inherits
from this type can call self.b.build() at test_run().

We have now only BRTest, but for special cases we can have other classes that
override setUp.

Regards,
Ricardo
