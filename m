From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 20:46:41 +0200
Subject: [Buildroot] [PATCH 4/5] support/testing: add python-incremental
 tests
In-Reply-To: <20180926025514.2092-5-ricardo.martincoski@gmail.com>
References: <20180926025514.2092-1-ricardo.martincoski@gmail.com>
 <20180926025514.2092-5-ricardo.martincoski@gmail.com>
Message-ID: <20181011204641.6ded469a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Sep 2018 23:55:13 -0300, Ricardo Martincoski wrote:

> +class TestPythonIncremental(TestPythonBase):
> +    def str_test(self):
> +        cmd = self.interpreter + " -c 'import incremental;"
> +        cmd += "v = incremental.Version(\"package\", 1, 2, 3, release_candidate=4);"
> +        cmd += "assert(str(v) == \"[package, version 1.2.3rc4]\")'"

When I see this, I wonder if it wouldn't be nicer to do something like
this:

class PythonIncremental(TestPythonBase):
	python_prog = """
import incremental
incremental.Version("package", 1, 2, 3, release_candidate=4)
assert(str(v) == "[package, version 1.2.3rc4]")
"""

and have the base TestPythonBase class have some logic that executes
this as a Python script with the Python interpreter.

It would make the thing a bit more readable. Also, the TestPythonBase
class could push things a bit further, and have a default
implementation of test_run() that does self.login() + execute the
Python program in python_prog.

This way, those simple Python tests only need to provide the Buildroot
configuration and the small Python program to run.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
