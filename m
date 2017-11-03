From: =?UTF-8?Q?Einar_J=C3=B3n_Gunnarsson?= <tolvupostur@gmail.com>
Date: Fri, 3 Nov 2017 07:40:41 -0700 (MST)
Subject: [Buildroot] BR2_REPRODUCIBLE issues
Message-ID: <1509720041684-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all.

I've been using BR2_REPRODUCIBLE, and it mostly works.

But when it is using a git repo, I have the following issues with creating
SOURCE_DATE_EPOCH:
1) It uses $(GIT), but the GIT variable is only defined in line 487:
"include package/Makefile.in".
Note that this is done around line 250 in $(TOPDIR)/Makefile, so sometimes
$(GIT) is unset then getting BR2_VERSION_GIT_EPOCH
2) It always uses the last git commit to calculate the date. So any commit
changes the timestamp, while the non-git timestamp stays the same.
This makes the whole thing almost useless.
If the git log command could take a parameter, you could make reproducible
builds based on e.g. tag 2017.08, which would be much more useful.

Regards,
Einar J?n

An idea for a patch made against origin/next - feel free to do whatever with
it.
if BR2_REPRODUCIBLE_CUSTOM_REPO_VERSION is empty, the behaviour is unchanged
from before.
Maybe setting the default value of BR2_REPRODUCIBLE_CUSTOM_REPO_VERSION to
the last major tag version might make sense.
------
