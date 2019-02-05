From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Feb 2019 09:09:38 +0100
Subject: [Buildroot] [PATCH v5 04/10] testing/tests/download: add git
 hash test
In-Reply-To: <5c58de45509b7_290e2ab5f544b97c12228@ultri5.mail>
References: <3493f835-d2c0-5d07-b33a-9bfd746b57d8@mind.be>
 <5c58de45509b7_290e2ab5f544b97c12228@ultri5.mail>
Message-ID: <d27d3c06-dedf-7450-35fb-5bdf66845320@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/02/2019 01:52, Ricardo Martincoski wrote:
> Hello,
> 
> On Mon, Feb 04, 2019 at 01:52 PM, Arnout Vandecappelle wrote:
> 
>> On 12/05/2018 04:58, Ricardo Martincoski wrote:
>> [snip]
>>>  support/testing/tests/download/gitremote.py   |  44 ++++++++++++++++++
>>>  support/testing/tests/download/test_git.py    |  43 +++++++++++++++++
>>
>>  flake8 says:
>>
>> support/testing/tests/download/gitremote.py:5:1: I100 Import statements are in
>> the wrong order. 'import infra' should be before 'import pexpect' and in a
>> different group.
>> support/testing/tests/download/test_git.py:4:1: I100 Import statements are in
>> the wrong order. 'from gitremote import GitRemote' should be before 'import
>> infra' and in a different group.
>> support/testing/tests/download/test_git.py:4:1: I201 Missing newline between
>> import groups. 'from gitremote import GitRemote' is identified as Third Party
>> and 'import infra' is identified as Third Party.
>>
>>  I fixed this while applying.
> 
> So you have the plugin flake8-import-order.
> I don't have it locally and we don't have it yet in the docker image.

 We could add it, but in fact a lot of things "break" with it.

> But thank you for fixing.
> 
> [snip]
>>> +        daemon_cmd = ["git", "daemon", "--reuseaddr", "--verbose", "--listen=localhost", "--export-all",
>>
>>  Line is too long. Fixed as well.
> 
> But it is shorter than 132 (as we set in .flake8), no?
> 
> Any chance you are using some version of flake8/pycodestyle that does not
> support configs in .flake8 or max-line-length=132 ?

 No, I just manually check in my editor.

 The idea is that our target line length is 80, but in many cases lines are
difficult to split (it looks worse). Since we have the flake8 run in our CI, we
shouldn't error out on too long lines. And adding an exception comment for each
long line does not make the code more readable. So as a compromise, we set the
line length to 132 in .flake8. But the intention is to have line length of 80.

 Perhaps we should remove it from flake8, and instead add the option to
.gitlab-ci.yml.in.  Hm, yes, that would make a lot of sense...

> 
>>
>>> +                      "--base-path={}".format(serveddir)]
>>> +        for port in range(GIT_REMOTE_PORT_INITIAL, GIT_REMOTE_PORT_LAST + 1):
>>> +            cmd = daemon_cmd + ["--port={port}".format(port=port)]
>>> +            self.logfile.write("> starting git remote with '{}'\n".format(" ".join(cmd)))
>>> +            self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile)
>>> +            ret = self.daemon.expect(["Ready to rumble",
>>> +                                      "Address already in use"])
>>
>>  Shouldn't we add a timeout here, just to be safe?
> 
> I think the expect() method uses the default from the class if not defined.
> And the default timeout for spawn is 30 seconds AFAICR.
> I did not double-checked the docs yet.

 I had only diagonally read the documentation and I saw that timeout in expect()
defaults to -1, so I assumed it was infinity... But in fact it indeed means
"inherit from the spawn class", and there it defaults to 30.

 Regards,
 Arnout

> 
> [snip]
>>> +class GitTestBase(infra.basetest.BRTest):
>>> +    config = \
>>> +        """
>>> +        BR2_BACKUP_SITE=""
>>> +        """
>>> +    gitremotedir = infra.filepath("tests/download/git-remote")
>>> +    gitremote = None
>>> +
>>> +    def setUp(self):
>>> +        super(GitTestBase, self).setUp()
>>> +        self.gitremote = GitRemote(self.builddir, self.gitremotedir, self.logtofile)
>>> +
>>> +    def tearDown(self):
>>> +        self.show_msg("Cleaning up")
>>> +        if self.gitremote:
>>> +            self.gitremote.stop()
>>> +        if self.b and not self.keepbuilds:
>>
>>  This is actually a bit useless, since self.b is not initialzed in
>> BRTest.__init__ you'll actually get either an exception or self.b evaluates to
>> True. But the same pattern is used in other places, so OK. Can be fixed in a
>> follow-up patch.
> 
> Probably some leftover from a rebase. I will look into it.
