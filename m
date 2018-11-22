From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 22 Nov 2018 00:42:47 -0200
Subject: [Buildroot] [PATCH 3/8] support/testing: add perl-class-load
 test
References: <20181121195822.15379-4-francois.perrad@gadz.org>
Message-ID: <5bf617a7c511c_17c33fb41a13eb84711cb@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Nov 21, 2018 at 05:58 PM, Francois Perrad wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---

If you send another iteration, it would be good to add the changelog here, and
add to the patch header the iteration of the series and also the branch name
(with git format-patch -v3 --subject-prefix "PATCH/next").

>  .gitlab-ci.yml                                |  1 +
>  .../tests/package/test_perl_class_load.py     | 27 +++++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 support/testing/tests/package/test_perl_class_load.py
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ae5d57026..16eb134c3 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -313,6 +313,7 @@ tests.package.test_dropbear.TestDropbear: *runtime_test
>  tests.package.test_ipython.TestIPythonPy2: *runtime_test
>  tests.package.test_ipython.TestIPythonPy3: *runtime_test
>  tests.package.test_perl.TestPerl: *runtime_test
> +tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
>  tests.package.test_python.TestPython2: *runtime_test
>  tests.package.test_python.TestPython3: *runtime_test
>  tests.package.test_python_autobahn.TestPythonPy2Autobahn: *runtime_test

If you run 'make .gitlab-ci.yml' the diff will be:
 tests.package.test_perl.TestPerl: *runtime_test
+tests.package.test_perl.TestPerl: *runtime_test
+tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test

With one extra TestPerl for each test case of perl package.
This happens because of how nose2 collects test cases, it looks at the context
of the module and since ...

> diff --git a/support/testing/tests/package/test_perl_class_load.py b/support/testing/tests/package/test_perl_class_load.py
> new file mode 100644
> index 000000000..488719482
> --- /dev/null
> +++ b/support/testing/tests/package/test_perl_class_load.py
> @@ -0,0 +1,27 @@
> +from tests.package.test_perl import TestPerl

... here you import TestPerl nose2 finds it, with a test_run method, at this
module too.
One way to solve this is by using the same pattern found in test_python and a
few others: change test_perl to have 2 classes: TestPerlBase declaring the
common stuff and TestPerl that actually tests the interpreter. And here use only
TestPerlBase (4 changes below):

from tests.package.test_perl import TestPerlBase

> +
> +
> +class TestPerlClassLoad(TestPerl):

class TestPerlClassLoad(TestPerlBase):

> +    """
> +    package:
> +        Class-Load
> +    direct dependencies:
> +        Data-OptList *
> +        Module-Implementation
> +        Module-Runtime
> +        Package-Stash
> +        Try-Tiny
> +    indirect dependencies:
> +        Dist-CheckConflicts
> +        Params-Util
> +        Sub-Install
> +    """
> +
> +    config = TestPerl.config + \

    config = TestPerlBase.config + \

> +        """

        BR2_PACKAGE_PERL=y

> +        BR2_PACKAGE_PERL_CLASS_LOAD=y
> +        """
> +
> +    def test_run(self):
> +        self.login()
> +        self.module_test("Class::Load")
> -- 


Regards,
Ricardo
