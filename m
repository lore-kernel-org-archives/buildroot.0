From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 04 Feb 2019 23:00:29 -0200
Subject: [Buildroot] [PATCH v5 02/10] testing/infra: split runtime test
 from BRTest
References: <3f24bc0c-1e66-b4e5-760b-6ff354092c9e@mind.be>
Message-ID: <5c58e02dcb189_290e3faf9e14bcec12638@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Matt

On Mon, Feb 04, 2019 at 01:55 PM, Arnout Vandecappelle wrote:

> On 12/05/2018 04:58, Ricardo Martincoski wrote:
>> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
>> 
>> Move the setup of emulator to a new class, RuntimeTestBase, that bahaves
>> exactly like BRTest currently does.
>> It will avoid duplicating code when adding a common class to test the
>> git download infra.
>> 
>> Change all current test cases to use the new class.
>> Do this by first using automatic replace:
>> $ find support/testing/ -name '*.py' | \
>>   xargs grep -l BRTest | \
>>   xargs sed -i \
>>     -e 's,import infra.basetest,\0\nimport infra.runtimetest,g' \
>>     -e 's,infra.basetest.BRTest,infra.runtimetest.RuntimeTestBase,g'
>> and then manually add code to import runtimetest in test_external.py to
>> avoid this error:
>>  AttributeError: 'module' object has no attribute 'LoadTestsFailure'
>> This explicit import was not need before because run-tests imports
>> BRTest and this is the only test file that do not use the defconfig
>> fragments from basetest.py in its code.
>> 
>> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> ---
>> WARNING: this patch changes all current test cases, so if a new test case was
>> applied after this patch was sent, 'git am' will apply this patch cleanly, yet
>> any testcase created in the meantime will be broken.
>> But I can refresh it if need. It will probably only need the automatic replace
>> from the commit log to be re-run.
> 
>  This seems to be an optimisation rather than a requirement for the other
> patches, so I haven't applied this - it needs to be refreshed first.

It's an optimisation, but I failed to describe why it should be done first...

The download test cases do not need to build anything before they run, so by
splitting the two classes and making test_git to inherit from the new BRTest
instead of RuntimeTestBase makes the download test cases to run really fast.
The two test cases already on master, after applying and refreshing this patch,
run in 35 seconds total in my machine.
Less than 2 minutes each in the Gitlab CI auto-scale runners:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/156194310
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/156194313
Unfortunately there is still some problem in my WIP refresh of the patch, so I
can't send it now.

> 
>  If you do so before Wednesday, we might still apply it.

Unfortunately it's unlikely I can do in time.


Regards,
Ricardo
