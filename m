From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 23 Oct 2017 00:35:39 -0200
Subject: [Buildroot] [next v2 4/7] testing/tests/download: add infra for
	git tests
References: <76b115b4-dd02-0443-ba92-0d331cc1f0d1@mind.be>
Message-ID: <59ed557b40483_5e463fc3aca583041894@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Oct 06, 2017 at 06:30 PM, Arnout Vandecappelle <arnout@mind.be> wrote:

>  I would personally have split the patches differently: include a very minimal
> GitTestBase in the patch that adds the hash tests, then extend it with features
> needed for the later tests.

Good idea. I will do that.

> 
> On 27-08-17 00:20, Ricardo Martincoski wrote:
[snip]
>> ---
>>  support/testing/tests/download/__init__.py  |  0
> 
>  These empty __init__.py files were removed at some point.

Sorry. I did not understand what you meant.

> 
>>  support/testing/tests/download/gitbase.py   | 41 +++++++++++++++++++++++
>>  support/testing/tests/download/gitremote.py | 50 +++++++++++++++++++++++++++++
>>  3 files changed, 91 insertions(+)
>>  create mode 100644 support/testing/tests/download/__init__.py
>>  create mode 100644 support/testing/tests/download/gitbase.py
>>  create mode 100644 support/testing/tests/download/gitremote.py
>> 
[snip]
>> +    def setUp(self):
>> +        self.show_msg("Starting")
>> +        self.b = Builder(self.config, self.builddir, self.logtofile)
>> +
>> +        if not self.keepbuilds:
>> +            self.b.delete()
>> +
>> +        if not self.b.is_finished():
>> +            self.show_msg("Configuring")> +            self.b.configure(["BR2_EXTERNAL={}".format(self.br2_external)])
> 
>  I'm not at all happy with this, too much copying of the logic of BRTest. How
> about this:
> 
> - configure extra options are a member (like self.config is) and gets picked up
> by the base class.

I will put the support for BR2_EXTERNAL directly in BRTest instead.

> - Base class stops after configure.
> 
> - The rest of BRTest goes into a new class RuntimeTestBase, which does the build
> step in setUp and starts the emulator.

I will create a patch for these 2.

> - RuntimeTestBase and GitTestBase call super().setUp(self) to extend the setUp
> method. (Or however you do super() in Python2, it's different IIRC.)

OK. Much better this way avoiding code duplication.

> 
>  Note BTW that specifically BR2_EXTERNAL is typically passed in the environment,
> not as an option. But it doesn't matter much.

I didn't know that! In my everyday use I always passed a make variable.
The example in the manual does the same so I will keep it.

> 
> 
>  Perhaps we could even put the support for BR2_EXTERNAL directly in BRTest. It
> would then of course have to depend on self.br2_external is not None.

I will create a patch for this.

> 
>> +            # do not download not pre-installed dependencies (i.e. lzip) every
>> +            # time a test runs
>> +            self.b.build(["dependencies"])
> 
>  Since we have only one test per class, this is anyway run every time, so
> there's not much point I think.

This code matters when running the tests in a local machine.
I will add this info to the comment.

> 
>> +
>> +        self.gitremote = GitRemote(self.builddir, self.serveddir,
>> +                                   self.logtofile)
>> +        # send output from the test to the logfile created by GitRemote
>> +        self.logfile = self.gitremote.logfile
>> +        self.gitremote.start()
> 
>  Emulator starts directly from its __init__, perhaps the same should be done here?

Er... I don't see such code on Emulator.
But anyway... I will move to __init__. Few lines of code can removed this way.

> 
>> +
>> +    def tearDown(self):
>> +        self.show_msg("Cleaning up")
>> +        if self.gitremote:
>> +            self.gitremote.stop()
>> +        if self.b and not self.keepbuilds:
>> +            self.b.delete()
> 
>  Same here with super().tearDown(self) at the end.

OK.

[snip]
>> +            self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile)
>> +            ret = self.daemon.expect(["Ready to rumble",
>> +                                      "Address already in use"])
>> +            if ret == 0:
>> +                self.port = port
>> +                break
>> +            self.daemon.read()
> 
>  Maybe add a comment that explains why this is needed?

I will remove it, it will not be needed.

Regards,
Ricardo
