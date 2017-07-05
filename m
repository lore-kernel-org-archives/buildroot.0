From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 5 Jul 2017 14:27:09 -0700
Subject: [Buildroot] [PATCH 1/3] testing/infra/emulator: allow to
 specify pexpect timeout
In-Reply-To: <20170705125708.273a3669@windsurf>
References: <20170704185807.27189-1-andrew.smirnov@gmail.com>
 <20170705125708.273a3669@windsurf>
Message-ID: <CAHQ1cqFbaNfVH__9joFOu06YkoNk+HqXeL2ftJ3A_A5fHOygPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 5, 2017 at 3:57 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> First of all, thanks a lot for working on the testing infrastructure.
> It's nice to see people progressively making use of it!
>
> I however have one comment below.
>
> On Tue,  4 Jul 2017 11:58:05 -0700, Andrey Smirnov wrote:
>> Some commands take more than 5 seconds to complete under QEMU, so add
>> provisions to allow individual unit-test to specify different duration
>> to avoid false negative test failures.
>>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  support/testing/infra/emulator.py | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
>> index a39d59b..4e988a4 100644
>> --- a/support/testing/infra/emulator.py
>> +++ b/support/testing/infra/emulator.py
>> @@ -26,7 +26,10 @@ class Emulator(object):
>>      #
>>      # options: array of command line options to pass to Qemu
>>      #
>> -    def boot(self, arch, kernel=None, kernel_cmdline=None, options=None):
>> +    # timeout: timeout to wait for when excuting commands
>> +    #
>> +    def boot(self, arch, kernel=None, kernel_cmdline=None,
>> +             options=None, timeout=5):
>
> I don't really like the fact that the timeout is passed at boot() and
> then applies to the entire pexpect session.
>
> Indeed, within a single pexpect session, we may have some commands that
> are expected to be short, some commands that are expected to be long.
>
> The .expect() method of the spawn class does have a timeout argument,
> so I believe we could do that per-command.
>
> Do you think it would be possible to instead add the timeout to
> emulator.run() instead, and use it only when starting the interpreter ?
>

Yeah, I agree, it's a better idea to make "timeout" a parameter for
"emulator.run()". Will do in v2.

Thanks,
Andrey Smirnov
