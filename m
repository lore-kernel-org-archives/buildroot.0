From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 02 Dec 2016 00:34:22 -0200
Subject: [Buildroot] [PATCH 2/3] test/support/download/git: new test
References: <7b4bc8b4-db76-7703-54ce-72d923c00a41@mind.be>
Message-ID: <5840ddaed472e_3050f36d441751b@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

Right now I will resend this series without the test and later on I will send
two follow-up series adding tests already based on the test infra.

The first series will introduce changes and/or new module(s) to the test infra
to support the test of the git download script, and also 1 or 2 testcases;
The second series will introduce the rest of the testcases.

The advantages of this approach are:
- the tests I wrote works enough for me to reduce the load of manual tests if
  other improvements are needed in the download script;
- avoid duplicate rework (as the test infra already solves some issues my test
  has, especially some ugly code);
- avoid duplicate new work (as the test infra already brings features that I
  need/want to implement, such as the out-of-tree build);
- avoid non-trivial rebase (it is not that complex too, but it takes time) as
  the infra is currently functional but is right now under stylistic rework;
- the review of each patch/series should become easier.

I think it makes more sense to keep the test and the patch "log checked out
sha1" in the same series, so I won't resend that just yet.

On Sat, Nov 05, 2016 at 10:19 PM, Arnout Vandecappelle wrote:

[snip]
>> diff --git a/test/support/download/git b/test/support/download/git
> 
>  It would be nice if you could put this in a place that is convenient for
> integration with the overall test infrastructure that Thomas has been working
> on. However, I can't find the git repo with that test infrastructure anywhere...
> Thomas?

A working version is here:
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/?h=runtime-tests
but it is being refactored before merge.

> 
>  I would call it testgit.py instead, so it can be run with 'python -m unittest
> discover -s test'.

Yes.
Probably will become support/testing/tests/download/test_git.py

[snip]
>> +# BEFORE calling this script, make sure:
>> +# - there is a ssh server installed
>> +# - there is a key pair generated that allow the current user to run 'ssh localhost' without being prompted for entering a password
> 
>  That's not very nice. It would be better to use a git daemon (and the git://
> instead of ssh:// protocol). You can start it with:
> 
> git daemon --reuseaddr --verbose --listen=localhost --port={port}

OK. Probably it can be done about the same way the qemu is started by the test
infra.

> 
> It will fail to start if the port is already in use, so you can try a different
> port if you find 'Address already in use' in the output. And it will output
> 'Ready to rumble' once it started, so you can use that to delay the test until
> the daemon is operational.

Something similar (delay the test) is done for qemu in the infra.

[snip]
>> +# TODO test another transport protocols: git, https, ... - need manual setup of git server
> 
>  That's not very useful, we're pretty much agnostic of the protocol used.

OK.
The only corner case I found so far regarding the transport protocol is when the
remote server does not support smart http/https. In this case any use of --depth
is refused (git clone, git fetch) and fallback to a full clone. This case can
easily be tested manually:
make defconfig ; make am33x-cm3-source

> 
>> +# TODO test extra download options, especially --reference
> 
>  Er, that option isn't used anywhere at the moment...

Indeed. Sorry the wrong comment.

[snip]
>> +if __name__ == '__main__':
>> +    suite = git_keywords.unittest.TestLoader().loadTestsFromTestCase(TestSuiteSupportDownloadGitRefs)
> 
>  It's not very nice to rely on git_keywords' import of unittest. Just import
> unittest here.

OK.
But in the test infra I don't need to write this code :)

> 
>  Any reason why the usual unittest.main() doesn't work?

I used this because verbosity=2 can only be passed for main() when using at
least python 2.7 and I wanted to keep compatibility to 2.6.
But in the test infra I don't need to write this code :)

[snip]
>> +class Keywords(unittest.TestCase, git_util.Utilities):
> 
>  This class looks like nothing more than a GWT wrapper around git_util. I don't
> think that that's very useful. Buildroot developers are generally developers,
> not test engineers who are not so used to programming, and I think that for most
> BR developers the GWT standard is more confusing than useful.

I will use the same testcase style as other tests in test infra.

> 
[snip]
>> +    def given_the_commits_are_not_the_same(self, sha1_1st, sha1_2nd):
>> +        self.assertNotEqual(sha1_1st, sha1_2nd)
> 
>  This can't be right... An assertion shouldn't occur in a given clause, only in
> a then or maybe an unless clause.

Yes. Another error in my abstraction.

[snip]
>> +    def when_i_download_the_version(self, version):
>> +        result = self.download_source_using_buildroot(version)
>> +        self.assertEqual(0, result, "download of version %s failed" % version)
> 
[snip]
> 
>  Also, for this specific case, it's IMHO cleaner to raise an exception when the
> download fails, which unittest will interpret as a failure as well. Exceptions
> are something which are acceptable in a which clause I think. And when a
> download failure is expected, use assertRaises.

I will raise an exception.

[snip]
>> +class Utilities():
>> +    commit_data = 10000
> 
>  As far as I can see, instances of this class are completely stateless, there is
> only the commit_data class attribute that gets updated (for reasons I don't
> understand BTW). Python is not Java, so it's perfectly OK to have module
> functions. In other words, remove this class and just define everything as
> functions of the git_util module.

When using the test infra I will use a module.

> 
[snip]
>> +    remote_url_of_local_repo = subprocess.Popen('echo ssh://localhost/$(readlink -f $(pwd))/package/package', shell=True, stdout=subprocess.PIPE).communicate()[0].strip()
> 
>  Er, are you trying to do
> remote_url_of_local_repo = 'ssh://localhost' + os.path.abspath('package/package')
> ?

Yes. Much better.

> 
>  BTW, wrap at around 80 columns when that makes sense.

OK.

[snip]
>> +    verbose = True
> 
>  Perhaps use the logging module.

Won't be needed in the test infra, that generates a log for each stage (build,
run).

[snip]
>> +            result = os.system(command)
>> +            if result != 0:
>> +                raise OSError("command '%s' failed with error %d" % (command, result / 256))
> 
>  Use subprocess.check_call instead. The loop is kind of useless, constructing
> the list or having multiple check_call's is more or less equivalent.

I will use the same as in the test infra, that uses subprocess.

[snip]
>> +    def check_the_patch_instrumenting_the_source_code_is_present(cls):
>> +        cls.run_commands_or_exit(
>> +            ['grep -q "Checked out" support/download/git'])
> 
>  Just assume that that patch is present. We're not going to make tests that run
> in different version of Buildroot. If something changes in Buildroot, the tests
> should be updated along with it.

OK. Fair enough.

[snip]
>> +        cls.run_commands_or_exit(
>> +            ['mkdir package/package',
> 
>  Use os.makedirs instead.

OK.
I first started to write these tests in a bash script.
Some ugly things like this survived the port to python.

> 
>> +             'echo "PACKAGE_VERSION = invalid" >> package/package/package.mk',
>> +             'echo "PACKAGE_SITE = %s/package.git" >> package/package/package.mk' % cls.remote_url_of_local_repo,
>> +             'echo "PACKAGE_SITE_METHOD = git" >> package/package/package.mk',
>> +             'echo \'$(eval $(generic-package))\' >> package/package/package.mk'])
> 
>     with open('package/package/package.mk', 'wt') as package_mk:
>         package_mk.write('''\
> PACKAGE_VERSION = ...
> ...''' % remote_url_of_local_repo)

This will move to a committed br2-external in the test infra.

> 
>  Although actually, .format is preferred over % nowadays.

I will use the same style as the test infra after stylistic refactor.

> 
>  That said, I think what we're testing here is just the git download wrapper,
> not the entire download infrastructure. So I wouldn't create a package, but
> instead call support/download/dl-wrapper with the appropriate arguments. This is
> a unit test after all, not an integration test.

Of course it's possible to create a unit test.
But in this case I think the total effort (including maintenance) will be
smaller if we keep calling make ...-source.
The test infra is ready to do calls to the main Buildroot makefile.

There are some cases, e.g. package version with slash, that we would need to
mimic other scripts in the infra to test the wrapper by itself.

> 
>  If you do keep the package, then it shouldn't be created in the Buildroot tree,
> but it should be used as a BR2_EXTERNAL package. Also, instead of creating the
> files here, just add them to the buildroot tree and use them from the test, like
> I proposed for the testgit repository.

I will use a package in a br2-external.

[snip]
>> +             'echo \'BR2_DL_DIR="$(TOPDIR)/package/package/dl"\' >> .config',
> 
>  BR2_DL_DIR is overridden by the environment variable. I have BR2_DL_DIR in my
> environment, so all the tests fail for me :-) So just make sure it is exported.
> Or override it on the make commandline whenever you call make, that works as well.

OK.

> 
> 
>> +             'echo \'BR2_BACKUP_SITE=""\' >> .config',
>> +             'make oldconfig >/dev/null 2>/dev/null'])
> 
>  You shouldn't use the output directory, instead use a O= to some temporary
> directory.

That I get for free from the test infra.

[snip]
>> +            ['rm -rf package/package/dl'])
> 
>  Use shutil.rmtree

I will point the download directory inside the builddir, so the infra will take
care of this for me. BTW the test infra uses shutil.rmtree.

> 
>> +
>> +    def run_commands_or_fail(self, commands):
>> +        for command in commands:
>> +            result = os.system(command)
>> +            # FIXME ugly abstraction error, but it does the job
>> +            self.assertEqual(0, result, "command %s failed with error %d" % (command, result / 256))
> 
>  The only difference with the other run_commands definition is that this one
> raises AssertionError instead of OSError. Not much of a difference... If the
> difference is important, use subprocess.check() instead.

OK.

[snip]
>> +    def create_a_special_ref_in_test_repo(self, special_ref):
>> +        base_dir = os.path.realpath('.')
>> +        os.chdir('package/package/package.git')
>> +        directory = '/'.join(special_ref.split('/')[:-1])
>> +        self.run_commands_or_fail(
>> +            ['git branch -q -f temporary',
>> +             'mkdir -p .git/refs/%s' % directory,
>> +             'mv .git/refs/heads/temporary .git/refs/%s' % special_ref])
> 
>  You should probably read the git update-ref man page.

Thanks, much cleaner solution.

[snip]
>> +    def check_tarball_exists(self, expected_download):
>> +        if self.verbose:
>> +            os.system('echo -n "dl: " ; ls package/package/dl/')
>> +        return os.path.isfile('package/package/dl/package-' + expected_download + '.tar.gz')
> 
>  It would be good to also check the contents of the tarball. That way the
> submodule stuff is immediately covered as well.

Indeed. This is the only one I am not sure how I will do in the test infra, but
should not be too hard. I will keep this suggestion in mind when rewriting the
tests.

[snip]
>> +    def check_sha1_appeared_in_build_log(self, sha1):  # it needs some instrumentation in the code
>> +        self.run_commands_or_fail(
>> +            ['grep -q "Checked out \'%s\'" stdout' % sha1])
> 
>  Instead of using this stdout file, just use subprocess.check_output, save the
> output somewhere, and use it in the asserts. And obviously instead of grep use
> re.match or str.find.

Will do.
That grep was another ugly code that survived the port from shell script.

Regards,
Ricardo
