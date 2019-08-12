From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon, 12 Aug 2019 16:57:51 +0200
Subject: [Buildroot] [PATCH v2] support/testing: add test for root
 password
In-Reply-To: <5d4cd45ade698_53243feb780f396440693@ultri5.mail>
References: <20190719142656.14448-1-victor.huesca@bootlin.com>
 <5d4cd45ade698_53243feb780f396440693@ultri5.mail>
Message-ID: <e85456c7-5387-b4ae-1ee5-de8cdededa70@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thank you for this detailed feedback, I'll prepare a v3.

On 09/08/2019 04:03, Ricardo Martincoski wrote:
> Hello,
> 
> Looks good in general, but there is a major issue that prevents the target to
> boot: the generation of cpio is not enabled.
> Also a few nits.
> 
> On Fri, Jul 19, 2019 at 11:26 AM, Victor Huesca wrote:
> 
>> Add support to test that the root passowrd is working as expected.
>> - Buildtime test: Check the hash present in the /etc/shadow.
>> - Runtime test: Build an armv7 image and try to login with a password.
>>
>> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
>> ---
>> Changes v1 --> v2:
>>   - Fix coding style to pass flake8 test
>> ---
>>  .../testing/tests/core/test_root_password.py  | 36 +++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>  create mode 100644 support/testing/tests/core/test_root_password.py
> 
> The update to .gitlab-ci.yml is missing. You can generate the change with
> 'make .gitlab-ci.yml' and commit.
> 
>>
>> diff --git a/support/testing/tests/core/test_root_password.py b/support/testing/tests/core/test_root_password.py
>> new file mode 100644
>> index 0000000000..c6f6b76bfd
>> --- /dev/null
>> +++ b/support/testing/tests/core/test_root_password.py
>> @@ -0,0 +1,36 @@
>> +import os
>> +import infra.basetest
>> +from crypt import crypt
>> +
>> +
>> +class TestRootPassword(infra.basetest.BRTest):
>> +    password = "foo"
>> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>> +        """
> 
>> +        BR2_TARGET_ENABLE_ROOT_LOGIN=y
> 
> Not really needed, it ends up defaulting to 'y'.

Isn't it more clear to explicitly set it to 'y' ?

> 
>> +        BR2_TARGET_GENERIC_ROOT_PASSWD="{}"
> 
> Here are missing:
>          BR2_TARGET_ROOTFS_CPIO=y
>          # BR2_TARGET_ROOTFS_TAR is not set
> See test_dropbear.py for an example.
> 

Yes I saw that and had a patch ready to submit for that.

>> +        """.format(password)
>> +
>> +    def test_run(self):
>> +        # 1. Test by looking hash in the /etc/shadow
>> +        shadow = os.path.join(self.builddir, "target", "etc", "shadow")
>> +        with open(shadow, "r") as f:
>> +            users = f.readlines()
>> +            for user in users:
>> +                s = user.split(":")
>> +                n, h = s[0], s[1]
>> +                if n == "root":
>> +                    # Fail if the account is disabled or no password is required
>> +                    self.assertTrue(h not in ["", "*"])
>> +                    # Fail if the has isn't right
> 
> typo: has -> hash
> 

Oups, thanks

>> +                    self.assertTrue(crypt(self.password, h) == h)
> 
> You could use assertEqual instead.
> 

Ack

>> +
>> +        # 2. Test by attempting to login
>> +        try:
>> +            cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
>> +            self.emulator.boot(arch="armv7",
>> +                               kernel="builtin",
>> +                               options=["-initrd", cpio_file])
>> +            self.emulator.login(self.password)
>> +        except SystemError:
>> +            self.fail("Unable to login with the password")
> 
> I was about to suggest to remove the try/except.
> If we replace the block of code with only the 3 lines currently inside the
> 'try' the infra will:
> - raise 'SystemError: System does not boot' if the target dow not boot
> - raise 'SystemError: Cannot login' if the login fails
> With the block you used, it will raise
> 'AssertionError: Unable to login with the password' for both cases.
> 
> But later I understood what you did.
> Without the try/except we end up with an ERROR, while with the try/except we
> end up with a FAIL, it is conceptually more correct.
> 
> So I agree that the code you wrote is better. Let's keep it as is.
> 
> When we eventually use different exceptions for each failure on the infra
> itself your code will be ready to be changed to
>         except infra.exceptions.LoginError:
> See http://patchwork.ozlabs.org/patch/1043199/ from Thomas S.
> 

I'll keep an eye on this patch.

> Regards,
> Ricardo
> 

-- 
Victor Huesca, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
