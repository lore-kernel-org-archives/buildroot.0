From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 16 Jul 2018 21:53:47 -0500
Subject: [Buildroot] [PATCH 6/6] support/testing/tests/core: SSP &
 hardening flags
In-Reply-To: <5b4bf5c0f404_14132af17f6f95b4173ee@ultri5.mail>
References: <20180711143113.11927-7-matthew.weber@rockwellcollins.com>
 <5b4bf5c0f404_14132af17f6f95b4173ee@ultri5.mail>
Message-ID: <CANQCQpaTmZrenyxjA5S0kABeiQPqD2sRtaksJ0HtLv_keHLXSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo,

On Sun, Jul 15, 2018 at 8:32 PM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> Hello,
>
> Looks good in general. A few nits below.
>
> On Wed, Jul 11, 2018 at 11:31 AM, Matt Weber wrote:
>
>> Catch the commonly used options of SSP, Relro, and fortify.
>>
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>> ---
>>  support/testing/tests/core/test_hardening.py | 104 +++++++++++++++++++
>>  1 file changed, 104 insertions(+)
>>  create mode 100644 support/testing/tests/core/test_hardening.py
>
> You forgot to run 'make .gitlab-ci.yml'. It could be done while applying.

I didn't realize that existed.  Maybe I should add a new section 23
titled "Testing" and a subsection on contributing a test case?

>
>>
>> diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
>> new file mode 100644
>> index 0000000000..2a479d89aa
>> --- /dev/null
>> +++ b/support/testing/tests/core/test_hardening.py
>
> Could you fix the 6 warnings from flake8?
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/81143173

Can do.  I'll go ahead and respin a new rev with this

>
> [snip]
>> +class TestRelro(infra.basetest.BRTest):
>> +    config = HARD_DEFCONFIG + \
>> +        """
>> +        BR2_RELRO_FULL=y
>> +        """
>> +
>> +    def test_run(self):
>> +        out = json.loads(checksec_run(self.builddir, "target/usr/sbin/lighttpd"))
>> +        self.assertEqual(out["file"]["relro"], "full")
>> +        self.assertEqual(out["file"]["pie"], "yes")
>> +        out = json.loads(checksec_run(self.builddir, "target/bin/busybox"))
>> +        self.assertEqual(out["file"]["relro"], "full")
>
> Any reason to not test 'pie' for busybox?
>         self.assertEqual(out["file"]["pie"], "yes")
>

Oops, left that out.  I've updated both cases.

Thanks for the review
Matt
