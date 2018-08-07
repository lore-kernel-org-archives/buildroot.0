From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 06 Aug 2018 21:39:35 -0300
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
References: <20180806183647.GC2427@scaer>
Message-ID: <5b68ea47f2a6f_79bb3fe8c00774a0328a9@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Aug 06, 2018 at 03:36 PM, Yann E. MORIN wrote:

> On 2018-08-06 00:14 -0300, Ricardo Martincoski spake thusly:
>> On Sat, Aug 04, 2018 at 01:33 PM, Yann E. MORIN wrote:
>> > +# Check if the changeset is a branch name.
>> > +if _git show-ref "${cset}" |grep -qv refs/tags; then
>> 
>> I didn't had time to test it yet.
>> Special refs still works after this?
> 
> It is not supposed to be broken, as those special refs are (AFAIU)
> exposed as tags, not heads. But as I don't have access to a server
> serving those special refs (support for which I find ugly, btw), I
> could not test.

One way to test special refs is by using a github package with some dirty
hacks (I picked a special ref at random by inspecting the output of ls-remote):
$ make defconfig
$ ./utils/config --set-str BR2_BACKUP_SITE ""
$ sed -e '/^TMUX_SITE_METHOD/d' \
      -e 's,^TMUX_VERSION =.*,TMUX_VERSION = refs/pull/1014/head,g' \
      -e 's,^TMUX_SITE.*,TMUX_SITE = https://github.com/tmux/tmux.git\nTMUX_SITE_METHOD = git,g' \
      -i package/tmux/tmux.mk
$ rm -f package/tmux/tmux.hash
$ BR2_DL_DIR=$(mktemp -d) make tmux-dirclean tmux-source
...
Commit 'refs/pull/1014/head' is a branch name.
Using a branch name is not supported.


The other way is by using this series:
http://patchwork.ozlabs.org/project/buildroot/list/?series=44009
current master:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27301317
current master + this patch:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27301358
It doesn't get to show that special-ref is broken because the tests run
sequentially (to avoid overpopulate the gitlab CI), but it shows (in the
-build.log) that also the download of a sha1 tip of a branch (search for
"git-sha1-branch-head" in the log) would be broken with this patch.
This can be reproduced locally:
$ make defconfig
$ ./utils/config --set-str BR2_BACKUP_SITE ""
$ BR2_DL_DIR=$(mktemp -d) make tremor-dirclean tremor-source
...
Commit '7c30a66346199f3f09017a09567c6c8a3a0eedc8' is a branch name.
Using a branch name is not supported.


So NACK for this patch as-is.
Of course, I am not against the concept of detecting the name of a branch being
used as package version and aborting the download with a nice message.
Unfortunately I currently don't have suggestions on how to fix the code.

Regards,
Ricardo
