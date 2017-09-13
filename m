From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 13 Sep 2017 00:18:47 -0300
Subject: [Buildroot] [PATCH v2] testing: add python-cryptography tests
References: <1504790742-27831-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <59b8a39736fe1_cba17788b87013c@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Sep 07, 2017 at 10:25 AM, Yegor wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

[code style follows test_python.py, let me fix both (and more) in a follow up
 series if this one gets applied now]
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Thomas,
It's up to you to apply this now or to wait for a generic solution for all
python packages. I suppose the later will take a while.
Anyway, these test cases seem to be a good base to compare against the
auto-generated test cases for python packages.

[snip]
> +    def fernet_test(self, timeout=-1):
> +        cmd = self.interpreter + " -c 'from cryptography.fernet import Fernet;"
> +        cmd += "key = Fernet.generate_key();"
> +        cmd += "f = Fernet(key)'"
> +        _, exit_code = self.emulator.run(cmd, timeout)
> +        self.assertEqual(exit_code, 0)

This test could be expanded to catch also the missing hashlib dependency:
        out, exit_code = self.emulator.run(cmd, timeout)
        self.assertEqual(exit_code, 0)
        output = "\n".join(out) + "\n"
        self.assertNotRegexpMatches(output, "ERROR")
but it can be done later, maybe it is only a corner case (to fail based on
output instead of only on exit code).

It would fail like this (without "bbcc673b3a python-cryptography: add missing
dependency on BR2_PACKAGE_PYTHON_HASHLIB"):
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/32317984

Regards,
Ricardo
