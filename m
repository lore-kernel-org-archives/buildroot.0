From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 23 Oct 2018 00:15:56 -0300
Subject: [Buildroot] [PATCH 1/7] support/testing: create default test
 case for python packages
References: <20181022095518.47a6fd03@windsurf>
Message-ID: <5bce926cde3fc_161d3f9ca608f07053f7@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Oct 22, 2018 at 04:55 AM, Thomas Petazzoni wrote:

[snip]
>>      def test_run(self):
>>          self.login()
>> +
>> +        if self.__class__.__name__ != "TestPython3":
>> +            # default test_run for TestPythonPy3<Package> that inherits from this one
>> +            self.check_sample_scripts_exist()
>> +            self.run_sample_scripts()
>> +            return
>> +
>>          self.version_test("Python 3")
>>          self.math_floor_test()
>>          self.libc_time_test()
> 
> I don't really like that TestPython2 and TestPython3 are used for two
> entirely separate things:
> 
>  - As a base class for testing individual Python packages
>  - As test cases for the Python interpreter itself
> 
> So here is the class hierarchy that I think would make more sense:
> 
>  - TestPythonBase, defines the base configuration, login() method and
>    that's it
> 
>  - TestPythonBase2, that appends the configuration with
>    BR2_PACKAGE_PYTHON=y
> 
>  - TestPythonBase3, that appends the configuration with
>    BR2_PACKAGE_PYTHON3=y
> 
>  - TestPythonInterpreter, defines the version_test(),
>    math_floor_test(), etc. methods that test the interpreter, and a
>    test_run() method that calls all those tests. Indeed, calling those
>    tests is currently repeated between Python2/Python3.
> 
>  - TestPythonInterpreter2, which inherits from TestPythonInterpreter
>    and TestPythonBase2
> 
>  - TestPythonInterpreter3, which inherits from TestPythonInterpreter
>    and TestPythonBase3
> 
>  - TestPythonPackageBase, which has all the logic to copy sample
>    scripts, run the scripts on the target, etc
> 
>  - TestPythonAutobahn that defines the sample script to use, and
>    inherits from TestPythonPackageBase
> 
>  - TestPython2Autobahn that inherits from TestPythonAutobahn and
>    TestPythonBase2
> 
> etc.
> 
> Does that make sense ? Basically, I'd like the test case of the
> interpreter to not be a "special case".
> 
> Does that make sense ?

Sure it does make sense. I will rework.
Thank you for your review.
I will set this series as Changes Requested.


Regards,
Ricardo
