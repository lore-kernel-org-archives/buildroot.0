From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 15 Oct 2019 20:37:29 -0300
Subject: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_python_django.py: New test
References: <20191015181356.5459-2-aduskett@gmail.com>
Message-ID: <5da65839e4c24_4d172ac7848e7544125f6@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Oct 15, 2019 at 03:13 PM, wrote:

> support/testing/tests/package/test_python_django.py: New test

The commit summary should be:
support/testing: add python-django test

> This test comprises of two simple steps:
>   1: Start a new simple project called testsite.
>   2: Run ./manage.py migrate on the new testsite.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

After changing the commit summary and fixing the warnings from flake8, and
changing or not the ';' to '&&' between the commands, you can add:
 Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

I tested both the original patch and with all suggestions to the test I make
below, so this tag is unconditional:
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

> ---
>  .gitlab-ci.yml                                |  1 +
>  .../tests/package/sample_python_django.py     |  1 +
>  .../tests/package/test_python_django.py       | 26 +++++++++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_django.py

>  create mode 100644 support/testing/tests/package/test_python_django.py

Tip: if you add this file to your entry in the DEVELOPERS file you will be
notified if it ever fails.

[snip]
> +++ b/support/testing/tests/package/sample_python_django.py
> @@ -0,0 +1 @@
> +import django

In order to comply to flake8:
sample_python_django.py:1:1: F401 'django' imported but unused
use:
import django  # noqa: F401

> diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
> new file mode 100644
> index 0000000000..595134f50e
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_django.py
> @@ -0,0 +1,26 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonDjango(TestPythonPackageBase):
> +    config = TestPythonPackageBase.config
> +    sample_scripts = ["tests/package/sample_python_django.py"]
> +
> +    def run_sample_scripts(self):
> +        cmd = "cd /opt; /usr/bin/django-admin startproject testsite"

This ';' reminded me about a suggestion (a long time ago) from Thomas that is
still pending on my TODO list for another test... I will repeat it here:

        cmd = "cd /opt && /usr/bin/django-admin startproject testsite"

Maybe && between each command would be better?

> +        _, exit_code = self.emulator.run(cmd, timeout=30)
> +        self.assertEqual(exit_code, 0)
> +        cmd = "cd /opt/testsite; " + self.interpreter + " ./manage.py migrate"

The same here:
        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py migrate"

> +        output, exit_code = self.emulator.run(cmd, timeout=30)
> +        self.assertIn("Operations to perform:", output[0])
> +        self.assertEqual(exit_code, 0)
> +

test_python_django.py:17:1: E302 expected 2 blank lines, found 1

> +class TestPythonPy3Django(TestPythonDjango):
> +    __test__ = True
> +    config = TestPythonDjango.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_DJANGO=y
> +        BR2_PACKAGE_PYTHON_SQLPARSE=y
> +        BR2_PACKAGE_PYTHON3_SQLITE=y
> +        """

> +

test_python_django.py:26:1: W391 blank line at end of file

> -- 
> 2.21.0

Regards,
Ricardo
