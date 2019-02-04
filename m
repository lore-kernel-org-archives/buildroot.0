From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Feb 2019 20:48:54 +0100
Subject: [Buildroot] [PATCH v5 05/10] testing/tests/download: test case
 for git refs
In-Reply-To: <20180512025833.22998-6-ricardo.martincoski@gmail.com>
References: <20180512025833.22998-1-ricardo.martincoski@gmail.com>
 <20180512025833.22998-6-ricardo.martincoski@gmail.com>
Message-ID: <428c323b-041c-aa42-6b7d-9e0c704f47c3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/05/2018 04:58, Ricardo Martincoski wrote:
[snip]
>  create mode 100644 support/testing/tests/download/br2-external/git-refs/Config.in
>  create mode 100644 support/testing/tests/download/br2-external/git-refs/external.desc
>  create mode 100644 support/testing/tests/download/br2-external/git-refs/external.mk

 I don't think it makes a whole lot of sense to make a separate external for
this; it would seem easier to put everything in a single external (and move the
br2_external setting to GitTestBase). But that can be fixed in a follow-up
patch, so applied to master, thanks.

[snip]
> +    def check_download(self, package):
> +        # store downloaded tarball inside the output dir so the test infra
> +        # cleans it up at the end
> +        env = {"BR2_DL_DIR": os.path.join(self.builddir, "dl"),
> +               "GITREMOTE_PORT_NUMBER": str(self.gitremote.port)}
> +        self.b.build(["{}-dirclean".format(package),
> +                      "{}-legal-info".format(package)],

 Here there's also a refactoring opportunity, since this function only differs
with check_hash in this one line.

 Regards,
 Arnout

> +                     env)
> +
>  
>  class TestGitHash(GitTestBase):
>      br2_external = [infra.filepath("tests/download/br2-external/git-hash")]
> @@ -41,3 +50,13 @@ class TestGitHash(GitTestBase):
>              self.check_hash("bad")
>          self.check_hash("good")
>          self.check_hash("nohash")
> +
> +
> +class TestGitRefs(GitTestBase):
> +    br2_external = [infra.filepath("tests/download/br2-external/git-refs")]
> +
> +    def test_run(self):
> +        with self.assertRaises(SystemError):
> +            self.check_download("git-wrong-content")
> +        with self.assertRaises(SystemError):
> +            self.check_download("git-wrong-sha1")
> 
