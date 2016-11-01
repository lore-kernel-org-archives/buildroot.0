From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Tue,  1 Nov 2016 17:33:53 -0200
Subject: [Buildroot] [PATCH 2/3] test/support/download/git: new test
In-Reply-To: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
References: <20161101193354.8716-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This test assumes:
- it is run from the buildroot base dir;
- there is a ssh server installed;
- there is a key pair to allow the current user to ssh to localhost
  without being prompted for a password;
- there is no ./.config ./stdout ./package/package;

For each testcase, it creates a new git repo, and then download from
this repo using a fake package named 'package'.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
This test needs some instrumentation in the source code (previous patch)
to work properly.
---
 support/download/git                  |   1 +
 test/support/download/git             | 202 ++++++++++++++++++++++++++++++++++
 test/support/download/git_keywords.py |  84 ++++++++++++++
 test/support/download/git_util.py     | 196 +++++++++++++++++++++++++++++++++
 4 files changed, 483 insertions(+)
 create mode 100755 test/support/download/git
 create mode 100755 test/support/download/git_keywords.py
 create mode 100644 test/support/download/git_util.py

diff --git a/support/download/git b/support/download/git
index 7c44c65..f7eef15 100755
--- a/support/download/git
+++ b/support/download/git
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# Please test this script using test/support/download/git
 
 # We want to catch any unexpected failure, and exit immediately
 set -e
diff --git a/test/support/download/git b/test/support/download/git
new file mode 100755
index 0000000..3aa4d43
--- /dev/null
+++ b/test/support/download/git
@@ -0,0 +1,202 @@
+#!/usr/bin/env python
+# this script conforms to pyflakes && pep8 --ignore=E501
+
+# BEFORE calling this script, make sure:
+# - there is a ssh server installed
+# - there is a key pair generated that allow the current user to run 'ssh localhost' without being prompted for entering a password
+
+# TODO test recursive submodules
+# TODO test another transport protocols: git, https, ... - need manual setup of git server
+# TODO test extra download options, especially --reference
+# TODO test which cases should have optimized download, and which cases use the full fetch
+
+
+import git_keywords
+
+
+class TestSuiteSupportDownloadGitRefs(git_keywords.Keywords):
+    @classmethod
+    def setUpClass(cls):
+        print("Setup")
+        cls.given_the_the_patch_instrumenting_the_source_code_is_present()
+        cls.given_the_localhost_can_be_accessed_by_current_user_without_a_password_prompt()
+        cls.given_the_test_will_not_overwrite_user_files()
+        cls.create_a_fake_package()
+        cls.create_a_config_file()
+
+    @classmethod
+    def tearDownClass(cls):
+        print("Teardown")
+        cls.remove_temporary_files()
+
+    def setUp(self):
+        self.create_test_repo()
+        self.create_commit_in_test_repo()  # initial commit
+        self.remove_dowloaded_tarball()
+
+    def tearDown(self):
+        self.remove_test_repo()
+
+    def test101_tag_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_tag_named("feature101")
+        self.when_i_download_the_version("feature101")
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists("feature101")
+
+    def test102_tag_can_be_preferred_over_branch_by_using_full_name(self):
+        tag_sha1 = self.given_there_is_a_commit_pointed_only_by_the_tag_named("feature102")
+        branch_sha1 = self.given_there_is_a_commit_pointed_only_by_the_branch_named("feature102")
+        self.given_the_commits_are_not_the_same(branch_sha1, tag_sha1)
+        self.when_i_download_the_version("refs/tags/feature102")
+        self.then_i_can_see_the_downloaded_sha1_is(tag_sha1)
+        self.then_i_can_see_the_tarball_exists("refs_tags_feature102")
+
+    def test201_sha1_not_branch_head_but_in_a_branch_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_branch_named("feature201")
+        sha1_head = self.given_there_is_another_commit_in_the_upstream()
+        self.given_the_commits_are_not_the_same(sha1, sha1_head)
+        self.when_i_download_the_version(sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(sha1)
+
+    def test201b_sha1_not_branch_head_but_in_a_branch_does_not_use_optimized_download(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_branch_named("feature201")
+        sha1_head = self.given_there_is_another_commit_in_the_upstream()
+        self.given_the_commits_are_not_the_same(sha1, sha1_head)
+        self.when_i_download_the_version(sha1)
+        self.then_i_can_see_the_tarball_exists(sha1)
+        self.then_i_can_see_a_full_clone_was_needed()
+
+    def test202_sha1_of_branch_head_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_branch_named("feature202")
+        self.when_i_download_the_version(sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(sha1)
+
+    def test203_sha1_of_branch_head_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_branch_named("feature203")
+        partial_sha1 = sha1[:20]
+        self.when_i_download_the_version(partial_sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(partial_sha1)
+
+    def test204_sha1_of_commit_pointed_by_a_tag_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_tag_named("feature204")
+        self.when_i_download_the_version(sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(sha1)
+
+    def test204b_sha1_of_commit_pointed_by_a_tag_uses_optimized_download(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_tag_named("feature204b")
+        self.when_i_download_the_version(sha1)
+        self.then_i_can_see_the_tarball_exists(sha1)
+        self.then_i_can_see_a_full_clone_was_not_needed()
+
+    def test205_sha1_head_of_branch_with_slash_in_the_name_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_branch_named("feat/ure205")
+        self.when_i_download_the_version(sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(sha1)
+
+    def test206_sha1_not_branch_head_but_in_a_branch_with_slash_in_the_name_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_branch_named("feat/ure206")
+        sha1_head = self.given_there_is_another_commit_in_the_upstream()
+        self.given_the_commits_are_not_the_same(sha1, sha1_head)
+        self.when_i_download_the_version(sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(sha1)
+
+    def test207_partial_sha1_of_tagged_commit_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_tag_named("feature207")
+        partial_sha1 = sha1[:20]
+        self.when_i_download_the_version(partial_sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(partial_sha1)
+
+    def test208_sha1_of_special_ref_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_special_ref_named("changes/02/2/8")
+        self.when_i_download_the_version(sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(sha1)
+
+    def test209_sha1_of_merged_special_ref_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_special_ref_named("changes/02/2/9")
+        self.given_the_same_commit_is_pointed_by_the_branch_named("feature209")
+        self.when_i_download_the_version(sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(sha1)
+
+    def test210_partial_sha1_of_special_ref_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_special_ref_named("changes/02/2/10")
+        partial_sha1 = sha1[:20]
+        self.when_i_download_the_version(partial_sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(partial_sha1)
+
+    def test211_partial_sha1_of_merged_special_ref_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_special_ref_named("changes/02/2/11")
+        self.given_the_same_commit_is_pointed_by_the_branch_named("feature211")
+        sha1_head = self.given_there_is_another_commit_in_the_upstream()
+        self.given_the_commits_are_not_the_same(sha1, sha1_head)
+        partial_sha1 = sha1[:20]
+        self.when_i_download_the_version(partial_sha1)
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists(partial_sha1)
+
+    def test301_special_ref_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_special_ref_named("changes/03/3/1")
+        self.when_i_download_the_version("refs/changes/03/3/1")
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists("refs_changes_03_3_1")
+
+    def test302_merged_special_ref_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_special_ref_named("changes/03/3/2")
+        self.given_the_same_commit_is_pointed_by_the_branch_named("feature302")
+        self.when_i_download_the_version("refs/changes/03/3/2")
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists("refs_changes_03_3_2")
+
+    def test401_branch_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_branch_named("feature401")
+        self.when_i_download_the_version("feature401")
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists("feature401")
+
+    def test402_branch_is_preferred_over_tag(self):  # XXX behavior enforced by git clone / fetch / checkout
+        tag_sha1 = self.given_there_is_a_commit_pointed_only_by_the_tag_named("feature402")
+        branch_sha1 = self.given_there_is_a_commit_pointed_only_by_the_branch_named("feature402")
+        self.given_the_commits_are_not_the_same(branch_sha1, tag_sha1)
+        self.when_i_download_the_version("feature402")
+        self.then_i_can_see_the_downloaded_sha1_is(branch_sha1)
+        self.then_i_can_see_the_tarball_exists("feature402")
+
+    def test403_branch_with_slash_in_the_name_can_be_used(self):
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_branch_named("feat/ure403")
+        self.when_i_download_the_version("feat/ure403")
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists("feat_ure403")
+
+    def test501_tag_can_be_used_when_there_are_submodules_without_support_to_git_modules(self):
+        self.given_there_is_a_submodule_named("submodule501")
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_tag_named("feature501")
+        self.when_i_download_the_version("feature501")
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists("feature501")
+        self.then_i_can_see_the_tarball_does_not_contain_the_submodule("feature501", "submodule501")
+
+    def test502_tag_can_be_used_when_there_are_submodules_with_support_to_git_modules(self):
+        self.given_there_is_a_submodule_named("submodule502")
+        sha1 = self.given_there_is_a_commit_pointed_only_by_the_tag_named("feature502")
+        self.when_i_download_with_support_to_git_modules_the_version("feature502")
+        self.then_i_can_see_the_downloaded_sha1_is(sha1)
+        self.then_i_can_see_the_tarball_exists("feature502")
+        self.then_i_can_see_the_tarball_contains_the_submodule("feature502", "submodule502")
+
+    def test901_head_can_be_used(self):
+        self.when_i_download_the_version("HEAD")
+        self.then_i_can_see_the_tarball_exists("HEAD")
+
+
+if __name__ == '__main__':
+    suite = git_keywords.unittest.TestLoader().loadTestsFromTestCase(TestSuiteSupportDownloadGitRefs)
+    git_keywords.unittest.TextTestRunner(verbosity=2).run(suite)
diff --git a/test/support/download/git_keywords.py b/test/support/download/git_keywords.py
new file mode 100755
index 0000000..34ee5eb
--- /dev/null
+++ b/test/support/download/git_keywords.py
@@ -0,0 +1,84 @@
+#!/usr/bin/env python
+# this script conforms to pyflakes && pep8 --ignore=E501
+
+import git_util
+import unittest
+
+
+class Keywords(unittest.TestCase, git_util.Utilities):
+    @classmethod
+    def given_the_the_patch_instrumenting_the_source_code_is_present(cls):
+        cls.check_the_patch_instrumenting_the_source_code_is_present()
+
+    @classmethod
+    def given_the_localhost_can_be_accessed_by_current_user_without_a_password_prompt(cls):
+        cls.check_user_can_run_command_in_localhost_through_ssh_without_password_prompt()
+
+    @classmethod
+    def given_the_test_will_not_overwrite_user_files(cls):
+        cls.check_temporary_files_do_not_exist_or_exit()
+
+    def given_there_is_a_commit_pointed_only_by_the_branch_named(self, branch):
+        self.checkout_a_new_branch_in_test_repo(branch)
+        sha1 = self.create_commit_in_test_repo()
+        return sha1
+
+    def given_the_same_commit_is_pointed_by_the_branch_named(self, branch):
+        self.checkout_a_new_branch_in_test_repo(branch)
+
+    def given_there_is_another_commit_in_the_upstream(self):
+        sha1 = self.create_commit_in_test_repo()
+        return sha1
+
+    def given_there_is_a_commit_pointed_only_by_the_tag_named(self, tag):
+        sha1 = self.create_commit_in_test_repo()
+        self.create_a_new_tag_in_test_repog(tag)
+        self.create_commit_in_test_repo()
+        return sha1
+
+    def given_there_is_a_commit_pointed_only_by_the_special_ref_named(self, special_ref):
+        self.detach_head_in_test_repo()
+        sha1 = self.create_commit_in_test_repo()
+        self.create_a_special_ref_in_test_repo(special_ref)
+        self.checkout_branch_in_test_repo("master")
+        return sha1
+
+    def given_the_commits_are_not_the_same(self, sha1_1st, sha1_2nd):
+        self.assertNotEqual(sha1_1st, sha1_2nd)
+
+    def given_the_commits_are_the_same(self, sha1_1st, sha1_2nd):
+        self.assertEqual(sha1_1st, sha1_2nd)
+
+    def when_i_download_the_version(self, version):
+        result = self.download_source_using_buildroot(version)
+        self.assertEqual(0, result, "download of version %s failed" % version)
+
+    def when_i_download_with_support_to_git_modules_the_version(self, version):
+        result = self.download_source_using_buildroot(version, 'PACKAGE_GIT_SUBMODULES=YES')
+        self.assertEqual(0, result, "download with support to git modules of version %s failed" % version)
+
+    def then_i_can_see_the_tarball_exists(self, version):
+        result = self.check_tarball_exists(version)
+        self.assertTrue(result, "Tarball for version %s does not exist" % version)
+
+    def then_i_can_see_the_tarball_contains_the_submodule(self, version, submodule):
+        result = self.check_tarball_contains_the_submodule(version, submodule)
+        self.assertTrue(result, "Tarball does not contain the submodule data")
+
+    def then_i_can_see_the_tarball_does_not_contain_the_submodule(self, version, submodule):
+        result = self.check_tarball_contains_the_submodule(version, submodule)
+        self.assertFalse(result, "Tarball does contain the submodule data, but it shouldn't")
+
+    def then_i_can_see_the_downloaded_sha1_is(self, sha1):
+        self.check_sha1_appeared_in_build_log(sha1)
+
+    def then_i_can_see_a_full_clone_was_not_needed(self):
+        result = self.check_in_the_build_log_if_a_full_clone_or_fetch_was_needed()
+        self.assertFalse(result, "A full clone or fetch was needed")
+
+    def then_i_can_see_a_full_clone_was_needed(self):
+        result = self.check_in_the_build_log_if_a_full_clone_or_fetch_was_needed()
+        self.assertTrue(result, "A full clone or fetch was not needed")
+
+    def given_there_is_a_submodule_named(self, submodule):
+        self.create_a_submodule(submodule)
diff --git a/test/support/download/git_util.py b/test/support/download/git_util.py
new file mode 100644
index 0000000..5e6e3e5
--- /dev/null
+++ b/test/support/download/git_util.py
@@ -0,0 +1,196 @@
+#!/usr/bin/env python
+# this script conforms to pyflakes && pep8 --ignore=E501
+
+import os
+import subprocess
+
+
+class Utilities():
+    commit_data = 10000
+    # TODO allow customizing the url
+    remote_url_of_local_repo = subprocess.Popen('echo ssh://localhost/$(readlink -f $(pwd))/package/package', shell=True, stdout=subprocess.PIPE).communicate()[0].strip()
+    # debug intentionally left on. It pollutes the test log but it shows relevant info when a test fails
+    # TODO allow setting this at command line
+    verbose = True
+
+    @classmethod
+    def run_commands_or_exit(cls, commands):
+        for command in commands:
+            result = os.system(command)
+            if result != 0:
+                raise OSError("command '%s' failed with error %d" % (command, result / 256))
+
+    @classmethod
+    def check_the_patch_instrumenting_the_source_code_is_present(cls):
+        cls.run_commands_or_exit(
+            ['grep -q "Checked out" support/download/git'])
+
+    @classmethod
+    def check_user_can_run_command_in_localhost_through_ssh_without_password_prompt(cls):
+        cls.run_commands_or_exit(
+            ['ssh localhost true'])
+
+    @classmethod
+    def create_a_fake_package(cls):
+        cls.run_commands_or_exit(
+            ['mkdir package/package',
+             'echo "PACKAGE_VERSION = invalid" >> package/package/package.mk',
+             'echo "PACKAGE_SITE = %s/package.git" >> package/package/package.mk' % cls.remote_url_of_local_repo,
+             'echo "PACKAGE_SITE_METHOD = git" >> package/package/package.mk',
+             'echo \'$(eval $(generic-package))\' >> package/package/package.mk'])
+
+    @classmethod
+    def create_a_config_file(cls):
+        cls.run_commands_or_exit(
+            ['make defconfig >/dev/null 2>/dev/null',
+             'echo \'BR2_DL_DIR="$(TOPDIR)/package/package/dl"\' >> .config',
+             'echo \'BR2_BACKUP_SITE=""\' >> .config',
+             'make oldconfig >/dev/null 2>/dev/null'])
+
+    @classmethod
+    def check_temporary_files_do_not_exist_or_exit(cls):
+        if not os.path.isfile('support/download/git'):
+            raise OSError('These tests must be run from Buildroot base dir')
+        if os.path.isfile('.config'):
+            raise OSError('File .config should not exist')
+        if os.path.isfile('stdout'):  # FIXME ugly abstraction error, but it does the job
+            raise OSError('File stdout should not exist')
+        if os.path.isdir('package/package/'):
+            raise OSError('The fake package package/package/ should not exist')
+
+    @classmethod
+    def remove_temporary_files(cls):
+        cls.run_commands_or_exit(
+            ['rm -rf package/package/',
+             'rm -f .config',
+             'rm -f stdout'])
+
+    def remove_dowloaded_tarball(self):
+        self.__class__.run_commands_or_exit(
+            ['rm -rf package/package/dl'])
+
+    def run_commands_or_fail(self, commands):
+        for command in commands:
+            result = os.system(command)
+            # FIXME ugly abstraction error, but it does the job
+            self.assertEqual(0, result, "command %s failed with error %d" % (command, result / 256))
+
+    def create_test_repo(self):
+        self.run_commands_or_fail(
+            ['git init -q package/package/package.git'])
+
+    def remove_test_repo(self):
+        self.run_commands_or_fail(
+            ['rm -rf package/package/package.git'])
+
+    def create_commit_in_test_repo(self):
+        base_dir = os.path.realpath('.')
+        os.chdir('package/package/package.git')
+        self.run_commands_or_fail(
+            ['echo %i > %i' % (self.commit_data, self.commit_data),
+             'git add %i' % self.commit_data,
+             'git commit -q -m %i' % self.commit_data])
+        self.commit_data += 1
+        sha1 = self.get_sha1_from_checkout()
+        os.chdir(base_dir)
+        return sha1
+
+    def checkout_a_new_branch_in_test_repo(self, branch):
+        base_dir = os.path.realpath('.')
+        os.chdir('package/package/package.git')
+        self.run_commands_or_fail(
+            ['git branch -q -f "%s"' % branch,
+             'git checkout -q -f "%s"' % branch])
+        os.chdir(base_dir)
+
+    def create_a_special_ref_in_test_repo(self, special_ref):
+        base_dir = os.path.realpath('.')
+        os.chdir('package/package/package.git')
+        directory = '/'.join(special_ref.split('/')[:-1])
+        self.run_commands_or_fail(
+            ['git branch -q -f temporary',
+             'mkdir -p .git/refs/%s' % directory,
+             'mv .git/refs/heads/temporary .git/refs/%s' % special_ref])
+        os.chdir(base_dir)
+
+    def create_a_new_tag_in_test_repog(self, tag):
+        base_dir = os.path.realpath('.')
+        os.chdir('package/package/package.git')
+        self.run_commands_or_fail(
+            ['git tag -a "%s" -m "%s"' % (tag, self.commit_data)])
+        self.commit_data += 1
+        os.chdir(base_dir)
+
+    def download_source_using_buildroot(self, version, extra_options=''):
+        redirect_stderr = '2>/dev/null'
+        if self.verbose:
+            os.system('echo; git -C package/package/package.git log --all --graph --abbrev-commit --pretty=oneline --decorate; git ls-remote package/package/package.git')
+            redirect_stderr = ''
+        # Using 'make PACKAGE_VERSION=' does not work for references with slash, so write to the .mk
+        self.run_commands_or_fail(
+            ['sed -e \'s#^PACKAGE_VERSION.*$#PACKAGE_VERSION = %s#g\' -i package/package/package.mk' % version])
+        result = os.system(
+            'make %s package-dirclean package-source >stdout %s' % (extra_options, redirect_stderr))
+        if self.verbose:
+            os.system('echo -; cat stdout; echo -')
+        return result
+
+    def check_tarball_exists(self, expected_download):
+        if self.verbose:
+            os.system('echo -n "dl: " ; ls package/package/dl/')
+        return os.path.isfile('package/package/dl/package-' + expected_download + '.tar.gz')
+
+    def get_sha1_from_checkout(self):
+        pipe = subprocess.Popen("git rev-parse HEAD", shell=True, stdout=subprocess.PIPE)
+        sha1 = pipe.communicate()[0].strip()
+        if len(sha1) != 40:
+            raise OSError("Failed to create commit, got sha1 '%s'" % sha1)
+        return sha1
+
+    def check_sha1_appeared_in_build_log(self, sha1):  # it needs some instrumentation in the code
+        self.run_commands_or_fail(
+            ['grep -q "Checked out \'%s\'" stdout' % sha1])
+
+    def check_in_the_build_log_if_a_full_clone_or_fetch_was_needed(self):  # it is very coupled to the source code
+        return 0 == os.system('grep -q "Doing full" stdout')
+
+    def detach_head_in_test_repo(self):
+        base_dir = os.path.realpath('.')
+        os.chdir('package/package/package.git')
+        self.run_commands_or_fail(
+            ['git checkout -q -f HEAD~0'])
+        os.chdir(base_dir)
+
+    def checkout_branch_in_test_repo(self, branch):
+        base_dir = os.path.realpath('.')
+        os.chdir('package/package/package.git')
+        self.run_commands_or_fail(
+            ['git checkout -q -f "%s"' % branch])
+        os.chdir(base_dir)
+
+    def create_a_submodule(self, submodule):
+        base_dir = os.path.realpath('.')
+        submodule_dir = 'package/package/%s.git' % submodule
+        self.run_commands_or_fail(
+            ['git init -q %s' % submodule_dir])
+        os.chdir(submodule_dir)
+        self.run_commands_or_fail(
+            ['echo %s > %s' % (submodule, submodule),
+             'git add %s' % submodule,
+             'git commit -q -m %s' % submodule])
+        os.chdir(base_dir)
+        os.chdir('package/package/package.git')
+        self.run_commands_or_fail(
+            ['git submodule add %s/%s.git ./%s 2>/dev/null' % (self.__class__.remote_url_of_local_repo, submodule, submodule),
+             'echo %i > %i' % (self.commit_data, self.commit_data),
+             'git add %i' % self.commit_data,
+             'git commit -q -m %i' % self.commit_data])
+        self.commit_data += 1
+        sha1 = self.get_sha1_from_checkout()
+        os.chdir(base_dir)
+        return sha1
+
+    def check_tarball_contains_the_submodule(self, expected_download, submodule):
+        if self.verbose:
+            os.system('echo "tar:"; tar -tf "package/package/dl/package-%s.tar.gz"' % expected_download)
+        return 0 == os.system('tar -tf "package/package/dl/package-%s.tar.gz" | grep -q "%s/%s"' % (expected_download, submodule, submodule))
-- 
2.9.3
