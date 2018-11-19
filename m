From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Nov 2018 22:27:36 -0200
Subject: [Buildroot] [RFC 0/4] suppport/testing: Perl,
 Lua and their modules
References: <20181117175244.23594-1-francois.perrad@gadz.org>
Message-ID: <5bf203782d9fe_3eca2ac89cab6a28206cf@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+ Arnout
+ Thomas
+ Yann

On Sat, Nov 17, 2018 at 03:52 PM, Francois Perrad wrote:

> The testing infrastructure seems not yet documented.

Not yet. I know Yann has some work in progress.

> So, I use the recent work on Python2/3 modules as example.
> 
> On my local machine, I run successfully:
> 	flake8
> 	run-tests --list
> So, the Python syntax is correct.

And they run well in the GitLab CI:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/37026720

> But, I don't know how to run a test on Qemu.

You can run it locally:

$ support/testing/run-tests -o test-output tests.package.test_lua

Hint 1: use -k when developing tests, specially the commands that will be issued
to the target. This option keeps any successful build and just execute the
commands.

Hint 2: -s is also very helpful when developing test cases, sending all the logs
to stdout.

Hint 3: the first line of the -run.log contains the command that the infra calls
to start qemu. You can run the same command and enter qemu.

> 
> As future work, I think that scancpan could generate test for Perl/CPAN packages.

Nice.

> Loading a pure Perl module has no real added value.
> So, test will be generated only for XS modules.
> 
> luainterpreter is a virtual package, provided by lua or luajit.
> lua comes with 3 versions (5.1, 5.2, 5.3), 5.3 is the BR default.

I would create a TestLuaPackageBase class that does the same of
TestPythonPackageBase, adding a script in build time to the image, and calling
it in runtime. The script is then stored in the tree in a separate .lua file.
And with this, we can also easily create 4 test cases for each lua package, one
for each version.
Arnout,
Thomas,
Do you think it is too much?
Notice the 4 test cases added in this series take respectively (perl) 9, 12,
(lua) 4 and 4 minutes to run.

> On 32 bits target, BR enables by default the "32 bits numbers" compilation option.
> I think that most of upstream authors never test their modules with a "32 bits numbers" lua.
> Currently, test_lua uses this worst config (Lua 5.3 "32 bits numbers").
> What do you think about shuffle various Lua interpreters ?

I am not sure if I understood, sorry.
Do you mean who is writing the test case randomly chooses a version and creates
a test case for it?
Or do you mean to have a code in the test infra that randomly selects a version
when testing?

The later is not good, IMO. The results would not be reproducible.
I would prefer to add one test case for each one of them.
And if we think it is too much (I don't, it seems to me these test cases would
run in few minutes), we can choose a subset, perhaps 2 of the 4 variants per lua
package.


Regards,
Ricardo
