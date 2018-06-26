From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 25 Jun 2018 23:01:16 -0300
Subject: [Buildroot] [PATCH 1/1] pkg-generic: fix no-check-hash for
 inferred site method
References: <390b1691-6548-abfd-50de-cb642d692b03@lucaceresoli.net>
Message-ID: <5b319e6ca0af0_7d0f2ae8223913c422165@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Jun 25, 2018 at 06:01 PM, Luca Ceresoli wrote:

> On 25/06/2018 03:41, Ricardo Martincoski wrote:
>> Currently, when the site method is explicitly set to a SCM other than
>> git, the main download is correctly excluded from being hash-checked.
>> But when the site method is inferred from the site uri, the download
>> from a SCM other than git is wrongly being hash-checked.
[snip]
>> ---
>> All packages in the tree that use those site methods currently
>> explicitly set the site method.
>> $ make -s printvars VARS=%_SITE_METHOD | grep '=\(bzr\|cvs\|hg\|svn\)'
[snip]
>> PYTHON_PYGAME_SITE_METHOD=hg
> 
> Apologies, but I couldn't understand what this commit is supposed to
> fix. From your description above I understand you're fixing packages
> whose method is inferred (i.e. not explicitly set). But here you list

I am fixing packages whose method is inferred.

> packages which explicitly set it.

Sorry. My message after the commit log was misleading.
Rethinking now, a better message would be:
"Currently there is no package in the tree that uses inferred site method, and
that is why the autobuilder didn't caught this. We had packages using inferred
site method in the past, the last one was 'expect', but since they didn't have a
hash file (for a license or extra-download for example) the build didn't error
out."

> 
> Which one are you fixing exactly? Can you provide an example package
> that your patch fixes?

There is no example in the tree right now, but they can either live in a
br2-external somewhere or they can be added to the tree in the future.
I don't have a real package with this problem.

I stumbled on this because I am creating automated tests for the download infra.
They setup a SCM remote in the docker image by calling git daemon, svnserver,
... depending on the download method and download a package. Here is one package
under test [1], the test failing before this patch [2] and the test passing
after this patch [3].

> 
> BTW I couldn't find in Buildroot any package whose method is an SCM
> other than git and is not explicitly set.

Correct. The last one was 'expect', it now uses a tarball instead of cvs.

You can reproduce the problem I a trying to fix by doing this:
$ git revert 23ab6cb162b7456925e2c3df4917cf9b45868d55
$ touch package/expect/expect.hash
$ make expect-source
ERROR: No hash found for expect-2014-05-02.tar.gz


[1] https://gitlab.com/RicardoMartincoski/buildroot/blob/910ad20b78db2b5f238daca18c5688e3ec3c157b/support/testing/tests/download/br2-external/svn-refs/package/svn-revision-number/svn-revision-number.mk
[2] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/77355189
[3] https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/77355202


Regards,
Ricardo
