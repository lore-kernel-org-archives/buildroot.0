From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Jul 2017 00:09:10 +0200
Subject: [Buildroot] [PATCH 2/3] testing/tests/package/test_python:
 refactor to support better code reuse
In-Reply-To: <CAHQ1cqEHAaVa5rp=gJ=UdjQS0LMc2iaESjB=gftux9Ar3UQ=TA@mail.gmail.com>
References: <20170704185807.27189-1-andrew.smirnov@gmail.com>
 <20170704185807.27189-2-andrew.smirnov@gmail.com>
 <20170705125959.09d059bc@windsurf>
 <CAHQ1cqEHAaVa5rp=gJ=UdjQS0LMc2iaESjB=gftux9Ar3UQ=TA@mail.gmail.com>
Message-ID: <ba95e326-7229-d4a1-3e1c-b4aae54a4f5d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 23:30, Andrey Smirnov wrote:
> On Wed, Jul 5, 2017 at 3:59 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> The commit title should mention that a test for Python 3 is added. Or
>> perhaps you could split this into two commits: one that does the
>> refactor but keeps only the Python 2 test. And one that only adds the
>> Python 3 test case on top of that.
>>
> 
> Yeah, I think this commit should be split into at least two. Will do in v2.
> 
>> On Tue,  4 Jul 2017 11:58:06 -0700, Andrey Smirnov wrote:
>>> Refactor TestPythonBase class in the following ways:
>>>
>>>        - Split single test_run() function into multiple smaller once
>>>            to allow derivative classes to mix and match what they want
>>>            to test. Also avoid naming any of the functions starting
>>>            with "test_" to prevent nose2 from picking up
>>>            TestPythonBase class as a class that defines any unit
>>>            tests.
>>>
>>>        - Allow derivative classes to specify QEMU/pexpect timeout in
>>>            login() method
>>>
>>>        - Do not hardcode 'python' as a interpreter to use and
>>>            specify that via class variable 'interpreter'. This way
>>>            classes that inherit from TestPythonBase can override this
>>>            particualr aspect of the test code
>>>
>>>        - Change code of libc related test to be both Python2 and
>>>            Python3 compliant so as to be usable for testing both
>>>
>>>        - Create two derivative classes TestPython2 and TestPython3
>>>            that perform all of the tests specified in TestPythonBase
>>>            using Python2 and Python3 correspondingly
>>
>> Why use such a huge indentation for the bullet list?
>>
> 
> Sorry about that, will fix in v2.
> 
>>
>>> -    def test_run(self):
>>> +    def login(self, timeout=5):
>>>          cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
>>>          self.emulator.boot(arch="armv5",
>>>                             kernel="builtin",
>>> -                           options=["-initrd", cpio_file])
>>> +                           options=["-initrd", cpio_file],
>>> +                           timeout)
>>>          self.emulator.login()
>>> -        cmd = "python --version 2>&1 | grep '^Python 2'"
>>> -        _, exit_code = self.emulator.run(cmd)
>>> -        self.assertEqual(exit_code, 0)
>>
>> I'm not a big fan of having a method called .login() also start the
>> interpreter, it feels a bit weird.
>>
> 
> I'll split it in the code into custom "boot()" and "login()" in v2,
> unless you have something else in mind.

 I *think* this is a mistake on Thomas's part, that he thought the login()
function would boot, login and start Python. I.e., he missed the - in front of
the line. For me at least it's very natural that the login() function does the
boot + login.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
