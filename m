From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 30 Mar 2019 00:26:02 -0300
Subject: [Buildroot] [PATCH 2/2] support/testing: introduce specific
 error classes
References: <20190215213549.8476-2-patrickdepinguin@gmail.com>
Message-ID: <5c9ee1ca98157_29f73fa56c14b2b0433cf@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

See some nits below.

On Fri, Feb 15, 2019 at 07:35 PM, Thomas De Schampheleire wrote:

> Rather than using 'SystemError' with a text string, introduce specific error
> classes. These can now be caught specifically, without having to check the
> error string, like was done in tests.download.test_scp, or without catching
> too much like in the case of tests.download.test_git.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  support/testing/infra/__init__.py           |  3 +++
>  support/testing/infra/builder.py            |  4 +--
>  support/testing/infra/emulator.py           |  4 +--
>  support/testing/infra/exceptions.py         | 27 +++++++++++++++++++++

Please run flake8 and fix the warnings it generates.
support/testing/infra/__init__.py:9:1: F401 'infra.exceptions' imported but unused
support/testing/infra/exceptions.py:3:1: E302 expected 2 blank lines, found 1

[snip]
> +++ b/support/testing/infra/__init__.py
> @@ -5,6 +5,9 @@ import tempfile
>  import subprocess
>  from urllib2 import urlopen, HTTPError, URLError
>  
> +# make exceptions available to all tests with just 'import infra'
> +import infra.exceptions

So here you can use:
import infra.exceptions  # noqa: F401

[snip]
> +++ b/support/testing/tests/download/test_scp.py
> @@ -37,9 +37,5 @@ class TestScpPrimarySite(infra.basetest.BRConfigTest):
>              self.b.build(["{}-dirclean".format(package),
>                            "{}-source".format(package)],
>                           env)
> -        except SystemError as e: # FIXME: introduce specific Exception classes
> -            if str(e) == 'Build failed':
> -                self.assertFalse('Download error, search for ERROR in the log')
> -            else:
> -                # an unexpected error
> -                raise
> +        except infra.exceptions.BuildError:
> +            self.assertFalse('Download error, search for ERROR in the log')

Any reason to not do this?

        except infra.exceptions.BuildError:
            raise infra.exceptions.TestError('Download error, search for ERROR in the log')


Regards,
Ricardo
