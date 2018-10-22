From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Oct 2018 09:55:18 +0200
Subject: [Buildroot] [PATCH 1/7] support/testing: create default test
 case for python packages
In-Reply-To: <20181016004230.10393-2-ricardo.martincoski@gmail.com>
References: <20181016004230.10393-1-ricardo.martincoski@gmail.com>
 <20181016004230.10393-2-ricardo.martincoski@gmail.com>
Message-ID: <20181022095518.47a6fd03@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

Overall, I find the patch series good (thanks for working on this!), but
there is one thing that I dislike a bit see below.

On Mon, 15 Oct 2018 21:42:24 -0300, Ricardo Martincoski wrote:

> +        if self.__class__.__name__ != "TestPython2":
> +            # default test_run for TestPythonPy2<Package> that inherits from this one
> +            self.check_sample_scripts_exist()
> +            self.run_sample_scripts()
> +            return
> +
>          self.version_test("Python 2")
>          self.math_floor_test()
>          self.libc_time_test()
> @@ -64,6 +100,13 @@ class TestPython3(TestPythonBase):
>  
>      def test_run(self):
>          self.login()
> +
> +        if self.__class__.__name__ != "TestPython3":
> +            # default test_run for TestPythonPy3<Package> that inherits from this one
> +            self.check_sample_scripts_exist()
> +            self.run_sample_scripts()
> +            return
> +
>          self.version_test("Python 3")
>          self.math_floor_test()
>          self.libc_time_test()

I don't really like that TestPython2 and TestPython3 are used for two
entirely separate things:

 - As a base class for testing individual Python packages
 - As test cases for the Python interpreter itself

So here is the class hierarchy that I think would make more sense:

 - TestPythonBase, defines the base configuration, login() method and
   that's it

 - TestPythonBase2, that appends the configuration with
   BR2_PACKAGE_PYTHON=y

 - TestPythonBase3, that appends the configuration with
   BR2_PACKAGE_PYTHON3=y

 - TestPythonInterpreter, defines the version_test(),
   math_floor_test(), etc. methods that test the interpreter, and a
   test_run() method that calls all those tests. Indeed, calling those
   tests is currently repeated between Python2/Python3.

 - TestPythonInterpreter2, which inherits from TestPythonInterpreter
   and TestPythonBase2

 - TestPythonInterpreter3, which inherits from TestPythonInterpreter
   and TestPythonBase3

 - TestPythonPackageBase, which has all the logic to copy sample
   scripts, run the scripts on the target, etc

 - TestPythonAutobahn that defines the sample script to use, and
   inherits from TestPythonPackageBase

 - TestPython2Autobahn that inherits from TestPythonAutobahn and
   TestPythonBase2

etc.

Does that make sense ? Basically, I'd like the test case of the
interpreter to not be a "special case".

Does that make sense ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
