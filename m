From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 20 Mar 2019 12:51:45 +0100
Subject: [Buildroot] [WIP] support/testing: add xserver + Mesa OpenGL
 (GLX) + glxinfo
In-Reply-To: <87imxypndq.fsf@dell.be.48ers.dk>
References: <20190107235024.6819-1-romain.naour@gmail.com>
 <87imxypndq.fsf@dell.be.48ers.dk>
Message-ID: <4d73605c-e986-df32-118d-bec7b3a2dfda@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 05/02/2019 ? 10:58, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  > This test allow to check if the xserver with GLX is working properly.
>  > This is a basic test but it allow to trigger the current bug reported
>  > by [1].
> 
>  > [1] https://bugs.buildroot.org/show_bug.cgi?id=11591
> 
>  > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>  > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  > ---
>  >  support/testing/tests/package/test_glxinfo.py | 57 +++++++++++++++++++++++++++
>  >  1 file changed, 57 insertions(+)
>  >  create mode 100644 support/testing/tests/package/test_glxinfo.py
> 
> ..
> 
>  > +    def test_run(self):
>  > +        self.login()
>  > +
> 
> Dont we need to wait for the xserver to start?

The test succeed without wait_for_xserver.

I can add a function wait_for_xserver (like wait_for_dockerd function in
docker_compose test).

    def wait_for_xserver(self):
        # xserver takes some time to start up
        _, _ = self.emulator.run('while [ pidof Xorg >/dev/null 2>&1 ]; do sleep
1; done', 120)

> 
>  > +        # The test case verifies that the xserver with GLX is working
>  > +        cmd = "glxinfo -display :0 2>&1 >/dev/null | grep Error"
>  > +        # Error case: "Error: couldn't find RGB GLX visual or fbconfig"
> 
> Why the redirect / grep when you ignore the output in emulator.run()?

Actually the std outpout of glxinfo is redirected to /dev/null and the std error
is redirected to the std input of grep.

> 
>> +        _, exit_code = self.emulator.run(cmd, GLXINFO_TIMEOUT)
>  > +        self.assertEqual(exit_code, 1)>
> So your expect glxinfo to fail?
> 
So, we actually test the return code of grep command.

If grep doesn't find "Error" then the test is OK (grep return code is 1).
else grep find "Error" then the test is KO (grep return code is 0).

I agree, it's a bit tricky here...

Best regards,
Romain
