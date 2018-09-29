From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 29 Sep 2018 02:35:14 -0300
Subject: [Buildroot] [PATCH 5/5] support/testing: add python-twisted
 tests
References: <20180926025514.2092-6-ricardo.martincoski@gmail.com>
Message-ID: <5baf0f128f758_62ce2b1ab2c1648c317bc@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 25, 2018 at 11:55 PM, Ricardo Martincoski wrote:

[snip]
> +        cmd = self.interpreter + " test.py &"
> +        # give some time to setup the server
> +        cmd += "sleep 5"
> +        _, exit_code = self.emulator.run(cmd, timeout=10)

NOTE: results below include the entire series:
http://patchwork.ozlabs.org/project/buildroot/list/?series=67693

Turns out that 5 seconds is enough to setup the server when running in Python 2,
but not in Python 3.
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/102456734 FAIL

So I will need to change the sleep time (and the timeout passed to .run()) to
something like this:
        cmd += "sleep 30"
        _, exit_code = self.emulator.run(cmd, timeout=35)
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/102483479 PASS

> +        self.assertEqual(exit_code, 0)
> +
> +        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
[snip]

Can I remove only this patch from the series (it is the last) and move it to my
next series adding more test cases for python packages? Or should I resend this
series (5 patches) right now?
It could also be fixed while applying.


Regards,
Ricardo
