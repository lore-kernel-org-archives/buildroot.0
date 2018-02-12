From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 11 Feb 2018 23:44:02 -0200
Subject: [Buildroot] [next] listing of tests is broken
References: <20180209110643.7977e3ba@windsurf.lan>
Message-ID: <5a80f162d1e9e_5e516a461c185b1@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

It happens on the master branch too.

On Fri, Feb 09, 2018 at 08:06 AM, Thomas Petazzoni wrote:

> On Fri, 9 Feb 2018 10:04:37 +0100, Yegor Yefremov wrote:
> 
>> > I have not yet decided if the right fix is to replace config = None by
>> > config = list() in the base test class, or to fix the Rust test case.  
>> 
>> I'm for the first fix: config = list()
> 
> Before going with this fix, I'd like to understand if what the Rust
> tests are doing is legit or not. If it isn't, then we may not
> necessarily want to paper over the problem.

The correct fix IMO is to change the Rust test case.

With the current code, nose2 will collect 3 test cases from the file:
TestRustBase, TestRustBin and TestRust. It happens because all three have a
method called test_something. But TestRustBase is not a test case by itself.

So we should move the test_* method from the base class to the 2 derived classes
(yes, duplicating the code), like it is already done by the 'init' test cases.

An alternative solution is to rename the method in the base class to not start
with test_ and create a test_run method in each derived class calling it. The
method is short, so I don't think we need to do this.


With the listing of tests broken, also 'make .gitlab-ci.yml' is broken. Based
only on this I would say we should fix that on master branch. But see below...
And also the update to .gitlab-ci.yml must be committed. This way we fix
check-gitlab-ci.yml in GitLab:
https://gitlab.com/buildroot.org/buildroot/-/jobs/52000035

But after fixing those, the TestRustBin still fails at GitLab:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/52092045
from test_rust.py, line 39, like this:
>SystemError: Cargo init failed
The build.log ends in these messages:
>error: Failed to create project `hello-world` at `/tmp/tmp_US3dA-br2-testing-rust/hello-world`
>
>Caused by:
>  could not determine the current user, please set $USER
The same test case does not fail for me when it runs outside the Docker image,
so I guess we will need to tweak the Docker image.


I don't have the result yet for TestRust in GitLab. It is still running (105
minutes and counting) by the time I write this.
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/52092044
But running outside the Docker image it also passes.


... Would it be the case to revert only the rust test case only from the master
branch? If yes, extra care must be taken when merging the branches to not remove
it from the next branch too.


Regards,
Ricardo
