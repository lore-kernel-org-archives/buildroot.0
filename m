From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 10:43:10 +0100
Subject: [Buildroot] [PATCH v7 1/2] testing/infra: split runtime test
 into new class
In-Reply-To: <1549423530-12795-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1549423530-12795-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <27a2ea82-cfcd-a9e3-baa1-a2757a5282f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Applied both to master, thanks.

 I did rewrite the commit message completely :-)

 Regards,
 Arnout

On 06/02/2019 04:25, Matt Weber wrote:
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Move the setup of emulator to a new class, which takes the BRTest name.
> The original BRTest is renamed to BRConfigTest and is used as a base
> class for test cases that don't require a run-time target test. It will
> avoid duplicating code / execution time when adding a common class to
> test items like the git download infra.
> 
> The existing test cases are not impacted as the base and emulator class
> are still contained in basetest.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes v6 -> v7:
> [Peter / Arnout
>   - Swapped the class structure to allow all the existing test cases to
>     not be impacted
> 
> Changes v5 -> v6:
>   - Fixed rebase which added extra args being passed to
>     self.b.configure() for br2-external support
>   - Added additional test cases with class updates committed since v5
> 
> Changes v4 -> v5:
>   - no changes
> 
> Changes v3 -> v4:
>   - re-run the automatic replace command
> 
> Changes v2 -> v3:
>   - new patch
>   - search for "RuntimeTestBase" in
>     http://patchwork.ozlabs.org/patch/806161/
> ---
>  support/testing/infra/basetest.py | 26 +++++++++++++++++++-------
>  support/testing/run-tests         | 16 ++++++++--------
>  2 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index e67bf1a..a176bc3 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -28,7 +28,7 @@ MINIMAL_CONFIG = \
>      """
>  
>  
> -class BRTest(unittest.TestCase):
> +class BRConfigTest(unittest.TestCase):
>      config = None
>      br2_external = list()
>      downloaddir = None
> @@ -39,10 +39,9 @@ class BRTest(unittest.TestCase):
>      timeout_multiplier = 1
>  
>      def __init__(self, names):
> -        super(BRTest, self).__init__(names)
> +        super(BRConfigTest, self).__init__(names)
>          self.testname = self.__class__.__name__
>          self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
> -        self.emulator = None
>          self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
>          self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
>  
> @@ -58,8 +57,23 @@ class BRTest(unittest.TestCase):
>              self.b.delete()
>  
>          if not self.b.is_finished():
> -            self.show_msg("Building")
>              self.b.configure(make_extra_opts=["BR2_EXTERNAL={}".format(":".join(self.br2_external))])
> +
> +    def tearDown(self):
> +        self.show_msg("Cleaning up")
> +        if self.b and not self.keepbuilds:
> +            self.b.delete()
> +
> +
> +class BRTest(BRConfigTest):
> +    def __init__(self, names):
> +        super(BRTest, self).__init__(names)
> +        self.emulator = None
> +
> +    def setUp(self):
> +        super(BRTest, self).setUp()
> +        if not self.b.is_finished():
> +            self.show_msg("Building")
>              self.b.build()
>              self.show_msg("Building done")
>  
> @@ -67,8 +81,6 @@ class BRTest(unittest.TestCase):
>                                   self.logtofile, self.timeout_multiplier)
>  
>      def tearDown(self):
> -        self.show_msg("Cleaning up")
>          if self.emulator:
>              self.emulator.stop()
> -        if self.b and not self.keepbuilds:
> -            self.b.delete()
> +        super(BRTest, self).tearDown()
> diff --git a/support/testing/run-tests b/support/testing/run-tests
> index 76dd15e..813b927 100755
> --- a/support/testing/run-tests
> +++ b/support/testing/run-tests
> @@ -5,7 +5,7 @@ import os
>  import nose2
>  import multiprocessing
>  
> -from infra.basetest import BRTest
> +from infra.basetest import BRConfigTest
>  
>  
>  def main():
> @@ -38,7 +38,7 @@ def main():
>      test_dir = os.path.dirname(script_path)
>  
>      if args.stdout:
> -        BRTest.logtofile = False
> +        BRConfigTest.logtofile = False
>  
>      if args.list:
>          print("List of tests")
> @@ -57,7 +57,7 @@ def main():
>              parser.print_help()
>              return 1
>  
> -    BRTest.downloaddir = os.path.abspath(args.download)
> +    BRConfigTest.downloaddir = os.path.abspath(args.download)
>  
>      if args.output is None:
>          print("Missing output directory, please use -o/--output")
> @@ -68,7 +68,7 @@ def main():
>      if not os.path.exists(args.output):
>          os.mkdir(args.output)
>  
> -    BRTest.outputdir = os.path.abspath(args.output)
> +    BRConfigTest.outputdir = os.path.abspath(args.output)
>  
>      if args.all is False and len(args.testname) == 0:
>          print("No test selected")
> @@ -76,7 +76,7 @@ def main():
>          parser.print_help()
>          return 1
>  
> -    BRTest.keepbuilds = args.keep
> +    BRConfigTest.keepbuilds = args.keep
>  
>      if args.testcases != 1:
>          if args.testcases < 1:
> @@ -89,7 +89,7 @@ def main():
>          each_testcase = br2_jlevel / args.testcases
>          if each_testcase < 1:
>              each_testcase = 1
> -        BRTest.jlevel = each_testcase
> +        BRConfigTest.jlevel = each_testcase
>  
>      if args.jlevel:
>          if args.jlevel < 0:
> @@ -98,14 +98,14 @@ def main():
>              parser.print_help()
>              return 1
>          # the user can override the auto calculated value
> -        BRTest.jlevel = args.jlevel
> +        BRConfigTest.jlevel = args.jlevel
>  
>      if args.timeout_multiplier < 1:
>          print("Invalid multiplier for timeout values")
>          print("")
>          parser.print_help()
>          return 1
> -    BRTest.timeout_multiplier = args.timeout_multiplier
> +    BRConfigTest.timeout_multiplier = args.timeout_multiplier
>  
>      nose2_args = ["-v",
>                    "-N", str(args.testcases),
> 
