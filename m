From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 04 Apr 2019 00:30:39 -0300
Subject: [Buildroot] [PATCH v3 4/4] support/testing: test_optee.py: test
 optee boot and testsuite
References: <CAN5uoS-sKGtsQqep=pU5iX_4iNApu-TcpmsqxOWscdZFNnbrfg@mail.gmail.com>
Message-ID: <5ca57a5f55355_5b873f82b8174e70724df@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, Apr 03, 2019 at 07:19 AM, Etienne Carriere wrote:

[snip]
>> > +class TestOptee(infra.basetest.BRTest):
>> > +
>> > +    with open(os.path.join(os.getcwd(), 'configs',
>> > +                           'qemu_arm_vexpress_tz_defconfig'),
>> > +              'r') as config_file:
>>
>> Regarding the use of open(), I see no better option here.
>>
>> Regarding the use of os.getcwd(), I would prefer to have my patch applied
>> before this one:
>> http://patchwork.ozlabs.org/patch/992697/
>> So here you could use:
>>     with open(infra.basepath('configs/qemu_armv7a_tz_virt_defconfig'), 'r') as config_file:
>> This way we would keep the logic to get any path in a single point in the test
>> infra.
>> But this suggestion depends on what the maintainers think about my patch.
>> If you like the idea you can add my patch to your series.
> 
> Ok, thanks, it will be more consistent with the runtime env.
> Maybe I could simply merge your proposal in my change (and append your
> s-o-b tag to it), if you agree.

I prefer my patch to stay as a separate commit because it changes how run-tests
can be called. Currently we can chdir to one buildroot tree and call run-tests
from another buildroot tree. Currently we also need to be in the buildroot top
dir when we call run-tests. After that patch when run-tests is called it will
execute in (and consequently test) the buildroot tree it belongs to, no matter
which is the current directory when run-tests is called.
That patch can still be applied with 'git am -3'.

But feel free to just grab only part of the code from there if you want to. No
need for my SoB if you use only part of it. Maybe something like this is enough:

def basepath(relpath=""):
    return os.path.join(os.getcwd(), relpath)

This way we have all calls to os.getcwd() in support/testing/infra/__init__.py
and I resend my patch later.

But also feel free to not do this right now. Up to you.


Regards,
Ricardo
