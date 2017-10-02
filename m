From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 01 Oct 2017 22:09:33 -0300
Subject: [Buildroot] [PATCH 4/5] support/testing: fix remaining code
	style
References: <20170929080419.GA2899@scaer>
Message-ID: <59d191cdafd96_6a703fce1469bdfc55573@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Sep 29, 2017 at 05:04 AM, Yann E. MORIN wrote:

> On 2017-09-28 23:27 -0300, Ricardo Martincoski spake thusly:
>> Fix the remaining code style warnings from flake8:
>>  - break lines at 79 columns;
>>  - replace some long lines by equivalent code;
>>  - make flake8 ignore some long lines that need to be that way;
>>  - properly indent continuation lines;
>>  - use simpler code to test a parameter is not None.
> 
> NACK for that last one. PEP8 https://www.python.org/dev/peps/pep-0008/
> says:
> 
> ---8<---
> Also, beware of writing if x when you really mean if x is not None --
> e.g. when testing whether a variable or argument that defaults to None
> was set to some other value. The other value might have a type (such as
> a container) that could be false in a boolean context!
> ---8<---
> 
> But you are right in a sense, in that we should write "if x is not None"
> instead of the current "if not x is None".
> 
> And that is exactly what flake8 reports, by the way. ;-)

Thanks for pointing this out. I will fix it.
I won't resend this patch right now. Let's decide the max length first.

[snip]
>> +++ b/support/testing/infra/basetest.py
>> @@ -41,13 +41,14 @@ class BRTest(unittest.TestCase):
>>      def __init__(self, names):
>>          super(BRTest, self).__init__(names)
>>          self.testname = self.__class__.__name__
>> -        self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
>> +        self.builddir = self.outputdir and os.path.join(self.outputdir,
>> +                                                        self.testname)
> 
> I think that in such situation, a better break would be right after the
> 'and' operator (but Python is stupid and errors if there is no explicit
> line continuation):
> 
>     self.builddir = self.outputdir and \
>                     os.path.join(self.outputdir, self.testname)
> 
> However, I don't understand what this was supposed to do in the first
> place... If self.outputdir does not evaluate to False, I understand. But
> if it does evaluate to "False" (in fact, probably because it is "None"),
> then we assign "None" to self.builddir.
> 
> However, we do ensure that self.outputdir is indeed set, because we do
> require the -o option to be passed.
> 
> Hmm... Unless we are just listing the tests, in which case -o is not
> mandatory... Is that it? If so, this is confusing... :-/

Yes, you can see this explanation at the commit log of
704db1586c1408106e1337bc7a2ab3cfec593899

> 
> [--SNIP--]
>> diff --git a/support/testing/tests/core/test_rootfs_overlay.py b/support/testing/tests/core/test_rootfs_overlay.py
>> index fedd40d8ac..31d6c0fb5e 100644
>> --- a/support/testing/tests/core/test_rootfs_overlay.py
>> +++ b/support/testing/tests/core/test_rootfs_overlay.py
>> @@ -24,7 +24,8 @@ class TestRootfsOverlay(infra.basetest.BRTest):
>>          ret = compare_file(overlay_file, target_file)
>>          self.assertEqual(ret, 0)
>>  
>> -        target_file = os.path.join(self.builddir, "target", "etc", "test-file2")
>> +        target_file = os.path.join(self.builddir, "target", "etc",
>> +                                   "test-file2")
> 
> Sometimes, rules are stupid... :-/ I would again have found that a
> better break would have been right between self.builddir and "target",
> like so:
> 
>     target_file = os.path.join(self.builddir, 
>                                "target", "etc", "test-file2")
> 
> But why is the "target/etc/test-file2" path split in the first place? It
> should probably be a single argument, no?
> 
> Or are we afraid that this might have to run on a system where path
> separator are not forward slashes?  (note: only Windows uses backslash
> as a path separator, and we never claimed we would work on Windows. And
> if one uses cygwin, then Cygwin works very well with forward slashes.
> There's just this new fancy WSL stuff, but I haven't touched a Windows
> in a decade, so I can't say.)

I think it's fair to say it will run only under linux.

> 
> So, back to the point: why not make it a siungle argument?

We could.

> 
> Especially since we do have such path in a lot of other places all over
> the tree (e.g. [...].format(infra.filepath("conf/grub2.cfg")) below [0]).
[snip]
> [0] ... here. OK, I made my point, I guess! ;-)

We also have several uses of the Pythonic form:
$ grep 'os.path.join([^,]*,[^,]*,' -r support/testing/ | wc -l
29

We can choose one of the ways and standardize.

> 
>>          out = subprocess.check_output(unsquashfs_cmd,
>>                                        cwd=self.builddir,
>>                                        env={"LANG": "C"})
>>          out = out.splitlines()
>>          self.assertEqual(out[0],
>> -                         "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
>> +                         "Found a valid SQUASHFS 4:0 superblock on "
>> +                         "images/rootfs.squashfs.")
> 
> This is typically another case where splitting is just nut. Don't; it
> only brings readabilitiy issues.

OK.

> 
> But I would like to allow for a bit longer lines, because we already
> have quite some deeply indented code, and 79 chars wide lines are all
> the shorter.
> 
> So I would suggest we add this file:
> 
>     $ cat support/testing/setup.cfg:
>     [flake8]
>     max-line-length=132

I didn't know about this option. Nice!

> 
> Thoughts?

My personal preference is to use the default. We can add "  # noqa" to the
exceptions.
The beauty of using default values is that anyone can call the tool without
thinking about config files or command line options.

But well... we can add a command line to the manual (as we have for
git format-patch), or either add such config file for the test infra and also
for all directories that have Python files.

If we follow this path of adopting command line arguments or a config file,
don't worry about the test files in the package directories
(http://patchwork.ozlabs.org/patch/814544/), I will send a RFC patch that also
checks files pointed by symlinks.

The bikeshedding challenge is to define the magic number: 100? 132? 150?

Regards,
Ricardo
