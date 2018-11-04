From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 04 Nov 2018 20:42:29 -0200
Subject: [Buildroot] [PATCH v2 00/12] default runtime test case for
 python packages v2
References: <20181104114044.3a01aa11@windsurf>
Message-ID: <5bdf75d55554f_4f663ff4e40da8e0185a@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thank you again for your review.

On Sun, Nov 04, 2018 at 08:40 AM, Thomas Petazzoni wrote:

> On Fri,  2 Nov 2018 01:12:29 -0300, Ricardo Martincoski wrote:
> 
>> Ricardo Martincoski (11):
>>   support/testing: use helper class in IPython test
>>   support/testing: use helper class in Python test
>>   support/testing: create intermediate class per Python version
>>   support/testing: create default test case for python packages
>>   support/testing: use TestPythonPackageBase for python-autobahn
>>   support/testing: use TestPythonPackageBase for python-cryptography
>>   support/testing: use TestPythonPackageBase for python-incremental
>>   support/testing: use TestPythonPackageBase for python-twisted
>>   support/testing: use TestPythonPackageBase for python-txaio
>>   support/testing: use TestPythonPackageBase for python-txtorcon
>>   support/testing: rename python* test cases
> 
> I was about to apply this patch series, but the logic in PATCH 04/12 to
> call the TestPythonBase constructor from a class that isn't a child
> class of TestPythonBase really looked awkward.
> 
> So I google a bit for people having the same issue, i.e defining a base
> class for unit tests, but wanting this base class to be ignored.
> 
> This answer looks particular useful:
> 
>   https://stackoverflow.com/a/25695512/643208

There are 2 suggestions there. So let me answer both.

"move your base class into the separate module"

This should work, but I think we would still need to use the same construct that
I used in v1 (I omitted TestPythonBase2 here to make the comparison easier):
 import tests.package.new_module
 class TestPython2<Package>(tests.package.new_module.TestPythonPackageBase):
instead of the nicer IMO:
 from tests.package.new_module import TestPythonPackageBase
 class TestPython2<Package>(TestPythonPackageBase):
otherwise the class that is not discovered because the new module doesn't have
'test_' in its name would be discovered later in the symbols table of the module
that imports it, unless we use 'del' at the end in every module that imports it.

"wrap it with the blank class"

Using this approach we could even wrap all base classes that are imported by
another files (TestPythonBase2, TestPythonBase3, TestPythonPackageBase,
TestPythonInterpreter). See this applied on top of v2 in [1].
But we would still use multiple inheritance.

> 
> Alternatively this one, which looks less nice to me:
> 
>   https://stackoverflow.com/a/22836015/643208

I am afraid using only 'del' will not work well (maybe won't work at all) in our
case, because the base class is in another file.

> 
> Also, the first answer points to an article that describe potential
> issues when using multiple inheritance like we're doing:
> https://nedbatchelder.com/blog/201210/multiple_inheritance_is_hard.html.

Yes, there will be always the catches about the order of the classes.
There is (at least) one way out of this: if we don't create the classes
TestPythonBase2 and TestPythonBase3. We don't need to keep the 
BR2_PACKAGE_PYTHON=y in every test case, we can add a python_version variable
and a __init__ method to TestPythonBase.

class TestPythonBase(infra.basetest.BRTest):
...
    python_version = None
    def __init__(self, names):
        super(TestPythonBase, self).__init__(names)
        if self.python_version == "2":
            self.config += \
                """
                BR2_PACKAGE_PYTHON=y
                """
        elif self.python_version == "3":
            self.config += \
                """
                BR2_PACKAGE_PYTHON3=y
                """

See how the test cases for python packages would look like in [2]. It's a patch
on top of v2.

> 
> What do you think about this ?

I am really unsure about the best approach here.
TBH all (my v1 and v2, and the 2 links above) look a bit hackish to me.

But I just found deeper on nose2 docs [3] the __test__ attribute. It seems the
most correct solution as it depends on a feature that was implemented and
documented. I just failed to find it earlier.

In the multi inheritance version it would look like this:
class TestPythonPackageBase(TestPythonBase):
...
    def __init__(self, names):
        if not issubclass(self.__class__, TestPythonBase2) and not issubclass(self.__class__, TestPythonBase3):
            self.__test__ = False
        super(TestPythonBase, self).__init__(names)
        if self.config_package:
...

And without multi inheritance you can see a hackish patch on top of v2 in [4].

I know I changed my mind a few times.
But now I prefer to resend using [4] (reworking each patch, of course) because:
 - it does not use multi inheritance that can potentially lead to future
   problems as the article you found pointed. Let's avoid it while we can;
 - the code for each test case for a python package looks nice, i.e. [2];
But it is not a strong preference.

What do you think about this?

[1] https://gitlab.com/RicardoMartincoski/buildroot/commit/cc2f227de49b256d9023e59bca37b8a89622bc60
[2] https://gitlab.com/RicardoMartincoski/buildroot/blob/ddf45cc7ca6d61a85b6642a246cb9b4625160d1c/support/testing/tests/package/test_python_autobahn.py
[3] https://nose2.readthedocs.io/en/latest/plugins/dundertests.html
[4] https://gitlab.com/RicardoMartincoski/buildroot/commit/ddf45cc7ca6d61a85b6642a246cb9b4625160d1c


Regards,
Ricardo
