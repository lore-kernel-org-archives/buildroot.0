From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 6 Nov 2016 01:19:40 +0100
Subject: [Buildroot] [PATCH 2/3] test/support/download/git: new test
In-Reply-To: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
References: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
 <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
Message-ID: <7b4bc8b4-db76-7703-54ce-72d923c00a41@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-11-16 20:33, Ricardo Martincoski wrote:
> This test assumes:
> - it is run from the buildroot base dir;
> - there is a ssh server installed;
> - there is a key pair to allow the current user to ssh to localhost
>   without being prompted for a password;
> - there is no ./.config ./stdout ./package/package;
> 
> For each testcase, it creates a new git repo, and then download from
> this repo using a fake package named 'package'.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> ---
> This test needs some instrumentation in the source code (previous patch)
> to work properly.
> ---
>  support/download/git                  |   1 +
>  test/support/download/git             | 202 ++++++++++++++++++++++++++++++++++
>  test/support/download/git_keywords.py |  84 ++++++++++++++
>  test/support/download/git_util.py     | 196 +++++++++++++++++++++++++++++++++
>  4 files changed, 483 insertions(+)
>  create mode 100755 test/support/download/git
>  create mode 100755 test/support/download/git_keywords.py
>  create mode 100644 test/support/download/git_util.py
> 
> diff --git a/support/download/git b/support/download/git
> index 7c44c65..f7eef15 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -1,4 +1,5 @@
>  #!/usr/bin/env bash
> +# Please test this script using test/support/download/git
>  
>  # We want to catch any unexpected failure, and exit immediately
>  set -e
> diff --git a/test/support/download/git b/test/support/download/git

 It would be nice if you could put this in a place that is convenient for
integration with the overall test infrastructure that Thomas has been working
on. However, I can't find the git repo with that test infrastructure anywhere...
Thomas?

 I would call it testgit.py instead, so it can be run with 'python -m unittest
discover -s test'.


> new file mode 100755
> index 0000000..3aa4d43
> --- /dev/null
> +++ b/test/support/download/git
> @@ -0,0 +1,202 @@
> +#!/usr/bin/env python
> +# this script conforms to pyflakes && pep8 --ignore=E501
> +
> +# BEFORE calling this script, make sure:
> +# - there is a ssh server installed
> +# - there is a key pair generated that allow the current user to run 'ssh localhost' without being prompted for entering a password

 That's not very nice. It would be better to use a git daemon (and the git://
instead of ssh:// protocol). You can start it with:

git daemon --reuseaddr --verbose --listen=localhost --port={port}

It will fail to start if the port is already in use, so you can try a different
port if you find 'Address already in use' in the output. And it will output
'Ready to rumble' once it started, so you can use that to delay the test until
the daemon is operational.


> +
> +# TODO test recursive submodules
> +# TODO test another transport protocols: git, https, ... - need manual setup of git server

 That's not very useful, we're pretty much agnostic of the protocol used.

> +# TODO test extra download options, especially --reference

 Er, that option isn't used anywhere at the moment...

> +# TODO test which cases should have optimized download, and which cases use the full fetch
> +
> +
> +import git_keywords
> +
> +
> +class TestSuiteSupportDownloadGitRefs(git_keywords.Keywords):

 I'm going to skip the tests themselves for the moment, because I first want to
comment on the test infrastructure (which is unfortunately further below). I
have a *lot* of remarks on the pythonesqueness of the code. That's not so great,
because:
- it's a lot of bikeshedding and doesn't affect the functionality (much);
- it's just my opinion and I'm not even much of a Python expert;
- changing it may be a lot of work and it's unfortunate to have a patch held up
because of it (especially adding a test, because that is *always useful*);
- these things can anyway be rewritten later, after the patch has been accepted.
So feel free to disregard some or all of my bikeshedding remarks.

 There are, however, also a large number of functional remarks. I hope you'll be
able to distinguish them :-)


[snip]
> +if __name__ == '__main__':
> +    suite = git_keywords.unittest.TestLoader().loadTestsFromTestCase(TestSuiteSupportDownloadGitRefs)

 It's not very nice to rely on git_keywords' import of unittest. Just import
unittest here.

 Any reason why the usual unittest.main() doesn't work?

> +    git_keywords.unittest.TextTestRunner(verbosity=2).run(suite)
> diff --git a/test/support/download/git_keywords.py b/test/support/download/git_keywords.py
> new file mode 100755
> index 0000000..34ee5eb
> --- /dev/null
> +++ b/test/support/download/git_keywords.py
> @@ -0,0 +1,84 @@
> +#!/usr/bin/env python
> +# this script conforms to pyflakes && pep8 --ignore=E501
> +
> +import git_util
> +import unittest
> +
> +
> +class Keywords(unittest.TestCase, git_util.Utilities):

 This class looks like nothing more than a GWT wrapper around git_util. I don't
think that that's very useful. Buildroot developers are generally developers,
not test engineers who are not so used to programming, and I think that for most
BR developers the GWT standard is more confusing than useful.

 Second, instead of all these given's etc., it is much simpler to set up a
single test repo, once, that has all the features you need. Setting it up could
either be through explicit git commands, but I think it's even simpler if you
just create a bare repository and commit that into Buildroot. It's not very nice
for review, but I think it simplifies things enough to make it worth it. And
anyway, the contents of the objects are not so important for review. If you do
this, remove the hooks and info directories to make it smaller, and make sure
the objects directory is binary. You know, I'll send a patch to show you how.

> +    @classmethod
> +    def given_the_the_patch_instrumenting_the_source_code_is_present(cls):
> +        cls.check_the_patch_instrumenting_the_source_code_is_present()
> +
> +    @classmethod
> +    def given_the_localhost_can_be_accessed_by_current_user_without_a_password_prompt(cls):
> +        cls.check_user_can_run_command_in_localhost_through_ssh_without_password_prompt()
> +
> +    @classmethod
> +    def given_the_test_will_not_overwrite_user_files(cls):
> +        cls.check_temporary_files_do_not_exist_or_exit()
> +
> +    def given_there_is_a_commit_pointed_only_by_the_branch_named(self, branch):
> +        self.checkout_a_new_branch_in_test_repo(branch)
> +        sha1 = self.create_commit_in_test_repo()
> +        return sha1
> +
> +    def given_the_same_commit_is_pointed_by_the_branch_named(self, branch):
> +        self.checkout_a_new_branch_in_test_repo(branch)
> +
> +    def given_there_is_another_commit_in_the_upstream(self):
> +        sha1 = self.create_commit_in_test_repo()
> +        return sha1
> +
> +    def given_there_is_a_commit_pointed_only_by_the_tag_named(self, tag):
> +        sha1 = self.create_commit_in_test_repo()
> +        self.create_a_new_tag_in_test_repog(tag)
> +        self.create_commit_in_test_repo()
> +        return sha1
> +
> +    def given_there_is_a_commit_pointed_only_by_the_special_ref_named(self, special_ref):
> +        self.detach_head_in_test_repo()
> +        sha1 = self.create_commit_in_test_repo()
> +        self.create_a_special_ref_in_test_repo(special_ref)
> +        self.checkout_branch_in_test_repo("master")
> +        return sha1
> +
> +    def given_the_commits_are_not_the_same(self, sha1_1st, sha1_2nd):
> +        self.assertNotEqual(sha1_1st, sha1_2nd)

 This can't be right... An assertion shouldn't occur in a given clause, only in
a then or maybe an unless clause.

> +
> +    def given_the_commits_are_the_same(self, sha1_1st, sha1_2nd):
> +        self.assertEqual(sha1_1st, sha1_2nd)
> +
> +    def when_i_download_the_version(self, version):
> +        result = self.download_source_using_buildroot(version)
> +        self.assertEqual(0, result, "download of version %s failed" % version)

 This is an example why GWT doesn't really work. For GWT, the assert should be
in the then clause. But to be able to do that, you have to store the result in
some stateful object, and that unnecessarily complicates thing. Just use the
asserts directly in the test.

 Also, for this specific case, it's IMHO cleaner to raise an exception when the
download fails, which unittest will interpret as a failure as well. Exceptions
are something which are acceptable in a which clause I think. And when a
download failure is expected, use assertRaises.

> +
> +    def when_i_download_with_support_to_git_modules_the_version(self, version):
> +        result = self.download_source_using_buildroot(version, 'PACKAGE_GIT_SUBMODULES=YES')
> +        self.assertEqual(0, result, "download with support to git modules of version %s failed" % version)
> +
> +    def then_i_can_see_the_tarball_exists(self, version):
> +        result = self.check_tarball_exists(version)
> +        self.assertTrue(result, "Tarball for version %s does not exist" % version)
> +
> +    def then_i_can_see_the_tarball_contains_the_submodule(self, version, submodule):
> +        result = self.check_tarball_contains_the_submodule(version, submodule)
> +        self.assertTrue(result, "Tarball does not contain the submodule data")
> +
> +    def then_i_can_see_the_tarball_does_not_contain_the_submodule(self, version, submodule):
> +        result = self.check_tarball_contains_the_submodule(version, submodule)
> +        self.assertFalse(result, "Tarball does contain the submodule data, but it shouldn't")
> +
> +    def then_i_can_see_the_downloaded_sha1_is(self, sha1):
> +        self.check_sha1_appeared_in_build_log(sha1)
> +
> +    def then_i_can_see_a_full_clone_was_not_needed(self):
> +        result = self.check_in_the_build_log_if_a_full_clone_or_fetch_was_needed()
> +        self.assertFalse(result, "A full clone or fetch was needed")
> +
> +    def then_i_can_see_a_full_clone_was_needed(self):
> +        result = self.check_in_the_build_log_if_a_full_clone_or_fetch_was_needed()
> +        self.assertTrue(result, "A full clone or fetch was not needed")
> +
> +    def given_there_is_a_submodule_named(self, submodule):
> +        self.create_a_submodule(submodule)
> diff --git a/test/support/download/git_util.py b/test/support/download/git_util.py
> new file mode 100644
> index 0000000..5e6e3e5
> --- /dev/null
> +++ b/test/support/download/git_util.py
> @@ -0,0 +1,196 @@
> +#!/usr/bin/env python
> +# this script conforms to pyflakes && pep8 --ignore=E501
> +
> +import os
> +import subprocess
> +
> +
> +class Utilities():
> +    commit_data = 10000

 As far as I can see, instances of this class are completely stateless, there is
only the commit_data class attribute that gets updated (for reasons I don't
understand BTW). Python is not Java, so it's perfectly OK to have module
functions. In other words, remove this class and just define everything as
functions of the git_util module.

 Anyway, with my suggestion of including the test repo directly rather than
building it up, most of this module becomes redundant.

> +    # TODO allow customizing the url
> +    remote_url_of_local_repo = subprocess.Popen('echo ssh://localhost/$(readlink -f $(pwd))/package/package', shell=True, stdout=subprocess.PIPE).communicate()[0].strip()

 Er, are you trying to do
remote_url_of_local_repo = 'ssh://localhost' + os.path.abspath('package/package')
?

 BTW, wrap at around 80 columns when that makes sense.

> +    # debug intentionally left on. It pollutes the test log but it shows relevant info when a test fails
> +    # TODO allow setting this at command line
> +    verbose = True

 Perhaps use the logging module.

> +
> +    @classmethod
> +    def run_commands_or_exit(cls, commands):
> +        for command in commands:
> +            result = os.system(command)
> +            if result != 0:
> +                raise OSError("command '%s' failed with error %d" % (command, result / 256))

 Use subprocess.check_call instead. The loop is kind of useless, constructing
the list or having multiple check_call's is more or less equivalent.

> +
> +    @classmethod
> +    def check_the_patch_instrumenting_the_source_code_is_present(cls):
> +        cls.run_commands_or_exit(
> +            ['grep -q "Checked out" support/download/git'])

 Just assume that that patch is present. We're not going to make tests that run
in different version of Buildroot. If something changes in Buildroot, the tests
should be updated along with it.

> +
> +    @classmethod
> +    def check_user_can_run_command_in_localhost_through_ssh_without_password_prompt(cls):
> +        cls.run_commands_or_exit(
> +            ['ssh localhost true'])
> +
> +    @classmethod
> +    def create_a_fake_package(cls):
> +        cls.run_commands_or_exit(
> +            ['mkdir package/package',

 Use os.makedirs instead.

> +             'echo "PACKAGE_VERSION = invalid" >> package/package/package.mk',
> +             'echo "PACKAGE_SITE = %s/package.git" >> package/package/package.mk' % cls.remote_url_of_local_repo,
> +             'echo "PACKAGE_SITE_METHOD = git" >> package/package/package.mk',
> +             'echo \'$(eval $(generic-package))\' >> package/package/package.mk'])

    with open('package/package/package.mk', 'wt') as package_mk:
        package_mk.write('''\
PACKAGE_VERSION = ...
...''' % remote_url_of_local_repo)

 Although actually, .format is preferred over % nowadays.

 That said, I think what we're testing here is just the git download wrapper,
not the entire download infrastructure. So I wouldn't create a package, but
instead call support/download/dl-wrapper with the appropriate arguments. This is
a unit test after all, not an integration test.

 If you do keep the package, then it shouldn't be created in the Buildroot tree,
but it should be used as a BR2_EXTERNAL package. Also, instead of creating the
files here, just add them to the buildroot tree and use them from the test, like
I proposed for the testgit repository.

> +
> +    @classmethod
> +    def create_a_config_file(cls):
> +        cls.run_commands_or_exit(
> +            ['make defconfig >/dev/null 2>/dev/null',
> +             'echo \'BR2_DL_DIR="$(TOPDIR)/package/package/dl"\' >> .config',

 BR2_DL_DIR is overridden by the environment variable. I have BR2_DL_DIR in my
environment, so all the tests fail for me :-) So just make sure it is exported.
Or override it on the make commandline whenever you call make, that works as well.


> +             'echo \'BR2_BACKUP_SITE=""\' >> .config',
> +             'make oldconfig >/dev/null 2>/dev/null'])

 You shouldn't use the output directory, instead use a O= to some temporary
directory.

> +
> +    @classmethod
> +    def check_temporary_files_do_not_exist_or_exit(cls):
> +        if not os.path.isfile('support/download/git'):
> +            raise OSError('These tests must be run from Buildroot base dir')
> +        if os.path.isfile('.config'):
> +            raise OSError('File .config should not exist')
> +        if os.path.isfile('stdout'):  # FIXME ugly abstraction error, but it does the job
> +            raise OSError('File stdout should not exist')
> +        if os.path.isdir('package/package/'):
> +            raise OSError('The fake package package/package/ should not exist')
> +
> +    @classmethod
> +    def remove_temporary_files(cls):
> +        cls.run_commands_or_exit(
> +            ['rm -rf package/package/',
> +             'rm -f .config',
> +             'rm -f stdout'])
> +
> +    def remove_dowloaded_tarball(self):
> +        self.__class__.run_commands_or_exit(
> +            ['rm -rf package/package/dl'])

 Use shutil.rmtree

> +
> +    def run_commands_or_fail(self, commands):
> +        for command in commands:
> +            result = os.system(command)
> +            # FIXME ugly abstraction error, but it does the job
> +            self.assertEqual(0, result, "command %s failed with error %d" % (command, result / 256))

 The only difference with the other run_commands definition is that this one
raises AssertionError instead of OSError. Not much of a difference... If the
difference is important, use subprocess.check() instead.

> +
> +    def create_test_repo(self):
> +        self.run_commands_or_fail(
> +            ['git init -q package/package/package.git'])
> +
> +    def remove_test_repo(self):
> +        self.run_commands_or_fail(
> +            ['rm -rf package/package/package.git'])
> +
> +    def create_commit_in_test_repo(self):
> +        base_dir = os.path.realpath('.')
> +        os.chdir('package/package/package.git')
> +        self.run_commands_or_fail(
> +            ['echo %i > %i' % (self.commit_data, self.commit_data),
> +             'git add %i' % self.commit_data,
> +             'git commit -q -m %i' % self.commit_data])
> +        self.commit_data += 1
> +        sha1 = self.get_sha1_from_checkout()
> +        os.chdir(base_dir)
> +        return sha1
> +
> +    def checkout_a_new_branch_in_test_repo(self, branch):
> +        base_dir = os.path.realpath('.')
> +        os.chdir('package/package/package.git')
> +        self.run_commands_or_fail(
> +            ['git branch -q -f "%s"' % branch,
> +             'git checkout -q -f "%s"' % branch])
> +        os.chdir(base_dir)
> +
> +    def create_a_special_ref_in_test_repo(self, special_ref):
> +        base_dir = os.path.realpath('.')
> +        os.chdir('package/package/package.git')
> +        directory = '/'.join(special_ref.split('/')[:-1])
> +        self.run_commands_or_fail(
> +            ['git branch -q -f temporary',
> +             'mkdir -p .git/refs/%s' % directory,
> +             'mv .git/refs/heads/temporary .git/refs/%s' % special_ref])

 You should probably read the git update-ref man page.

> +        os.chdir(base_dir)
> +
> +    def create_a_new_tag_in_test_repog(self, tag):
> +        base_dir = os.path.realpath('.')
> +        os.chdir('package/package/package.git')
> +        self.run_commands_or_fail(
> +            ['git tag -a "%s" -m "%s"' % (tag, self.commit_data)])
> +        self.commit_data += 1
> +        os.chdir(base_dir)
> +
> +    def download_source_using_buildroot(self, version, extra_options=''):
> +        redirect_stderr = '2>/dev/null'
> +        if self.verbose:
> +            os.system('echo; git -C package/package/package.git log --all --graph --abbrev-commit --pretty=oneline --decorate; git ls-remote package/package/package.git')
> +            redirect_stderr = ''
> +        # Using 'make PACKAGE_VERSION=' does not work for references with slash, so write to the .mk
> +        self.run_commands_or_fail(
> +            ['sed -e \'s#^PACKAGE_VERSION.*$#PACKAGE_VERSION = %s#g\' -i package/package/package.mk' % version])
> +        result = os.system(
> +            'make %s package-dirclean package-source >stdout %s' % (extra_options, redirect_stderr))
> +        if self.verbose:
> +            os.system('echo -; cat stdout; echo -')
> +        return result
> +
> +    def check_tarball_exists(self, expected_download):
> +        if self.verbose:
> +            os.system('echo -n "dl: " ; ls package/package/dl/')
> +        return os.path.isfile('package/package/dl/package-' + expected_download + '.tar.gz')

 It would be good to also check the contents of the tarball. That way the
submodule stuff is immediately covered as well.

> +
> +    def get_sha1_from_checkout(self):
> +        pipe = subprocess.Popen("git rev-parse HEAD", shell=True, stdout=subprocess.PIPE)
> +        sha1 = pipe.communicate()[0].strip()
> +        if len(sha1) != 40:
> +            raise OSError("Failed to create commit, got sha1 '%s'" % sha1)
> +        return sha1
> +
> +    def check_sha1_appeared_in_build_log(self, sha1):  # it needs some instrumentation in the code
> +        self.run_commands_or_fail(
> +            ['grep -q "Checked out \'%s\'" stdout' % sha1])

 Instead of using this stdout file, just use subprocess.check_output, save the
output somewhere, and use it in the asserts. And obviously instead of grep use
re.match or str.find.



 Regards,
 Arnout


> +
> +    def check_in_the_build_log_if_a_full_clone_or_fetch_was_needed(self):  # it is very coupled to the source code
> +        return 0 == os.system('grep -q "Doing full" stdout')
> +
> +    def detach_head_in_test_repo(self):
> +        base_dir = os.path.realpath('.')
> +        os.chdir('package/package/package.git')
> +        self.run_commands_or_fail(
> +            ['git checkout -q -f HEAD~0'])
> +        os.chdir(base_dir)
> +
> +    def checkout_branch_in_test_repo(self, branch):
> +        base_dir = os.path.realpath('.')
> +        os.chdir('package/package/package.git')
> +        self.run_commands_or_fail(
> +            ['git checkout -q -f "%s"' % branch])
> +        os.chdir(base_dir)
> +
> +    def create_a_submodule(self, submodule):
> +        base_dir = os.path.realpath('.')
> +        submodule_dir = 'package/package/%s.git' % submodule
> +        self.run_commands_or_fail(
> +            ['git init -q %s' % submodule_dir])
> +        os.chdir(submodule_dir)
> +        self.run_commands_or_fail(
> +            ['echo %s > %s' % (submodule, submodule),
> +             'git add %s' % submodule,
> +             'git commit -q -m %s' % submodule])
> +        os.chdir(base_dir)
> +        os.chdir('package/package/package.git')
> +        self.run_commands_or_fail(
> +            ['git submodule add %s/%s.git ./%s 2>/dev/null' % (self.__class__.remote_url_of_local_repo, submodule, submodule),
> +             'echo %i > %i' % (self.commit_data, self.commit_data),
> +             'git add %i' % self.commit_data,
> +             'git commit -q -m %i' % self.commit_data])
> +        self.commit_data += 1
> +        sha1 = self.get_sha1_from_checkout()
> +        os.chdir(base_dir)
> +        return sha1
> +
> +    def check_tarball_contains_the_submodule(self, expected_download, submodule):
> +        if self.verbose:
> +            os.system('echo "tar:"; tar -tf "package/package/dl/package-%s.tar.gz"' % expected_download)
> +        return 0 == os.system('tar -tf "package/package/dl/package-%s.tar.gz" | grep -q "%s/%s"' % (expected_download, submodule, submodule))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
